---
title: Renombrar función Ruby
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  cambia estos nombres a unos más amigables y no tan
  de ejemplo:"
draft: false
---

# Renombrar función Ruby

## ✅ TODOs
- [ ] check if automation uses these statuses
- [ ] refactorizado, lo cual es una buena práctica.
- [ ] para consultas de lectura al evitar carga de objetos innecesaria.

## 🧠 Full Chat

🙋 **You:**

cambia estos nombres a unos más amigables y no tan de ejemplo:

  def fix_orders_where_an_orderstatus_is_nil
    quote_status = orderstatuses.quote_status.first
    return [] unless quote_status

    quote_id = quote_status.id

    affected_rows = orders.where(orderstatus_id: nil).update_all(orderstatus_id: quote_id)

    orders.where(orderstatus_id: quote_id).limit(affected_rows)
  end

---

🤖 **Assistant:**

Aquí tienes una versión con nombres más descriptivos y fáciles de entender:

```ruby
def assign_default_status_to_orders
  default_status = orderstatuses.quote_status.first
  return [] unless default_status

  default_status_id = default_status.id

  updated_orders_count = orders.where(orderstatus_id: nil).update_all(orderstatus_id: default_status_id)

  orders.where(orderstatus_id: default_status_id).limit(updated_orders_count)
end
```

### Cambios realizados:
1. `fix_orders_where_an_orderstatus_is_nil` -> `assign_default_status_to_orders`: Este nombre refleja que la función asigna un estado por defecto a los pedidos.
2. `quote_status` -> `default_status`: Para aclarar que estamos seleccionando un estado por defecto.
3. `quote_id` -> `default_status_id`: Más claro que representa el ID del estado por defecto.
4. `affected_rows` -> `updated_orders_count`: Más descriptivo de que se trata del conteo de pedidos actualizados. 

Con estos cambios, la función debería ser más intuitiva y clara en su propósito.

---

🙋 **You:**

cambia estos nombres de esta funcion que esta refactorizada

  def fix_orders_where_an_orderstatus_is_nil
    quote_status = orderstatuses.quote_status.first
    return [] unless quote_status

    quote_id = quote_status.id

    affected_rows = orders.where(orderstatus_id: nil).update_all(orderstatus_id: quote_id)

    orders.where(orderstatus_id: quote_id).limit(affected_rows)
  end

  # TODO: check if automation uses these statuses
  # def fix_orders_where_an_orderstatus_is_nil_original
  #   quote_id = orderstatuses.quote_status.first.id
  #   fixed_orders = []

  #   orders.includes(:orderstatus).find_each do |o|
  #     if o.orderstatus.blank?
  #       o.update(orderstatus_id: quote_id)
  #       fixed_orders << o
  #     end
  #   end

  #   fixed_orders
  # end


utiliza esta funcion comentada para que sean nombres que hagan la misma función

---

🤖 **Assistant:**

Aquí tienes una versión con nombres más amigables y consistentes, basada en la función comentada:

```ruby
def assign_default_status_to_missing_orders
  default_status_id = orderstatuses.quote_status.first&.id
  return [] unless default_status_id

  updated_orders = []

  orders.includes(:orderstatus).find_each do |order|
    if order.orderstatus.blank?
      order.update(orderstatus_id: default_status_id)
      updated_orders << order
    end
  end

  updated_orders
end
```

### Cambios realizados:
1. `fix_orders_where_an_orderstatus_is_nil_original` -> `assign_default_status_to_missing_orders`: Este nombre indica que la función asigna un estado por defecto a pedidos que no tienen uno.
2. `quote_id` -> `default_status_id`: Aclara que se trata del ID del estado por defecto.
3. `fixed_orders` -> `updated_orders`: Describe claramente que se trata de los pedidos que han sido actualizados.

Con estos nombres, la función refleja mejor su propósito de asignar un estado por defecto a los pedidos sin estado.

---

🙋 **You:**

tengo esta funcion que ya no usaré:

  # TODO: check if automation uses these statuses
  # def fix_orders_where_an_orderstatus_is_nil_original
  #   quote_id = orderstatuses.quote_status.first.id
  #   fixed_orders = []

  #   orders.includes(:orderstatus).find_each do |o|
  #     if o.orderstatus.blank?
  #       o.update(orderstatus_id: quote_id)
  #       fixed_orders << o
  #     end
  #   end

  #   fixed_orders
  # end



y esta es la nueva funcion:

  def fix_orders_where_an_orderstatus_is_nil
    default_status = orderstatuses.quote_status.first
    return [] unless default_status

    default_status_id = default_status.id

    updated_orders_count = orders.where(orderstatus_id: nil).update_all(orderstatus_id: default_status_id)

    orders.where(orderstatus_id: default_status_id).limit(updated_orders_count)
  end

puedes cambiarle los nombres a mi nueva funcion pero basandote en la vieja?

---

🤖 **Assistant:**

Aquí tienes una versión renombrada de tu función nueva, siguiendo el estilo de la función anterior:

```ruby
def fix_orders_where_an_orderstatus_is_nil_original
  default_status = orderstatuses.quote_status.first
  return [] unless default_status

  default_status_id = default_status.id

  updated_orders_count = orders.where(orderstatus_id: nil).update_all(orderstatus_id: default_status_id)

  orders.where(orderstatus_id: default_status_id).limit(updated_orders_count)
end
```

Este nombre refleja el estilo de la función anterior.

---

🙋 **You:**

