---
title: Turbo Stream Lazy Loading
tags:
- page
- orders_test_tab
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Turbo Stream Lazy Loading

## ✅ TODOs
- [ ] |format|
- [ ] s de carga diferida en el controlador para inicializar los datos solo cuando sea necesario. Esto reduce la sobrecarga inicial.
- [ ] y está bien, es solo que no sé que pasa porque se queda el loading en la vista
- [ ] s de helpers no están disponibles directamente en el controlador.
- [ ] s externos.
- [ ] privado del controlador.
- [ ] está en el mismo lugar.
- [ ] s no definidos.
- [ ] s adicionales, puedes calcular las variables justo antes de `render`:
- [ ] ) puede ser una mejor opción.
- [ ] sea consistente y que `:order_tab` también se cargue de manera diferida (pero manteniendo un fallback inicial), puedes usar un `src` y combinarlo con un `render` por defecto:
- [ ] s los frames
- [ ] s los frames (`.hidden`) y muestra (`.active`) solo el frame correspondiente.

## 📌 Summary
tengo esta vista:

## 🧠 Full Chat


tengo esta vista:

= render "orders/show/header_content", order: @order

= javascript_include_tag "order_show_orderstatus"

:javascript
  $(document).on("shown.bs.tab", ".jq-payments-expenses-sidebar", function(e) {
  }).one("shown.bs.tab", ".jq-payments-expenses-sidebar", function(e) {
    createRevenueAndExpensesChart(#{@order.total.amount}, #{@order.expenses_total.amount});
  });

= render "orders/modals/add_payment",
         order: @order,
         books_categories: @account.payment_categories,
         payment: @payment

- if current_account.flipper?(:pt_1057_billing_contact)
  -# When this becomes the default, we can get rid of these files:
     - assets/javascript/payment_request.js
     - views/orders/_reminder_fields.html.haml
     - views/orders/modals/fields/_payment_request_email_fields.html.haml
     - views/orders/modals/fields/_payment_request_text_message_fields.html.haml

  = render "orders/modals/collect_payment_new",
           order: @order,
           payment_processor: @payment_processor,
           account: @account,
           books_categories: @account.payment_categories,
           amount_outstanding: @order.amount_outstanding,
           parent_customer: @parent_customer,
           ordered_contacts: @ordered_contacts
- else
  = render "orders/modals/collect_payment",
           order: @order,
           payment_processor: @payment_processor,
           account: @account,
           books_categories: @account.payment_categories,
           amount_outstanding: @order.amount_outstanding

= render "shipping_labels/modals/new"
= render "orders/modals/approve_invoice",
         order: @order,
         form_url: approve_approval_requests_path,
         account: @account,
         order_images: @order_images,
         approved_approval_requests: @order.approval_requests.approved

= render "expenses/modals/new_expense", expense: @expense
= render "orders/modals/quickbooks_lookup",
         books: @books,
         order: @order,
         currency: @account.currency.currency,
         account: @account

= render "orders/modals/new_merch_store", order: @order
= render "orders/show/navigation_tabs", order: @order, tasks: @tasks, customer: @order.customer, shipping_labels: @order.shipping_labels

#page-content-wrapper
  .page-container.margin-bottom-20
    .row
      .col-sm-12
        .tab-content
          = turbo_frame_tag :orders_test_tab do
            = render partial: "orders/show/loading"





y estoy tratando de manejarla así:

  def show
    ensure_order_has_line_item_group

    @email_templates = policy_scope(EmailTemplate).select("email_templates.id, email_templates.message, email_templates.subject_line, email_templates.name").order("name ASC")

    @title = "##{@order.visual_id}"

    @billing_states = Address.retrieve_subregions(@customer&.billing_address&.country ||= current_account.country)
    @shipping_states = Address.retrieve_subregions(@customer&.shipping_address&.country ||= current_account.country)

    # Tasks
    @tasks = @order.tasks.unscope(:order).includes(:taskable, :completed_by).order(:position, :due_date)
    @task = Task.new(due_date: @order.due_date)

    # Payments
    @payment_processor = @account.payment_processor || PaymentProcessor.new
    @books = Book.where(bookable: @order)
      .or(Book.where(bookable: @order.statements).where(book_orders: BookOrder.where(order: @order)))
      .includes(:book_category).order(:transaction_date)
    @expense = Expense.new(account: current_account, bookable: @order)
    @payment = Payment.new(transaction_date: Time.current)

    load_size_options_and_images

    # Customer shipping info
    @shipping_label_form = ShippingLabelForm.new(order: @order).prepopulate

    @parent_customer = @order.customer.parent_customer
    @ordered_contacts = @parent_customer.sub_customers.billing_contact_first

    @show_invoice_dates = true
    @public_invoice_view = false

    respond_to do |format|
      format.html { render @order.is_a?(::Store::Order) ? "show_store_order" : "show_order" }
      format.turbo_stream do
        turbo_stream.replace("orders_test_tab", partial: "orders/show/order_tab", locals: {order: @order, customer: @order.customer, currency: @account.currency.currency})
      end
      format.js
    end
  end

  # Payments
  def load_books
    Book.where(bookable: @order)
      .or(Book.where(bookable: @order.statements).where(book_orders: BookOrder.where(order: @order)))
      .includes(:book_category).order(:transaction_date)
  end

  def load_payment_processor
    @account.payment_processor || PaymentProcessor.new
  end

  def load_expense
    Expense.new(account: current_account, bookable: @order)
  end

  def load_payment
    Payment.new(transaction_date: Time.current)
  end



pero por algo razón solo muestra el loading, como le hago para cargar mis renders, el objetivo lazy loading



Para implementar lazy loading correctamente en esta vista, el problema radica en cómo estás manejando el contenido de `turbo_frame_tag` y cómo estás respondiendo en el controlador con `format.turbo_stream`. A continuación te detallo los pasos necesarios para solucionar el problema y lograr el comportamiento esperado.

### 1. Revisión del Turbo Frame
Asegúrate de que el `turbo_frame_tag` en tu vista esté configurado con el ID correcto y que este ID coincida con lo que se está reemplazando desde el controlador.

En tu vista:
```haml
= turbo_frame_tag :orders_test_tab do
  = render partial: "orders/show/loading"
```

### 2. Configuración Correcta en el Controlador
En el controlador, estás definiendo un formato `turbo_stream` para reemplazar el contenido del frame `orders_test_tab`. Revisa que el `partial` especificado en el `turbo_stream.replace` exista y tenga el contenido esperado.

En tu acción `show`:
```ruby
respond_to do |format|
  format.html { render @order.is_a?(::Store::Order) ? "show_store_order" : "show_order" }
  format.turbo_stream do
    render turbo_stream: turbo_stream.replace(
      "orders_test_tab",
      partial: "orders/show/order_tab",
      locals: { order: @order, customer: @order.customer, currency: @account.currency.currency }
    )
  end
end
```

- **Revisa el partial:** Verifica que `orders/show/order_tab` existe y contiene el contenido que deseas cargar en el `turbo_frame`.

### 3. JavaScript para Lazy Loading
Si quieres cargar este contenido solo cuando el usuario interactúe, agrega un evento en JavaScript que cargue el contenido del `turbo_frame_tag` dinámicamente. Un ejemplo sería usar un evento `scroll` o `click`.

En tu JavaScript:
```javascript
document.addEventListener("DOMContentLoaded", () => {
  const turboFrame = document.querySelector("turbo-frame#orders_test_tab");

  if (turboFrame) {
    // Detecta cuando el frame es visible y carga su contenido
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          fetch(turboFrame.src);
          observer.disconnect();
        }
      },
      { rootMargin: "0px", threshold: 0.1 }
    );
    observer.observe(turboFrame);
  }
});
```

En tu vista HAML, asegúrate de configurar el atributo `src` del frame para que haga la solicitud automáticamente cuando sea visible:
```haml
= turbo_frame_tag :orders_test_tab, src: order_path(@order, format: :turbo_stream) do
  = render partial: "orders/show/loading"
```

### 4. Validación Adicional
- **Logs del servidor:** Revisa los logs del servidor para verificar si la solicitud al endpoint `order_path` está siendo ejecutada correctamente.
- **DevTools en el navegador:** Inspecciona las solicitudes de red para confirmar que el `turbo_frame` está cargando el contenido esperado.

### 5. Mejora del Código del Controlador
Considera usar métodos de carga diferida en el controlador para inicializar los datos solo cuando sea necesario. Esto reduce la sobrecarga inicial.

En el controlador, podrías usar `before_action` para manejar partes específicas:
```ruby
before_action :load_payment_data, only: [:show]

def load_payment_data
  @books = load_books
  @payment_processor = load_payment_processor
  @expense = load_expense
  @payment = load_payment
end
```

### Conclusión
Con estas modificaciones, deberías lograr el comportamiento de lazy loading esperado. El `turbo_frame` inicialmente muestra el loading y luego reemplaza su contenido con los datos cargados dinámicamente cuando la solicitud `turbo_stream` se completa. Si sigues teniendo problemas, verifica errores específicos en la consola del navegador o en los logs del servidor.

tengo este controlador:

  def show
    ensure_order_has_line_item_group

    @email_templates = policy_scope(EmailTemplate).select("email_templates.id, email_templates.message, email_templates.subject_line, email_templates.name").order("name ASC")

    @title = "##{@order.visual_id}"

    @billing_states = Address.retrieve_subregions(@customer&.billing_address&.country ||= current_account.country)
    @shipping_states = Address.retrieve_subregions(@customer&.shipping_address&.country ||= current_account.country)

    # Tasks
    @tasks = @order.tasks.unscope(:order).includes(:taskable, :completed_by).order(:position, :due_date)
    @task = Task.new(due_date: @order.due_date)

    # Payments
    @payment_processor = @account.payment_processor || PaymentProcessor.new
    @books = Book.where(bookable: @order)
      .or(Book.where(bookable: @order.statements).where(book_orders: BookOrder.where(order: @order)))
      .includes(:book_category).order(:transaction_date)
    @expense = Expense.new(account: current_account, bookable: @order)
    @payment = Payment.new(transaction_date: Time.current)

    load_size_options_and_images

    # Customer shipping info
    @shipping_label_form = ShippingLabelForm.new(order: @order).prepopulate

    @parent_customer = @order.customer.parent_customer
    @ordered_contacts = @parent_customer.sub_customers.billing_contact_first

    @show_invoice_dates = true
    @public_invoice_view = false

    respond_to do |format|
      format.html { render @order.is_a?(::Store::Order) ? "show_store_order" : "show_order" }
      format.turbo_stream do
        turbo_stream.replace("orders_test_tab", partial: "orders/show/order_tab", locals: {order: @order, customer: @order.customer, currency: @account.currency.currency})
      end
      format.js
    end
  end



tengo esta vista:

= render "orders/show/header_content", order: @order

= javascript_include_tag "order_show_orderstatus"

:javascript
  $(document).on("shown.bs.tab", ".jq-payments-expenses-sidebar", function(e) {
  }).one("shown.bs.tab", ".jq-payments-expenses-sidebar", function(e) {
    createRevenueAndExpensesChart(#{@order.total.amount}, #{@order.expenses_total.amount});
  });

= render "orders/modals/add_payment",
         order: @order,
         books_categories: @account.payment_categories,
         payment: @payment

- if current_account.flipper?(:pt_1057_billing_contact)
  -# When this becomes the default, we can get rid of these files:
     - assets/javascript/payment_request.js
     - views/orders/_reminder_fields.html.haml
     - views/orders/modals/fields/_payment_request_email_fields.html.haml
     - views/orders/modals/fields/_payment_request_text_message_fields.html.haml

  = render "orders/modals/collect_payment_new",
           order: @order,
           payment_processor: @payment_processor,
           account: @account,
           books_categories: @account.payment_categories,
           amount_outstanding: @order.amount_outstanding,
           parent_customer: @parent_customer,
           ordered_contacts: @ordered_contacts
- else
  = render "orders/modals/collect_payment",
           order: @order,
           payment_processor: @payment_processor,
           account: @account,
           books_categories: @account.payment_categories,
           amount_outstanding: @order.amount_outstanding

= render "shipping_labels/modals/new"
= render "orders/modals/approve_invoice",
         order: @order,
         form_url: approve_approval_requests_path,
         account: @account,
         order_images: @order_images,
         approved_approval_requests: @order.approval_requests.approved

= render "expenses/modals/new_expense", expense: @expense
= render "orders/modals/quickbooks_lookup",
         books: @books,
         order: @order,
         currency: @account.currency.currency,
         account: @account

= render "orders/modals/new_merch_store", order: @order
= render "orders/show/navigation_tabs", order: @order, tasks: @tasks, customer: @order.customer, shipping_labels: @order.shipping_labels

#page-content-wrapper
  .page-container.margin-bottom-20
    .row
      .col-sm-12
        .tab-content
          = turbo_frame_tag :orders_test_tab, src: order_path(@order, format: :turbo_stream) do
            = render partial: "orders/show/loading"



pero no está funcionando el turbo_stream.replace con mi la parcial orders/show/order_tab, ya verifique que esten creadas las parciales y todo y está bien, es solo que no sé que pasa porque se queda el loading en la vista

El problema puede estar relacionado con cómo se está manejando la respuesta del controlador, el uso de `turbo_frame_tag` en la vista, o incluso con cómo está configurado tu entorno para Turbo Streams. Aquí tienes una guía para solucionar el problema:

---

### 1. Verificar la Respuesta del Controlador
Asegúrate de que la acción `show` está devolviendo el contenido correcto en el formato `turbo_stream`.

En el controlador:
```ruby
format.turbo_stream do
  render turbo_stream: turbo_stream.replace(
    "orders_test_tab", # ID del frame
    partial: "orders/show/order_tab", # Parcial correcto
    locals: { order: @order, customer: @order.customer, currency: @account.currency.currency }
  )
end
```

- **Clave:** Asegúrate de que `orders_test_tab` es el ID del frame en la vista.

---

### 2. Configuración Correcta en la Vista
Tu `turbo_frame_tag` debe incluir un atributo `src` para permitir el lazy loading.

En la vista HAML:
```haml
= turbo_frame_tag :orders_test_tab, src: order_path(@order, format: :turbo_stream) do
  = render partial: "orders/show/loading"
```

### 3. Confirmar el Partial y su Contexto
Asegúrate de que `orders/show/order_tab` existe y se puede renderizar con las variables locales correctas.

- Revisa que la parcial `orders/show/order_tab` sea válida y no tenga errores. Si usas dependencias como `@order` o `@customer`, verifica que estas variables se están inicializando correctamente en el controlador.

Ejemplo de un archivo `orders/show/_order_tab.html.haml` válido:
```haml
%div
  %h1= "Order: ##{@order.visual_id}"
  %p= "Customer: #{@customer.name}"
  %p= "Currency: #{@currency}"
```

---

### 4. Verificar el Entorno de Desarrollo
En la consola del navegador, revisa las solicitudes de red (Network tab) y asegúrate de que:

1. Se está haciendo una solicitud a `order_path` con el formato `turbo_stream`.
2. El servidor responde con un código HTTP 200 y el contenido correcto en el formato Turbo Stream.

---

### 5. Debugging de Turbo Frame
Añade un identificador único al frame y verifica que está siendo reemplazado correctamente.

```haml
= turbo_frame_tag :orders_test_tab, id: "orders_test_tab", src: order_path(@order, format: :turbo_stream) do
  = render partial: "orders/show/loading"
```

Para asegurarte de que Turbo Streams está funcionando:

- En la consola del navegador, escribe:
  ```javascript
  Turbo.StreamActions.replace = (target, template) => {
    console.log(`Replacing content for ${target}`);
    document.getElementById(target).innerHTML = template.innerHTML;
  };
  ```

Esto te permitirá ver si Turbo está intentando reemplazar el contenido.

---

### 6. Verificar el Turbo Frame en el Servidor
Agrega un log en el controlador para confirmar que el bloque `format.turbo_stream` se está ejecutando:

```ruby
format.turbo_stream do
  Rails.logger.info "Turbo Stream executed for orders_test_tab"
  render turbo_stream: turbo_stream.replace(
    "orders_test_tab",
    partial: "orders/show/order_tab",
    locals: { order: @order, customer: @order.customer, currency: @account.currency.currency }
  )
end
```

Consulta los logs del servidor para verificar que este mensaje aparece al cargar la página.

---

### 7. Aislar el Problema
Intenta cargar el contenido directamente en el navegador visitando:

```
http://localhost:3000/orders/:id.turbo_stream
```

Deberías ver un contenido como:
```html
<turbo-stream action="replace" target="orders_test_tab">
  <template>
    <!-- Contenido del partial -->
  </template>
</turbo-stream>
```

Si ves errores o contenido incorrecto, depura en el controlador o el partial.

---

### 8. Verificar Dependencias de JavaScript
Asegúrate de que tienes las dependencias necesarias para Turbo cargadas en tu aplicación, como el archivo `turbo.js`.

En el layout:
```haml
= javascript_include_tag "turbo", defer: true
```

---

Con estos pasos, deberías identificar y solucionar el problema. Si el problema persiste, es probable que sea un error en cómo estás inicializando las variables o configurando Turbo Streams en tu aplicación.

tengo este error:

espond_to was called multiple times and matched with conflicting formats in this action. Please note that you may only call respond_to and match on a single format per action.


  def show
    ensure_order_has_line_item_group

    @email_templates = policy_scope(EmailTemplate).select("email_templates.id, email_templates.message, email_templates.subject_line, email_templates.name").order("name ASC")

    @title = "##{@order.visual_id}"

    @billing_states = Address.retrieve_subregions(@customer&.billing_address&.country ||= current_account.country)
    @shipping_states = Address.retrieve_subregions(@customer&.shipping_address&.country ||= current_account.country)

    # Tasks
    @tasks = @order.tasks.unscope(:order).includes(:taskable, :completed_by).order(:position, :due_date)
    @task = Task.new(due_date: @order.due_date)

    # Payments
    @payment_processor = @account.payment_processor || PaymentProcessor.new
    @books = Book.where(bookable: @order)
      .or(Book.where(bookable: @order.statements).where(book_orders: BookOrder.where(order: @order)))
      .includes(:book_category).order(:transaction_date)
    @expense = Expense.new(account: current_account, bookable: @order)
    @payment = Payment.new(transaction_date: Time.current)

    load_size_options_and_images

    # Customer shipping info
    @shipping_label_form = ShippingLabelForm.new(order: @order).prepopulate

    @parent_customer = @order.customer.parent_customer
    @ordered_contacts = @parent_customer.sub_customers.billing_contact_first

    @show_invoice_dates = true
    @public_invoice_view = false

    respond_to do |format|
      format.html { render @order.is_a?(::Store::Order) ? "show_store_order" : "show_order" }
      render turbo_stream: [
        turbo_stream.replace(:orders_test_tab, partial: "orders/show/order_tab", locals: {order: @order, customer: @order.customer, currency: @account.currency.currency})
      ]
      format.js
    end
  end

El error ocurre porque estás invocando `render turbo_stream` fuera del bloque condicional de `format`, lo que genera conflictos de formato en `respond_to`. Solo puedes invocar una respuesta por formato dentro de un único bloque `respond_to`.

### Solución

Para solucionar este problema, asegúrate de que cada respuesta esté claramente delimitada dentro de `format` y elimina cualquier respuesta conflictiva. Aquí está la corrección:

```ruby
def show
  ensure_order_has_line_item_group

  @email_templates = policy_scope(EmailTemplate).select("email_templates.id, email_templates.message, email_templates.subject_line, email_templates.name").order("name ASC")

  @title = "##{@order.visual_id}"

  @billing_states = Address.retrieve_subregions(@customer&.billing_address&.country ||= current_account.country)
  @shipping_states = Address.retrieve_subregions(@customer&.shipping_address&.country ||= current_account.country)

  # Tasks
  @tasks = @order.tasks.unscope(:order).includes(:taskable, :completed_by).order(:position, :due_date)
  @task = Task.new(due_date: @order.due_date)

  # Payments
  @payment_processor = @account.payment_processor || PaymentProcessor.new
  @books = Book.where(bookable: @order)
    .or(Book.where(bookable: @order.statements).where(book_orders: BookOrder.where(order: @order)))
    .includes(:book_category).order(:transaction_date)
  @expense = Expense.new(account: current_account, bookable: @order)
  @payment = Payment.new(transaction_date: Time.current)

  load_size_options_and_images

  # Customer shipping info
  @shipping_label_form = ShippingLabelForm.new(order: @order).prepopulate

  @parent_customer = @order.customer.parent_customer
  @ordered_contacts = @parent_customer.sub_customers.billing_contact_first

  @show_invoice_dates = true
  @public_invoice_view = false

  respond_to do |format|
    format.html do
      render @order.is_a?(::Store::Order) ? "show_store_order" : "show_order"
    end
    format.turbo_stream do
      render turbo_stream: turbo_stream.replace(
        :orders_test_tab,
        partial: "orders/show/order_tab",
        locals: { order: @order, customer: @order.customer, currency: @account.currency.currency }
      )
    end
    format.js
  end
end
```

### Cambios Realizados

1. **Delimitación de `format.turbo_stream`:** La respuesta Turbo Stream ahora está claramente dentro del bloque `format.turbo_stream`.
2. **Eliminación de Respuestas Conflictivas:** Se eliminó el `render turbo_stream` fuera de los bloques `format`.

### Notas

- **Formato Turbo Stream:** Si necesitas manejar diferentes formatos, asegúrate de que las rutas o solicitudes incluyan el formato esperado (`.html`, `.turbo_stream`, `.js`).
- **Depuración:** Revisa los logs del servidor para confirmar que la solicitud está llegando con el formato esperado (`Started GET "/orders/1.turbo_stream"`).

Con esta solución, el error debería resolverse y las respuestas deberían comportarse correctamente según el formato solicitado.

Alright, then how can i handle multiple render:


  def show
    ensure_order_has_line_item_group

    @email_templates = policy_scope(EmailTemplate).select("email_templates.id, email_templates.message, email_templates.subject_line, email_templates.name").order("name ASC")

    @title = "##{@order.visual_id}"

    @billing_states = Address.retrieve_subregions(@customer&.billing_address&.country ||= current_account.country)
    @shipping_states = Address.retrieve_subregions(@customer&.shipping_address&.country ||= current_account.country)

    # Tasks
    @tasks = @order.tasks.unscope(:order).includes(:taskable, :completed_by).order(:position, :due_date)
    @task = Task.new(due_date: @order.due_date)

    # Payments
    @payment_processor = @account.payment_processor || PaymentProcessor.new
    @books = Book.where(bookable: @order)
      .or(Book.where(bookable: @order.statements).where(book_orders: BookOrder.where(order: @order)))
      .includes(:book_category).order(:transaction_date)
    @expense = Expense.new(account: current_account, bookable: @order)
    @payment = Payment.new(transaction_date: Time.current)

    load_size_options_and_images

    # Customer shipping info
    @shipping_label_form = ShippingLabelForm.new(order: @order).prepopulate

    @parent_customer = @order.customer.parent_customer
    @ordered_contacts = @parent_customer.sub_customers.billing_contact_first

    @show_invoice_dates = true
    @public_invoice_view = false

    respond_to do |format|
      format.html do
        render @order.is_a?(::Store::Order) ? "show_store_order" : "show_order"
      end
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          :order_tab,
          partial: "orders/show/order_tab",
          locals: {order: @order, customer: @order.customer, currency: @account.currency.currency}
        )
        render turbo_stream: turbo_stream.replace(
          :tasks_tab,
          partial: "orders/show/tasks_tab",
          locals: {order: @order, tasks: @tasks, task: @task}
        )
        render turbo_stream: turbo_stream.replace(
          :messages_tab,
          partial: "orders/show/messages_tab",
          locals: {order: @order, message: @order.email_messages.newy}
        )
      end
      format.js
    end
  end

When you want to handle multiple `render` calls in a single `format` block, you need to combine the responses into a single `turbo_stream` payload. Each `render turbo_stream` call overwrites the previous one if done sequentially, which is why your setup isn’t working.

Instead, you can use an array or combine multiple Turbo Stream actions in a single `render` call.

### Correct Approach

Combine all `turbo_stream.replace` calls into a single `render turbo_stream`:

```ruby
def show
  ensure_order_has_line_item_group

  @email_templates = policy_scope(EmailTemplate).select("email_templates.id, email_templates.message, email_templates.subject_line, email_templates.name").order("name ASC")

  @title = "##{@order.visual_id}"

  @billing_states = Address.retrieve_subregions(@customer&.billing_address&.country ||= current_account.country)
  @shipping_states = Address.retrieve_subregions(@customer&.shipping_address&.country ||= current_account.country)

  # Tasks
  @tasks = @order.tasks.unscope(:order).includes(:taskable, :completed_by).order(:position, :due_date)
  @task = Task.new(due_date: @order.due_date)

  # Payments
  @payment_processor = @account.payment_processor || PaymentProcessor.new
  @books = Book.where(bookable: @order)
    .or(Book.where(bookable: @order.statements).where(book_orders: BookOrder.where(order: @order)))
    .includes(:book_category).order(:transaction_date)
  @expense = Expense.new(account: current_account, bookable: @order)
  @payment = Payment.new(transaction_date: Time.current)

  load_size_options_and_images

  # Customer shipping info
  @shipping_label_form = ShippingLabelForm.new(order: @order).prepopulate

  @parent_customer = @order.customer.parent_customer
  @ordered_contacts = @parent_customer.sub_customers.billing_contact_first

  @show_invoice_dates = true
  @public_invoice_view = false

  respond_to do |format|
    format.html do
      render @order.is_a?(::Store::Order) ? "show_store_order" : "show_order"
    end
    format.turbo_stream do
      render turbo_stream: [
        turbo_stream.replace(:order_tab, partial: "orders/show/order_tab", locals: {order: @order, customer: @order.customer, currency: @account.currency.currency}),
        turbo_stream.replace(:tasks_tab, partial: "orders/show/tasks_tab", locals: {order: @order, tasks: @tasks, task: @task}),
        turbo_stream.replace(:messages_tab, partial: "orders/show/messages_tab", locals: {order: @order, message: @order.email_messages.new})
      ]
    end
    format.js
  end
end
```

### Key Changes

1. **Combine Turbo Streams into an Array**: The `render turbo_stream` now takes an array of `turbo_stream.replace` actions. This ensures all the replacements are included in the same response.

2. **No Multiple `render turbo_stream` Calls**: Instead of calling `render` multiple times, you consolidate all the actions into one `render` call.

3. **Efficient Partial Handling**: Each partial (`order_tab`, `tasks_tab`, `messages_tab`) is rendered with its respective locals.

---

### Debugging Tips

- **Network Tab in DevTools**: Check the Turbo Stream response in the browser's network tab to ensure all the `turbo-stream` actions are included.
- **Turbo Frame IDs**: Make sure the `id` attributes in your `turbo_frame_tag` elements match the `target` values used in the `turbo_stream.replace` calls.
- **Server Logs**: Inspect the Rails logs to confirm that the response is correctly formatted.

This setup ensures all your tabs are dynamically updated within a single Turbo Stream response.

hacer esto me ayuda significamente con lazy load? 

Yes, combining multiple `turbo_stream.replace` actions into a single `render` call is an effective way to implement **lazy loading** for your application. Here’s why:

---

### 1. **Efficient Network Usage**
When using a single `render turbo_stream` with an array of `turbo_stream.replace` actions, Rails sends a single HTTP response with multiple updates. This minimizes the overhead of multiple requests, making the lazy loading process more efficient.

Instead of handling separate requests for each tab (`order_tab`, `tasks_tab`, `messages_tab`), you're loading everything in one response triggered by the user's action (e.g., scrolling or tab activation).

---

### 2. **Granular Updates**
Turbo Stream's `turbo_frame_tag` and `turbo_stream.replace` allow you to control which parts of the page are updated. Lazy loading ensures only the visible or requested portions of the page are fetched and rendered, saving resources and improving performance.

For instance:
- The `:order_tab` might only load when the user navigates to the orders section.
- The `:tasks_tab` loads only when the tasks section becomes relevant.
- The `:messages_tab` can lazy-load only when the user interacts with messages.

---

### 3. **Dynamic and Lazy Loading Together**
By combining this with Turbo Frames (`turbo_frame_tag` with a `src` attribute), you can dynamically trigger these updates when needed, rather than preloading all data upfront.

Example in your view:
```haml
= turbo_frame_tag :order_tab, src: order_path(@order, tab: "order_tab", format: :turbo_stream) do
  = render partial: "orders/show/loading"

= turbo_frame_tag :tasks_tab, src: order_path(@order, tab: "tasks_tab", format: :turbo_stream) do
  = render partial: "orders/show/loading"

= turbo_frame_tag :messages_tab, src: order_path(@order, tab: "messages_tab", format: :turbo_stream) do
  = render partial: "orders/show/loading"
```

And modify your `show` action to handle the `tab` parameter:
```ruby
def show
  ensure_order_has_line_item_group

  # Load common resources
  @title = "##{@order.visual_id}"
  @customer = @order.customer

  respond_to do |format|
    format.html do
      render @order.is_a?(::Store::Order) ? "show_store_order" : "show_order"
    end
    format.turbo_stream do
      case params[:tab]
      when "order_tab"
        render turbo_stream: turbo_stream.replace(:order_tab, partial: "orders/show/order_tab", locals: {order: @order, customer: @customer})
      when "tasks_tab"
        @tasks = @order.tasks.includes(:taskable, :completed_by).order(:position, :due_date)
        render turbo_stream: turbo_stream.replace(:tasks_tab, partial: "orders/show/tasks_tab", locals: {tasks: @tasks})
      when "messages_tab"
        @messages = @order.email_messages
        render turbo_stream: turbo_stream.replace(:messages_tab, partial: "orders/show/messages_tab", locals: {messages: @messages})
      else
        # Default loading case
        render turbo_stream: turbo_stream.replace(:orders_test_tab, partial: "orders/show/loading")
      end
    end
  end
end
```

### 4. **Improved User Experience**
Lazy loading only loads data when necessary, improving the initial page load speed. This is especially useful if:
- The `tasks_tab` or `messages_tab` has data that is resource-intensive to fetch or render.
- Users only interact with certain tabs or sections during their session.

---

### Conclusion: Why This is Significant for Lazy Loading
By combining Turbo Streams and Frames:
- **Less Initial Payload**: Only `loading` placeholders are rendered initially, saving bandwidth and server resources.
- **On-Demand Loading**: Data is fetched and rendered only when the user interacts with a specific section or frame.
- **Single Response Efficiency**: The approach minimizes redundant requests by batching multiple updates in a single Turbo Stream response.

This setup makes your application faster, more responsive, and more efficient, providing a better user experience while keeping resource usage under control.

How can i use a turbo_stream.replace if something



      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace(:order_tab, partial: "orders/show/order_tab", locals: {order: @order, customer: @order.customer, currency: @account.currency.currency}),
          turbo_stream.replace(:tasks_tab, partial: "orders/show/tasks_tab", locals: {order: @order, tasks: @tasks, task: @task}),
          turbo_stream.replace(:messages_tab, partial: "orders/show/messages_tab", locals: {order: @order, message: @order.email_messages.new}),
          turbo_stream.replace(:messages_tab, partial: "orders/show/payments_expenses_tab", locals: {order: @order, books: @books, currency: @account.currency.currency}),
          turbo_stream.replace(:messages_tab, partial: "orders/show/scheduled_tab", locals: {order: @order})
        ]
      end

