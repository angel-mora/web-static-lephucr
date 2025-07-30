---
title: Integrating Jekyll into Rails
tags:
- getting
- show
- index
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  What is the best way to have a jekyll blog inside a
  rails app?"
draft: false
---

# Integrating Jekyll into Rails

## 🧠 Full Chat

🙋 **You:**

What is the best way to have a jekyll blog inside a rails app?

---

🤖 **Assistant:**

To integrate a Jekyll blog inside a Rails app, you can follow these steps:

### Step 1: Install Jekyll

First, make sure you have Jekyll installed. You can install it using:

```bash
gem install jekyll bundler
```

### Step 2: Create Your Jekyll Blog

Create a new Jekyll site:

```bash
jekyll new myblog
```

This will create a new directory named `myblog` with the basic structure of a Jekyll site.

### Step 3: Move Jekyll Files into Rails

1. **Create a Directory in Rails for Jekyll**: Inside your Rails app directory, create a directory for the Jekyll blog. You can place it in the `public` directory or any other location you prefer.

```bash
mkdir -p public/blog
```

2. **Move Jekyll Files**: Move all the files from your Jekyll site (`myblog`) into this new directory.

```bash
mv myblog/* myblog/.* public/blog
```

### Step 4: Configure Jekyll to Build into the Rails Public Directory

1. **Modify Jekyll Configuration**: Open the `_config.yml` file in your Jekyll site and set the destination to point to the `public/blog` directory:

```yaml
destination: ./public/blog
```

### Step 5: Build Jekyll Site

Build your Jekyll site to generate the static files:

```bash
jekyll build
```

### Step 6: Automate Jekyll Build with Rails

To ensure that your Jekyll site is built every time you deploy your Rails app, you can add a task to your Rails `Rakefile`.

1. **Create a Rake Task**: Open your `lib/tasks` directory in your Rails app and create a new file `jekyll.rake`.

```ruby
namespace :jekyll do
  desc "Build Jekyll site"
  task :build do
    sh "jekyll build --source ./path_to_jekyll --destination ./public/blog"
  end
end

task :deploy => "jekyll:build"
```

### Step 7: Add Jekyll Build to Deployment Process

Ensure that your deployment process runs the `jekyll:build` task. If you are using Capistrano for deployment, you can add the following to your `config/deploy.rb`:

```ruby
after 'deploy:updated', 'jekyll:build'
```

### Step 8: Access Jekyll Blog in Rails

You can now access your Jekyll blog at `http://yourdomain.com/blog`.

### Optional: Serving Jekyll as Part of Rails Routes

If you want to serve the Jekyll blog as part of your Rails routes, you can add a route in `config/routes.rb`:

```ruby
get '/blog(/*path)', to: redirect('/blog/index.html')
```

This route will redirect all `/blog/*` requests to the corresponding static files in the `public/blog` directory.

With these steps, you should have a Jekyll blog integrated into your Rails application, allowing you to manage both your Rails app and Jekyll blog together seamlessly.

---

🙋 **You:**

Can I still put it behind a devise login?

---

🤖 **Assistant:**

Yes, you can put your Jekyll blog behind a Devise login in your Rails application. To achieve this, you need to serve the Jekyll files through Rails controllers and apply Devise's authentication filters. Here's how you can do it:

### Step 1: Configure Devise

