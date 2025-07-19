---
title: NVM not found solution
tags:
- '0'
- build_quartz_site
- '1'
- setup_quartz
- show
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# NVM not found solution

## ✅ TODOs


## 📌 Summary
require "fileutils"

## 🧠 Full Chat


require "fileutils"

class QuartzInstance < ApplicationRecord
  belongs_to :user
  after_create :setup_quartz

  def setup_quartz
    repo_name = repo_url.split("/").last.gsub(".git", "")
    base_path = Rails.root.join("storage", "quartz", repo_name.gsub(/@.*$/, ""))
    self.local_path = File.join(base_path, repo_name)

    unless Dir.exist?(local_path)
      system("git clone #{repo_url} #{local_path}")
    end

    build_quartz_site
    update(local_path: local_path.to_s)
  end

  def sync_repo
    system("cd #{local_path} && git pull origin main")
    build_quartz_site
  end

  private

  def build_quartz_site
    build_path = File.join(local_path, "public")
    FileUtils.mkdir_p(build_path) unless Dir.exist?(build_path)
    system("cd #{local_path} && nvm use 20.17.0 && npm install && npm run build")
  end
end


returns:

quartz-social-blog(dev)> QuartzInstance.last.setup_quartz
  QuartzInstance Load (0.3ms)  SELECT "quartz_instances".* FROM "quartz_instances" ORDER BY "quartz_instances"."id" DESC LIMIT 1 /*application='QuartzSocialBlog'*/
sh: nvm: command not found
=> true
quartz-social-blog(dev)> 



The issue here is that `nvm` (Node Version Manager) is not available in the environment where your Rails app is executing. This usually happens because `nvm` is a shell function rather than a system-wide command. When running shell commands via `system`, the Rails process may not load the user's shell profile (e.g., `.bashrc`, `.zshrc`) where `nvm` is initialized.

### **Solutions**

#### **1. Use the full path to Node instead of `nvm`**
Since `nvm` is unavailable, you can use the absolute path to Node.js instead:

```ruby
def build_quartz_site
  build_path = File.join(local_path, "public")
  FileUtils.mkdir_p(build_path) unless Dir.exist?(build_path)

  node_path = `which node`.strip
  npm_path = `which npm`.strip

  system("cd #{local_path} && #{node_path} install && #{npm_path} run build")
end
```

This way, you ensure the system finds the correct Node.js and npm binaries.

---

#### **2. Use `nvm` explicitly in a login shell**
You can force `nvm` to be loaded by using `bash -i` (interactive shell):

```ruby
def build_quartz_site
  build_path = File.join(local_path, "public")
  FileUtils.mkdir_p(build_path) unless Dir.exist?(build_path)

  system("cd #{local_path} && bash -i -c 'nvm use 20.17.0 && npm install && npm run build'")
end
```

This will load your `.bashrc` (or `.zshrc` if using zsh), where `nvm` is initialized.

---

#### **3. Source `nvm` manually**
If `bash -i` doesn't work, try manually sourcing `nvm` before using it:

```ruby
def build_quartz_site
  build_path = File.join(local_path, "public")
  FileUtils.mkdir_p(build_path) unless Dir.exist?(build_path)

  system("cd #{local_path} && source ~/.nvm/nvm.sh && nvm use 20.17.0 && npm install && npm run build")
end
```

Make sure `~/.nvm/nvm.sh` is the correct path to your `nvm` installation.

---

#### **4. Use `nodenv` or a system-wide Node version**
If you have `nodenv` instead of `nvm`, you can use:

```ruby
def build_quartz_site
  build_path = File.join(local_path, "public")
  FileUtils.mkdir_p(build_path) unless Dir.exist?(build_path)

  system("cd #{local_path} && nodenv local 20.17.0 && npm install && npm run build")
end
```

Alternatively, just ensure you have the correct version of Node installed system-wide and remove the `nvm use 20.17.0` part.

---

### **Check if NVM is Installed Properly**
Run the following in your Rails app environment:

```sh
which nvm
```

If it returns nothing, then `nvm` is not properly loaded in the shell running your Rails processes.

---

### **Recommended Fix**
Try **solution 1 first** (direct `node` path). If that doesn’t work, go for **solution 2** (interactive shell). Let me know how it goes! 🚀

quartz-social-blog(dev)> QuartzInstance.last.setup_quartz
  QuartzInstance Load (1.0ms)  SELECT "quartz_instances".* FROM "quartz_instances" ORDER BY "quartz_instances"."id" DESC LIMIT 1 /*application='QuartzSocialBlog'*/
