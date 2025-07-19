---
title: Geodecidim y wikilinks
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Geodecidim y wikilinks

## ✅ TODOs
- [ ] |format|

## 📌 Summary
Geodecidim con wikilinks, como sería??

## 🧠 Full Chat


Geodecidim con wikilinks, como sería??



Geodecidim con *wikilinks* sería una adaptación del sistema de participación y toma de decisiones de Decidim que integra la funcionalidad de *wikilinks* para mejorar la navegación y el acceso al contenido relacionado dentro de la plataforma.

En este caso, el sistema Geodecidim mantendría sus características principales, como la gestión de propuestas, votaciones, debates y procesos participativos, pero añadiría enlaces internos (wikilinks) que permitirían a los usuarios conectar ideas, propuestas, debates y documentos de manera intuitiva, similar a cómo funcionan los *wikilinks* en plataformas como Wikipedia o los *digital gardens* basados en Markdown.

### Funcionamiento potencial:
1. **Propuestas interconectadas**: Los usuarios podrían enlazar propuestas entre sí mediante el uso de *wikilinks*. Por ejemplo, si una propuesta A es complementaria a una propuesta B, se podría agregar un enlace interno para que los usuarios exploren ambas propuestas en conjunto.
   
2. **Documentación colaborativa**: La plataforma podría tener una sección de documentación donde se explique cada proceso, normativa o reglamento. Los *wikilinks* permitirían a los usuarios navegar fácilmente entre términos técnicos, reglas o procesos sin tener que salir de la plataforma o hacer búsquedas externas.

3. **Comentarios y debates**: Durante los debates, los participantes podrían enlazar a propuestas, comentarios o secciones clave de documentos existentes usando *wikilinks*, facilitando un análisis más profundo y contextualizado de cada tema.

4. **Historial de revisiones**: Al igual que en una wiki, cada contenido enlazado y modificado podría tener un historial de cambios, permitiendo una mayor transparencia en cómo las propuestas o documentos han evolucionado.

Esto podría fomentar una participación más informada y profunda, ya que los participantes podrían explorar las conexiones y antecedentes de manera más clara y rápida, promoviendo la colaboración.

¿Te gustaría desarrollar más esta idea o explorar cómo integrarlo técnicamente en una plataforma basada en Rails?

Dame un detalle más técnico considerando Rails + visualización con Kepler.gl

Para desarrollar una versión de **Geodecidim con *wikilinks* y visualización con Kepler.gl** en Rails, el proyecto tendría dos aspectos principales: (1) la funcionalidad de *wikilinks* en el flujo de propuestas y (2) la integración de Kepler.gl para la visualización geoespacial de datos. A continuación, te doy un desglose técnico:

### 1. **Funcionalidad de *wikilinks* en Rails**
   **Wikilinks en el contenido de propuestas:**
   - **Modelos de Propuestas y Wikilinks**: Las propuestas se gestionarían mediante un modelo `Proposal` (u otro término que utilices en Decidim). Para los *wikilinks*, podrías tener un modelo `Linkable` o simplemente almacenar los *wikilinks* como parte del contenido en un campo de texto.
     ```ruby
     class Proposal < ApplicationRecord
       has_many :wikilinks, dependent: :destroy
     end

     class Wikilink < ApplicationRecord
       belongs_to :proposal
       # This stores the link to another proposal or content piece
       validates :linked_content, presence: true
     end
     ```

   - **Markdown con wikilinks**: Puedes usar una gema como `redcarpet` o `kramdown` para procesar el contenido en Markdown y permitir que los usuarios utilicen *wikilinks*. 
     ```ruby
     def markdown_with_wikilinks(text)
       markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
       text_with_links = text.gsub(/\[\[(.*?)\]\]/) do
         # Encuentra la propuesta por título
         linked_proposal = Proposal.find_by(title: $1)
         if linked_proposal
           link_to(linked_proposal.title, proposal_path(linked_proposal))
         else
           $1 # Si no se encuentra, deja el texto sin enlazar
         end
       end
       markdown.render(text_with_links).html_safe
     end
     ```

   - **Interfaz para crear *wikilinks***: Puedes crear una funcionalidad de autocompletado para que al escribir `[[`, los usuarios vean una lista de propuestas o documentos que puedan enlazar. Esto se puede hacer con **Stimulus.js** o **React**.

   - **Versiones de propuestas con revisiones (historial de cambios)**: Implementa un historial de versiones usando una gema como `paper_trail` para guardar versiones anteriores de las propuestas y rastrear quién hizo qué cambios.

