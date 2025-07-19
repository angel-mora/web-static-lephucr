---
title: Rails Enum Usage Guide
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Rails Enum Usage Guide

## ✅ TODOs


## 📌 Summary
How  to call an enum value from rails model.

## 🧠 Full Chat


How  to call an enum value from rails model.
enum context: { service: 'service', software: 'software' }.freeze

In Rails, when you define an enum attribute in a model, it automatically adds several methods related to the values defined in the enum. For your example, with an enum defined as `context: { service: 'service', software: 'software' }`, you can interact with the `context` attribute using these auto-generated methods.

Here's how you can work with the `context` enum in different scenarios:

1. **Setting a Value:**
   To set a value for the `context` attribute, you can do it either directly or using the auto-generated methods:
   ```ruby
   # Direct assignment
   model_instance.context = 'service'

   # Using auto-generated method
   model_instance.service!
   ```

2. **Querying a Value:**
   To check if a particular enum value is set, you can use the query methods:
   ```ruby
   model_instance.service?
   model_instance.software?
   ```

3. **Scopes:**
   Rails enums also automatically create scopes for querying objects:
   ```ruby
   Model.service  # returns all records where context is 'service'
   Model.software # returns all records where context is 'software'
   ```

4. **Retrieving the String Value:**
   To get the string value of the enum field, you just access it like any other attribute:
   ```ruby
   value = model_instance.context # Will return 'service' or 'software'
   ```

5. **Using in Forms:**
   When using enums in forms, you can use the enum values directly:
   ```erb
   <%= form.select :context, Model.contexts.keys.map { |k| [k.humanize, k] } %>
   ```

Remember, when you define an enum, Rails expects the underlying database field to be an integer (by default) or a string if you explicitly map the values like in your example. Ensure that your database schema matches your enum definition.

I want to merge it in another scope through joins but if I say Category.service it will return service context but I want all that are not service context

In Rails, when you want to create a scope that selects records which do not match a specific enum value, you'll need to use a condition that excludes that value. Since you've defined `context` as an enum in your model and you want to exclude records with the `service` context, you can write a custom scope to achieve this.

Assuming you have a model `Category` with the enum `context: { service: 'service', software: 'software' }`, and you want to create a scope that excludes `service` context, you can do it like this:

```ruby
class Category < ApplicationRecord
  enum context: { service: 'service', software: 'software' }

  # Scope to get all categories that are NOT service
  scope :not_service, -> { where.not(context: contexts[:service]) }
end
```

Then you can use this scope in conjunction with other scopes or joins. For example, if you want to merge this scope with another one through joins, you could do something like:

```ruby
# Assuming another model relation, e.g., Product
scope :with_non_service_categories, -> { joins(:categories).merge(Category.not_service) }
```

This will create a query that joins with the `categories` table and applies the condition to exclude categories with the `service` context. Remember to adjust the `joins` part according to your actual model relations.