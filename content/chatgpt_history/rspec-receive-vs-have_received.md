---
title: RSpec receive vs have_received
tags:
- '1'
- '2'
- '3'
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Difference between receive and have_received in rspec.
  When each of them is used properly"
draft: false
---

# RSpec receive vs have_received

## 🧠 Full Chat

🙋 **You:**

Difference between receive and have_received in rspec. When each of them is used properly

---

🤖 **Assistant:**

In RSpec, `receive` and `have_received` are both used to mock and verify that a method has been called on a particular object, but they are used in different contexts and serve different purposes:

### `receive`
- **Use case**: `receive` is used when you want to set an expectation **before** the method is called during the test.
- **When to use**: You use `receive` when you're writing a test that will trigger a method to be called and you want to verify that the method is called during the execution of the test.
  
  Example:

  ```ruby
  describe SomeClass do
    it 'calls the method during the test' do
      instance = SomeClass.new
      expect(instance).to receive(:some_method)
      instance.some_method
    end
  end
  ```

  Here, `receive` sets the expectation that `some_method` will be called on `instance`, and the test will pass if that method is called during the execution.

### `have_received`
- **Use case**: `have_received` is used to verify that a method was called **after** the method has already been invoked.
- **When to use**: You use `have_received` when the method has already been called, and you want to check that it happened. It's used with spies (or implicit spying via `allow`).

  Example:

  ```ruby
  describe SomeClass do
    it 'verifies that the method was called' do
      instance = SomeClass.new
      allow(instance).to receive(:some_method)
      instance.some_method
      expect(instance).to have_received(:some_method)
    end
  end
  ```

  In this case, `have_received` verifies that `some_method` was called on `instance` **after** the method has already been invoked. It’s often used in combination with `allow`.

### Key Differences:
- `receive` is **before** the method is called and is about setting the expectation for a future call.
- `have_received` is **after** the method is called and is about verifying that the call already happened.

### When to use:
- Use **`receive`** when you're in control of triggering the method call and want to expect it in advance.
- Use **`have_received`** when you want to verify that a method was called at some point during the test execution, typically in cases where you're spying on an object.

---

🙋 **You:**

How to use each one correctly and common pitfalls that cause false positives or negatives

---

🤖 **Assistant:**

### How to Use `receive` and `have_received` Correctly

#### Using `receive`:
`receive` is used **before** the method is called and is typically part of setting up your test’s expectations.

- **Correct usage**:
  ```ruby
  describe SomeClass do
    it 'calls the method during the test' do
      instance = SomeClass.new
      expect(instance).to receive(:some_method)
      instance.some_method
    end
  end
  ```
  Here, you're setting an expectation that `some_method` will be called, and then calling it. The test will pass if the method is invoked.

- **Common pitfall #1: Not calling the method**
  If you set an expectation using `receive` but don’t actually call the method, the test will fail:
  
  ```ruby
  expect(instance).to receive(:some_method)
  # instance.some_method is not called
  ```

  **Result**: This will fail because the method was expected to be called but wasn't.

- **Common pitfall #2: Expecting a method call on the wrong object**
  Sometimes the expectation is set on the wrong instance:

  ```ruby
  another_instance = SomeClass.new
  expect(instance).to receive(:some_method)
  another_instance.some_method
  ```

  **Result**: The test will fail because `some_method` was called on `another_instance`, not `instance`.

- **Common pitfall #3: Using `receive` when stubbing is intended**
  If you need to stub a method to return a value, use `allow` instead of `expect`. `receive` is for setting expectations, not stubbing behavior.

  ```ruby
  allow(instance).to receive(:some_method).and_return('value')
  ```

#### Using `have_received`:
`have_received` is used **after** the method has already been called, and you want to verify that the method was called on an object.

- **Correct usage**:
  ```ruby
  describe SomeClass do
    it 'verifies the method was called' do
      instance = SomeClass.new
      allow(instance).to receive(:some_method) # Spy on method
      instance.some_method
      expect(instance).to have_received(:some_method)
    end
  end
  ```

  In this case, you’re allowing the object to spy on `some_method` and later verifying that it was called.

- **Common pitfall #1: Not spying on the method**
  If you forget to spy on the method (via `allow`), `have_received` will fail:

  ```ruby
  instance = SomeClass.new
  instance.some_method
  expect(instance).to have_received(:some_method) # Will fail
  ```

  **Result**: This will fail because RSpec didn’t spy on `some_method`, so it doesn't know it was called. Always use `allow(instance).to receive(:method)` to spy.

- **Common pitfall #2: Forgetting to call the method**
  Similar to the pitfall with `receive`, if you don’t call the method, the test will fail:

  ```ruby
  instance = SomeClass.new
  allow(instance).to receive(:some_method)
  # some_method is not called
  expect(instance).to have_received(:some_method) # Will fail
  ```

  **Result**: This will fail because `some_method` was never called.

- **Common pitfall #3: Spying on a method after the call**
  If you call the method first and then try to spy on it, `have_received` will not work because spying needs to be set **before** the method is invoked.

  ```ruby
  instance.some_method
  allow(instance).to receive(:some_method)
  expect(instance).to have_received(:some_method) # Will fail
  ```

  **Result**: This will fail because the method was called before you set the spy. Spying needs to be in place **before** the method is called.

### Summary of Proper Usage

- **`receive`**: Use when setting expectations **before** the method is called. Ensure the method is actually called on the correct object within the test.
- **`have_received`**: Use **after** a method has already been called, ensuring the spy is set up **before** the method call. This is useful for verifying behavior after the fact, especially when testing side effects.