To handle conditions for specific `turbo_stream.replace` calls dynamically within a `format.turbo_stream` block, you can use Ruby's control flow structures like `if` or `case` statements to add or skip specific Turbo Stream actions based on certain criteria.

Here’s how you can modify your code to include conditional logic:

### Updated Code with Conditions

```ruby
format.turbo_stream do
  turbo_stream_actions = []

  # Always replace :order_tab
  turbo_stream_actions << turbo_stream.replace(:order_tab, partial: "orders/show/order_tab", locals: { order: @order, customer: @order.customer, currency: @account.currency.currency })

  # Conditionally add :tasks_tab
  if @tasks.any?
    turbo_stream_actions << turbo_stream.replace(:tasks_tab, partial: "orders/show/tasks_tab", locals: { order: @order, tasks: @tasks, task: @task })
  end

  # Conditionally add :messages_tab
  if @order.email_messages.present?
    turbo_stream_actions << turbo_stream.replace(:messages_tab, partial: "orders/show/messages_tab", locals: { order: @order, message: @order.email_messages.new })
  end

  # Conditionally add :payments_expenses_tab
  if @books.present?
    turbo_stream_actions << turbo_stream.replace(:payments_expenses_tab, partial: "orders/show/payments_expenses_tab", locals: { order: @order, books: @books, currency: @account.currency.currency })
  end

  # Conditionally add :scheduled_tab
  if @order.scheduled?
    turbo_stream_actions << turbo_stream.replace(:scheduled_tab, partial: "orders/show/scheduled_tab", locals: { order: @order })
  end

  render turbo_stream: turbo_stream_actions
end
```

