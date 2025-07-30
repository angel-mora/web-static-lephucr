---
title: Preloading Associations in Controller
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  How to preload the following associations under a show
  controller action?"
draft: false
---

# Preloading Associations in Controller

## ✅ TODOs
- [ ] |format|

## 🧠 Full Chat

🙋 **You:**

How to preload the following associations under a show controller action?
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
      format.turbo_stream
      format.js
    end
  end

---

🤖 **Assistant:**

To preload the necessary associations for your `show` action in the controller, you can modify the queries to include `includes` and eager loading wherever possible. This will reduce the number of database queries by loading the associated records in a single query.

Here’s how you can preload associations in your `show` action:

### Updated `show` Action with Preloading

```ruby
def show
  ensure_order_has_line_item_group

  # Preloading policy_scope associations for EmailTemplate (if applicable)
  @email_templates = policy_scope(EmailTemplate)
    .select("email_templates.id, email_templates.message, email_templates.subject_line, email_templates.name")
    .order("name ASC")

  @title = "##{@order.visual_id}"

  # Preloading Address subregions
  @billing_states = Address.retrieve_subregions(@customer&.billing_address&.country ||= current_account.country)
  @shipping_states = Address.retrieve_subregions(@customer&.shipping_address&.country ||= current_account.country)

  # Tasks with preloaded associations
  @tasks = @order.tasks
    .unscope(:order)
    .includes(:taskable, :completed_by) # Preload taskable and completed_by
    .order(:position, :due_date)

  @task = Task.new(due_date: @order.due_date)

  # Payments and books with preloaded associations
  @payment_processor = @account.payment_processor || PaymentProcessor.new
  @books = Book.where(bookable: @order)
    .or(Book.where(bookable: @order.statements)
    .where(book_orders: BookOrder.where(order: @order)))
    .includes(:book_category) # Preload book_category
    .order(:transaction_date)

  @expense = Expense.new(account: current_account, bookable: @order)
  @payment = Payment.new(transaction_date: Time.current)

  load_size_options_and_images

  # Shipping info preloading
  @shipping_label_form = ShippingLabelForm.new(order: @order).prepopulate

  # Customer and parent_customer with preloading
  @parent_customer = @order.customer.includes(:parent_customer).parent_customer
  @ordered_contacts = @parent_customer.sub_customers.includes(:billing_contact).billing_contact_first

  @show_invoice_dates = true
  @public_invoice_view = false

  respond_to do |format|
    format.html { render @order.is_a?(::Store::Order) ? "show_store_order" : "show_order" }
    format.turbo_stream
    format.js
  end
end
```

### Key Points:
1. **Tasks**:
   - `@tasks = @order.tasks.includes(:taskable, :completed_by)`: Preload the `taskable` and `completed_by` associations.

2. **Books**:
   - Use `.includes(:book_category)` to preload the `book_category` association for books.

3. **Customer**:
   - Preload `parent_customer` and its `billing_contact` by modifying `@order.customer` and `@parent_customer`.

4. **General Associations**:
   - Use `includes` where associations are used in your views or further operations to minimize N+1 query issues.

### Explanation of Changes:
- By adding `.includes(...)` where associations are referenced, the related records are preloaded into memory, reducing the number of queries executed.
- This approach is especially beneficial if your views iterate over these associations or if they are deeply nested. 

### Final Note:
Ensure your `includes` match the associations defined in your models. For example, if `:parent_customer` is not an association on `Customer`, modify the preloading accordingly.

---

🙋 **You:**

sorry, I meant lazy loading

---

🤖 **Assistant:**

Lazy loading is the opposite of preloading—data is only fetched when it is accessed. By default, Active Record uses lazy loading unless you explicitly use methods like `includes`, `joins`, or `preload`. This means that if you are not seeing explicit database queries until the data is accessed, lazy loading is already happening.

However, if your concern is **ensuring lazy loading remains intact or reverting preloading**, you need to avoid eager loading strategies (`includes`, `joins`, or `preload`) and defer data access until it's explicitly required.

### Updated `show` Action for Lazy Loading

Here’s how you can adjust your action to ensure lazy loading:

```ruby
def show
  ensure_order_has_line_item_group

  # Querying without preloading
  @email_templates = policy_scope(EmailTemplate)
    .select("email_templates.id, email_templates.message, email_templates.subject_line, email_templates.name")
    .order("name ASC")

  @title = "##{@order.visual_id}"

  # Avoid eager loading for states
  @billing_states = Address.retrieve_subregions(@customer&.billing_address&.country ||= current_account.country)
  @shipping_states = Address.retrieve_subregions(@customer&.shipping_address&.country ||= current_account.country)

  # Lazy loading tasks
  @tasks = @order.tasks.unscope(:order).order(:position, :due_date)
  @task = Task.new(due_date: @order.due_date)

  # Lazy loading payments and books
  @payment_processor = @account.payment_processor || PaymentProcessor.new
  @books = Book.where(bookable: @order)
    .or(Book.where(bookable: @order.statements).where(book_orders: BookOrder.where(order: @order)))
    .order(:transaction_date)

  @expense = Expense.new(account: current_account, bookable: @order)
  @payment = Payment.new(transaction_date: Time.current)

  load_size_options_and_images

  # Lazy loading customer associations
  @shipping_label_form = ShippingLabelForm.new(order: @order).prepopulate
  @parent_customer = @order.customer.parent_customer
  @ordered_contacts = @parent_customer.sub_customers.billing_contact_first

  @show_invoice_dates = true
  @public_invoice_view = false

  respond_to do |format|
    format.html { render @order.is_a?(::Store::Order) ? "show_store_order" : "show_order" }
    format.turbo_stream
    format.js
  end
end
```

