---
title: Escalabilidad Gollum Rails
tags:
- show
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Escalabilidad Gollum Rails

## ✅ TODOs
- [ ] vive en la misma aplicación.
- [ ] s los repositorios en una app será insostenible.
- [ ] el tiempo:
- [ ] s permanentemente.

## 📌 Summary
Cuál es la manera más escalable de que rails genere una instancia de gollum bajo un tenant?

## 🧠 Full Chat


Cuál es la manera más escalable de que rails genere una instancia de gollum bajo un tenant?



Para crear una instancia de **Gollum** (un wiki basado en Git) bajo un esquema **multitenancy** en **Rails**, necesitas una solución que permita administrar repositorios Gollum independientes y asociarlos a un "tenant". La clave está en escalar y manejar de manera eficiente la generación y administración de estos repositorios.

Aquí te describo un **enfoque escalable** que puedes aplicar:

---

### 1. **Estructura del modelo de datos en Rails**

Tendrás que organizar tus tenants en una base de datos. Cada tenant (o usuario) tendrá su propio repositorio Git/Gollum asociado:

- **Modelo `Tenant`**:
   ```ruby
   class Tenant < ApplicationRecord
     has_one :gollum_repository
   end
   ```

- **Modelo `GollumRepository`**:
   ```ruby
   class GollumRepository < ApplicationRecord
     belongs_to :tenant
     validates :path, presence: true
   end
   ```

   Aquí, `path` representa la ruta local donde está almacenado el repositorio Git/Gollum.

---

### 2. **Generar un repositorio Gollum por Tenant**

Cuando un tenant se crea, puedes generar un nuevo repositorio Gollum usando la gema `gollum-lib`. Esto se hace en un **callback**:

- **Ejemplo de creación del repositorio**:
   ```ruby
   class Tenant < ApplicationRecord
     after_create :create_gollum_repository

     private

     def create_gollum_repository
       repo_path = Rails.root.join("repos", "tenant_#{self.id}")
       FileUtils.mkdir_p(repo_path) unless Dir.exist?(repo_path)
       Gollum::Wiki.new(repo_path) # Inicializa el repositorio Gollum
       self.create_gollum_repository!(path: repo_path)
     end
   end
   ```

En este caso:
- Cada repositorio está ubicado en un directorio único bajo `repos/`.
- Se inicializa usando la gema `gollum-lib`.

---

### 3. **Servir Gollum como un servicio independiente**

Por escalabilidad, cada instancia Gollum debe ser servida como un proceso separado, que actúe de backend. Puedes configurarlo usando una solución como **Gollum en modo API**:

- **Ejecuta Gollum en modo API**:
   ```bash
   gollum --port=4567 --base-path=/tenant_1 /ruta/al/repositorio
   ```

- **Automatiza el inicio de Gollum con procesos independientes** usando herramientas como:
   - **Docker**: Crea un contenedor Docker por tenant con su propio servidor Gollum.
   - **Sidekiq/Background Jobs**: Inicia procesos para servir repositorios bajo demanda.
   - **Puma Cluster**: Genera instancias Gollum en paralelo para manejar la concurrencia.

---

### 4. **Rutas dinámicas en Rails**

Configura rutas dinámicas para servir los wikis de los tenants usando subdominios o paths:

- **Ejemplo en `routes.rb`**:
   ```ruby
   constraints subdomain: 'wiki' do
     get '/:tenant_id', to: 'wikis#show'
   end
   ```

- **Controlador `WikisController`**:
   ```ruby
   class WikisController < ApplicationController
     def show
       tenant = Tenant.find(params[:tenant_id])
       gollum_path = tenant.gollum_repository.path

       # Lógica para conectarse a Gollum
       redirect_to "http://localhost:4567/tenant_#{tenant.id}"
     end
   end
   ```

---

### 5. **Escalabilidad**

1. **Docker**: Una solución efectiva es correr una instancia Gollum en un contenedor Docker por tenant. Esto aísla el proceso y permite escalar horizontalmente.

2. **Nginx o Traefik**: Usa un proxy inverso para enrutar el tráfico de forma dinámica hacia las instancias Gollum según el tenant.

