---
title: TinyTDS installation error fix
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  An error occurred while installing tiny_tds (2.1.7),
  and Bundler cannot"
draft: false
---

# TinyTDS installation error fix

## 🧠 Full Chat

🙋 **You:**

An error occurred while installing tiny_tds (2.1.7), and Bundler cannot
continue.

In Gemfile:
  activerecord-sqlserver-adapter was resolved to 7.0.7, which depends on
    tiny_tds
I am in Ubuntu within aws workspace

---

🤖 **Assistant:**

The error indicates an issue installing the `tiny_tds` gem, which is a dependency of the `activerecord-sqlserver-adapter`. This usually happens due to missing system libraries or misconfiguration.

### Steps to Fix

1. **Install Required Libraries**
   `tiny_tds` relies on FreeTDS, a library for connecting to Microsoft SQL Server. You need to install it first.

   Run the following commands:

   ```bash
   sudo apt-get update
   sudo apt-get install -y freetds-dev
   ```

2. **Verify FreeTDS Installation**
   Check that FreeTDS is correctly installed:

   ```bash
   tsql -C
   ```

   This should display configuration details for FreeTDS. If it does not, ensure that `freetds-dev` was installed correctly.

3. **Install `tiny_tds` Gem Again**
   After installing FreeTDS, retry installing the gem:

   ```bash
   gem install tiny_tds
   ```

4. **Check Your Gemfile**
   Ensure your `Gemfile` includes the correct dependency. For example:

   ```ruby
   gem 'tiny_tds'
   gem 'activerecord-sqlserver-adapter'
   ```

   Then run:

   ```bash
   bundle install
   ```

5. **Verify Connection to SQL Server**
   Ensure you can connect to your SQL Server instance. You may need to configure `/etc/freetds/freetds.conf` to specify the server settings.

   Example configuration:

   ```plaintext
   [myserver]
       host = your-sql-server-host
       port = 1433
       tds version = 8.0
   ```

6. **Set Environment Variables (If Necessary)**
   If you still encounter issues, explicitly set environment variables for `tiny_tds`. For example:

   ```bash
   export TINY_TDS_VERSION=2.1.7
   export TDSVER=7.4
   ```

7. **Debugging (Optional)**
   If the problem persists, try running the gem installation with verbose output to debug:

   ```bash
   gem install tiny_tds --verbose
   ```

Let me know if you encounter further issues!