### Explanation

1. **Dynamic Turbo Stream Actions**:
   - Create an array `turbo_stream_actions` to collect the `turbo_stream.replace` calls dynamically based on conditions.
   - Use `<<` to append a `turbo_stream.replace` to the array only if the corresponding condition is met.

2. **Conditions**:
   - Replace `:tasks_tab` only if `@tasks.any?` is true (i.e., there are tasks).
   - Replace `:messages_tab` only if `@order.email_messages` is present.
   - Replace `:payments_expenses_tab` only if `@books` has any records.
   - Replace `:scheduled_tab` only if the order has a `scheduled?` status.

3. **Final Render**:
   - Pass the dynamically constructed array of Turbo Stream actions (`turbo_stream_actions`) to `render`.

### Benefits of This Approach

- **Flexible Updates**: Only relevant sections of the page are updated, avoiding unnecessary rendering.
- **Optimized Performance**: Conditional rendering minimizes processing and data transfer for unused tabs.
- **Maintainability**: Adding new conditions or modifying existing ones is straightforward.

This approach ensures that your Turbo Streams adapt dynamically to the state of the application.

mmm i dont think handle it with that way would be the best one, could you give me another approach 

Certainly! Another approach is to separate the logic for each section (or tab) into individual controller actions. Each action can handle the rendering of its specific `turbo_stream.replace`, making the code cleaner and easier to maintain. This approach is especially effective when combined with `turbo_frame_tag` in the views, enabling true lazy loading for each section.