3. **Background Workers**: Usa jobs para inicializar Gollum solo cuando un usuario lo necesite, evitando que todas las instancias estén corriendo simultáneamente.

---

### Resumen del flujo

1. **Registro del tenant** → se genera un repositorio Gollum.
2. **Ruta dinámica** → permite acceder a cada wiki según el tenant.
3. **Gollum en modo API** (con Docker o procesos gestionados) → sirve cada instancia de manera aislada.
4. **Proxy inverso** → enruta solicitudes según el tenant.

Esta arquitectura es **escalable**, ya que puedes agregar más instancias Gollum horizontalmente usando herramientas como Docker y Kubernetes, asegurando un uso eficiente de los recursos.

Pero todas las instancias de gollum extras viven dentro de la misma app de rails, no? Usar alguna gema de tenancy tiene beneficios?

Si decides que **todas las instancias de Gollum vivan dentro de la misma aplicación Rails**, el manejo de **multitenancy** sigue siendo clave para la organización y escalabilidad. Al usar una **gema de tenancy**, como `apartment` o `acts_as_tenant`, obtienes beneficios significativos dependiendo de tus necesidades, como:

1. **Separación lógica de datos**: Cada tenant puede tener su propio espacio aislado en la base de datos o en rutas específicas.
2. **Gestión limpia de recursos**: Puedes organizar rutas, configuraciones y acceso a repositorios Gollum de forma más estructurada.
3. **Escalabilidad**: Permiten una implementación más ordenada si necesitas migrar hacia una arquitectura más distribuida o basada en contenedores en el futuro.

---

### Ejemplo usando **`acts_as_tenant`**

La gema **`acts_as_tenant`** te permite aplicar un scope global basado en el tenant actual.

1. **Instalación**:
   ```ruby
   gem 'acts_as_tenant'
   ```

