---
title: Migración Polimórfica Rails
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  como hago una migracion polimorfica en ruby on rails
  que se llame instances esta almacenara repositorios de github, sera como :"
draft: false
---

# Migración Polimórfica Rails

## 🧠 Full Chat

🙋 **You:**

como hago una migracion polimorfica en ruby on rails que se llame instances esta almacenara repositorios de github, sera como :

class CreateQuartzInstances < ActiveRecord::Migration[7.0]
  def change
    create_table :quartz_instances do |t|
      t.references :user, null: false, foreign_key: true
      t.string :repo_url, null: false
      t.string :local_path
      t.timestamps
    end
  end
end


pero quiero que sea polimorfica

---

🤖 **Assistant:**

Para hacer una migración polimórfica en Ruby on Rails, debes agregar una referencia polimórfica en la tabla de `instances`. Esto se logra usando `t.references` con las opciones `polymorphic: true`.  

Aquí está la migración corregida para que sea polimórfica:  

```ruby
class CreateInstances < ActiveRecord::Migration[7.0]
  def change
    create_table :instances do |t|
      t.references :owner, null: false, polymorphic: true
      t.string :repo_url, null: false
      t.string :local_path
      t.timestamps
    end
  end
end
```

### Explicación:
- `t.references :owner, polymorphic: true, null: false`:  
  - Esto crea dos columnas: `owner_id` (integer) y `owner_type` (string), lo que permite que `instances` pertenezca a múltiples modelos (por ejemplo, `User`, `Organization`, etc.).
- `repo_url` y `local_path`:  
  - Son los atributos que definen el repositorio y su ruta local.

### Modelo en Rails:
En tu modelo `Instance`, necesitas agregar la asociación polimórfica:

```ruby
class Instance < ApplicationRecord
  belongs_to :owner, polymorphic: true
end
```

En los modelos que usarán la asociación (`User`, `Organization`, etc.), agrega:

```ruby
class User < ApplicationRecord
  has_many :instances, as: :owner
end

class Organization < ApplicationRecord
  has_many :instances, as: :owner
end
```

Ahora puedes hacer cosas como:

```ruby
user = User.find(1)
repo = user.instances.create(repo_url: "https://github.com/user/repo.git", local_path: "/local/path")

org = Organization.find(1)
repo = org.instances.create(repo_url: "https://github.com/org/repo.git", local_path: "/local/path")
```

Esto te permite que un `Instance` pertenezca tanto a un `User` como a una `Organization`, o a cualquier otro modelo que definas. 🚀

---

🙋 **You:**

como hago una migracion polimorfica en ruby on rails que se llame instances esta almacenara repositorios de github, sera como :

class CreateQuartzInstances < ActiveRecord::Migration[7.0]
  def change
    create_table :quartz_instances do |t|
      t.references :user, null: false, foreign_key: true
      t.string :repo_url, null: false
      t.string :local_path
      t.timestamps
    end
  end
end


pero quiero que sea polimorfica y evitar palabras reservadas

---

🤖 **Assistant:**

Para hacer que la migración sea polimórfica y evitar palabras reservadas, puedes usar un nombre más descriptivo como `instantiable`. Aquí tienes la migración polimórfica corregida:  

```ruby
class CreateInstances < ActiveRecord::Migration[7.0]
  def change
    create_table :instances do |t|
      t.references :user, null: false, foreign_key: true
      t.references :instantiable, polymorphic: true, null: false
      t.string :repo_url, null: false
      t.string :local_path
      t.timestamps
    end
  end
end
```

### Explicación:
1. **Polimorfismo**:  
   - `t.references :instantiable, polymorphic: true, null: false` crea las columnas `instantiable_type` y `instantiable_id`, permitiendo que una `Instance` pertenezca a diferentes modelos (por ejemplo, `GitHubRepo`, `BitbucketRepo`, etc.).
   
2. **Evitar palabras reservadas**:  
   - `instance` es una palabra común en Ruby y Rails, lo que podría causar conflictos.  
   - `instantiable` es más seguro y sigue la convención polimórfica en Rails.

3. **Modelo correspondiente**:  
   ```ruby
   class Instance < ApplicationRecord
     belongs_to :user
     belongs_to :instantiable, polymorphic: true
   end
   ```

4. **Ejemplo de modelo polimórfico**:
   ```ruby
   class GitHubRepo < ApplicationRecord
     has_many :instances, as: :instantiable
   end
   ```

Así, puedes asociar múltiples tipos de recursos a `Instance` sin problemas. 🚀