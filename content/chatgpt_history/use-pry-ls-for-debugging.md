---
title: Use Pry ls for Debugging
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Use Pry ls for Debugging

## ✅ TODOs


## 📌 Summary
Can I use pry ls to see instances of different classes in rspec or rails console debugging?

## 🧠 Full Chat


Can I use pry ls to see instances of different classes in rspec or rails console debugging? 

Yes, you can use `pry` along with the `ls` command to see instances of different classes while debugging in RSpec or the Rails console. `Pry` is a powerful interactive shell for Ruby and offers advanced features for introspection and debugging. Here's how you can use it:

1. **Install Pry**: If you haven't already, add Pry to your Gemfile and bundle install.
   ```ruby
   gem 'pry'
   ```

2. **Insert a Breakpoint**: In your RSpec tests or Rails application code, insert a breakpoint using `binding.pry`. This will pause execution at that point.
   ```ruby
   def my_method
     binding.pry
     # more code...
   end
   ```

3. **Use Pry's `ls` Command**: Once execution is paused, Pry's interactive shell will open. You can use the `ls` command to list the methods, constants, and variables in the current scope. To see instances of a particular class, you can use `ls` with the `-G` option followed by a regex pattern. For example, to list all instances of the `User` class, you could do:
   ```
   ls -G User
   ```

4. **Navigating Through Objects**: You can also navigate through objects and their methods. For example, to see methods available on an instance of a class:
   ```
   ls my_instance
   ```

5. **Resume Execution**: To continue execution after inspecting, use the `exit` or `continue` command.

This approach is particularly useful for exploring the state of your application at a specific point in time, and it can greatly aid in debugging complex issues in both test and development environments. Remember that `pry` is a very flexible tool, and there are many commands and options available to aid your debugging process.