2. **Configuración de `Tenant`**:
   ```ruby


Pero en tu respuesta todas las instancias de gollum extras viven dentro de la misma app de rails, no? Yo quiero que la app no se sature en tamaño y no se si sería conveniente que cada subdominio viviera en un lugar independiente o no. Evalúa. Por otro lado, usar alguna gema de tenancy tiene beneficios?

Entiendo mejor tu preocupación: **quieres evitar que tu app de Rails crezca demasiado o se sature**, especialmente si cada subdominio debe tener su instancia Gollum. Aquí evaluaremos las dos opciones:

1. **Instancias Gollum aisladas fuera de la app principal**.
2. **Beneficios de usar una gema de tenancy**.

---

## **Evaluación de Instancias Aisladas vs. Internas**

### **A. Instancias Gollum Independientes (Aisladas)**
En este enfoque, cada tenant tiene su propia instancia de Gollum **fuera** de la app principal de Rails. Esto es ideal si esperas un crecimiento significativo.

#### **Cómo funciona**:
1. **App de Rails ligera**: Rails solo administra los tenants y actúa como **orquestador**.
2. **Servidor Gollum independiente**:
   - Cada subdominio apunta a un proceso/servicio separado de Gollum.
   - Las instancias se pueden desplegar en **contenedores Docker**, servidores aislados o como servicios micro.
3. **Proxy inverso (Nginx/Traefik)**: Redirige tráfico según el subdominio al servidor correcto.

#### **Ventajas**:
- **Escalabilidad**: Puedes levantar y apagar instancias Gollum según demanda.
- **Aislamiento**: Cada tenant tiene un entorno independiente (menos riesgo de afectar otros tenants).
- **Reducción de carga** en la app principal de Rails.

#### **Desventajas**:
- **Complejidad de despliegue**: Necesitas orquestar la creación, eliminación y escalamiento de las instancias Gollum.
- **Costo**: Requiere más recursos (procesos separados, contenedores adicionales).

#### **Tecnologías sugeridas**:
- **Docker + Kubernetes**: Ideal para manejar cientos de instancias automáticamente.
- **Systemd o background jobs**: Si trabajas con pocos tenants, puedes iniciar Gollum como procesos gestionados.

---

### **B. Instancias Gollum Dentro de Rails**
Aquí, las instancias de Gollum viven dentro de la misma app de Rails, pero cada tenant tiene su propio directorio de repositorios.

#### **Ventajas**:
- **Simplificación del despliegue**: Todo vive en la misma aplicación.
- **Más económico**: Menos procesos y recursos separados.

#### **Desventajas**:
- **Escalabilidad limitada**: La app Rails crece y puede saturarse.
- **Monolito gigante**: Si esperas muchos tenants, manejar todos los repositorios en una app será insostenible.

---

## **¿Usar una Gema de Tenancy?**

### Beneficios de las gemas multitenancy (como **Apartment** o **ActsAsTenant**):
1. **Organización de datos**: Te permiten **separar datos por tenant**.
   - Por ejemplo, en lugar de un solo directorio de repositorios, puedes tener un directorio por tenant.
2. **Menos lógica personalizada**: Gemas como **ActsAsTenant** facilitan la asignación de repositorios por tenant automáticamente.
3. **Escalabilidad lógica**: Puedes combinarla con la ejecución de Gollum como microservicio.

---

## **Recomendación Final**

Si necesitas **escalabilidad y aislamiento**:
1. **Usa instancias Gollum externas** desplegadas en contenedores Docker.
2. Maneja el tráfico con un **proxy inverso** (Nginx/Traefik) para redirigir cada subdominio a la instancia adecuada.
3. Usa **Rails** como orquestador, creando y eliminando contenedores cuando se registra un tenant.
4. Puedes usar una gema de tenancy como **ActsAsTenant** para simplificar el manejo lógico de tenants dentro de Rails.

### Flujo:
- **Tenant se registra en Rails** → Rails inicializa un contenedor Gollum con su subdominio asociado.
- **Proxy inverso** enruta tráfico hacia el contenedor adecuado.
- Rails solo administra metadatos (sin cargar las instancias directamente).

Este enfoque es **modular**, **escalable**, y mantiene tu app de Rails ligera.

Me gusta la recomendación final



User prefiere manejar instancias Gollum externas con contenedores Docker y un proxy inverso (como Nginx/Traefik) para su aplicación multitenancy, utilizando Rails como orquestador.

Model set context updated.

¡Perfecto! Si necesitas detalles adicionales sobre cómo configurar el **proxy inverso**, cómo automatizar la orquestación con Rails o ejemplos prácticos para la inicialización de contenedores Gollum, no dudes en decirlo.

Si, tutorial básico



Aquí tienes un **tutorial básico** para implementar tu solución: Rails como orquestador, Gollum en contenedores Docker, y un proxy inverso (Nginx/Traefik).

---

## **1. Configuración del Proyecto en Rails**

Primero, Rails será el **orquestador** que:
- Administra los tenants.
- Lanza o elimina contenedores Docker.
- Configura el proxy inverso.

### **1.1 Modelo de Tenant**
Crea un modelo Tenant en Rails con un campo para el subdominio:

```bash
rails g model Tenant name:string subdomain:string
rails db:migrate
```

---

## **2. Configuración de Docker para Gollum**

Crea



Aquí tienes un **tutorial básico** paso a paso para manejar instancias **Gollum externas** con **Docker** y un **proxy inverso** (Traefik) orquestado por **Rails**.

---

## **1. Configuración del proyecto Gollum en Docker**

Primero, crea un contenedor Docker que servirá una instancia de Gollum:

### **1.1. Crea un Dockerfile para Gollum**

```Dockerfile
# Dockerfile
FROM ruby:3.1

# Instala dependencias
RUN gem install gollum

# Define el directorio del repositorio Gollum
WORKDIR /wiki

# Expone el puerto predeterminado de Gollum
EXPOSE 4567

