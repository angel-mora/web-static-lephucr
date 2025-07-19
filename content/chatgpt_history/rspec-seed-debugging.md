---
title: RSpec Seed Debugging
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# RSpec Seed Debugging

## ✅ TODOs
- [ ] is reset the Random seed of every spec and log that seed if that spec fails. This way we can run the spec locally using the same Random seed that failed in CI so the exact same faker data is produced and hopefully will reproduce any flakiness in the spec and make it easy to fix.

## 📌 Summary
seed number for each spec in rspec so i can trace down flaky specs in circleci

## 🧠 Full Chat


seed number for each spec in rspec so i can trace down flaky specs in circleci



To ensure that each test run in RSpec outputs the seed number, helping you trace flaky specs in CircleCI, follow these steps:

### 1. **Enable Seed Output in `spec_helper.rb` or `rails_helper.rb`**
RSpec automatically assigns a random seed for test execution order when using `--order random`. You can make it explicit in your helper file:

#### Modify `spec/spec_helper.rb` or `spec/rails_helper.rb`:
```ruby
RSpec.configure do |config|
  config.order = :random
  Kernel.srand config.seed

  # Print the seed at the beginning of the test suite
  config.before(:suite) do
    puts "\nRunning specs with seed: #{RSpec.configuration.seed}\n"
  end
end
```

### 2. **Run Tests with a Fixed or Logged Seed**
When running tests in CircleCI, ensure the seed is logged:

```bash
bundle exec rspec --order random
```

CircleCI will output the seed in logs. If you encounter a flaky test, you can rerun the test with that seed:

```bash
bundle exec rspec --seed 12345
```

### 3. **Force Retries with the Same Seed**
If you're using `rspec-retry` to catch flaky specs, configure it to use the same seed:

```ruby
RSpec.configure do |config|
  config.verbose_retry = true # Show retry attempts
  config.default_retry_count = 2 # Adjust retries as needed

  config.around(:each) do |example|
    seed = RSpec.configuration.seed
    example.run_with_retry retry: 2, seed: seed
  end
end
```

### 4. **CircleCI Debugging**
If a test fails due to a flaky condition, you can rerun the test in CircleCI using SSH and specify the seed:

```bash
circleci rerun --seed 12345
```

This will help you reproduce and debug flaky tests. 🚀

What we really want to do is reset the Random seed of every spec and log that seed if that spec fails. This way we can run the spec locally using the same Random seed that failed in CI so the exact same faker data is produced and hopefully will reproduce any flakiness in the spec and make it easy to fix.

That makes sense! To achieve this, you need to reset the random seed for every spec and log the seed only when a test fails. Here's how you can implement it in `spec_helper.rb` or `rails_helper.rb`:

### **1. Reset Random Seed for Each Example**
You can use `Kernel.srand` inside `RSpec.config.before(:each)` to reset the seed at the beginning of each test.

### **2. Log the Seed When a Spec Fails**
Use `RSpec.config.after(:each)` to log the seed only if a test fails.

---

### **Implementation in `rails_helper.rb` or `spec_helper.rb`**
```ruby
RSpec.configure do |config|
  config.before(:each) do
    @example_seed = Random.new_seed
    Kernel.srand @example_seed
  end

  config.after(:each) do |example|
    if example.exception # Only log if the test failed
      puts "\n🚨 Spec failed! Run with: SEED=#{@example_seed}"
    end
  end
end
```

---

### **3. Run a Failing Spec with the Same Seed**
When a spec fails in CircleCI, you'll see output like:

```
🚨 Spec failed! Run with: SEED=123456789
```

To reproduce the failure locally, run:

```bash
SEED=123456789 bundle exec rspec path/to/flaky_spec.rb
```

---

### **4. Ensure Faker Uses the Same Seed**
If you're using `faker` for random test data, make sure it respects the seed:

```ruby
RSpec.configure do |config|
  config.before(:each) do
    seed = Random.new_seed
    Kernel.srand seed
    Faker::Config.random = Random.new(seed) # Ensures Faker uses the same seed
  end
end
```

---

### **Why This Works**
- Each test gets a fresh random seed.
- If a test fails, you log the seed, making it easy to reproduce.
- Faker will generate the exact same data when rerun with the same seed.

This should make tracking down flaky tests in CircleCI **much easier**! 🚀