### How This Works

1. **Split Responsibility**: Each "tab" has its own endpoint that renders a partial via `turbo_stream.replace`.
2. **Trigger Rendering Dynamically**: Use `turbo_frame_tag` with a `src` attribute to load each section only when needed.
3. **Centralized Fallback**: The main action (`show`) still serves as the fallback for the initial load.

---

### Implementation

#### 1. Adjust the View with `turbo_frame_tag`
Use `turbo_frame_tag` in your view to separate each tab into a lazy-loaded frame:

```haml
= turbo_frame_tag :order_tab, src: order_tab_path(@order) do
  = render partial: "orders/show/loading"

= turbo_frame_tag :tasks_tab, src: tasks_tab_path(@order) do
  = render partial: "orders/show/loading"

= turbo_frame_tag :messages_tab, src: messages_tab_path(@order) do
  = render partial: "orders/show/loading"

= turbo_frame_tag :payments_expenses_tab, src: payments_expenses_tab_path(@order) do
  = render partial: "orders/show/loading"

= turbo_frame_tag :scheduled_tab, src: scheduled_tab_path(@order) do
  = render partial: "orders/show/loading"
```

---

#### 2. Add Individual Controller Actions

Each action focuses on rendering the content for its specific frame.

```ruby
class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :order_tab, :tasks_tab, :messages_tab, :payments_expenses_tab, :scheduled_tab]

  def show
    # This action serves as the main fallback
    @title = "##{@order.visual_id}"
    # Other common initializations
  end

  def order_tab
    render turbo_stream: turbo_stream.replace(
      :order_tab,
      partial: "orders/show/order_tab",
      locals: { order: @order, customer: @order.customer, currency: @account.currency.currency }
    )
  end

  def tasks_tab
    @tasks = @order.tasks.includes(:taskable, :completed_by).order(:position, :due_date)
    render turbo_stream: turbo_stream.replace(
      :tasks_tab,
      partial: "orders/show/tasks_tab",
      locals: { order: @order, tasks: @tasks, task: Task.new }
    )
  end

  def messages_tab
    @messages = @order.email_messages
    render turbo_stream: turbo_stream.replace(
      :messages_tab,
      partial: "orders/show/messages_tab",
      locals: { order: @order, message: @order.email_messages.new }
    )
  end

  def payments_expenses_tab
    @books = Book.where(bookable: @order)
      .or(Book.where(bookable: @order.statements).where(book_orders: BookOrder.where(order: @order)))
      .includes(:book_category).order(:transaction_date)
    render turbo_stream: turbo_stream.replace(
      :payments_expenses_tab,
      partial: "orders/show/payments_expenses_tab",
      locals: { order: @order, books: @books, currency: @account.currency.currency }
    )
  end

  def scheduled_tab
    render turbo_stream: turbo_stream.replace(
      :scheduled_tab,
      partial: "orders/show/scheduled_tab",
      locals: { order: @order }
    )
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
```