# Ejecuta Gollum en modo servidor
CMD ["gollum", "--host", "0.0.0.0"]
```

---

### **1.2. Construye la imagen de Docker**

```bash
docker build -t gollum-server .
```

---

## **2. Usa Rails como orquestador**

Rails manejará el registro de tenants, creará repositorios y lanzará contenedores Gollum usando `Docker API` o un comando del sistema.

### **2.1. Configura un controlador en Rails**

Crea un **controlador** para inicializar contenedores Gollum por tenant:

```ruby
class TenantsController < ApplicationController
  require 'docker-api'

  def create
    @tenant = Tenant.create(name: params[:name])

    # Crea el directorio del repositorio Gollum
    repo_path = Rails.root.join("repos", "tenant_#{@tenant.id}")
    FileUtils.mkdir_p(repo_path)

    # Lanza un contenedor Docker
    Docker::Container.create(
      'Image' => 'gollum-server',
      'HostConfig' => {
        'Binds' => ["#{repo_path}:/wiki"],
        'PortBindings' => { '4567/tcp' => [{ 'HostPort' => dynamic_port }] }
      }
    ).start

    redirect_to tenants_path, notice: 'Tenant creado y servidor Gollum inicializado.'
  end

  private

  def dynamic_port
    # Encuentra un puerto libre dinámicamente
    (3000..4000).to_a.sample.to_s
  end
end
```

---

## **3. Configurar el proxy inverso con Traefik**

Traefik enruta el tráfico hacia las instancias Gollum según el subdominio.

### **3.1. Configura `traefik.yml`**

```yaml
# traefik.yml
entryPoints:
  web:
    address: ":80"

providers:
  file:
    filename: "dynamic.yml"

api:
  dashboard: true
```

### **3.2. Configura `dynamic.yml` para el enrutamiento**

```yaml
http:
  routers:
    tenant1:
      rule: "Host(`tenant1.example.com`)"
      service: tenant1
      entryPoints: web

  services:
    tenant1:
      loadBalancer:
        servers:
          - url: "http://localhost:3001" # Puerto asignado al contenedor
```

---

## **4. Ejecuta Traefik**

Levanta el proxy inverso Traefik en Docker:

```bash
docker run -d \
  -p 80:80 \
  -v /path/to/traefik.yml:/traefik.yml \
  -v /path/to/dynamic.yml:/dynamic.yml \
  --name traefik traefik:v2.10
```

---

## **5. Flujo Completo**

1. **Tenant se registra** → Rails:
   - Crea un repositorio Gollum.
   - Lanza un contenedor Docker con `docker-api` y asigna un puerto.
   - Actualiza la configuración de Traefik para redirigir tráfico.

2. **Traefik** redirige el subdominio `tenant1.example.com` al contenedor específico.

3. **Usuarios** pueden acceder a su wiki a través del subdominio.

---

Este flujo asegura:
- **Aislamiento**: Cada tenant tiene su contenedor.
- **Escalabilidad**: Nuevos tenants no afectan a otros.
- **Automatización**: Rails orquesta la creación y despliegue de instancias Gollum.

Si necesitas más detalles o un ejemplo de código sobre cómo actualizar dinámicamente la configuración de Traefik, ¡dímelo!

Esa configuración como aplicaría de manera escalable en el cloud?

Para llevar este flujo **al cloud de manera escalable**, puedes usar servicios administrados de contenedores y un **balanceador de carga** en plataformas como **AWS, Google Cloud** o **Azure**. El objetivo es orquestar contenedores de **Gollum** para cada tenant sin saturar la infraestructura.

---

## **1. Infraestructura recomendada en el cloud**

### **Componentes clave:**
1. **Orquestador de contenedores**:  
   - **AWS ECS** (Elastic Container Service) o **EKS** (Kubernetes).  
   - **GKE** (Google Kubernetes Engine) o **Azure AKS** (Kubernetes en Azure).

2. **Proxy inverso**:
   - **Traefik** o **Nginx** (para Kubernetes) como un **ingress controller**.  
   - Balanceador de carga administrado (ALB en AWS, Load Balancer en GCP/Azure).

3. **Almacenamiento persistente**:
   - EFS (AWS), **Persistent Volumes** (Kubernetes), o discos en GCP/Azure para los repositorios de Gollum.

4. **Base de datos**:  
   Rails puede usar un **RDS** administrado como PostgreSQL.

---

## **2. Despliegue escalable usando Kubernetes**

### **Paso 1: Configura un Cluster de Kubernetes**
Puedes crear un cluster administrado en tu proveedor de cloud:
- **AWS** → EKS  
- **GCP** → GKE  
- **Azure** → AKS  

---

### **Paso 2: Crea un Deployment para Gollum**
Define un **Deployment** y un **Service** en Kubernetes para lanzar contenedores **Gollum**:

**Archivo: `gollum-deployment.yaml`**
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: gollum-server
spec:
  replicas: 1  # Una instancia por tenant
  selector:
    matchLabels:
      app: gollum
  template:
    metadata:
      labels:
        app: gollum
    spec:
      containers:
        - name: gollum
          image: gollum-server:latest
          ports:
            - containerPort: 4567
          volumeMounts:
            - mountPath: /wiki
              name: gollum-data
      volumes:
        - name: gollum-data
          persistentVolumeClaim:
            claimName: gollum-pvc
---
apiVersion: v1
kind: Service
metadata:
  name: gollum-service
spec:
  type: ClusterIP
  selector:
    app: gollum
  ports:
    - protocol: TCP
      port: 80
      targetPort: 4567
```

