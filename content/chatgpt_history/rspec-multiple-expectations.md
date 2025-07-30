---
title: RSpec multiple expectations.
tags:
- my_method
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  rspec multiple expectations inline comment how to"
draft: false
---

# RSpec multiple expectations.

## ✅ TODOs
- [ ] so and if you're confident that the disabled code is correct and won't cause any issues.

## 🧠 Full Chat

🙋 **You:**

rspec multiple expectations inline comment how to

---

🤖 **Assistant:**

To write multiple expectations in an RSpec test using inline comments, you can separate each expectation with a semicolon (;) and add an inline comment after each expectation. Here's an example:

```ruby
RSpec.describe MyClass do
  describe "#my_method" do
    it "returns the correct values" do
      result = MyClass.my_method
      expect(result).to eq("value1"); # Check the first value
      expect(result.size).to eq(10); # Check the size of the result
      expect(result).to include("value2"); # Check that the result includes a specific value
    end
  end
end
```

In the above example, three expectations are written in one line, separated by semicolons, and each expectation has a comment that describes what it's checking.

However, it's important to note that while this can be a useful technique for shortening your test code, it can also make your tests harder to read and understand. So it's generally a good idea to use it sparingly and only when it improves readability.

---

🙋 **You:**

disable rubocop inline

---

🤖 **Assistant:**

To disable Rubocop for a specific line of code, you can add a comment with the `rubocop:disable` directive followed by the specific cop that you want to disable. Here's an example:

```ruby
def some_method
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Style/MethodCallWithArgsParentheses
  long_variable_name = some_object.do_something(argument1, argument2)
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Style/MethodCallWithArgsParentheses

  # rest of the code
end
```

In the above example, the `Metrics/AbcSize` and `Style/MethodCallWithArgsParentheses` cops are disabled for the line where the `long_variable_name` variable is assigned. The `rubocop:enable` directive is used to re-enable these cops after the disabled line.

Note that while disabling Rubocop can be useful in some cases, it should be used with caution, as it can make your code less readable and maintainable. Only disable cops if you have a good reason to do so and if you're confident that the disabled code is correct and won't cause any issues.

---

🙋 **You:**

two directives disabled, same line

---

🤖 **Assistant:**

To disable multiple Rubocop directives for the same line, you can separate the directive names with a comma. Here's an example:

```ruby
def some_method
  # rubocop:disable Metrics/AbcSize, Style/MethodCallWithArgsParentheses
  long_variable_name = some_object.do_something(argument1, argument2)
  # rubocop:enable Metrics/AbcSize, Style/MethodCallWithArgsParentheses

  # rest of the code
end
```

In the above example, both `Metrics/AbcSize` and `Style/MethodCallWithArgsParentheses` cops are disabled for the line where the `long_variable_name` variable is assigned. The `rubocop:enable` directive is used to re-enable both cops after the disabled line.

Again, while disabling Rubocop directives can be useful in some cases, it's generally a good idea to use them sparingly and only when necessary, as they can make your code harder to maintain and understand.