not even reaching config.before and after blocks for @example_seed

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.disable_monkey_patching!
  config.expose_dsl_globally = true
  config.default_formatter = "doc" if config.files_to_run.one?
  config.profile_examples = 10

  # retry once on these errors
  config.exceptions_to_retry = [Net::OpenTimeout, Net::ReadTimeout, Timeout::Error, Selenium::WebDriver::Error::WebDriverError]
  config.verbose_retry = true
  config.display_try_failure_messages = true
  config.before do
    @example_seed = Random.new_seed
    Kernel.srand(@example_seed)
    Faker::Config.random = Random.new(@example_seed)
  end
  config.around :each, type: :feature do |ex|
    ex.run_with_retry retry: 2
  end
  config.after do |example|
    if example.exception # Only log if the test failed
      puts "\n🚨 Spec failed! Run with: SEED=#{@example_seed}"
    end
  end

  config.include GraphQLHelper
end

Your `before` and `after` hooks should be running, but if they're not, here are a few things to check and alternative approaches:

---

### **1. Debug Whether `before` is Running at All**
Try adding a simple debug print inside your `before` block to check if it executes:

```ruby
config.before do
  @example_seed = Random.new_seed
  Kernel.srand(@example_seed)
  Faker::Config.random = Random.new(@example_seed)
  puts "Setting SEED=#{@example_seed}" # Debugging output
end
```

If you **don’t see this output**, it means the `before` block isn’t being executed at all. That would suggest:
- The spec suite might be misconfigured.
- The tests you're running might not be triggering `before` (e.g., if they're outside RSpec’s normal execution path).

---

### **2. Check `config.before` Scope**
Your `config.before` doesn’t specify a scope (like `:each` or `:suite`). By default, it runs **before every example**, but explicitly setting it might help:

```ruby
config.before(:each) do
  @example_seed = Random.new_seed
  Kernel.srand(@example_seed)
  Faker::Config.random = Random.new(@example_seed)
  puts "Setting SEED=#{@example_seed}" # Debugging output
end
```

Same with `config.after(:each)`, in case the `after` block isn’t firing:

```ruby
config.after(:each) do |example|
  if example.exception
    puts "\n🚨 Spec failed! Run with: SEED=#{@example_seed}"
  end
end
```

---

### **3. Ensure Your Specs Are Running Inside RSpec**
Make sure your tests are actually being run inside RSpec. If you're using `rails test` instead of `rspec`, these hooks won’t execute.

Try running:

```bash
bundle exec rspec --format documentation
```

If you still don’t see "Setting SEED=...", that means the hooks aren't firing.

---

### **4. Confirm Other Hooks Aren’t Interfering**
Your config includes `config.around :each, type: :feature`, which retries tests. **If a test passes on retry, the failure log might not appear.** 

Try moving the `after(:each)` **outside** the retry block or logging `@example_seed` on every run:

```ruby
config.after(:each) do |example|
  puts "Finished spec with SEED=#{@example_seed}" # Log every test's seed
  if example.exception
    puts "\n🚨 Spec failed! Run with: SEED=#{@example_seed}"
  end
end
```

---

### **5. Force a Test Failure to See If Logging Works**
If all else fails, create a deliberately failing spec to test:

```ruby
RSpec.describe "Flaky spec test" do
  it "fails on purpose" do
    expect(1).to eq(2) # Intentional failure
  end
end
```

If **this fails but doesn't log the seed**, then something is preventing `config.after` from executing.

---

### **6. Last Resort: Use `RSpec.current_example` Instead**
If instance variables aren’t being set properly, you can use `RSpec.current_example`:

```ruby
config.before(:each) do
  RSpec.current_example.metadata[:seed] = Random.new_seed
  Kernel.srand(RSpec.current_example.metadata[:seed])
  Faker::Config.random = Random.new(RSpec.current_example.metadata[:seed])
  puts "Setting SEED=#{RSpec.current_example.metadata[:seed]}" # Debugging
end

config.after(:each) do |example|
  if example.exception
    puts "\n🚨 Spec failed! Run with: SEED=#{example.metadata[:seed]}"
  end
end
```

---

### **Summary**
- Add a debug `puts` to confirm the `before` block is running.
- Explicitly use `:each` for `config.before(:each)` and `config.after(:each)`.
- Make sure you’re running `rspec`, not `rails test`.
- Check that retries aren’t swallowing errors before logging the seed.
- Use `RSpec.current_example.metadata[:seed]` as an alternative.

Let me know if this helps! 🚀