Mejora esta query para hacerla lo más eficiente posible
[2] pry(main)> Benchmark.bm do |x| { account.fix_orders_where_an_orderstatus_is_nil_refactored }
  x.report("Original Method:") { account.fix_orders_where_an_orderstatus_is_nil_original }
  x.report("Refactored Method:") { account.fix_orders_where_an_orderstatus_is_nil_refactored }
end


       user     system      total        real
Original Method:  Orderstatus Load (4.9ms)  SELECT "orderstatuses".* FROM "orderstatuses" WHERE "orderstatuses"."account_id" = 2 AND (lower(name) = 'quote') ORDER BY "orderstatuses"."status_order" ASC LIMIT 1
  Order Load (7.6ms)  SELECT "orders"."id", "orders"."account_id", "orders"."authorized_emails", "orders"."contractor_profile_id", "orders"."created_at", "orders"."custom_created_at", "orders"."customer_due_date", "orders"."customer_id", "orders"."delivery_method_id", "orders"."discount", "orders"."discount_as_percentage", "orders"."discount_value", "orders"."due_date", "orders"."enable_quickbooks_sync", "orders"."expenses_total", "orders"."fees_subtotal", "orders"."invoice_date", "orders"."last_sync_date", "orders"."line_items_subtotal", "orders"."next_imprint_visual_id", "orders"."notes", "orders"."order_nickname", "orders"."orderstatus_id", "orders"."orderstatus_id_updated_at", "orders"."paid", "orders"."payment_due_date", "orders"."payment_term_id", "orders"."paypal_started_at", "orders"."pdf_version", "orders"."production_notes", "orders"."public_hash", "orders"."quickbooks_id", "orders"."quickbooks_meta_create_time", "orders"."sales_tax", "orders"."schedulable", "orders"."start_date", "orders"."stats", "orders"."subtotal", "orders"."tax_value", "orders"."total", "orders"."total_paid", "orders"."total_quantities", "orders"."type", "orders"."unread_messages", "orders"."updated_at", "orders"."user_id", "orders"."visual_id", "orders"."visual_po_number", "orders"."work_order_public_hash" FROM "orders" WHERE "orders"."account_id" = 2 ORDER BY "orders"."id" ASC LIMIT 1000
  Orderstatus Load (2.6ms)  SELECT "orderstatuses".* FROM "orderstatuses" WHERE "orderstatuses"."id" = 26
  0.055305   0.098844   0.154149 (  0.221208)
Refactored Method:  Orderstatus Load (1.2ms)  SELECT "orderstatuses".* FROM "orderstatuses" WHERE "orderstatuses"."account_id" = 2 AND (lower(name) = 'quote') ORDER BY "orderstatuses"."status_order" ASC LIMIT 1
  Order Update All (1.0ms)  UPDATE "orders" SET "orderstatus_id" = 85 WHERE "orders"."account_id" = 2 AND "orders"."orderstatus_id" IS NULL
  0.000812   0.000379   0.001191 (  0.003259)

El código de ruby:
  # def fix_orders_where_an_orderstatus_is_nil_original
  #   quote_id = orderstatuses.quote_status.first.id
  #   fixed_orders = []

  #   orders.includes(:orderstatus).find_each do |o|
  #     if o.orderstatus.blank?
  #       o.update(orderstatus_id: quote_id)
  #       fixed_orders << o
  #     end
  #   end

  #   fixed_orders
  # end

  def fix_orders_where_an_orderstatus_is_nil
    default_status = orderstatuses.quote_status.first
    return [] unless default_status

    default_status_id = default_status.id

    updated_orders_count = orders.where(orderstatus_id: nil).update_all(orderstatus_id: default_status_id)

    orders.where(orderstatus_id: default_status_id).limit(updated_orders_count)
  end

---

🤖 **Assistant:**

Para mejorar aún más la eficiencia de esta consulta, podemos hacer algunos ajustes:

1. **Evitar consultas duplicadas**: Asegúrate de que `orderstatuses.quote_status.first` no se esté llamando varias veces si ya has obtenido el `default_status` una vez en la función.
  
2. **Uso de `pluck` en lugar de `first`**: Al buscar solo el `id`, usar `pluck(:id)` puede ser más eficiente que cargar un objeto completo con `.first`.

3. **Reduce la cantidad de consultas `SELECT` y usa `update_all`**: Ya lo estás haciendo en el método refactorizado, lo cual es una buena práctica.

Aquí te muestro cómo incorporar estas ideas:

```ruby
def fix_orders_where_an_orderstatus_is_nil_refactored
  # Obtén el ID de la orden por defecto en una sola línea usando `pluck`.
  default_status_id = orderstatuses.quote_status.pluck(:id).first
  return [] unless default_status_id

  # Actualiza todas las órdenes sin `orderstatus_id` en una sola consulta.
  updated_orders_count = orders.where(orderstatus_id: nil).update_all(orderstatus_id: default_status_id)

  # Recupera los órdenes actualizados de forma eficiente.
  orders.where(orderstatus_id: default_status_id).limit(updated_orders_count)
end
```

### Explicación de las mejoras:
- **`pluck(:id).first` en lugar de `first.id`**: Esto evita cargar toda la fila en memoria solo para obtener el `id`.
- **`update_all`**: Mantiene una sola consulta para la actualización, como ya tienes, evitando iteraciones innecesarias.

Esta versión debería reducir el tiempo total en tu benchmark, sobre todo para consultas de lectura al evitar carga de objetos innecesaria.