### 2. **Integración de Kepler.gl para visualización de propuestas georreferenciadas**
   Kepler.gl es una herramienta de visualización geoespacial que permite mostrar datos en mapas interactivos. Puedes integrarlo en Rails usando las siguientes técnicas:

   **A. Configuración de Kepler.gl en Rails**:
   - Primero, añade el front-end de Kepler.gl a tu proyecto Rails usando **React**. Puedes usar `webpacker` para administrar tus paquetes de JavaScript, incluyendo Kepler.gl.
   
   ```bash
   yarn add kepler.gl react-redux redux
   ```

   Luego, puedes crear un componente React para cargar el mapa de Kepler.gl dentro de tu vista de Rails.

   ```javascript
   // app/javascript/components/KeplerMap.js
   import React from "react";
   import KeplerGl from "kepler.gl";
   import { addDataToMap } from "kepler.gl/actions";
   import { connect } from "react-redux";

   class KeplerMap extends React.Component {
     componentDidMount() {
       const { dispatch } = this.props;
       // Añadir datos al mapa
       dispatch(
         addDataToMap({
           datasets: {
             info: {
               label: "Propuestas",
               id: "proposals_dataset"
             },
             data: this.props.geoData
           },
           option: { centerMap: true },
           config: {} // Configuración personalizada de Kepler.gl
         })
       );
     }

     render() {
       return <KeplerGl id="proposal_map" />;
     }
   }

   export default connect()(KeplerMap);
   ```

   **B. Backend en Rails para entregar datos geoespaciales**:
   Los datos de las propuestas que contienen información georreferenciada pueden ser enviados al front-end de Kepler.gl desde el backend en formato GeoJSON. Puedes tener un campo `location` o `coordinates` en tu modelo `Proposal` y luego generar el archivo GeoJSON para visualización.

   ```ruby
   class ProposalsController < ApplicationController
     def index
       @proposals = Proposal.all
       respond_to do |format|
         format.html
         format.json { render json: @proposals.to_geojson }
       end
     end
   end

   class Proposal < ApplicationRecord
     # Se asume que tienes campos 'latitude' y 'longitude'
     def to_geojson
       {
         type: "Feature",
         geometry: {
           type: "Point",
           coordinates: [longitude, latitude]
         },
         properties: {
           title: title,
           description: description,
           created_at: created_at
         }
       }
     end

     def self.to_geojson
       {
         type: "FeatureCollection",
         features: all.map(&:to_geojson)
       }
     end
   end
   ```

   **C. Mostrar el mapa en las vistas de Rails**:
   Puedes crear una vista en Rails donde se incluya el componente de Kepler.gl cargando los datos geoespaciales:

   ```erb
   <!-- app/views/proposals/index.html.erb -->
   <div id="kepler-map"></div>

   <%= javascript_pack_tag 'kepler_map' %>
   ```

### 3. **Estructura General**
   1. **Backend (Rails)**:
      - Proporciona las APIs para cargar propuestas geolocalizadas.
      - Administra *wikilinks* en propuestas con Markdown procesado.
      - Gestiona versiones de las propuestas.

   2. **Frontend (React con Kepler.gl)**:
      - Visualiza las propuestas georreferenciadas en el mapa.
      - Proporciona la capacidad de filtrar y explorar propuestas basadas en criterios geográficos.
      - Añadir interacción con propuestas al hacer clic en el mapa, que redirija a la vista de la propuesta completa con *wikilinks* visibles.

### Ejemplo de flujo:
1. Un usuario crea una propuesta desde una ubicación geográfica (especifica latitud/longitud).
2. La propuesta se almacena en la base de datos de Rails, y cualquier referencia a otra propuesta se realiza mediante *wikilinks* (e.g., `[[Título de otra propuesta]]`).
3. Al visitar la página de visualización, Kepler.gl muestra un mapa interactivo con todas las propuestas geolocalizadas, permitiendo filtrar por temas o visualizar las interrelaciones a través de los *wikilinks*.

Este tipo de integración permite una forma enriquecida de explorar tanto espacial como semánticamente las propuestas en una plataforma de participación como Decidim.

¿Te gustaría más detalles sobre algún aspecto específico, como la gestión de mapas, la creación de APIs, o la visualización de *wikilinks*?