**Notas**:
- Cada **Deployment** puede corresponder a un tenant.
- Usa **Persistent Volumes** para garantizar que los datos del repositorio Gollum persistan.

---

### **Paso 3: Configura el Ingress con Traefik**

Traefik enruta tráfico basado en el **subdominio** hacia la instancia correcta.

**Archivo: `traefik-ingress.yaml`**
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: gollum-ingress
  annotations:
    traefik.ingress.kubernetes.io/router.entrypoints: web
spec:
  rules:
    - host: tenant1.example.com
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: gollum-service
                port:
                  number: 80
    - host: tenant2.example.com
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: gollum-service
                port:
                  number: 80
```

---

### **Paso 4: Escalabilidad dinámica**

Para evitar ejecutar contenedores todo el tiempo:
1. **Auto Scaling**: Configura **Horizontal Pod Autoscaler (HPA)** para lanzar más contenedores según la demanda.
2. **On-Demand**: Usa Jobs o funciones Lambda (AWS) para levantar contenedores bajo demanda al registrar un tenant.

---

## **3. Flujo Completo en el Cloud**

1. **Tenant registrado en Rails**:
   - Rails crea un repositorio en un volumen persistente (EFS, PV).
   - Rails hace un `kubectl apply` o usa la API de Kubernetes para crear un Deployment.

2. **Gollum despliega como Pod**:
   - El contenedor Gollum se inicializa con el volumen correspondiente.

3. **Traefik enruta tráfico**:
   - El Ingress Controller redirige subdominios (`tenant1.example.com`) a la instancia Gollum correspondiente.

4. **Auto Scaling**:
   - Kubernetes escala horizontalmente los pods según la demanda.

---

## **4. Beneficios**

- **Escalabilidad horizontal**: Kubernetes se encarga del escalado automático.
- **Aislamiento por tenant**: Cada tenant tiene su propio contenedor y almacenamiento persistente.
- **Reducción de costos**: Contenedores bajo demanda en lugar de ejecutar todos permanentemente.
- **Flexibilidad**: Puedes integrar fácilmente servicios cloud (como almacenamiento S3, RDS).

---

Si necesitas un ejemplo de cómo Rails interactuaría con la **API de Kubernetes**, ¡avísame y lo detallamos!

Forma más fácil de deploy una sola instancia de gollum

La forma más fácil y rápida de desplegar una sola instancia de **Gollum** es utilizar **Docker** con un único contenedor y exponer el puerto para acceso público.

---

## **1. Dockerfile básico**

Si aún no tienes la imagen de Docker de Gollum, puedes crear una de manera simple.

### **Dockerfile**
```Dockerfile
FROM ruby:3.1

# Instalar Gollum
RUN gem install gollum

# Crear el directorio donde se almacenará el repositorio
WORKDIR /wiki

# Exponer el puerto
EXPOSE 4567

# Comando para iniciar Gollum
CMD ["gollum", "--host", "0.0.0.0", "--port", "4567"]
```

---

## **2. Construir la imagen**

Construye la imagen con el comando:
```bash
docker build -t gollum-instance .
```

---

## **3. Ejecutar el contenedor**

Puedes ejecutar el contenedor exponiendo el puerto 4567 en tu máquina.

```bash
docker run -d -p 8080:4567 \
  -v $(pwd)/repos:/wiki \
  --name gollum-server gollum-instance