node:internal/modules/cjs/loader:1143
  throw err;
  ^

Error: Cannot find module '/Users/spectech/Documents/quartz-social-blog/storage/quartz/my-blog/my-blog/install'
    at Module._resolveFilename (node:internal/modules/cjs/loader:1140:15)
    at Module._load (node:internal/modules/cjs/loader:981:27)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:128:12)
    at node:internal/main/run_main_module:28:49 {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}

Node.js v18.20.4
=> true
quartz-social-blog(dev)> 

It looks like your Quartz setup script is trying to run `npm install` in the wrong directory or expecting a module that isn't there. Here’s how to debug and fix it.

---

## **1. Verify that the directory exists and contains the expected files**
Run the following command to check if the directory exists and has a `package.json`:

```sh
ls -lah /Users/spectech/Documents/quartz-social-blog/storage/quartz/my-blog/my-blog
```

If this directory does **not** exist, something went wrong with the `git clone` step. If it **does** exist but lacks a `package.json`, the repo may not contain the correct Quartz project files.

---

## **2. Check if Git Clone Worked Properly**
In your `setup_quartz` method, the `git clone` command is supposed to pull the repository. Try running:

```sh
cd /Users/spectech/Documents/quartz-social-blog/storage/quartz/my-blog
git status
```

If the folder doesn’t exist or is empty, double-check that `repo_url` is correct.

---

## **3. Fix the `build_quartz_site` Method**
It seems like `npm install` is being run incorrectly. Modify the method to ensure the correct directory is used:

### **Updated Code:**
```ruby
def build_quartz_site
  build_path = File.join(local_path, "public")
  FileUtils.mkdir_p(build_path) unless Dir.exist?(build_path)

  # Ensure we are in the correct directory
  system("cd #{local_path} && ls -lah && npm install && npm run build")
end
```

### **What This Fix Does:**
- The `ls -lah` command will list the files in the directory so you can check if `package.json` exists before running `npm install`.
- If `npm install` fails because the directory is incorrect, this will give you a clue.

---

## **4. Ensure the Correct Node Version**
The error message shows **Node.js v18.20.4**, but you are trying to use `nvm use 20.17.0`. If your project **requires Node 20**, you need to ensure it's actually available:

Run:
```sh
node -v
```
If it returns `v18.20.4`, you may need to switch to Node 20 manually:
```sh
nvm install 20.17.0
nvm use 20.17.0
```

If `nvm` still isn’t working inside Rails, replace `nvm use` in your script with:
```ruby
system("cd #{local_path} && export PATH=\"$HOME/.nvm/versions/node/v20.17.0/bin:$PATH\" && npm install && npm run build")
```
This ensures Rails uses the correct Node.js version.

---

### **Final Debugging Steps**
1. **Run Quartz manually**  
   Instead of using `setup_quartz`, try running the commands manually in the terminal:
   ```sh
   cd /Users/spectech/Documents/quartz-social-blog/storage/quartz/my-blog
   ls -lah  # Check files exist
   npm install
   npm run build
   ```
   If this works manually but fails in Rails, it’s likely an environment issue.

2. **Check logs for errors**  
   Add `&& echo 'Build successful'` to `system` commands to verify success:
   ```ruby
   system("cd #{local_path} && npm install && npm run build && echo 'Build successful'")
   ```

3. **Ensure repo URL is correct**  
   Manually clone the repo and inspect its contents:
   ```sh
   git clone <repo_url> test_quartz
   ls -lah test_quartz
   ```

---

### **Let me know what fails, and we’ll debug further! 🚀**

quartz-social-blog(dev)> QuartzInstance.last.setup_quartz
  QuartzInstance Load (0.1ms)  SELECT "quartz_instances".* FROM "quartz_instances" ORDER BY "quartz_instances"."id" DESC LIMIT 1 /*application='QuartzSocialBlog'*/
[27, 35] in ~/Documents/quartz-social-blog/app/models/quartz_instance.rb
    27|   def build_quartz_site
    28|     build_path = File.join(local_path, "public")
    29|     FileUtils.mkdir_p(build_path) unless Dir.exist?(build_path)
    30|     node_path = `which node`.strip
    31|     npm_path = `which npm`.strip
=>  32| debugger
    33|     system("cd #{local_path} && #{node_path} install && #{npm_path} run build")
    34|   end
    35| end
