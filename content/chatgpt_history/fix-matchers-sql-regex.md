---
title: 'Fix Matchers: SQL Regex'
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Fix this couple of matchers for partial matching"
draft: false
---

# Fix Matchers: SQL Regex

## ✅ TODOs
- [ ] it on a per-record basis or across all instances during a certain condition like testing.

## 🧠 Full Chat

🙋 **You:**

Fix this couple of matchers for partial matching

    describe '.order_by_date_desc' do
      it { expect(described_class.order_by_date_desc.to_sql).to match(/'%ORDER BY `dispatcher_trace_logs`.`created_at` DESC%/) }
    end

    describe '.older_than' do
      let(:expiration) { 60 }

      it { expect(described_class.older_than(expiration).to_sql).to match(/^(created_at < #{expiration.days.ago})/) }
    end

Then explain

---

🤖 **Assistant:**

To fix the matchers for partial matching in the provided RSpec tests and ensure they work as intended, let's revise each matcher:

1. **`.order_by_date_desc` Matcher Correction:**

The original matcher attempts to use a percent symbol (`%`) as a wildcard for partial matching within a regular expression. However, the percent symbol is not a wildcard in regular expressions. Instead, the correct wildcard symbol is `.*` which means "any character (.) zero or more times (*)". Additionally, the use of backticks around `dispatcher_trace_logs`.`created_at` might be an attempt to quote the table and column names, but in the context of a regular expression, they are interpreted literally. Unless the actual SQL string contains backticks, you should remove them or replace them with appropriate characters to match the SQL syntax used by your database adapter.

Corrected Matcher:

```ruby
describe '.order_by_date_desc' do
  it { expect(described_class.order_by_date_desc.to_sql).to match(/ORDER BY `dispatcher_trace_logs`.`created_at` DESC/) }
end
```

Explanation: This corrected matcher removes the incorrect wildcard symbols and ensures that the regex correctly matches any SQL string containing the "`ORDER BY `dispatcher_trace_logs`.`created_at` DESC" part. If your SQL syntax doesn't use backticks, you might need to adjust the regex accordingly.

2. **`.older_than` Matcher Correction:**

The original matcher for `.older_than` incorrectly attempts to interpolate `#{expiration.days.ago}` directly within a regex, which is not valid. To correct this, we need to dynamically generate the part of the SQL query that checks if `created_at` is less than `expiration.days.ago` and then interpolate that value into the regex.

First, ensure that your test setup includes the necessary Rails ActiveSupport extensions for `.days.ago` to work, and then interpolate the calculated date into the regex:

Corrected Matcher:

```ruby
describe '.older_than' do
  let(:expiration) { 60 }

  it do
    expiration_time = expiration.days.ago.to_s(:db) # Formats the datetime in a way that's comparable to your SQL output
    expect(described_class.older_than(expiration).to_sql).to match(/created_at < '#{Regexp.escape(expiration_time)}'/)
  end
end
```

Explanation: This matcher dynamically calculates `expiration.days.ago` and formats it as a string comparable to the SQL datetime format. It then escapes this datetime string to safely use it within a regex. The matcher checks that the `.to_sql` output includes a `created_at < 'formatted_expiration_time'` condition. The use of `Regexp.escape` is crucial here to ensure that any characters in the `expiration_time` string that could be interpreted as regex tokens are escaped.

Please note: The exact formatting of `expiration_time` might need to be adjusted depending on the database you're using and its date formatting in SQL queries. The example uses `:db` symbol for formatting, which is a common Rails convention for database-compatible datetime formats.

---

🙋 **You:**

fix that regexp escape for expiration variable, remove utc

---

🤖 **Assistant:**

If the goal is to fix the regular expression escape for the `expiration` variable in the `.older_than` matcher and ensure the date comparison doesn't specifically reference UTC or any timezone formatting in the regex, we can approach this by simplifying the date comparison to focus on the structure of the query itself without embedding a specific datetime string. This means we won't directly interpolate the exact datetime string into the regex but rather ensure the structure of the SQL query matches the expected pattern.

Here’s how you can adjust the test:

1. **Simplify the Regex for the Date Comparison:** Instead of trying to match the exact datetime, we'll match the structure of the SQL query that checks if `created_at` is less than a certain time ago, without embedding the exact datetime.

2. **Remove Timezone Consideration:** By not embedding a specific datetime string (which might include timezone information), we inherently remove the UTC or any timezone consideration from the regex.

Corrected Matcher Without Direct DateTime Interpolation:

```ruby
describe '.older_than' do
  let(:expiration) { 60 }

  it do
    # Assuming `expiration.days.ago` generates a condition in your SQL query,
    # but without embedding the exact datetime string in the matcher.
    # This regex looks for the pattern "created_at <" followed by a placeholder
    # for the dynamic part of the query that represents the datetime calculation.
    expect(described_class.older_than(expiration).to_sql).to match(/created_at < '.+'/)
  end
end
```

Explanation:
- This approach checks for the presence of a `created_at < '...'` pattern in the SQL query, indicating that there's a condition filtering records older than a certain datetime. The `'.+'` part of the regex represents any character one or more times, serving as a placeholder for the actual datetime calculation part of the SQL query. This way, the test focuses on the structure of the query rather than the exact values, which can vary.

Please note, this approach makes the test less precise in terms of matching the exact datetime calculation, as it no longer verifies the specific datetime value being compared. This might be acceptable depending on the level of precision required for your tests. If you specifically need to verify the datetime calculation, you would need to inject the calculated datetime string into the regex, ensuring it matches the format used in your SQL queries, and possibly handling timezone conversions explicitly if necessary.

---

🙋 **You:**

How skip the after_save callback even if it is a class method
# frozen_string_literal: true

class DispatcherTraceLog < ApplicationRecord
  acts_as_tenant(:company)
  after_save -> { self.class.delete_old_logs }

  TABLE_ATTR = %w[created_at dispatcher_id description worker_class class_name method_name jid].freeze

  paginates_per 20

  scope :order_by_date_desc, -> { order(created_at: :desc) }
  scope :older_than, -> (expiring_time) do
    where("created_at < ?", expiring_time.days.ago)
  end

  # we can disable logging by updating /config/application.rb
  def self.log_trace!(attributes)
    return unless Rails.configuration.x.mypolicies.dispatcher_tracing

    create(
      attributes
    )
  end

  def self.delete_old_logs
    binding.pry
    older_than(ENV['DISPATCHER_TRACE_LOGS_EXPIRING_TIME'].to_i).destroy_all
  end
end


Here is my factory where I was trying to make it work

FactoryBot.define do
  factory :dispatcher_trace_log do
    company { ActsAsTenant.current_tenant }
    description { 'dispatcher description' }
    class_name { SidekiqMiddleware::JobQueueServerMiddleware }
    method_name { 'call' }
    created_at { Time.now }

    # after(:build) { |log| log.class.skip_callback(:save, :after, :log.class.delete_old_logs) }

    trait :created_100_days_ago do
      created_at { 100.days.ago }
    end
    
    factory :dispatcher_trace_log_outdated, traits: [:created_100_days_ago]
  end
end

---

🤖 **Assistant:**

Skipping an `after_save` callback in Rails, especially when the callback is a class method, requires careful handling to ensure that the callback is skipped only under the right conditions without affecting other parts of the application that rely on this callback.

The challenge with the approach you've commented out in your factory (`after(:build) { |log| log.class.skip_callback(:save, :after, :log.class.delete_old_logs) }`) is that `log.class.delete_old_logs` is not the right syntax for referencing a method when skipping callbacks. Additionally, you typically cannot skip a callback that is defined using a lambda directly in the model because the lambda creates an anonymous function that is not easily referenced outside of its definition.

To address this, let's explore a couple of solutions:

### Solution 1: Conditionally Skip Callback in the Model

One way to skip the callback is by adding a condition to the model that checks an attribute or a global setting that you control during your test setup.

For example, you could add an attribute to your model (not saved to the database) that you check in the lambda before executing the class method:

```ruby
class DispatcherTraceLog < ApplicationRecord
  attr_accessor :skip_delete_old_logs_callback

  after_save -> { self.class.delete_old_logs unless skip_delete_old_logs_callback }
  # ...
end
```

In your factory or test setup, you can then set this attribute to `true`:

```ruby
FactoryBot.define do
  factory :dispatcher_trace_log do
    # ...
    after(:build) do |log|
      log.skip_delete_old_logs_callback = true
    end
    # ...
  end
end
```

This approach allows you to conditionally skip the callback based on the `skip_delete_old_logs_callback` attribute without modifying the callback mechanism globally.

### Solution 2: Global Configuration Option

If the condition under which you want to skip the callback is more global (not specific to individual records), you could use a Rails configuration option (similar to what you have with `Rails.configuration.x.mypolicies.dispatcher_tracing`).

In `config/application.rb`, add another configuration option:

```ruby
config.x.mypolicies.skip_delete_old_logs_callback = false
```

Modify your `after_save` callback to check this configuration:

```ruby
class DispatcherTraceLog < ApplicationRecord
  after_save -> { self.class.delete_old_logs unless Rails.configuration.x.mypolicies.skip_delete_old_logs_callback }
  # ...
end
```

In your test setup or factory, you can then temporarily change this configuration:

```ruby
before(:each) do
  Rails.configuration.x.mypolicies.skip_delete_old_logs_callback = true
end

after(:each) do
  Rails.configuration.x.mypolicies.skip_delete_old_logs_callback = false
end
```

This approach is more global and affects all instances where the callback might be triggered, which is useful if you're running tests that require the callback to be skipped across the board.

Both of these solutions provide a way to conditionally skip `after_save` callbacks in Rails, depending on whether you need the flexibility to do it on a per-record basis or across all instances during a certain condition like testing.

---

🙋 **You:**

You should learn it is easier to just pass unless Rails.env.test? in the callback

---

🤖 **Assistant:**

Indeed, using `unless Rails.env.test?` directly within the callback condition is a straightforward and simple approach to skip executing a callback during test runs in a Rails environment. This technique is particularly useful when you want to avoid certain behaviors, such as external API calls, email sending, or in this case, deleting old logs, that are unnecessary or undesirable during automated tests.

Applying this method to your `DispatcherTraceLog` model, the `after_save` callback modification would look like this:

```ruby
class DispatcherTraceLog < ApplicationRecord
  acts_as_tenant(:company)
  after_save -> { self.class.delete_old_logs unless Rails.env.test? }

  TABLE_ATTR = %w[created_at dispatcher_id description worker_class class_name method_name jid].freeze

  paginates_per 20

  scope :order_by_date_desc, -> { order(created_at: :desc) }
  scope :older_than, -> (expiring_time) do
    where("created_at < ?", expiring_time.days.ago)
  end

  # we can disable logging by updating /config/application.rb
  def self.log_trace!(attributes)
    return unless Rails.configuration.x.mypolicies.dispatcher_tracing

    create(
      attributes
    )
  end

  def self.delete_old_logs
    older_than(ENV['DISPATCHER_TRACE_LOGS_EXPIRING_TIME'].to_i).destroy_all
  end
end
```

This method effectively ensures that the `delete_old_logs` class method is called after each save, except when the code is running in the test environment. This approach has several benefits:

1. **Simplicity:** It's very straightforward to implement and understand.
2. **Environment-specific Behavior:** It provides a clear distinction between the test environment and other environments (development, production), making it easier to manage environment-specific behaviors.
3. **No Impact on Production Code:** Since this condition specifically checks for the test environment, it has no impact on the behavior of your application in development or production environments.

However, it's important to consider that using environment checks within your application logic can sometimes make the code harder to follow, especially for newcomers to the project. It may also introduce environment-specific bugs if not carefully managed. Always weigh the convenience of this approach against these considerations. For tests that need to verify the behavior of callbacks, you might still need to find alternative strategies, such as explicitly calling the callback method in your test setup or using mocking/stubbing techniques.