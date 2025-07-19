---
title: Refactor Test for Logging
tags:
- new
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Refactor Test for Logging

## ✅ TODOs
- [ ] , not how it does it. This principle is important for several reasons:
- [ ] .

## 📌 Summary
Difference between and_return, and_throw, and and_raise, as well as link to a few sources to understand it deeper and better

## 🧠 Full Chat


Difference between and_return, and_throw, and and_raise, as well as link to a few sources to understand it deeper and better

The terms `and_return`, `and_throw`, `and_raise` are used in different programming contexts, each serving a distinct purpose. 

1. **`and_return`**: This is typically used in the context of mocking or stubbing in unit testing. When you set up a mock or a stub for a method

Difference between Rspec and_return, and_throw, and and_raise, as well as link to a few sources to understand it deeper and better

`RSpec` is a popular testing framework for Ruby, and it provides various ways to specify the behavior of doubles (test doubles are simplified objects that mimic real objects). Three of these methods are `and_return`, `and_throw`, and `and_raise`, each serving a different purpose in your test setup:

1. **`and_return`**: This is used when you want your double to return a specific value when a method is called. It's useful for simulating different return values without needing to invoke the actual implementation.

   Example:
   ```ruby
   expect(double).to receive(:method_name).and_return("some value")
   ```

2. **`and_throw`**: This is different from raising an exception. `throw` and `catch` in Ruby are used for control flow, not for error handling. `and_throw` is used when you want your double to throw a symbol, which can then be caught by a `catch` block elsewhere in your test.

   Example:
   ```ruby
   expect(double).to receive(:method_name).and_throw(:some_symbol)
   ```

3. **`and_raise`**: This is used to simulate an exception being raised when a method is called. It's helpful when you want to test error handling in your code.

   Example:
   ```ruby
   expect(double).to receive(:method_name).and_raise(SomeError)
   ```

To understand these concepts more deeply, it's best to refer to official documentation and reputable sources. Let me find a few links for you.

The RSpec framework for Ruby offers different methods for specifying the behavior of test doubles, such as `and_return`, `and_throw`, and `and_raise`. Here's a brief overview of each:

1. **`and_return`**: This method is used to specify the value that should be returned when a certain message is received by the test double. You can provide one or more values, and they will be returned in the order specified for consecutive calls. If a message is received more times than the specified values, the last value is repeated for every subsequent call. You can find more details in the [RSpec Mocks documentation](https://www.rubydoc.info/github/rspec/rspec-mocks/RSpec/Mocks/MessageExpectation%3aand_return).

2. **`and_throw`**: This method is not covered in the sources I found, but generally in Ruby, `throw` is used for control flow, not for error handling. When used with `and_throw`, the test double is instructed to throw a specified symbol when a particular message is received. This is different from raising an exception and is used less commonly in tests.

3. **`and_raise`**: This method is used when you want the test double to raise an exception in response to a received message. It's helpful for testing error handling in your code. While I didn't find a direct source covering `and_raise`, understanding it can be aided by general knowledge of exception handling and test doubles in RSpec.

For a more comprehensive understanding of these methods and their use cases, it's recommended to refer to the official RSpec documentation and explore various examples and tutorials. The [RSpec Mocks documentation](https://www.rubydoc.info/github/rspec/rspec-mocks/RSpec/Mocks/MessageExpectation%3aand_return) is a good starting point for `and_return`, and exploring broader RSpec resources will help with understanding `and_throw` and `and_raise`. Additionally, resources like Semaphore's guide on [RSpec Subject, Helpers, Hooks, and Exception Handling](https://semaphoreci.com/community/tutorials/rspec-subject-helpers-hooks-and-exception-handling) provide a broader view of RSpec's capabilities, which can be helpful in understanding the context in which these methods are used.

  subject(:builder) { described_class.new(company: policy_book.company, user: user, creation_date: DateTime.current) }

  let(:company_with_logo) { FactoryBot.create(:random_company_with_logo) }
  let(:user) { FactoryBot.create(:user, company: policy_book.company) }
  let!(:policy_book) { FactoryBot.create(:policy_book) }
  let(:host) { Rails.application.secrets.policy_book_asset_root_url.gsub('#', ActsAsTenant.current_tenant.subdomain) }
  let(:file_stub) { Rails.root.join('spec/fixtures/test.png') }

  describe '#new' do
    before do
      allow(user).to receive(:first_profile_name).and_throw(StandardError)
      allow_any_instance_of(described_class).to receive(:log_output)
    end

    it 'handles StandardError with logs_output' do
      builder
    rescue StandardError
      ''
    ensure
      expect_any_instance_of(described_class).to receive(:log_output)
    end
  end

So in that spec it is failing because the service object can not initialize due to the standard error set in the allow. How can I pass the test or refactor it in such a way that I can test it logs_output?

  def initialize(company:, user:, creation_date:)
    @company = company
    ActsAsTenant.current_tenant = @company
    @user = user
    @profile_name = @user.first_profile_name
    @policy_book = @company.policy_book || PolicyBook.new(company: @company)
    @creation_date = creation_date.in_time_zone(@company.time_zone)
    primary_document_type
  rescue StandardError => e
    puts 'e'
    log_output "#{e.message}\n\n#{e.backtrace.join("\n")}"
    raise
  end


Your test is aiming to verify that an error is logged when a `StandardError` is encountered during the initialization of your service object. However, there's an issue in the way your test is set up, particularly with the use of `and_throw`. In Ruby, `throw` is used for control flow and not for error handling. For simulating exceptions, you should use `and_raise` instead.

Here's how you can refactor the test:

1. **Change `and_throw` to `and_raise`**: Replace the `and_throw(StandardError)` with `and_raise(StandardError)`. This will simulate the behavior where calling `first_profile_name` on `user` raises a `StandardError`, which is what you seem to want to test.

2. **Test the Logging**: To test that the `log_output` method is called when an error is raised, you need to ensure that the expectation (`expect_any_instance_of(described_class).to receive(:log_output)`) is set up before the error occurs. This means moving the expectation to before the `builder` is initialized.

Here is a modified version of your test:

```ruby
describe '#new' do
  before do
    allow(user).to receive(:first_profile_name).and_raise(StandardError)
    allow_any_instance_of(described_class).to receive(:log_output)
  end

  it 'handles StandardError with logs_output' do
    expect_any_instance_of(described_class).to receive(:log_output)
    begin
      builder
    rescue StandardError
      # Handle error
    end
  end
end
```

This setup will ensure that when `builder` is initialized and `StandardError` is raised, the `log_output` method is expected to be called.

Remember, when writing tests, especially those involving exceptions and error handling, it's crucial to closely align the test setup with the actual behavior you expect from your code under test. This includes using the correct methods (`and_raise` for exceptions) and structuring your tests to reflect the flow of execution in your application.

Is it correct to try to test that according to the test behavior, not implementation principle? 



Testing behavior rather than implementation is indeed a core principle in software testing, particularly in unit testing. This approach focuses on what the code is supposed to do, not how it does it. This principle is important for several reasons:

1. **Maintainability**: Tests based on behavior are less brittle. They don't break with every change in the implementation as long as the behavior remains consistent.

2. **Refactoring Friendly**: Since behavior-based tests don't rely on the specifics of the implementation, they allow developers to refactor code without needing to rewrite tests, as long as the external behavior doesn't change.

3. **Clarity**: Tests that focus on behavior tend to be more readable and provide clearer documentation for what the code is supposed to do.

4. **Focus on Requirements**: Behavior-based testing helps ensure that the code meets the requirements and use cases it's supposed to address, rather than merely ensuring that the code works as it's currently written.

In your specific case, testing that an error is logged when an exception occurs is testing behavior. You are not concerned with how `log_output` is implemented, but rather that it's called appropriately in response to an error condition. This aligns with the behavior-based testing principle.

However, a word of caution: while focusing on behavior is generally good, sometimes implementation details can be critical, especially for performance-critical components or when dealing with resources like database connections, file I/O, etc. In such cases, a balance between behavior and implementation testing might be necessary.

In summary, your approach of testing that an error is logged (rather than the internals of the logging mechanism) seems aligned with the principle of testing behavior over implementation. This is a widely recommended practice in software development for the reasons outlined above.