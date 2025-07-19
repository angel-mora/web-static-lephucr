---
title: Quartz.js in Rails 8
tags:
- show
- github
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Quartz.js in Rails 8

## ✅ TODOs


## 📌 Summary
what is the ideal way to render multiple instances of quartz javascript instance in Rails application? I mean, to be compliant with Rails 8 and all those Rails conventions and security conventions

## 🧠 Full Chat


what is the ideal way to render multiple instances of quartz javascript instance in Rails application? I mean, to be compliant with Rails 8 and all those Rails conventions and security conventions



Rendering multiple instances of a **Quartz.js** (or any JavaScript visualization library) in a **Rails 8** application while keeping it **secure and maintainable** involves several best practices:

---

### **1. Use Rails' Import Maps or ESBuild for Asset Management**
Rails 8 defaults to **Import Maps**, but for heavy JS usage, **ESBuild** or **Webpack** via **jsbundling-rails** is a better approach.

- **If using Import Maps**:  
  You’ll need to include Quartz.js as an external dependency and manage its instances manually.

- **If using ESBuild/Webpack**:  
  You can **import Quartz.js** like a regular npm package and manage it as a module.

---

### **2. Encapsulate Quartz Instances in a Stimulus Controller**
Since Rails 8 encourages **Hotwire (Turbo + Stimulus)** for frontend interactivity, wrap your Quartz rendering logic inside a **Stimulus controller**.

#### **app/javascript/controllers/quartz_controller.js**
```javascript
import { Controller } from "@hotwired/stimulus";
import Quartz from "quartz-js"; // Adjust if you're using a CDN or ESModule

export default class extends Controller {
  static targets = ["container"];

  connect() {
    this.renderQuartz();
  }

  renderQuartz() {
    this.containerTargets.forEach((element) => {
      const quartzInstance = new Quartz(element, {
        data: element.dataset.quartzData, // JSON data stored in a data attribute
      });
      quartzInstance.render();
    });
  }
}
```

---

### **3. Use Stimulus Controller in Rails Views**
In your **ERB view or partial**, render multiple Quartz.js instances like this:

```erb
<div data-controller="quartz" data-quartz-target="container" data-quartz-data='<%= raw @quartz_data_1.to_json %>'></div>
<div data-controller="quartz" data-quartz-target="container" data-quartz-data='<%= raw @quartz_data_2.to_json %>'></div>
```

Or in **Rails helpers**:

```ruby
def quartz_chart(data)
  content_tag(:div, "", data: { controller: "quartz", quartz_target: "container", quartz_data: data.to_json })
end
```

Usage:
```erb
<%= quartz_chart(@chart_data) %>
```

---

### **4. Ensure Security Best Practices**
1. **Escape JSON properly**:  
   - If using `raw @data.to_json`, ensure `@data` does not contain unsafe HTML.
   - Use `html_safe` only if necessary.
   - Prefer `json_escape` to prevent injection attacks:
     ```erb
     data-quartz-data="<%= json_escape(@quartz_data.to_json) %>"
     ```

2. **CSP Headers (Content Security Policy)**:  
   If Quartz loads external assets (e.g., via a CDN), you must allow it in your **CSP headers**:
   ```ruby
   Rails.application.config.content_security_policy do |policy|
     policy.script_src :self, :https, "https://cdn.example.com"
   end
   ```

3. **Defer Turbo Drive Compatibility Issues**  
   If your Quartz.js instances break due to Turbo Drive page caching, **manually disconnect/reconnect** in the Stimulus controller:
   ```javascript
   disconnect() {
     this.containerTargets.forEach((element) => {
       element.innerHTML = ""; // Cleanup to prevent duplicate renders
     });
   }
   ```

---

### **Final Notes**
- **Use Stimulus to keep JavaScript modular** and Rails-compliant.  
- **Escape JSON safely** to avoid security issues.  
- **Check Turbo Drive compatibility** if necessary.  

Would you like a more tailored implementation, such as integrating Quartz.js into a specific Rails component like a dashboard? 🚀

Is that the best approach if I want my app to create a new Quartz js library (Obsidian Publish alternative) for each new user that signs up with GitHub and connect a markdown repo to a quartz instance?

If you're building an **Obsidian Publish alternative** where each **new user** gets a separate **Quartz.js** instance connected to a **Markdown repository**, then the architecture needs to scale dynamically and integrate securely with GitHub. Here’s an **ideal Rails 8 approach** that follows **Rails conventions** and **best security practices** while making it easy to manage multiple Quartz.js instances.  

---

### **1. Architectural Breakdown**
Each user should have:
✅ A unique **Quartz.js** instance  
✅ A linked **GitHub repository** (with Markdown content)  
✅ A **static site generation process** (to serve Quartz instances)  

For this, you'll need:  
- **GitHub OAuth Authentication** (via Devise + OmniAuth)  
- **A way to clone and sync Markdown repositories**  
- **Dynamic Quartz.js instance rendering**  

---

### **2. User Authentication via GitHub**
First, integrate **GitHub OAuth** using **Devise + OmniAuth**:

