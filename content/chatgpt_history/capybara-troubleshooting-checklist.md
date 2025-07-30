---
title: Capybara Troubleshooting Checklist
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Rspec capybara not rendering html nor png anymore"
draft: false
---

# Capybara Troubleshooting Checklist

## 🧠 Full Chat

🙋 **You:**

Rspec capybara not rendering html nor png anymore

---

🤖 **Assistant:**

When RSpec Capybara isn't rendering HTML or PNG files as expected, it can be due to a variety of reasons. Here's a checklist to troubleshoot and resolve the issue:

### 1. Ensure Capybara is Configured Correctly
Make sure your Capybara configuration in your `spec_helper.rb` or `rails_helper.rb` file is set up correctly.

```ruby
require 'capybara/rspec'
require 'capybara-screenshot/rspec'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome # or :selenium_chrome_headless
  config.save_path = Rails.root.join('tmp/capybara')
end
```

### 2. Verify Screenshot Configuration
Ensure Capybara Screenshot is configured to save HTML and PNG files correctly.

```ruby
Capybara::Screenshot.configure do |config|
  config.autosave_on_failure = true
  config.after_save_html do |path|
    puts "HTML saved to #{path}"
  end
  config.after_save_screenshot do |path|
    puts "Screenshot saved to #{path}"
  end
end
```

### 3. Check Permissions
Ensure the directory where Capybara is trying to save the files has the correct permissions.

```sh
chmod -R 755 tmp/capybara
```

### 4. Inspect Test Logs
Check your test logs for any errors or warnings that might indicate why the files aren't being saved.

### 5. Ensure Required Gems are Installed
Make sure you have the necessary gems installed in your `Gemfile`.

```ruby
group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'capybara-screenshot'
end
```

Run `bundle install` to ensure all gems are installed.

### 6. Use Explicit Save Commands
Sometimes, using explicit save commands in your tests can help debug issues.

```ruby
it 'saves a screenshot and HTML file' do
  visit root_path
  save_screenshot('screenshot.png')
  save_page('page.html')
end
```

### 7. Check Capybara Version Compatibility
Ensure that the versions of Capybara, Selenium WebDriver, and Capybara Screenshot are compatible with each other.

### 8. Update Dependencies
Try updating your dependencies to the latest versions, as this can often resolve unexpected issues.

```sh
bundle update capybara selenium-webdriver capybara-screenshot
```

### 9. Use Headless Browser
If you are running tests in a CI environment or without a GUI, ensure you are using a headless browser.

```ruby
Capybara.register_driver :headless_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--disable-gpu')
  options.add_argument('--window-size=1280,1024')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.javascript_driver = :headless_chrome
```

### Example Configuration

Here’s a combined example for your `spec_helper.rb` or `rails_helper.rb`:

```ruby
require 'capybara/rspec'
require 'capybara-screenshot/rspec'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome # or :selenium_chrome_headless
  config.save_path = Rails.root.join('tmp/capybara')
end

Capybara::Screenshot.configure do |config|
  config.autosave_on_failure = true
  config.after_save_html do |path|
    puts "HTML saved to #{path}"
  end
  config.after_save_screenshot do |path|
    puts "Screenshot saved to #{path}"
  end
end

Capybara.register_driver :headless_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--disable-gpu')
  options.add_argument('--window-size=1280,1024')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.javascript_driver = :headless_chrome

RSpec.configure do |config|
  config.after(:each, type: :feature) do |example|
    if example.exception
      save_screenshot("tmp/capybara/#{example.full_description}.png")
      save_page("tmp/capybara/#{example.full_description}.html")
    end
  end
end
```

By following these steps, you should be able to troubleshoot and resolve the issue with Capybara not rendering HTML or PNG files. If the problem persists, please provide any error messages or logs you are seeing for further assistance.