```

### **Explicación del comando**:
- `-p 8080:4567`: Mapea el puerto 4567 del contenedor al puerto 8080 de tu máquina.
- `-v $(pwd)/repos:/wiki`: Monta el directorio local `repos` dentro del contenedor como `/wiki`, donde Gollum almacenará el repositorio Git.
- `-d`: Ejecuta el contenedor en segundo plano.
- `--name gollum-server`: Nombre del contenedor.

---

## **4. Acceder a Gollum**

Abre tu navegador y accede a:

```
http://localhost:8080
```

---

## **5. Deploy en la Nube (opcional)**

Si quieres que esta instancia sea accesible en la nube, puedes:

1. **AWS EC2** o **DigitalOcean**:
   - Ejecuta el contenedor en una máquina virtual (instancia) y abre el puerto 8080 en el firewall.

   Ejemplo:
   ```bash
   ssh user@ip-servidor
   docker run -d -p 80:4567 -v /repos:/wiki --name gollum-server gollum-instance
   ```

2. **Google Cloud Run** (fácil y serverless):
   - Sube la imagen de Gollum a **Google Container Registry (GCR)**.
   - Despliega con **Cloud Run** para que sea accesible públicamente sin preocuparte por servidores.

---

### **Ventajas de este enfoque**:
- Configuración mínima.
- Fácil de ejecutar en local y desplegar en la nube.
- Persistencia simple con volúmenes (`-v`).

Si necesitas ayuda para configurarlo en alguna plataforma específica (AWS, DigitalOcean o Cloud Run), házmelo saber.

No se puede poner en GitHub Pages?

No, **Gollum** no se puede desplegar directamente en **GitHub Pages**, porque GitHub Pages únicamente sirve archivos **estáticos** (HTML, CSS, JS) y **Gollum** es una aplicación dinámica escrita en Ruby que necesita ejecutarse en un servidor.

Sin embargo, sí puedes exportar el contenido de tu **wiki Gollum** como archivos HTML estáticos y publicarlos en GitHub Pages. Aquí te explico cómo hacerlo:

---

## **1. Exportar el contenido de Gollum como HTML estático**

Gollum proporciona una forma sencilla de exportar el contenido de tu wiki a archivos HTML estáticos usando un script:

### **Crea un script para exportar Gollum**
```bash
gollum --serve
```



No, **Gollum** no puede correr directamente en **GitHub Pages** porque **GitHub Pages** está diseñado para **archivos estáticos** y **no ejecuta aplicaciones dinámicas** como Gollum, que necesita un servidor Ruby para funcionar y renderizar contenido.

---

### **Por qué Gollum no funciona en GitHub Pages**
1. **Gollum** es un servidor dinámico que requiere Ruby ejecutándose en tiempo real.
2. **GitHub Pages** solo publica archivos HTML, CSS y JavaScript estáticos desde un repositorio.
3. **Gollum** usa un repositorio Git local como fuente y necesita escribir cambios en él, algo que GitHub Pages no permite.

---

## **Alternativa: Publicar el contenido Gollum como estático en GitHub Pages**

Si quieres **usar GitHub Pages**, puedes convertir el contenido de Gollum (markdown) en archivos estáticos y subirlos. Aquí te explico cómo:

---

### **1. Genera archivos estáticos desde Gollum**

Gollum no genera archivos HTML estáticos directamente, pero puedes usar herramientas como `jekyll` o scripts personalizados para convertir los archivos markdown a HTML.

1. **Extrae el repositorio de Gollum** (tu wiki):
   ```bash
   git clone path-to-your-gollum-repo
   cd your-gollum-repo
   ```

2. **Usa Jekyll para generar HTML estático**:
   - Instala Jekyll si no lo tienes:
     ```bash
     gem install jekyll
     ```

   - Genera el sitio estático en el directorio `_site`:
     ```bash
     jekyll build --source . --destination ./_site
     ```

---

### **2. Publica en GitHub Pages**

1. **Crea un nuevo branch `gh-pages`**:
   ```bash
   git checkout --orphan gh-pages
   git rm -rf .
   ```

2. **Sube el contenido generado en `_site`**:
   ```bash
   cp -r _site/* .
   git add .
   git commit -m "Deploy static site to GitHub Pages"
   git push -u origin gh-pages
   ```

3. En tu repositorio en GitHub, ve a **Settings > Pages** y configura **Source** como el branch `gh-pages`.

---

## **Resultado**

- Tu contenido de Gollum (Markdown) estará convertido en HTML estático y se mostrará en GitHub Pages.
- **No será editable online**, pero puedes seguir usando Gollum localmente para editar y subir los cambios.

---

Si prefieres mantener la funcionalidad dinámica de Gollum, necesitarás desplegarlo en servicios como **Heroku**, **Cloud Run**, o usando un servidor privado.

Como deploy gollum en heroku?

Desplegar **Gollum** en **Heroku** es sencillo porque Heroku soporta aplicaciones Ruby directamente. Aquí te dejo un tutorial paso a paso.

---

## **1. Prepara tu repositorio Gollum**

Primero, necesitas tener tu repositorio Gollum listo.

- Si no tienes uno, inicializa un repositorio Git localmente:

```bash
mkdir my-wiki
cd my-wiki
git init
echo "# My Gollum Wiki" > README.md
git add .
git commit -m "Initial commit"
```

---

## **2. Crea una aplicación Gollum en Heroku**

### **2.1. Crea el `Gemfile`**

Heroku usa Bundler para manejar las dependencias. Crea un archivo `Gemfile`:

```ruby
source "https://rubygems.org"

gem "gollum" # Última versión de Gollum
```

Instala las dependencias localmente:

```bash
bundle install
```

---

### **2.2. Configura el servidor Gollum**

Crea un archivo **`config.ru`** en la raíz del proyecto para configurar Rack, que es el estándar para servir aplicaciones Ruby en Heroku:

```ruby
require "gollum/app"

# Configura Gollum
Precious::App.set(:gollum_path, File.expand_path("."))
Precious::App.set(:wiki_options, { allow_editing: true })

run Precious::App
```

---

### **2.3. Añade un archivo `Procfile`**

Heroku usa un **Procfile** para ejecutar el proceso principal. Crea un archivo `Procfile`:

```bash
web: bundle exec rackup config.ru -p $PORT
```

---

### **2.4. Inicializa el proyecto Git**

Si no lo has hecho aún, inicializa Git y agrega los archivos:

```bash
git init
git add .
git commit -m "Add Gollum setup for Heroku"
```

---

## **3. Despliega Gollum en Heroku**

### **3.1. Crea la aplicación en Heroku**

Ejecuta el siguiente comando para crear una nueva aplicación en Heroku:

```bash
heroku create my-gollum-wiki
```

---

### **3.2. Despliega la aplicación**

Haz push de tu repositorio a Heroku:

```bash
git push heroku master
```

Heroku instalará Gollum automáticamente y arrancará el servidor.

---

## **4. Accede a tu Gollum Wiki**

Una vez desplegado, Heroku te proporcionará una URL como:

```
https://my-gollum-wiki.herokuapp.com
```

Abre esa URL en tu navegador y verás tu Gollum wiki funcionando.

---

## **Notas importantes**

1. **Persistencia de datos**:  
   Heroku no guarda archivos locales entre despliegues o reinicios. Necesitas un **repositorio Git remoto** para almacenar los cambios. Configura Gollum para hacer `git push` automáticamente a un repo remoto (como GitHub).

   Agrega una configuración en tu `config.ru` si deseas hacer commits automáticos:

   ```ruby
   Precious::App.set(:wiki_options, {
     commit_message: "Auto-commit from Heroku",
     ref: "master"
   })
   ```

2. **Almacenamiento externo**:  
   Si prefieres, puedes usar **Amazon S3** u otros servicios externos para almacenar los repositorios de manera persistente.

3. **Escalabilidad**:  
   Heroku está limitado a una sola instancia gratis. Si necesitas escalabilidad, considera planes pagos o despliegue en otros servicios como **AWS ECS**.

---

Con esto, tu instancia de Gollum estará corriendo en **Heroku** con una configuración básica. ¡Fácil y rápido! Si necesitas ayuda con persistencia de datos o configuraciones avanzadas, avísame.