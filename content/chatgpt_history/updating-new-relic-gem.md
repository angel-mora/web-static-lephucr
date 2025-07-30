---
title: Updating New Relic Gem
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  How should i update the newrelic gem for a ruby on
  rails app? Following app instructions or just by updating the gem?"
draft: false
---

# Updating New Relic Gem

## 🧠 Full Chat

🙋 **You:**

How should i update the newrelic gem for a ruby on rails app? Following app instructions or just by updating the gem?

---

🤖 **Assistant:**

To update the New Relic gem for your Ruby on Rails app, follow these steps:

### 1. **Check for New Versions**
   - Visit [New Relic's official Ruby agent page](https://rubygems.org/gems/newrelic_rpm) to find the latest version of the gem.

### 2. **Update Your Gemfile**
   - Open your `Gemfile` and update the version of `newrelic_rpm`:
     ```ruby
     gem 'newrelic_rpm', '~> [latest_version]'
     ```
     Replace `[latest_version]` with the version number you want to install.

### 3. **Run `bundle update`**
   - In your terminal, run:
     ```bash
     bundle update newrelic_rpm
     ```
   - This will update the gem and ensure that all dependencies are also updated.

### 4. **Check New Relic Documentation for Config Changes**
   - New versions of New Relic's gem may introduce new features or deprecate old ones. It's always a good idea to check the release notes or [New Relic’s documentation](https://docs.newrelic.com/docs/agents/ruby-agent) for any configuration changes you need to make in your `newrelic.yml` or `config/environments/production.rb` files.

### 5. **Test Your Application**
   - Restart your server and run tests to ensure the gem update hasn’t caused any issues:
     ```bash
     rails s
     ```
   - Also, check that New Relic is still receiving data after the update.

By following this process, you can ensure a smooth and reliable update.