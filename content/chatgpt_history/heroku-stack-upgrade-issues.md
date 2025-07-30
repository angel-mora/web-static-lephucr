---
title: Heroku stack upgrade issues
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  what kind of things can go wrong when upgrading stack
  from Heroku 20 to 24 without 22. Rails app"
draft: false
---

# Heroku stack upgrade issues

## 🧠 Full Chat

🙋 **You:**

what kind of things can go wrong when upgrading stack from Heroku 20 to 24 without 22. Rails app

---

🤖 **Assistant:**

Upgrading your Rails app from **Heroku-20** to **Heroku-24** while skipping **Heroku-22** can introduce several potential issues due to major system changes. Here are some key areas to watch out for:

### **1. Ruby Version Incompatibility**  
- **Heroku-24 uses Ubuntu 24.04**, which has newer system libraries that might not support older Ruby versions.
- Ensure your **Ruby version is compatible** with Ubuntu 24.04.
- If you're on an old Ruby version, upgrade to **Ruby 3.1+** before switching stacks.

### **2. Node.js and Yarn Version Mismatch**  
- Heroku-24 ships with **newer Node.js versions** by default.
- If your app relies on a specific Node.js or Yarn version, ensure your `engines` field in `package.json` is set correctly:
  ```json
  "engines": {
    "node": ">=18",
    "yarn": ">=1.22"
  }
  ```
- Run `heroku buildpacks` to check if the correct Node.js buildpack is being used.

### **3. Bundler and Gem Dependencies Issues**  
- Some gems that worked on Heroku-20 may not work with newer system libraries.
- Run:
  ```sh
  bundle update --bundler
  bundle install
  ```
- Recompile native gems (`pg`, `nokogiri`, etc.):
  ```sh
  bundle pristine
  ```

### **4. PostgreSQL and Database Adapter Issues**  
- **PostgreSQL client libraries are newer** in Heroku-24.
- If using the `pg` gem, ensure it's updated:
  ```sh
  gem install pg -- --with-pg-config=/app/.apt/usr/bin/pg_config
  ```
- Check if your database.yml configurations are still valid.

### **5. Webpack and Asset Compilation Issues**  
- If you use Webpacker or ESBuild, ensure compatibility with the newer Node.js and Yarn versions.
- Check for deprecated webpack plugins that might break.

### **6. Changes in System Libraries**  
- Heroku-24 uses **Glibc 2.39**, which might break older dependencies.
- Ensure any system dependencies installed via `apt-get` or `buildpacks` are still available.

### **7. Background Jobs (Sidekiq, Delayed Job, etc.)**  
- Newer Redis versions might be used by default, check Redis compatibility if Sidekiq is in use.
- Ensure `redis-rb` gem is up-to-date.

### **8. Scheduled Tasks and Cron Jobs**  
- Some Heroku cron jobs might fail due to environment variable changes.
- Run `heroku run env` to confirm expected environment variables are available.

---

### **How to Upgrade Safely**
1. **Test in a Staging App First**  
   ```sh
   heroku create my-app-staging --remote staging
   heroku stack:set heroku-24 -a my-app-staging
   ```
2. **Deploy & Monitor Logs**  
   ```sh
   git push staging main
   heroku logs --tail -a my-app-staging
   ```
3. **Run Migrations & Tasks**  
   ```sh
   heroku run rake db:migrate -a my-app-staging
   ```
4. **Rollback If Necessary**  
   If errors occur, rollback:
   ```sh
   heroku stack:set heroku-20 -a my-app
   ```

Would you like help debugging specific dependencies before upgrading?