### Avoiding False Positives and Negatives

- **False positives**: Occur when the test passes even though it shouldn't. For example:
  - Spying on methods that aren't called or are called on different objects might lead to false expectations.
  - Failing to call the method and not verifying the call properly can lead to misleading tests.
  
- **False negatives**: Occur when the test fails even though it should pass. For example:
  - Failing to set up spies or expectations before calling the method.
  - Expecting methods on the wrong objects or misunderstanding which object should receive the call.

By carefully ensuring you are setting up spies or expectations at the right time and on the right objects, you can avoid these common pitfalls.

---

🙋 **You:**

Explain the concept of spy. Is it exclusive of rspec? What else uses it?

---

🤖 **Assistant:**

### Concept of a Spy

A **spy** is a testing construct used to monitor and record interactions with an object during a test. Specifically, spies "spy" on method calls, allowing you to verify **after** the fact whether certain methods were called, how many times they were called, and with what arguments.

#### Key Characteristics of a Spy:
- **Records interactions**: Spies track method calls, the number of times a method was called, and the arguments with which it was called.
- **Non-intrusive**: Unlike mocks, which explicitly expect method calls before execution, spies allow you to verify behavior **after** the code runs.
- **Verification**: Spies are useful for verifying side effects of method calls or ensuring that a particular method was invoked as a result of executing a piece of code.

### Example of a Spy in RSpec

In RSpec, the `allow(...).to receive(...)` construct can act as a spy, where it permits a method to be called without changing its behavior but keeps track of the call so it can be verified later.

```ruby
describe SomeClass do
  it 'spies on method call' do
    instance = SomeClass.new
    allow(instance).to receive(:some_method) # Spy on the method
    instance.some_method('argument') # Method is called
    expect(instance).to have_received(:some_method).with('argument') # Verify call and argument
  end
end
```

In this example, `allow(instance).to receive(:some_method)` sets up the spy, and after the method is called, you can use `have_received(:some_method)` to verify that it was indeed invoked with the correct argument.

### Spies vs. Mocks

- **Spies**: Allow verification after the fact. You can call the methods freely, and then check later if they were called (and how many times, with what arguments).
  
- **Mocks**: Expect a method call to happen before the test runs. If the expected method is not called or called with wrong arguments, the test fails immediately.

### Are Spies Exclusive to RSpec?

No, spies are not exclusive to RSpec. The concept of a spy is widely used across different testing frameworks and languages. Below are some examples of spy implementations in other frameworks:

#### 1. **Jasmine (JavaScript)**:
Jasmine, a popular testing framework for JavaScript, has a built-in `spyOn` function. It can track method calls and verify the number of calls and their arguments.

```javascript
describe("Spy Example", function() {
  it("spies on a method", function() {
    var obj = { someMethod: function() {} };
    spyOn(obj, "someMethod"); // Set up a spy
    obj.someMethod("arg1"); // Call the method
    expect(obj.someMethod).toHaveBeenCalledWith("arg1"); // Verify the call
  });
});
```

#### 2. **Sinon.js (JavaScript)**:
Sinon.js is a popular library for JavaScript that provides spies, mocks, and stubs. Spies in Sinon allow tracking method calls and arguments.

```javascript
const sinon = require('sinon');

describe("Sinon Spy Example", function() {
  it("spies on method call", function() {
    const obj = { someMethod: function() {} };
    const spy = sinon.spy(obj, "someMethod"); // Set up a spy
    obj.someMethod("arg1"); // Call the method
    sinon.assert.calledWith(spy, "arg1"); // Verify the call
  });
});
```

#### 3. **Mockito (Java)**:
In Java, the Mockito framework provides spies. It allows partial mocking of objects, where some methods are "spied" on while others use their real implementations.

```java
import static org.mockito.Mockito.*;

public class SpyExampleTest {
  @Test
  public void testMethodSpy() {
    List<String> list = new ArrayList<>();
    List<String> spyList = spy(list); // Create a spy
    spyList.add("item");
    verify(spyList).add("item"); // Verify that add method was called
  }
}
```

#### 4. **Mocha (Ruby)**:
In the Ruby Mocha framework, spies are available as part of mocks/stubs. It can track method calls on objects and verify them.

```ruby
require 'mocha/minitest'

describe 'Mocha Spy Example' do
  it 'tracks method calls' do
    object = Object.new
    object.stubs(:some_method) # Stubs the method (and spies on it)
    object.some_method('argument')
    assert_received(object, :some_method) { |exp| exp.with('argument') }
  end
end
```

### Uses of Spies

Spies are useful in the following contexts:
1. **Testing side effects**: When you want to check if certain methods were called as a result of an action or event.
2. **Ensuring interactions**: For example, verifying that methods were called on a collaborator or dependency, without forcing their implementation to change.
3. **Verifying arguments**: Confirming that a method was called with the right parameters.
4. **Counting calls**: Checking how many times a method was called, especially in cases where a method should be called only once or a specific number of times.

### Conclusion

Spies are powerful testing tools, not exclusive to RSpec, but widely used across many testing frameworks. They provide a way to observe and verify behavior **after** the code is executed without being as intrusive as mocks, which enforce behavior before execution. Each testing library or framework has its own implementation of spies, such as `spyOn` in Jasmine, `spy` in Sinon.js, or `verify` in Mockito, but the core idea remains the same: monitoring and verifying method interactions.