---

#### 3. Update Routes

Add routes for the new actions:

```ruby
resources :orders do
  member do
    get :order_tab
    get :tasks_tab
    get :messages_tab
    get :payments_expenses_tab
    get :scheduled_tab
  end
end
```

---

### Benefits of This Approach

1. **Lazy Loading by Default**:
   - Each tab loads only when requested (e.g., when the user scrolls to it or clicks it).
   - This reduces the initial payload and speeds up the initial page load.

2. **Separation of Concerns**:
   - Each action has a single responsibility: rendering a specific partial for its corresponding tab.
   - This makes debugging, testing, and maintaining easier.

3. **Scalability**:
   - Adding new tabs or modifying existing ones is straightforward.
   - You don't need to handle complex conditionals in a single `show` action.

4. **Optimized for Turbo**:
   - Turbo Frames and Turbo Streams work seamlessly with this design.
   - You can use caching mechanisms (e.g., `fresh_when`) to further optimize performance.

---

### Conclusion

This approach leverages Turbo Frames and Streams to achieve modular and lazy-loaded components for your tabs. It eliminates the need for complex conditionals in the `show` action and enhances both performance and maintainability.

but add a lot of methods into a controller is not a option, can i do something like:


      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace(:order_tab, partial: "orders/show/order_tab", locals: {order: @order, customer: @order.customer, currency: @account.currency.currency}),
          turbo_stream.replace(:tasks_tab, partial: "orders/show/tasks_tab", locals: {order: @order, tasks: @tasks, task: @task}),
          turbo_stream.replace(:messages_tab, partial: "orders/show/messages_tab", locals: {order: @order, message: @order.email_messages.new}),
          turbo_stream.replace(:messages_tab, partial: "orders/show/payments_expenses_tab", locals: {order: @order, books: @books, currency: @account.currency.currency}), if something
          turbo_stream.replace(:messages_tab, partial: "orders/show/scheduled_tab", locals: {order: @order}) if something
        ]
      end

Yes, you can absolutely incorporate conditional logic directly into the `turbo_stream.replace` array to control whether specific actions should be included. Ruby allows inline `if` conditions within an array, so you can dynamically include or exclude `turbo_stream.replace` calls based on your logic.

Here's how you can handle it:

```ruby
format.turbo_stream do
  render turbo_stream: [
    turbo_stream.replace(:order_tab, partial: "orders/show/order_tab", locals: { order: @order, customer: @order.customer, currency: @account.currency.currency }),
    turbo_stream.replace(:tasks_tab, partial: "orders/show/tasks_tab", locals: { order: @order, tasks: @tasks, task: @task }),
    turbo_stream.replace(:messages_tab, partial: "orders/show/messages_tab", locals: { order: @order, message: @order.email_messages.new }),
    (turbo_stream.replace(:payments_expenses_tab, partial: "orders/show/payments_expenses_tab", locals: { order: @order, books: @books, currency: @account.currency.currency }) if some_condition?),
    (turbo_stream.replace(:scheduled_tab, partial: "orders/show/scheduled_tab", locals: { order: @order }) if another_condition?)
  ].compact
end
```

### Explanation of Changes

1. **Inline Conditionals**:
   - Use Ruby's inline `if` to include a `turbo_stream.replace` call only if the condition is true.
   - For example:
     ```ruby
     turbo_stream.replace(:payments_expenses_tab, partial: "orders/show/payments_expenses_tab", locals: { order: @order, books: @books, currency: @account.currency.currency }) if some_condition?
     ```

2. **Compact**:
   - The `.compact` method removes `nil` values from the array.
   - This is necessary because the conditional statements will return `nil` if the condition is false, and `render` cannot handle `nil` elements.

3. **Dynamic Inclusion**:
   - The array dynamically includes or excludes the `turbo_stream.replace` calls based on the result of the conditions.

### Benefits

- **No Additional Methods**: You avoid creating multiple methods in your controller, keeping it cleaner and simpler.
- **Maintainable**: Inline conditions make it easy to see when a specific tab is rendered without needing to search through multiple methods.
- **Efficient**: Unnecessary rendering is skipped, improving performance.

### Example with Conditions

```ruby
format.turbo_stream do
  render turbo_stream: [
    turbo_stream.replace(:order_tab, partial: "orders/show/order_tab", locals: { order: @order, customer: @order.customer, currency: @account.currency.currency }),
    turbo_stream.replace(:tasks_tab, partial: "orders/show/tasks_tab", locals: { order: @order, tasks: @tasks, task: @task }),
    turbo_stream.replace(:messages_tab, partial: "orders/show/messages_tab", locals: { order: @order, message: @order.email_messages.new }),
    (turbo_stream.replace(:payments_expenses_tab, partial: "orders/show/payments_expenses_tab", locals: { order: @order, books: @books, currency: @account.currency.currency }) if @books.present?),
    (turbo_stream.replace(:scheduled_tab, partial: "orders/show/scheduled_tab", locals: { order: @order }) if @order.scheduled?)
  ].compact
end
```

### Key Considerations

- **Readability**: While this approach avoids additional methods, be cautious of overly complex conditions that could hurt readability. Keep conditions straightforward.
- **Reusability**: If a certain condition is used frequently, consider extracting it into a helper method to avoid duplication (e.g., `def some_condition?`).

This approach combines the flexibility of conditional logic with the simplicity of a single `turbo_stream` response, making it an excellent fit for your requirements.

mm es que quiero que me ayudes con unas condiciones:


asi es como antes estaba

      .col-sm-12
        .tab-content
          = render "orders/show/order_tab", order: @order, customer: @order.customer, currency: @account.currency.currency
          = render "orders/show/tasks_tab", order: @order, tasks: @tasks, task: @task
          = render "orders/show/messages_tab", order: @order, message: @order.email_messages.new
          - if show_expenses_tab?(@order)
            = render "orders/show/payments_expenses_tab", order: @order, books: @books, currency: @account.currency.currency
          - if policy(::Scheduler::ImprintWorkTypeSchedule).index?
            = render "orders/show/scheduled_tab", order: @order


yo lo tengo asi:

#page-content-wrapper
  .page-container.margin-bottom-20
    .row
      .col-sm-12
        .tab-content
          = turbo_frame_tag :order_tab, src: order_path(@order, format: :turbo_stream) do
            = render partial: "orders/show/loading"
          = turbo_frame_tag :tasks_tab do
            = render partial: "orders/show/loading"
          = turbo_frame_tag :messages_tab do
            = render partial: "orders/show/loading"
          = turbo_frame_tag :payments_expenses_tab do
            = render partial: "orders/show/loading"
          = turbo_frame_tag :scheduled_tab do
            = render partial: "orders/show/loading"


pero como puedo respetar las condiciones ?

Para respetar las condiciones como las que tenías anteriormente, puedes integrar esas condiciones directamente en la estructura de los `turbo_frame_tag`. Esto asegurará que los frames solo se rendericen (y carguen) cuando las condiciones lo permitan.

Aquí tienes una solución adaptada para incluir las condiciones:

---

### Adaptación con Condiciones

```haml
#page-content-wrapper
  .page-container.margin-bottom-20
    .row
      .col-sm-12
        .tab-content
          = turbo_frame_tag :order_tab, src: order_path(@order, format: :turbo_stream) do
            = render partial: "orders/show/loading"

          = turbo_frame_tag :tasks_tab, src: tasks_path(@order, format: :turbo_stream) do
            = render partial: "orders/show/loading"

          = turbo_frame_tag :messages_tab, src: messages_path(@order, format: :turbo_stream) do
            = render partial: "orders/show/loading"

          - if show_expenses_tab?(@order)
            = turbo_frame_tag :payments_expenses_tab, src: payments_expenses_path(@order, format: :turbo_stream) do
              = render partial: "orders/show/loading"

          - if policy(::Scheduler::ImprintWorkTypeSchedule).index?
            = turbo_frame_tag :scheduled_tab, src: scheduled_path(@order, format: :turbo_stream) do
              = render partial: "orders/show/loading"
```

---

### Detalles de la Solución

1. **Condiciones en Turbo Frames**:
   - La condición `- if show_expenses_tab?(@order)` asegura que el frame `:payments_expenses_tab` solo se renderice si se cumple la condición.
   - Lo mismo aplica para la pestaña `:scheduled_tab` con la condición `- if policy(::Scheduler::ImprintWorkTypeSchedule).index?`.

2. **Carga Diferida**:
   - Cada `turbo_frame_tag` tiene un atributo `src` que apunta a una ruta que carga dinámicamente el contenido cuando el frame se activa por el usuario.

3. **Fallback de Carga**:
   - Si el contenido no está listo o no se carga, se muestra un indicador de carga definido como `= render partial: "orders/show/loading"`.

---

### Ajustes en el Controlador

Configura las acciones en tu controlador para manejar las rutas dinámicas y respetar las condiciones:

```ruby
class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :tasks_tab, :messages_tab, :payments_expenses_tab, :scheduled_tab]

  def show
    # Acción principal para cargar la vista inicial
  end

  def tasks_tab
    @tasks = @order.tasks.includes(:taskable, :completed_by).order(:position, :due_date)
    render turbo_stream: turbo_stream.replace(:tasks_tab, partial: "orders/show/tasks_tab", locals: { order: @order, tasks: @tasks, task: Task.new })
  end

  def messages_tab
    @messages = @order.email_messages
    render turbo_stream: turbo_stream.replace(:messages_tab, partial: "orders/show/messages_tab", locals: { order: @order, message: @order.email_messages.new })
  end

  def payments_expenses_tab
    if show_expenses_tab?(@order)
      @books = Book.where(bookable: @order)
        .or(Book.where(bookable: @order.statements).where(book_orders: BookOrder.where(order: @order)))
        .includes(:book_category).order(:transaction_date)
      render turbo_stream: turbo_stream.replace(:payments_expenses_tab, partial: "orders/show/payments_expenses_tab", locals: { order: @order, books: @books, currency: @account.currency.currency })
    else
      head :forbidden
    end
  end

  def scheduled_tab
    if policy(::Scheduler::ImprintWorkTypeSchedule).index?
      render turbo_stream: turbo_stream.replace(:scheduled_tab, partial: "orders/show/scheduled_tab", locals: { order: @order })
    else
      head :forbidden
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
```

---

### Ajustes en las Rutas

Define las rutas para cada pestaña:

```ruby
resources :orders do
  member do
    get :tasks_tab
    get :messages_tab
    get :payments_expenses_tab
    get :scheduled_tab
  end
end
```

---

### Ventajas de Este Enfoque

1. **Condiciones Respetadas**:
   - Las pestañas solo se renderizan si las condiciones se cumplen.
   - Ahorro de recursos al no renderizar frames innecesarios.

2. **Lazy Loading Efectivo**:
   - Solo se carga el contenido del frame cuando el usuario interactúa con él.
   - Esto mejora el rendimiento inicial de la página.

3. **Código Limpio y Modular**:
   - Las condiciones están directamente en la vista donde pertenecen.
   - Las acciones del controlador son claras y se mantienen separadas por funcionalidad.

Este enfoque combina las ventajas de las condiciones tradicionales con la capacidad de Turbo Frames para manejar cargas diferidas de manera eficiente.

y como debe verse mi controlador?


yo lo hice asi:

    respond_to do |format|
      format.html do
        render @order.is_a?(::Store::Order) ? "show_store_order" : "show_order"
      end
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace(:order_tab, partial: "orders/show/order_tab", locals: {order: @order, customer: @order.customer, currency: @account.currency.currency}),
          turbo_stream.replace(:tasks_tab, partial: "orders/show/tasks_tab", locals: {order: @order, tasks: @tasks, task: @task}),
          turbo_stream.replace(:messages_tab, partial: "orders/show/messages_tab", locals: {order: @order, message: @order.email_messages.new}),
          (turbo_stream.replace(:payments_expenses_tab, partial: "orders/show/payments_expenses_tab", locals: {order: @order, books: @books, currency: @account.currency.currency}) if policy(::Scheduler::ImprintWorkTypeSchedule).index?),
          (turbo_stream.replace(:scheduled_tab, partial: "orders/show/scheduled_tab", locals: {order: @order}) if show_expenses_tab?(@order))
        ].compact
      end
      format.js
    end


pero me marca este error :

NoMethodError at /invoices/65.turbo_stream
undefined method `show_expenses_tab?' for #<OrdersController:0x00000001669c60>
    1  class OrdersController < AuthenticatedController
[0m  107    def show
[0m  140      respond_to do |format|
[0m  144        format.turbo_stream do


y mi punto no importar los helper a mi controlador, lo que quiero es hacerlo de la forma mas sin modificar nada extra de lo que ya esta

El error que mencionas ocurre porque `show_expenses_tab?` probablemente está definido en un **helper** (o fuera del controlador), y los métodos de helpers no están disponibles directamente en el controlador.

Si no quieres importar helpers ni modificar su configuración, puedes mover la lógica de las condiciones directamente al controlador. Esto se puede hacer inyectando la lógica de los helpers como condiciones locales simples en la acción del controlador sin depender de métodos externos.

Aquí tienes cómo ajustar tu controlador sin importar helpers:

---

### Ajuste del Controlador

```ruby
respond_to do |format|
  format.html do
    render @order.is_a?(::Store::Order) ? "show_store_order" : "show_order"
  end
  format.turbo_stream do
    # Definir las condiciones localmente
    should_show_expenses_tab = @order.some_logic_for_expenses_tab? # Reemplaza con la lógica directa
    can_show_scheduled_tab = policy(::Scheduler::ImprintWorkTypeSchedule).index?

    render turbo_stream: [
      turbo_stream.replace(:order_tab, partial: "orders/show/order_tab", locals: { order: @order, customer: @order.customer, currency: @account.currency.currency }),
      turbo_stream.replace(:tasks_tab, partial: "orders/show/tasks_tab", locals: { order: @order, tasks: @tasks, task: @task }),
      turbo_stream.replace(:messages_tab, partial: "orders/show/messages_tab", locals: { order: @order, message: @order.email_messages.new }),
      (turbo_stream.replace(:payments_expenses_tab, partial: "orders/show/payments_expenses_tab", locals: { order: @order, books: @books, currency: @account.currency.currency }) if should_show_expenses_tab),
      (turbo_stream.replace(:scheduled_tab, partial: "orders/show/scheduled_tab", locals: { order: @order }) if can_show_scheduled_tab)
    ].compact
  end
  format.js
end
```

---

### Detalles de la Solución

1. **Definir Lógicas de Condiciones en el Controlador**:
   - En lugar de llamar a un helper como `show_expenses_tab?`, define una lógica equivalente directamente en el controlador usando variables locales como `should_show_expenses_tab`.

   Por ejemplo:
   ```ruby
   should_show_expenses_tab = @order.some_logic_for_expenses_tab?
   ```

   Si la lógica original de `show_expenses_tab?` involucra varias condiciones, puedes replicarla directamente aquí o extraerla como un método privado del controlador.

2. **Evitar Dependencias de Helpers**:
   - No necesitas importar el helper ni modificar su configuración.
   - Mantienes toda la lógica dentro del controlador.

3. **Políticas en Línea**:
   - En lugar de usar un helper o policy indirectamente, puedes evaluar la política directamente en el controlador:
     ```ruby
     can_show_scheduled_tab = policy(::Scheduler::ImprintWorkTypeSchedule).index?
     ```

4. **Compactar el Array**:
   - Como en tu ejemplo original, usa `.compact` para eliminar los elementos `nil` del array de Turbo Streams si las condiciones no se cumplen.

---

### Ejemplo de Lógica Equivalente para `show_expenses_tab?`

Si `show_expenses_tab?(@order)` era algo como esto en tu helper:

```ruby
def show_expenses_tab?(order)
  order.books.any? && order.currency.present?
end
```

Puedes replicarlo directamente en el controlador:

```ruby
should_show_expenses_tab = @order.books.any? && @order.currency.present?
```

Esto elimina la necesidad de usar el helper pero mantiene exactamente el mismo comportamiento.

---

### Ventajas de Este Enfoque

1. **Autonomía del Controlador**:
   - Toda la lógica se mantiene dentro del controlador, sin depender de helpers externos.

2. **Sin Cambios en Configuración**:
   - No necesitas importar ni incluir helpers en el controlador.

3. **Fácil de Leer y Mantener**:
   - La lógica es explícita y más fácil de seguir, ya que todo está en el mismo lugar.

4. **Compatibilidad con Turbo Streams**:
   - Este enfoque es completamente compatible con Turbo Streams y evita problemas de métodos no definidos.

Con este ajuste, deberías poder manejar las condiciones sin necesidad de modificar nada extra en tu configuración.

mejor haz la query dentro del render, no influye o si? 

No, incluir una query directamente dentro del `render` no debería influir significativamente en el rendimiento, **siempre y cuando las consultas sean ligeras y estén bien optimizadas**. Sin embargo, es importante ser consciente de que realizar consultas dentro de un `render` puede complicar la lectura del código y hacer que sea más difícil identificar problemas de rendimiento en el futuro.

Si decides hacerlo de esta manera, aquí está cómo podría verse:

---

### Controlador con Consultas en el `render`

```ruby
respond_to do |format|
  format.html do
    render @order.is_a?(::Store::Order) ? "show_store_order" : "show_order"
  end
  format.turbo_stream do
    render turbo_stream: [
      turbo_stream.replace(:order_tab, partial: "orders/show/order_tab", locals: { order: @order, customer: @order.customer, currency: @account.currency.currency }),
      turbo_stream.replace(:tasks_tab, partial: "orders/show/tasks_tab", locals: { order: @order, tasks: @order.tasks.includes(:taskable, :completed_by).order(:position, :due_date), task: Task.new }),
      turbo_stream.replace(:messages_tab, partial: "orders/show/messages_tab", locals: { order: @order, message: @order.email_messages.new }),
      (turbo_stream.replace(:payments_expenses_tab, partial: "orders/show/payments_expenses_tab", locals: { order: @order, books: @order.books.includes(:book_category).order(:transaction_date), currency: @account.currency.currency }) if @order.books.any?),
      (turbo_stream.replace(:scheduled_tab, partial: "orders/show/scheduled_tab", locals: { order: @order }) if policy(::Scheduler::ImprintWorkTypeSchedule).index?)
    ].compact
  end
  format.js