=>#0    QuartzInstance#build_quartz_site at ~/Documents/quartz-social-blog/app/models/quartz_instance.rb:32
  #1    QuartzInstance#setup_quartz at ~/Documents/quartz-social-blog/app/models/quartz_instance.rb:16
  # and 32 frames (use `bt' command for all frames)
(ruby) node_path
"/Users/spectech/.nvm/versions/node/v18.20.4/bin/node"
(rdbg) c    # continue command
node:internal/modules/cjs/loader:1143
  throw err;
  ^

Error: Cannot find module '/Users/spectech/Documents/quartz-social-blog/storage/quartz/my-blog/my-blog/install'
    at Module._resolveFilename (node:internal/modules/cjs/loader:1140:15)
    at Module._load (node:internal/modules/cjs/loader:981:27)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:128:12)
    at node:internal/main/run_main_module:28:49 {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}

Node.js v18.20.4
=> true
quartz-social-blog(dev)> 

Your debugger output shows that `node_path` is set to **Node.js v18.20.4**, but your code explicitly calls for `nvm use 20.17.0`. Since your system is still using Node 18, `npm install` might be failing or installing incompatible dependencies. Let's fix this step by step.

---

## **1. Verify the Correct Path for Node.js**
Before continuing, check if Node 20 is installed:

```sh
nvm install 20.17.0
nvm use 20.17.0
node -v  # Should show v20.17.0
```

If `node -v` still shows **v18.20.4**, your Rails app might not be loading `nvm` properly.

---

## **2. Fix `build_quartz_site` to Use the Correct Node Version**
Instead of relying on `nvm use`, explicitly set the correct Node.js path.

### **Updated Code:**
```ruby
def build_quartz_site
  build_path = File.join(local_path, "public")
  FileUtils.mkdir_p(build_path) unless Dir.exist?(build_path)

  node_path = "/Users/spectech/.nvm/versions/node/v20.17.0/bin/node"
  npm_path = "/Users/spectech/.nvm/versions/node/v20.17.0/bin/npm"

  system("cd #{local_path} && #{npm_path} install && #{npm_path} run build")
end
```

**Why this works:**  
- It directly uses the Node 20 binary instead of relying on `nvm use`, which isn't recognized inside Rails.

---

## **3. Verify the Correct Directory Structure**
Your error message indicates that `npm install` might be running in the wrong directory:

```
Error: Cannot find module '/Users/spectech/Documents/quartz-social-blog/storage/quartz/my-blog/my-blog/install'
```

Check what’s inside `local_path`:

```sh
ls -lah /Users/spectech/Documents/quartz-social-blog/storage/quartz/my-blog/
```

If the directory **does not contain `package.json`**, it means `git clone` might have nested the project incorrectly (e.g., `my-blog/my-blog`). You can fix this by ensuring your `repo_name` is correctly extracted in `setup_quartz`:

### **Fix `setup_quartz`:**
```ruby
def setup_quartz
  repo_name = repo_url.split("/").last.gsub(".git", "").gsub(/@.*$/, "")
  base_path = Rails.root.join("storage", "quartz", repo_name)
  self.local_path = base_path.to_s  # Avoid double nesting

  unless Dir.exist?(local_path)
    system("git clone #{repo_url} #{local_path}")
  end

  build_quartz_site
  update(local_path: local_path)
end
```

---

## **4. Manually Debug the Build Process**
Try running the steps manually:

```sh
cd /Users/spectech/Documents/quartz-social-blog/storage/quartz/my-blog/
ls -lah  # Ensure package.json exists
npm install
npm run build
```

If these commands fail, then:
- **The repo may be incorrect** → Check `repo_url`
- **`package.json` might be missing** → Check `git status`
- **Dependencies might be broken** → Try `rm -rf node_modules && npm install`

---

## **Final Steps**
1. Fix `setup_quartz` to prevent double nesting (`my-blog/my-blog` issue).
2. Hardcode the correct `node` and `npm` paths.
3. Manually verify the directory contents and run `npm install`.

Let me know what happens after these changes! 🚀

How should I render each quarts instance so it gets build and is available through the rails paywall? Am I using the right approach? Can I orchestrate those static site builds from the rails app itself?



You’re on the right track, but let's refine your approach to ensure that each Quartz instance gets built correctly and is served through your Rails paywall efficiently.  

