---
title: 'Ruby Blocks: Power and Usage'
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Ruby Blocks: Power and Usage

## ✅ TODOs


## 📌 Summary
Why Rails models and other classes don’t use attributes?

## 🧠 Full Chat


Why Rails models and other classes don’t use attributes?

In Ruby on Rails, models and many other classes use methods instead of directly exposing attributes for a few reasons:

1. **Encapsulation**: By not directly exposing attributes, Rails models encourage encapsulation. This means that the internal representation of the data can be kept separate from the way it's accessed and modified. This allows for more flexibility in implementing the underlying data structures without affecting the external interface of the class.

2. **Active Record Pattern**: Rails models are built on the Active Record design pattern. In this pattern, each instance of a model represents a row in a database table. By providing methods instead of direct attributes, Rails can handle all the database interactions transparently, such as lazy loading of data and automatic persistence of changed attributes.

3. **Virtual Attributes**: With methods, you can have "virtual" attributes that don't map directly to database columns. These are methods that compute values based on the real persisted attributes or other logic.

4. **Callbacks & Validations**: By using setter methods instead of direct attribute access, Rails can incorporate validation logic and callbacks. This means that you can run certain methods before or after attributes are changed, or validate that a value is in a certain format before it's saved to the database.

5. **Method Chaining**: The methods provided by Active Record, such as those for querying, often return modified versions of the current scope or object, allowing for method chaining. This style of API is more fluid and expressive when using methods instead of direct attributes.

6. **Attribute Methods**: Rails dynamically defines methods for each column in your table, so even though it may seem like you're accessing attributes directly (e.g., `user.name`), you're actually calling a method named `name` on the `user` object.

That said, if you do need direct access to the attributes, Rails models provide the `attributes` method which returns a hash of all the attributes with their names as keys and the current values as values.

In conclusion, while it might seem unusual to those coming from some other languages or frameworks, using methods instead of directly exposing attributes in Rails offers a great deal of power, flexibility, and safety.

What is so special about blocks and how can I leverage all its power?

In Ruby, blocks are one of its most distinctive and powerful features. A block is essentially a chunk of code that you can pass to a method. Here's why they're special and how you can leverage their power:

1. **Anonymous Functions**: Blocks are similar to anonymous functions in other languages. They allow you to encapsulate a piece of functionality that you can pass around and execute later.

2. **Closures**: Blocks also act as closures. This means they capture the local variables available at the time of their definition and carry them along. This makes it possible to preserve state and context, even when the block is executed in a different scope.

3. **Iterators**: One of the most common uses of blocks is with iterators. Many of the methods on Ruby's enumerable types, like `.each`, `.map`, and `.select`, accept blocks to define custom behavior.

    ```ruby
    [1, 2, 3].each { |num| puts num * 2 }
    ```

4. **Resource Management**: Blocks are very useful for resource management. The classic example is file handling. The `File.open` method can accept a block, and it will automatically close the file for you once the block completes.

    ```ruby
    File.open("example.txt", "r") do |file|
      puts file.read
    end
    ```

5. **Custom Control Structures**: You can define methods that accept blocks, allowing you to create your own control structures. For instance, the `Benchmark.measure` method lets you measure the time taken to execute a block of code.

6. **Laziness**: Blocks can be used to implement lazy evaluation. For instance, Ruby's `lazy` method returns a lazy version of an enumerable, where operations like `.map` and `.select` don't get executed immediately but instead stack up and execute when actually needed.

7. **DSLs (Domain Specific Languages)**: Blocks are a key ingredient in crafting DSLs in Ruby. Tools like Rake and frameworks like Sinatra or RSpec use blocks extensively to allow for a clean, domain-specific syntax.

**Leveraging Blocks**:

1. **Understand Yield**: The `yield` keyword allows you to execute a block within a method. Familiarize yourself with it to both use and define methods that accept blocks.

    ```ruby
    def custom_each(array)
      for element in array
        yield(element)
      end
    end

    custom_each([1, 2, 3]) { |num| puts num }
    ```

2. **Procs and Lambdas**: While blocks are wonderful, they're not objects. If you need to store a block or pass multiple blocks, look into Procs and Lambdas. They're objects representing blocks of code. Understanding the differences between them, particularly how they handle the `return` keyword, is crucial.

3. **Block Parameters**: When passing a block, you can accept parameters, much like with a method. This lets you pass data from the method into the block.

4. **Useful Block Methods**: Familiarize yourself with methods like `tap`, `then`, and `yield_self`, which can streamline code and reduce intermediate variables.

In summary, blocks in Ruby offer a flexible and powerful way to handle code as data, allowing for elegant and expressive solutions to many programming tasks. By understanding and utilizing blocks, you can write cleaner, more idiomatic Ruby code.