Make sure you have Devise set up and configured in your Rails application. If not, follow the [Devise installation guide](https://github.com/heartcombo/devise#getting-started).

### Step 2: Create a Controller for Serving Jekyll Pages

Create a controller that will serve the Jekyll files. For example, you can create a `BlogController`.

```bash
rails generate controller Blog show
```

### Step 3: Define Routes

In your `config/routes.rb`, define a route to handle the Jekyll blog pages:

```ruby
Rails.application.routes.draw do
  devise_for :users
  
  authenticate :user do
    get '/blog(/*path)', to: 'blog#show', as: :blog
  end

  root to: "home#index"
end
```

This will ensure that the `/blog` route and all its subpaths are protected by Devise.

### Step 4: Implement the Controller Action

In your `BlogController`, implement the `show` action to serve the Jekyll files:

```ruby
class BlogController < ApplicationController
  before_action :authenticate_user!

  def show
    path = params[:path] || 'index'
    path = "#{Rails.root}/public/blog/#{path}.html"

    if File.exist?(path)
      render file: path, layout: false, content_type: 'text/html'
    else
      render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false
    end
  end
end
```

This action will locate the requested Jekyll HTML file in the `public/blog` directory and render it. If the file does not exist, it will render a 404 error page.

### Step 5: Authenticate Devise Users

Ensure you have the `before_action :authenticate_user!` filter in your `BlogController` to protect the blog pages.

### Step 6: Testing

Start your Rails server and navigate to `/blog`. You should be prompted to log in if you're not already authenticated. After logging in, you should be able to access the Jekyll blog.

### Summary

By following these steps, you've configured your Jekyll blog to be served through Rails controllers, allowing you to leverage Devise for authentication. This way, the blog pages will be protected and only accessible to logged-in users.

---

🙋 **You:**

And how about urls that links to other parts of the rails app? How should we handle those?

---

🤖 **Assistant:**

To handle URLs that link to other parts of your Rails app from within the Jekyll blog, you need to ensure that your Jekyll blog generates the correct URLs and that Rails can properly route these requests. Here's how to manage this:

### Step 1: Use Absolute URLs in Jekyll

Ensure that your Jekyll blog uses absolute URLs for links that point to other parts of the Rails app. For example, in your Jekyll markdown or HTML files, use:

```markdown
[Link to Rails Page]({{ site.url }}/path_to_rails_page)
```

Or, if you have a base URL set in your `_config.yml`:

```yaml
url: "http://yourdomain.com"
```

Then in your Jekyll files:

```markdown
[Link to Rails Page]({{ site.url }}/path_to_rails_page)
```

### Step 2: Route Handling in Rails

Ensure that Rails routes are defined to handle these paths correctly. For example, if you have a link to a Rails page `/profile`, make sure you have a route defined for it in `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  devise_for :users
  
  authenticate :user do
    get '/blog(/*path)', to: 'blog#show', as: :blog
  end

  get '/profile', to: 'users#show'

  root to: "home#index"
end
```

### Step 3: Modify Jekyll's Base URL for Development

If you're developing locally, ensure your Jekyll blog links correctly to your local Rails server. You can set up a separate base URL in `_config.yml` for development:

```yaml
# For production
url: "http://yourdomain.com"

# For development
development:
  url: "http://localhost:3000"
```

Then, in your Jekyll files:

```markdown
[Link to Rails Page]({{ site.url }}/path_to_rails_page)
```

Jekyll will use the appropriate URL based on the environment.

### Step 4: Ensure Devise Authentication

Your `BlogController` already handles Devise authentication. If you have links in your Jekyll blog that point to authenticated sections of your Rails app, make sure those sections are properly protected by Devise.

For example, in a controller:

```ruby
class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    # User profile logic
  end
end
```

### Step 5: Navigation Consistency

If your Jekyll blog has navigation elements (like headers or footers) that link to Rails routes, ensure these links are absolute or relative to the base URL.

### Example Navigation

In a Jekyll layout file (e.g., `_layouts/default.html`):

```html
<nav>
  <ul>
    <li><a href="{{ site.url }}/blog">Blog Home</a></li>
    <li><a href="{{ site.url }}/profile">Profile</a></li>
    <li><a href="{{ site.url }}/about">About</a></li>
  </ul>
</nav>
```

### Summary

By using absolute URLs and ensuring that your Jekyll configuration aligns with your Rails routing, you can seamlessly link to other parts of your Rails app from your Jekyll blog. This approach maintains consistency in navigation and ensures that authenticated sections are properly protected.

---

🙋 **You:**

Continue

---

🤖 **Assistant:**

### Step 6: Handle Relative URLs in Jekyll

If you prefer to use relative URLs within your Jekyll blog and want them to work seamlessly with your Rails app, you can use Jekyll's built-in helpers to ensure the links are correct.

For example, you can use the `relative_url` filter in Jekyll:

```markdown
[Link to Rails Page]({{ "/path_to_rails_page" | relative_url }})
```

This filter will automatically prepend the site's base URL to the path.

### Step 7: Ensure J