### **1. The Right Approach: Storing and Serving Quartz Sites**  
Your goal is to:  
- Clone/build the Quartz repo for each user.  
- Store the generated static files.  
- Serve them behind a paywall in your Rails app.  
- Rebuild when changes occur.  

There are **two main approaches** to serving the static sites while keeping them behind a Rails paywall:  

### **Approach 1: Serve Built Files via Rails (`send_file`)**  
- **Pros:** Simple, works with authentication, no need for extra services.  
- **Cons:** Less performant than a dedicated web server (e.g., Nginx).  

#### **Steps**  
1. **Modify `QuartzInstance` to store built sites in `storage/quartz/{repo_name}/public`**
2. **Create a controller to serve static files**  

```ruby
class QuartzSitesController < ApplicationController
  before_action :authenticate_user!

  def show
    quartz_instance = current_user.quartz_instances.find(params[:id])
    site_path = File.join(quartz_instance.local_path, "public", params[:path] || "index.html")

    if File.exist?(site_path)
      send_file site_path, type: "text/html", disposition: "inline"
    else
      render plain: "Not Found", status: :not_found
    end
  end
end
```
3. **Modify Routes to Handle Quartz Requests**  
```ruby
Rails.application.routes.draw do
  get "/quartz/:id/*path", to: "quartz_sites#show", as: :quartz_site
end
```
4. **Access a user's Quartz site**  
   Example: `/quartz/1/index.html`

---

### **Approach 2: Proxy Requests to Nginx (Better for Performance)**
Instead of serving the files via Rails, you can have **Rails authenticate users** and then **proxy requests to an Nginx server** that serves the built Quartz sites.

#### **Steps**
1. **Store sites in `/var/www/quartz_sites/{repo_name}`**  
   Update `QuartzInstance`:
   ```ruby
   def build_quartz_site
     build_path = "/var/www/quartz_sites/#{id}"
     FileUtils.mkdir_p(build_path) unless Dir.exist?(build_path)
     system("cd #{local_path} && npm install && npm run build && mv public #{build_path}")
   end
   ```
2. **Configure Nginx to Serve Built Quartz Sites**  
   Add this to your Nginx config:
   ```
   location /quartz/ {
       internal;
       alias /var/www/quartz_sites/;
   }
   ```
3. **Modify Rails Controller to Authenticate & Proxy**  
```ruby
class QuartzSitesController < ApplicationController
  before_action :authenticate_user!

  def show
    quartz_instance = current_user.quartz_instances.find(params[:id])
    if quartz_instance
      redirect_to "/quartz/#{quartz_instance.id}/#{params[:path] || 'index.html'}"
    else
      render plain: "Not Found", status: :not_found
    end
  end
end
```

This way, Rails handles **authentication** but **Nginx serves the files**, making it much more efficient.

---

## **2. Orchestrating Builds from Rails**  
You want Quartz site builds to happen **on-demand** inside Rails. Here’s how:

### **Trigger Builds in the Background**
Instead of blocking Rails requests while running `git pull && npm run build`, use **ActiveJob** to handle builds asynchronously.

```ruby
class QuartzBuildJob < ApplicationJob
  queue_as :default

  def perform(quartz_instance_id)
    quartz_instance = QuartzInstance.find(quartz_instance_id)
    system("cd #{quartz_instance.local_path} && git pull origin main && npm install && npm run build")
  end
end
```
Then, trigger it whenever necessary:
```ruby
QuartzBuildJob.perform_later(quartz_instance.id)
```

#### **When to Trigger?**
- **On Quartz instance creation** (`after_create :setup_quartz`)
- **When user requests a manual rebuild** (button in UI)
- **On webhook from GitHub when repo changes**  

---

## **3. Handling User Authentication in Builds**  
If each Quartz site should be **user-restricted**, you have two options:

### **Option 1: Require Login for Static Pages**
- Modify Quartz templates to include **Rails authentication checks**.  
- Use **signed URLs** for each page.  

### **Option 2: Store Private Data in Rails**
- Store **metadata (e.g., blog posts, drafts) in Rails**.
- Serve static HTML, but use Rails API calls for **restricted data**.

---

## **Final Recommendation**
If you want simplicity: **Use `send_file` in Rails**.  
If you want high performance: **Use Nginx to serve Quartz sites** and Rails for auth.  
Either way, **use ActiveJob to build Quartz sites asynchronously**.

Would you like help integrating a GitHub webhook to trigger builds automatically? 🚀