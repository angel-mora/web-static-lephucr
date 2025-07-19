---
title: Rails Service Concern Creation
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Rails Service Concern Creation

## ✅ TODOs


## 📌 Summary
if want to get concern for service in rails what should I do?

## 🧠 Full Chat


if want to get concern for service in rails what should I do?



To create a concern for service objects in Rails, you should define a module that can be included in multiple service objects to share common functionality. Here's a step-by-step guide:

1. **Create the Concern Module:**
   - Navigate to the `app/models/concerns` directory (or create it if it doesn’t exist).
   - Create a new file for your concern, e.g., `app/models/concerns/service_logging.rb`.

2. **Define the Module:**
   - Inside this file, define the module and include the `ActiveSupport::Concern` module to leverage its features like `included` and `class_methods`.

   ```ruby
   # app/models/concerns/service_logging.rb
   module ServiceLogging
     extend ActiveSupport::Concern

     included do
       # Code that runs when the module is included
     end

     def log_service_action(action)
       Rails.logger.info "Service action: #{action} performed at #{Time.now}"
     end

     module ClassMethods
       def log_class_action(action)
         Rails.logger.info "Class action: #{action} performed at #{Time.now}"
       end
     end
   end
   ```

3. **Include the Concern in Service Objects:**
   - In your service objects, include the newly created concern to utilize its methods.

   ```ruby
   # app/services/my_service.rb
   class MyService
     include ServiceLogging

     def perform_action
       log_service_action('perform_action')
       # Your service logic here
     end
   end
   ```

4. **Use the Service Object:**
   - Now you can instantiate your service object and call its methods, benefiting from the shared functionality provided by the concern.

   ```ruby
   service = MyService.new
   service.perform_action
   ```

This structure allows you to keep your code DRY (Don't Repeat Yourself) by sharing common logic across different service objects through concerns.

where it should be located? arent concerns exclusively for models?

You're correct that concerns are traditionally associated with models in Rails, but you can also organize concerns for other parts of your application. For service objects, you can follow a similar structure but place them in a directory specific to services.

Here's how you can organize concerns for service objects:

1. **Create a Concerns Directory for Services:**
   - Navigate to `app/services/concerns` (create this directory if it doesn't exist).

2. **Define the Concern in the Service Concerns Directory:**
   - Create your concern in `app/services/concerns`.

   Example:

   ```ruby
   # app/services/concerns/service_logging.rb
   module ServiceLogging
     extend ActiveSupport::Concern

     included do
       # Code that runs when the module is included
     end

     def log_service_action(action)
       Rails.logger.info "Service action: #{action} performed at #{Time.now}"
     end

     module ClassMethods
       def log_class_action(action)
         Rails.logger.info "Class action: #{action} performed at #{Time.now}"
       end
     end
   end
   ```

3. **Include the Concern in Service Objects:**
   - In your service objects, include the concern from the `app/services/concerns` directory.

   Example:

   ```ruby
   # app/services/my_service.rb
   class MyService
     include ServiceLogging

     def perform_action
       log_service_action('perform_action')
       # Your service logic here
     end
   end
   ```

This organization keeps your concerns modular and reusable across different parts of your application, not just limited to models.