### Key Adjustments for Lazy Loading
1. **Removed `includes` or `preload`**:
   - Ensure that no eager-loading mechanisms like `includes`, `preload`, or `joins` are being used in your queries.

2. **Relied on Associations**:
   - Keep queries simple and allow Rails to fetch related records lazily when accessed.

3. **Avoided Iteration in Controller**:
   - Do not loop over associations in the controller, as this can inadvertently trigger queries. Leave such operations for views, where lazy loading will trigger when necessary.

### Why Lazy Loading?
- **Flexibility**: It fetches only the records you access.
- **Reduced Initial Overhead**: Database queries are deferred until the data is actually needed.

### Things to Watch For
- **N+1 Query Problem**: Lazy loading can inadvertently cause multiple queries when associations are accessed in loops. Use `bullet` or `rack-mini-profiler` gems to detect such issues.
- **Performance Implications**: If you access many associated records, consider whether preloading might actually be more efficient for those cases.

---

🙋 **You:**

show me the diff of your suggestion

---

🤖 **Assistant:**

Here’s the diff between the initial suggestion (eager loading) and the adjusted lazy loading approach:

```diff
def show
  ensure_order_has_line_item_group

-  @email_templates = policy_scope(EmailTemplate)
-    .select("email_templates.id, email_templates.message, email_templates.subject_line, email_templates.name")
-    .order("name ASC")
+  @email_templates = policy_scope(EmailTemplate)
+    .select("email_templates.id, email_templates.message, email_templates.subject_line, email_templates.name")
+    .order("name ASC")

  @title = "##{@order.visual_id}"

-  @billing_states = Address.retrieve_subregions(@customer&.billing_address&.country ||= current_account.country)
-  @shipping_states = Address.retrieve_subregions(@customer&.shipping_address&.country ||= current_account.country)
+  @billing_states = Address.retrieve_subregions(@customer&.billing_address&.country ||= current_account.country)
+  @shipping_states = Address.retrieve_subregions(@customer&.shipping_address&.country ||= current_account.country)

-  @tasks = @order.tasks
-    .unscope(:order)
-    .includes(:taskable, :completed_by) # Preload taskable and completed_by
-    .order(:position, :due_date)
+  @tasks = @order.tasks.unscope(:order).order(:position, :due_date)

  @task = Task.new(due_date: @order.due_date)

-  @books = Book.where(bookable: @order)
-    .or(Book.where(bookable: @order.statements).where(book_orders: BookOrder.where(order: @order)))
-    .includes(:book_category) # Preload book_category
-    .order(:transaction_date)
+  @books = Book.where(bookable: @order)
+    .or(Book.where(bookable: @order.statements).where(book_orders: BookOrder.where(order: @order)))
+    .order(:transaction_date)

  @payment_processor = @account.payment_processor || PaymentProcessor.new
  @expense = Expense.new(account: current_account, bookable: @order)
  @payment = Payment.new(transaction_date: Time.current)

  load_size_options_and_images

-  @parent_customer = @order.customer.includes(:parent_customer).parent_customer
-  @ordered_contacts = @parent_customer.sub_customers.includes(:billing_contact).billing_contact_first
+  @parent_customer = @order.customer.parent_customer
+  @ordered_contacts = @parent_customer.sub_customers.billing_contact_first

  @shipping_label_form = ShippingLabelForm.new(order: @order).prepopulate

  @show_invoice_dates = true
  @public_invoice_view = false

  respond_to do |format|
    format.html { render @order.is_a?(::Store::Order) ? "show_store_order" : "show_order" }
    format.turbo_stream
    format.js
  end
end
```

### Key Differences:
1. **Removed Preloading:**
   - Eliminated `.includes(...)` where preloading was previously applied (e.g., `taskable`, `completed_by`, `book_category`).

2. **Simplified Queries:**
   - Left queries as is, allowing associations to be fetched on demand (lazy loading).

3. **Deferred Association Access:**
   - No eager-fetching or pre-optimizing queries for tasks, books, or customers.

This ensures data is only fetched when accessed, adhering to lazy loading principles.

---

🙋 **You:**

como harías este mensaje más explicito pero así muy corot:

Friday:
Troubleshooting specs PT-697
Working on PT-1645
Today:
Continue with PT-697
Working on PT-1645

---

🤖 **Assistant:**

**Friday:**  
- Troubleshot specs for PT-697  
- Started work on PT-1645  

**Today:**  
- Continuing PT-697 troubleshooting  
- Progressing on PT-1645