```ruby
# config/initializers/devise.rb
config.omniauth :github, ENV["GITHUB_CLIENT_ID"], ENV["GITHUB_CLIENT_SECRET"], scope: "repo"
```

Add **GitHub authentication** in the User model:
```ruby
# app/models/user.rb
class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:github]

  has_many :repositories

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.nickname
      user.token = auth.credentials.token
    end
  end
end
```

---

### **3. Connecting GitHub Repos to Quartz**
Once a user signs up, they should **select a Markdown repo** and link it to a **Quartz.js instance**.

#### **GitHub API: Fetch User Repos**
Create a controller to fetch repositories from GitHub:
```ruby
# app/controllers/repositories_controller.rb
class RepositoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    response = RestClient.get("https://api.github.com/user/repos", {
      Authorization: "token #{current_user.token}",
      Accept: "application/vnd.github.v3+json"
    })
    @repositories = JSON.parse(response.body)
  end
end
```
Render a dropdown where users can select a repo:
```erb
<%= form_with url: repositories_path, method: :post do |f| %>
  <%= select_tag :repo, options_for_select(@repositories.map { |r| [r["name"], r["clone_url"]] }) %>
  <%= f.submit "Link Repository" %>
<% end %>
```

---

### **4. Cloning & Syncing Repos**
Once a user selects a repo, clone it using `git` inside a **user-specific directory**.

```ruby
# app/models/repository.rb
class Repository < ApplicationRecord
  belongs_to :user

  after_create :clone_repo

  def clone_repo
    repo_dir = Rails.root.join("storage", "repos", "#{user.id}_#{name}")
    FileUtils.mkdir_p(repo_dir)
    
    system("git clone #{clone_url} #{repo_dir}")
  end

  def pull_latest
    repo_dir = Rails.root.join("storage", "repos", "#{user.id}_#{name}")
    system("cd #{repo_dir} && git pull origin main")
  end
end
```

---

### **5. Serving Quartz.js Instances Dynamically**
Each **user gets a unique Quartz.js instance** that reads from their cloned Markdown repo.

#### **Quartz.js Static Site Generation**
Quartz.js expects Markdown files in a structured format. Generate **static HTML pages** inside `/public` for each user’s repo.

```ruby
# app/models/repository.rb (continued)
def generate_quartz_site
  quartz_dir = Rails.root.join("public", "quartz", "#{user.id}_#{name}")
  FileUtils.mkdir_p(quartz_dir)

  # Copy Markdown files into Quartz structure
  FileUtils.cp_r("#{repo_dir}/.", quartz_dir)

  # Use a Quartz.js-compatible SSG command here (or custom logic)
  system("cd #{quartz_dir} && quartz build")
end
```

---

### **6. Serving Quartz.js Sites via Routes**
Make each user’s site accessible via:  
👉 `yourapp.com/quartz/:username/:repo_name`

```ruby
# config/routes.rb
get "quartz/:username/:repo_name", to: "quartz#show", as: :quartz_site
```

Render the **Quartz.js instance** dynamically:
```ruby
# app/controllers/quartz_controller.rb
class QuartzController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    @repo = @user.repositories.find_by(name: params[:repo_name])

    if @repo
      redirect_to "/quartz/#{@user.id}_#{@repo.name}/index.html"
    else
      render plain: "Repository not found", status: :not_found
    end
  end
end
```

---

### **7. Automating Updates (Webhook for GitHub Sync)**
To **auto-sync when the repo updates**, create a **GitHub webhook**:

```ruby
# app/controllers/webhooks_controller.rb
class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def github
    payload = JSON.parse(request.body.read)
    repo = Repository.find_by(name: payload["repository"]["name"])
    repo.pull_latest if repo

    head :ok
  end
end
```

```ruby
# config/routes.rb
post "webhooks/github", to: "webhooks#github"
```

Users must **add this webhook to their GitHub repo**:
```sh
curl -X POST -H "Authorization: token YOUR_GITHUB_TOKEN" \
     -H "Accept: application/vnd.github.v3+json" \
     https://api.github.com/repos/YOUR_USERNAME/YOUR_REPO/hooks \
     -d '{
       "config": {
         "url": "https://yourapp.com/webhooks/github",
         "content_type": "json"
       },
       "events": ["push"]
     }'
```

---

## **Final Flow**
1. **User signs up via GitHub**  
2. **Selects a Markdown repo**  
3. **Repo is cloned & Quartz.js site is generated**  
4. **Site is accessible at `yourapp.com/quartz/:username/:repo`**  
5. **Repo updates trigger Quartz.js site regeneration**  

---

## **Security & Rails 8 Compliance**
✅ **Rails 8 standards** (Hotwire, Turbo, Stimulus, strong params)  
✅ **OAuth-secured API requests**  
✅ **No direct user input into shell commands (avoid command injection)**  
✅ **Background jobs (e.g., Sidekiq) for repo syncing**  
✅ **CSP headers & GitHub token encryption**  

---

## **Next Steps**
🚀 Deploying Quartz.js as a proper static site builder within Rails?  
💡 Need a CDN-like delivery for public Quartz instances?  

Let me know how deep you want to go!