---
title: Listing Ruby Class Methods
tags:
- methods
- instance_methods
- singleton_methods
- private_methods
- protected_methods
- public_methods
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Listing Ruby Class Methods

## ✅ TODOs


## 📌 Summary
How to see all methods of a class in ruby

## 🧠 Full Chat


How to see all methods of a class in ruby



In Ruby, you can list all methods of a class using several methods:

1. **`Class#methods`**:
   Lists class methods, including inherited ones.
   ```ruby
   MyClass.methods
   ```

2. **`Class#instance_methods`**:
   Lists instance methods, including inherited ones.
   ```ruby
   MyClass.instance_methods
   ```

3. **`Class#singleton_methods`**:
   Lists singleton methods of a class.
   ```ruby
   MyClass.singleton_methods
   ```

4. **`Class#private_methods`, `Class#protected_methods`, `Class#public_methods`**:
   These list private, protected, and public methods, respectively, including inherited ones.

   Example:
   ```ruby
   MyClass.private_methods
   MyClass.protected_methods
   MyClass.public_methods
   ```

5. **List only methods defined in the current class**:
   To exclude inherited methods, you can pass `false` as an argument to the method listing functions:
   ```ruby
   MyClass.instance_methods(false)
   ```

Would you like to see an example with a specific class?