end
```

---

### Detalles

1. **Consultas Directas en el `render`**:
   - Para las pestañas `tasks_tab` y `payments_expenses_tab`, las consultas están dentro del `locals` pasado al `render`.
   - Ejemplo:
     ```ruby
     tasks: @order.tasks.includes(:taskable, :completed_by).order(:position, :due_date)
     ```

2. **Condiciones Simplificadas**:
   - Las condiciones para mostrar las pestañas (`if @order.books.any?` y `if policy(...)`) permanecen directamente en el `turbo_stream.replace`, manteniendo el flujo lógico claro.

3. **Cálculos Simples**:
   - Asegúrate de que las consultas sean ligeras (uso de `includes`, índices adecuados en la base de datos) para evitar ralentizar el proceso de respuesta.

---

### Consideraciones

- **Rendimiento**:
  - Si las consultas son pequeñas y están optimizadas, no habrá impacto significativo.
  - Sin embargo, si estás cargando grandes cantidades de datos, considera usar variables de instancia para evitar recalcular las consultas cada vez.

- **Legibilidad**:
  - Si el código comienza a parecer desordenado o difícil de leer, mover las consultas a variables locales antes del `respond_to` puede hacer que el controlador sea más fácil de mantener.

---

### Alternativa Intermedia: Variables Locales en el Controlador

Si prefieres mantener las consultas fuera del `render` pero no quieres crear métodos adicionales, puedes calcular las variables justo antes de `render`:

```ruby
tasks = @order.tasks.includes(:taskable, :completed_by).order(:position, :due_date)
books = @order.books.includes(:book_category).order(:transaction_date)

respond_to do |format|
  format.html do
    render @order.is_a?(::Store::Order) ? "show_store_order" : "show_order"
  end
  format.turbo_stream do
    render turbo_stream: [
      turbo_stream.replace(:order_tab, partial: "orders/show/order_tab", locals: { order: @order, customer: @order.customer, currency: @account.currency.currency }),
      turbo_stream.replace(:tasks_tab, partial: "orders/show/tasks_tab", locals: { order: @order, tasks: tasks, task: Task.new }),
      turbo_stream.replace(:messages_tab, partial: "orders/show/messages_tab", locals: { order: @order, message: @order.email_messages.new }),
      (turbo_stream.replace(:payments_expenses_tab, partial: "orders/show/payments_expenses_tab", locals: { order: @order, books: books, currency: @account.currency.currency }) if books.any?),
      (turbo_stream.replace(:scheduled_tab, partial: "orders/show/scheduled_tab", locals: { order: @order }) if policy(::Scheduler::ImprintWorkTypeSchedule).index?)
    ].compact
  end
  format.js
end
```

---

### Conclusión

Hacer las consultas dentro del `render` **no influirá negativamente si son optimizadas** y fáciles de entender. Sin embargo:
- **Mantén las consultas ligeras**: Usa `includes` para evitar problemas de N+1.
- **Considera la legibilidad**: Si el código comienza a ser difícil de leer, mover las consultas a variables locales (incluso dentro del mismo método) puede ser una mejor opción.

como refactorizas esto siguiendo:

#page-content-wrapper
  .page-container.margin-bottom-20
    .row
      .col-sm-12
        .tab-content
          = turbo_frame_tag :order_tab, src: order_path(@order, format: :turbo_stream) do
            = render "layouts/shared/loading", margin_top: 40
          = turbo_frame_tag :tasks_tab do
            = render "layouts/shared/loading", margin_top: 40
          = turbo_frame_tag :messages_tab do
            = render "layouts/shared/loading", margin_top: 40
          - if show_expenses_tab?(@order)
            = turbo_frame_tag :payments_expenses_tab do
              = render "layouts/shared/loading", margin_top: 40
          - if policy(::Scheduler::ImprintWorkTypeSchedule).index?
            = turbo_frame_tag :scheduled_tab do
              = render "layouts/shared/loading", margin_top: 40


Para refactorizar este código, el objetivo principal es mantenerlo limpio y fácil de leer, reduciendo la duplicación de código y haciendo que las condiciones sean más manejables. Puedes lograr esto utilizando un helper de vista o una estructura repetitiva que integre condiciones dinámicamente.

---

### Refactorización con Iteración Dinámica

En lugar de repetir los `turbo_frame_tag` manualmente, puedes usar una estructura de datos que contenga la información necesaria para renderizar las pestañas dinámicamente.

```haml
#page-content-wrapper
  .page-container.margin-bottom-20
    .row
      .col-sm-12
        .tab-content
          - tabs = [
            { id: :order_tab, src: order_path(@order, format: :turbo_stream), condition: true },
            { id: :tasks_tab, src: nil, condition: true },
            { id: :messages_tab, src: nil, condition: true },
            { id: :payments_expenses_tab, src: nil, condition: show_expenses_tab?(@order) },
            { id: :scheduled_tab, src: nil, condition: policy(::Scheduler::ImprintWorkTypeSchedule).index? }
          ]

          - tabs.each do |tab|
            - if tab[:condition]
              = turbo_frame_tag tab[:id], src: tab[:src] do
                = render "layouts/shared/loading", margin_top: 40
```

---

### Detalles de la Refactorización

1. **Estructura de Datos para las Pestañas**:
   - La variable `tabs` contiene un array de hashes que define cada pestaña:
     - `:id`: El identificador del frame.
     - `:src`: La ruta dinámica si aplica (puede ser `nil` si no se usa).
     - `:condition`: Una condición booleana para determinar si la pestaña se renderiza.

2. **Iteración**:
   - Usamos `.each` para iterar sobre las pestañas y renderizar solo aquellas cuya condición sea verdadera (`if tab[:condition]`).

3. **Reducción de Repetición**:
   - El código ahora es más DRY (Don't Repeat Yourself), ya que los elementos repetitivos están centralizados en el array `tabs`.

4. **Flexibilidad**:
   - Si necesitas agregar más pestañas, simplemente añade un nuevo hash al array `tabs`.

---

### Cómo Funciona

- `:src` controla si una pestaña usa carga diferida. Si `nil`, el contenido inicial se carga directamente.
- `:condition` permite definir dinámicamente si la pestaña debe ser renderizada.

---

### Beneficios de Este Enfoque

1. **Legibilidad Mejorada**:
   - El código es más limpio y fácil de entender al eliminar la duplicación.

2. **Fácil Mantenimiento**:
   - Para agregar o modificar pestañas, solo necesitas actualizar el array `tabs`.

3. **Compatibilidad con Turbo Frames**:
   - `turbo_frame_tag` sigue funcionando con carga diferida si se proporciona un `:src`.

4. **Escalabilidad**:
   - Este enfoque es escalable para muchas pestañas o cambios en las condiciones de visibilidad.

Con esta refactorización, el código es más manejable, flexible y fácil de extender.

quiero que hagas como default esta vista:
          = render "orders/show/order_tab", order: @order, customer: @order.customer, currency: @account.currency.currency
en estos renders 
#page-content-wrapper
  .page-container.margin-bottom-20
    .row
      .col-sm-12
        .tab-content
          = turbo_frame_tag :order_tab do
            = render "layouts/shared/loading", margin_top: 40
          = turbo_frame_tag :tasks_tab do
            = render "layouts/shared/loading", margin_top: 40
          = turbo_frame_tag :messages_tab do
            = render "layouts/shared/loading", margin_top: 40
          - if show_expenses_tab?(@order)
            = turbo_frame_tag :payments_expenses_tab do
              = render "layouts/shared/loading", margin_top: 40
          - if policy(::Scheduler::ImprintWorkTypeSchedule).index?
            = turbo_frame_tag :scheduled_tab do
              = render "layouts/shared/loading", margin_top: 40


Para establecer una vista predeterminada como `= render "orders/show/order_tab", order: @order, customer: @order.customer, currency: @account.currency.currency` en los `turbo_frame_tag`, puedes verificar si se está renderizando directamente sin un `src` y cargar la vista por defecto en lugar del `loading`. Esto asegura que la primera carga muestre la vista predeterminada.

Aquí está cómo podrías hacerlo:

---

### Implementación Actualizada con Vista Predeterminada

```haml
#page-content-wrapper
  .page-container.margin-bottom-20
    .row
      .col-sm-12
        .tab-content
          = turbo_frame_tag :order_tab do
            = render "orders/show/order_tab", order: @order, customer: @order.customer, currency: @account.currency.currency
          
          = turbo_frame_tag :tasks_tab do
            = render "layouts/shared/loading", margin_top: 40
          
          = turbo_frame_tag :messages_tab do
            = render "layouts/shared/loading", margin_top: 40
          
          - if show_expenses_tab?(@order)
            = turbo_frame_tag :payments_expenses_tab do
              = render "layouts/shared/loading", margin_top: 40
          
          - if policy(::Scheduler::ImprintWorkTypeSchedule).index?
            = turbo_frame_tag :scheduled_tab do
              = render "layouts/shared/loading", margin_top: 40
```

---

### Detalles

1. **Vista Predeterminada para `:order_tab`**:
   - La pestaña `:order_tab` muestra la vista `orders/show/order_tab` directamente sin carga diferida. Esto hace que sea visible inmediatamente en lugar del estado de "cargando".

2. **Carga Diferida para Otras Pestañas**:
   - Las demás pestañas (`tasks_tab`, `messages_tab`, etc.) siguen mostrando el estado de "cargando" hasta que se activa la carga diferida con un `src`.

3. **Condiciones Mantienen la Carga Diferida**:
   - Las condiciones para las pestañas `:payments_expenses_tab` y `:scheduled_tab` siguen siendo respetadas, mostrando solo el estado de carga si la condición se cumple.

---

### Alternativa con `src` para Optimizar el HTML

Si prefieres que todo sea consistente y que `:order_tab` también se cargue de manera diferida (pero manteniendo un fallback inicial), puedes usar un `src` y combinarlo con un `render` por defecto:

```haml
#page-content-wrapper
  .page-container.margin-bottom-20
    .row
      .col-sm-12
        .tab-content
          = turbo_frame_tag :order_tab, src: order_path(@order, format: :turbo_stream) do
            = render "orders/show/order_tab", order: @order, customer: @order.customer, currency: @account.currency.currency

          = turbo_frame_tag :tasks_tab, src: tasks_path(@order, format: :turbo_stream) do
            = render "layouts/shared/loading", margin_top: 40
          
          = turbo_frame_tag :messages_tab, src: messages_path(@order, format: :turbo_stream) do
            = render "layouts/shared/loading", margin_top: 40
          
          - if show_expenses_tab?(@order)
            = turbo_frame_tag :payments_expenses_tab, src: payments_expenses_path(@order, format: :turbo_stream) do
              = render "layouts/shared/loading", margin_top: 40
          
          - if policy(::Scheduler::ImprintWorkTypeSchedule).index?
            = turbo_frame_tag :scheduled_tab, src: scheduled_path(@order, format: :turbo_stream) do
              = render "layouts/shared/loading", margin_top: 40
```

---

### Diferencias Clave

1. **Primera Opción**:
   - `:order_tab` no tiene `src` y carga inmediatamente la vista predeterminada.
   - Ideal si no necesitas que esta pestaña se cargue dinámicamente.

2. **Segunda Opción**:
   - `:order_tab` tiene un `src` pero incluye un fallback para mostrar algo útil mientras carga.
   - Ideal si deseas consistencia en la forma en que todas las pestañas manejan la carga.

---

### Recomendación

Usa la primera opción si quieres que `:order_tab` sea completamente predeterminada y visible desde el inicio. Opta por la segunda opción si deseas mantener una experiencia consistente y aprovechar Turbo Frames para todas las pestañas.

como le hago para dejar un render como default y que al cambiar las tabs se oculte :


#page-content-wrapper
  .page-container.margin-bottom-20
    .row
      .col-sm-12
        .tab-content
          = turbo_frame_tag :order_tab do
            = render "orders/show/order_tab", order: @order, customer: @order.customer, currency: @account.currency.currency

          = turbo_frame_tag :tasks_tab do
            = render "layouts/shared/loading", margin_top: 40

          = turbo_frame_tag :messages_tab do
            = render "layouts/shared/loading", margin_top: 40

          - if show_expenses_tab?(@order)
            = turbo_frame_tag :payments_expenses_tab do
              = render "layouts/shared/loading", margin_top: 40

          - if policy(::Scheduler::ImprintWorkTypeSchedule).index?
            = turbo_frame_tag :scheduled_tab do
              = render "layouts/shared/loading", margin_top: 40


este es mi controlador:

    respond_to do |format|
      format.html do
        render @order.is_a?(::Store::Order) ? "show_store_order" : "show_order"
      end
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace(:order_tab, partial: "orders/show/order_tab", locals: {order: @order, customer: @order.customer, currency: @account.currency.currency}),
          turbo_stream.replace(:tasks_tab, partial: "orders/show/tasks_tab", locals: {order: @order, tasks: @tasks, task: @task}),
          turbo_stream.replace(:messages_tab, partial: "orders/show/messages_tab", locals: {order: @order, message: @order.email_messages.new}),
          turbo_stream.replace(:payments_expenses_tab, partial: "orders/show/payments_expenses_tab", locals: {order: @order, books: @books, currency: @account.currency.currency}),
          turbo_stream.replace(:scheduled_tab, partial: "orders/show/scheduled_tab", locals: {order: @order})
        ].compact
      end
      format.js
    end



Para implementar un sistema en el que tengas un contenido predeterminado visible (como `:order_tab`) y las demás pestañas se carguen dinámicamente y oculten el contenido predeterminado cuando se cambien las pestañas, puedes combinar **Turbo Frames**, **JavaScript**, y un poco de CSS.

---

### Vista Actualizada

Aquí tienes cómo se ve tu vista con cambios que soportan esta funcionalidad:

```haml
#page-content-wrapper
  .page-container.margin-bottom-20
    .row
      .col-sm-12
        .tab-content
          -# Order Tab: Default visible
          = turbo_frame_tag :order_tab, class: "tab-content-frame active" do
            = render "orders/show/order_tab", order: @order, customer: @order.customer, currency: @account.currency.currency

          -# Other Tabs
          = turbo_frame_tag :tasks_tab, class: "tab-content-frame hidden", src: tasks_path(@order, format: :turbo_stream) do
            = render "layouts/shared/loading", margin_top: 40

          = turbo_frame_tag :messages_tab, class: "tab-content-frame hidden", src: messages_path(@order, format: :turbo_stream) do
            = render "layouts/shared/loading", margin_top: 40

          - if show_expenses_tab?(@order)
            = turbo_frame_tag :payments_expenses_tab, class: "tab-content-frame hidden", src: payments_expenses_path(@order, format: :turbo_stream) do
              = render "layouts/shared/loading", margin_top: 40

          - if policy(::Scheduler::ImprintWorkTypeSchedule).index?
            = turbo_frame_tag :scheduled_tab, class: "tab-content-frame hidden", src: scheduled_path(@order, format: :turbo_stream) do
              = render "layouts/shared/loading", margin_top: 40
```

---

### Controlador

El controlador no necesita cambios significativos porque ya está configurado para responder a las solicitudes de Turbo Stream de cada pestaña. Solo asegúrate de que los endpoints para las pestañas devuelvan los parciales esperados:

```ruby
def show
  respond_to do |format|
    format.html do
      render @order.is_a?(::Store::Order) ? "show_store_order" : "show_order"
    end
    format.turbo_stream do
      render turbo_stream: [
        turbo_stream.replace(:order_tab, partial: "orders/show/order_tab", locals: {order: @order, customer: @order.customer, currency: @account.currency.currency}),
        turbo_stream.replace(:tasks_tab, partial: "orders/show/tasks_tab", locals: {order: @order, tasks: @tasks, task: @task}),
        turbo_stream.replace(:messages_tab, partial: "orders/show/messages_tab", locals: {order: @order, message: @order.email_messages.new}),
        turbo_stream.replace(:payments_expenses_tab, partial: "orders/show/payments_expenses_tab", locals: {order: @order, books: @books, currency: @account.currency.currency}),
        turbo_stream.replace(:scheduled_tab, partial: "orders/show/scheduled_tab", locals: {order: @order})
      ]
    end
    format.js
  end
end
```

---

### JavaScript para Cambiar de Pestaña

Añade un script que controle las pestañas y las clases CSS de visibilidad:

```javascript
document.addEventListener("DOMContentLoaded", () => {
  const tabLinks = document.querySelectorAll("[data-tab-target]");
  const frames = document.querySelectorAll(".tab-content-frame");

  tabLinks.forEach((link) => {
    link.addEventListener("click", (e) => {
      e.preventDefault();

      // Obtener el target de la pestaña
      const targetId = link.dataset.tabTarget;
      const targetFrame = document.getElementById(targetId);

      // Ocultar todos los frames
      frames.forEach((frame) => frame.classList.add("hidden"));

      // Mostrar el frame seleccionado
      targetFrame.classList.remove("hidden");
      targetFrame.classList.add("active");
    });
  });
});
```

Cada pestaña debería tener un enlace que active el cambio de contenido. Por ejemplo:

```haml
.nav-tabs
  %a{ href: "#", data: { tab_target: "order_tab" } } Order
  %a{ href: "#", data: { tab_target: "tasks_tab" } } Tasks
  %a{ href: "#", data: { tab_target: "messages_tab" } } Messages
  - if show_expenses_tab?(@order)
    %a{ href: "#", data: { tab_target: "payments_expenses_tab" } } Payments
  - if policy(::Scheduler::ImprintWorkTypeSchedule).index?
    %a{ href: "#", data: { tab_target: "scheduled_tab" } } Scheduled
```

---

### CSS para Visibilidad

Define clases CSS para ocultar y mostrar las pestañas:

```css
.tab-content-frame {
  display: none;
}

.tab-content-frame.active {
  display: block;
}

.hidden {
  display: none;
}
```

---

### Cómo Funciona

1. **Vista Predeterminada**:
   - El frame `:order_tab` tiene la clase `active` y está visible inicialmente.
   - Todas las demás pestañas tienen la clase `hidden`.

2. **Cambio de Pestañas**:
   - Cuando el usuario hace clic en una pestaña, el JavaScript oculta todos los frames (`.hidden`) y muestra (`.active`) solo el frame correspondiente.

3. **Carga Diferida**:
   - Las pestañas con `src` (e.g., `tasks_tab`, `messages_tab`) cargan su contenido dinámicamente cuando se activan.

---

### Beneficios

- **Inicio Rápido**: El contenido predeterminado (`:order_tab`) se carga inmediatamente.
- **Lazy Loading**: Otras pestañas solo se cargan cuando son necesarias.
- **UX Intuitiva**: Cambiar pestañas oculta automáticamente la pestaña predeterminada o activa.

Con esta implementación, tienes un sistema funcional que respeta la carga diferida y las transiciones entre pestañas.