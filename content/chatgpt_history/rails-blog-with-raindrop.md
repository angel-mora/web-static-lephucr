---
title: Rails Blog with Raindrop
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Best approach to build a rails blog that will potentially
  pull from raindrop but should be able to handle obsidian compatible markdown"
draft: false
---

# Rails Blog with Raindrop

## 🧠 Full Chat

🙋 **You:**

Best approach to build a rails blog that will potentially pull from raindrop but should be able to handle obsidian compatible markdown

---

🤖 **Assistant:**

User is interested in building a Rails blog that will potentially pull content from Raindrop and handle Obsidian-compatible Markdown.

---

**Tool:**

Model set context updated.

---

🤖 **Assistant:**

To build a Rails blog that pulls content from Raindrop and handles Obsidian-compatible Markdown, you can follow this approach:

### 1. **Set Up Your Rails Blog**
   - Start by creating a new Rails app if you haven't already. Use `rails new your_blog_name` to get started.
   - Add essential gems for blogging:
     - `devise` for authentication (optional, if you want to have user accounts).
     - `friendly_id` for readable URLs.
     - `acts_as_taggable_on` for tagging functionality.

### 2. **Pull Content from Raindrop**
   - **Raindrop API Integration**:
     - Create a Raindrop API token via their developer portal.
     - Use `HTTParty` or `Faraday` gems to connect to the Raindrop API and pull bookmark data.
     - Store relevant metadata (e.g., title, description, URL) in your Rails models (e.g., a `Bookmark` model).

   - **Background Jobs**:
     - Use `sidekiq` or `delayed_job` to schedule background tasks for syncing bookmarks from Raindrop periodically.

### 3. **Handle Obsidian-Compatible Markdown**
   - **Markdown Parsing**:
     - Add the `redcarpet` or `kramdown` gem to your Gemfile to handle Markdown rendering.
     - Implement a custom renderer for any Obsidian-specific syntax if needed (e.g., handling internal links or custom embeds).

   - **File Attachments**:
     - If your Obsidian markdown files include attachments (like images), use `active_storage` to manage file uploads and associations.

   - **Syntax Highlighting**:
     - Use `rouge` or a similar gem to provide syntax highlighting in code blocks within your Markdown content.

### 4. **Database Design**
   - Design models to accommodate the imported content:
     - `Post` model for blog entries.
     - `Bookmark` model to store Raindrop entries.
     - Relationships between `Post` and `Bookmark` models if needed.

### 5. **Obsidian Integration**
   - **Markdown Export/Import**:
     - Allow exporting posts in Markdown format compatible with Obsidian for easy note-taking and linking.
     - If you plan to import Obsidian notes, ensure your Rails app can parse and store Obsidian-specific metadata.

### 6. **User Interface**
   - Build a simple and clean UI using `Tailwind CSS` or `Bootstrap` for responsive design.
   - Use JavaScript libraries like `turbo` (from Hotwire) for a smoother experience when navigating between posts.

### 7. **Deploy and Maintain**
   - Consider deploying on a platform like Heroku, Render, or Fly.io.
   - Use version control (Git) to manage changes and deployments.

### 8. **Extend and Customize**
   - Add features like full-text search using `pg_search`.
   - Integrate comments, likes, or share buttons if you want social engagement.

This setup will allow you to create a robust blog that integrates Raindrop content and maintains compatibility with Obsidian's Markdown.

---

🙋 **You:**

Consider options like this article and golem to handle the article as a git repo

https://dev.to/stripe/rendering-markdown-with-markdoc-in-rails-3bp0

---

🤖 **Assistant:**

User is considering using options like handling the article as a Git repo, including using tools like Markdoc, as mentioned in the Stripe article on Dev.to, and Golem for rendering Markdown in Rails.

---

**Tool:**

Model set context updated.

---

🤖 **Assistant:**

To integrate options like handling articles as a Git repository, along with tools like Markdoc and Golem for rendering Markdown, here's an enhanced approach for your Rails blog:

### 1. **Handling Articles as a Git Repository**
   - **Golem Integration**:
     - Golem is a Ruby tool for generating static sites with content stored in Git repositories. You can use Golem to handle content versioning and edits through Git, and then render the content dynamically within your Rails app.
     - To integrate, create a system where posts are stored in a Git repository. This can be done by setting up a local Git repo within your Rails app or using a remote Git service like GitHub or GitLab.
     - Use a background job (e.g., Sidekiq) to sync the Git repository at regular intervals or on-demand.
     - When rendering a post, pull the latest version of the Markdown file from the repository.

   - **Git Versioning**:
     - Enable version control on posts by storing them as Markdown files in a Git repository.
     - Allow users (or yourself) to edit these files directly through the Rails admin interface or by pushing updates via Git.
     - Use `git` commands within your Rails app to handle commits, branches, and rollbacks.

### 2. **Rendering Markdown with Markdoc**
   - **Markdoc Integration**:
     - Markdoc is a powerful Markdown-based document format that allows for custom components and structured content, making it a good fit for a more sophisticated blog system.
     - Install Markdoc by adding it to your Gemfile.
     - Configure Markdoc to render your Markdown files within your Rails views. This could include custom components, such as callouts or interactive elements, that Markdoc supports.

   - **Custom Components**:
     - Define custom components in Markdoc that cater to your specific content needs, such as embedding Raindrop links or formatting Obsidian-like internal links.
     - Ensure that Markdoc’s components and syntax are fully compatible with the way you intend to use Markdown files in Obsidian, minimizing friction when importing/exporting content.

### 3. **Combining Golem with Markdoc**
   - **Unified Workflow**:
     - Use Golem to manage the static content in your Git repo, while Markdoc handles the rendering.
     - Golem will generate the structure of your blog (like headers, footers, and navigation) while Markdoc renders the dynamic content within this structure.
     - This setup allows you to keep the content under version control while still benefiting from advanced Markdown rendering.

### 4. **Database and Git Integration**
   - **Hybrid Model**:
     - Store metadata and critical information (e.g., tags, categories, publication status) in your Rails database, while the actual content is managed in Git.
     - This way, you can combine the benefits of a dynamic Rails app (search, filters, user interactions) with the stability and version control of Git for your articles.

### 5. **CI/CD and Deployment**
   - **Automated Deployment**:
     - Set up a continuous integration/continuous deployment (CI/CD) pipeline to automatically deploy changes from your Git repository to your production server.
     - Use Git hooks to trigger content refreshes or background jobs within your Rails app whenever new commits are pushed.

### 6. **User Interface and Workflow**
   - **Markdown Editing**:
     - Allow Markdown editing directly within the Rails admin interface, with the ability to commit changes to the Git repository.
     - Alternatively, provide a simple workflow where users can edit posts locally in Obsidian, push to the Git repo, and see those changes reflected on the blog.

This setup not only enhances the flexibility and robustness of your blog but also allows you to maintain a structured and version-controlled content system with advanced Markdown rendering.

---

🙋 **You:**

So tell me the technical gems we will be using and how you plan to address the obsidian compatible markdown rendering. Are you using a parser just within the app or it will enable internal links within the rails app?

---

🤖 **Assistant:**

### Technical Gems to Use

1. **Rails Essentials**
   - `rails` - Framework to build the blog.
   - `pg` or `mysql2` - For database management.

2. **Markdown Handling**
   - **Markdoc**:
     - `markdoc-ruby` - For rendering advanced Markdown with custom components, following the approach in the Stripe article.

   - **Golem**:
     - `golem` - To handle static content as Git-managed Markdown files.

   - **Markdown Parsers**:
     - `redcarpet` or `kramdown` - For rendering Markdown if you need a simpler parser alongside Markdoc.

3. **Git Integration**
   - `rugged` or `git` - For Git operations within your Rails app, allowing for content versioning and syncing with the Git repository.

4. **Background Jobs**
   - `sidekiq` or `delayed_job` - To handle background syncing of content from Git or Raindrop.

5. **Database Enhancements**
   - `acts_as_taggable_on` - For tagging system in posts.
   - `friendly_id` - For user-friendly URLs.

6. **Authentication (Optional)**
   - `devise` - For user authentication if you need it.

7. **Miscellaneous**
   - `carrierwave` or `active_storage` - For handling attachments (if your Markdown includes images).
   - `searchkick` or `pg_search` - For implementing full-text search within your content.

### Addressing Obsidian-Compatible Markdown Rendering

**1. Handling Obsidian-Compatible Markdown**
   - **Internal Links**:
     - Obsidian uses `[[internal link]]` syntax for linking to other notes or files. This needs to be properly rendered within your Rails app.
     - **Custom Markdoc Components**: Create a custom component in Markdoc that identifies `[[internal link]]` syntax and translates it into an internal link within your Rails app. For example, `[[Post Title]]` could be translated into a Rails route like `/posts/post-title`.
     - **Parser Adjustments**: If using a simpler parser like Redcarpet, extend its functionality to recognize `[[ ]]` syntax and convert it into a link that navigates to the corresponding post in the Rails app.

**2. Storing Internal Links**
   - Internal links should be stored in a way that they map directly to routes in your Rails app. You can:
     - **Slug Matching**: Ensure that post slugs or titles match the `[[Post Title]]` format so that the link redirects appropriately.
     - **Database Lookups**: When rendering, perform a lookup for each `[[ ]]` link to match it with the correct database record.

**3. Using the Parser**
   - The Markdown parser will be embedded within the app and configured to handle Obsidian-specific syntax:
     - **Pre-processing**: Before rendering the Markdown, perform pre-processing to convert or map Obsidian-specific links into a format compatible with Rails.
     - **Post-processing**: After rendering, ensure any custom elements like internal links are correctly linked to routes within the app.

**4. Rendering**
   - **Live Previews**: If users are editing content within the Rails app, offer live previews that correctly render Obsidian-compatible Markdown, including internal links.
   - **Export/Import Compatibility**: Maintain compatibility when importing/exporting Markdown to/from Obsidian, ensuring that internal links and metadata are preserved.

This setup ensures that your blog fully supports Obsidian’s Markdown features, particularly the internal linking, while also taking advantage of version control with Git and advanced Markdown rendering with Markdoc.

---

🙋 **You:**

How about keeping it backend and using obsidiosaurus GitHub repo? Browse

---

🤖 **Assistant:**

Using the **Obsidiosaurus** tool could be a solid backend approach for your Rails blog project that needs to handle Obsidian-compatible Markdown. Obsidiosaurus acts as a converter that bridges Obsidian's unique Markdown syntax with the Docusaurus static site generator. While still in development, it supports a wide range of Markdown features—like links, tables, code blocks, and images—making it well-suited for integrating complex notes directly into your Rails app.

### Key Technical Considerations:
- **Markdown Parsing:** Obsidiosaurus can parse Obsidian-specific Markdown directly, which will allow your Rails app to render Obsidian notes correctly, including internal links, tables, and diagrams.
- **Asset Handling:** It supports various file types and media, such as images (including themed images for light/dark mode) and PDFs, which should be useful for maintaining the aesthetic consistency of your blog.
- **Advanced Features:** The project does not support some advanced features like MDX or Docusaurus tabs, but its existing support for elements like admonitions and diagrams could be leveraged to create a rich content experience.

### Integration Approach:
- **Git Backend:** You can use Obsidiosaurus in conjunction with a Git-based backend to track changes to your notes. The notes can be automatically converted and rendered using Obsidiosaurus each time they are updated in the Git repository, ensuring that the latest version is always live on your Rails blog.
- **Rendering Markdown:** The app would handle the Markdown rendering on the backend, translating Obsidian-specific syntax into HTML that Docusaurus can understand. This approach keeps the process streamlined and avoids the need for heavy client-side processing.

Using Obsidiosaurus offers a robust solution for your needs, ensuring that your Rails blog will fully support the features and flexibility of Obsidian while still being easy to maintain.

For more details on Obsidiosaurus, you can check the [official documentation](https://cimsta.github.io/obsidiosaurus-docs/docs/main/Introduction)【21†source】.

---

🙋 **You:**

Explain implementation

---

🤖 **Assistant:**

To implement a Rails blog that uses Obsidiosaurus to handle Obsidian-compatible Markdown, you can follow these steps:

### 1. **Set Up Your Rails Application**
   - Start by creating a new Rails app if you don't already have one:
     ```bash
     rails new my_blog
     ```
   - Set up your database and basic models for `Post`, `Category`, and `Tag` (if needed). The `Post` model will store metadata and references to Markdown files stored in a Git repository.

### 2. **Integrate Git for Content Management**
   - **Set Up Git Repository**: 
     - Store your Markdown files (converted Obsidian notes) in a dedicated Git repository. You can use either a local Git repo or host it on GitHub/GitLab.
   - **Git Integration**:
     - Use a gem like `rugged` to interact with the Git repository from your Rails app. This allows you to pull the latest changes from the repository and ensure that your Rails app always has the most up-to-date content.
     - Schedule regular sync jobs using `sidekiq` or `delayed_job` to update content from the Git repository.

### 3. **Integrate Obsidiosaurus**
   - **Install Obsidiosaurus**:
     - Follow the [installation guide](https://cimsta.github.io/obsidiosaurus-docs/docs/main/Introduction) to set up Obsidiosaurus. Since it's in an early development stage, ensure that you are using a compatible environment (e.g., Node.js) to run Obsidiosaurus.
     - Obsidiosaurus will convert Obsidian-specific Markdown into a format that can be rendered by Docusaurus or another compatible tool. This process will also handle internal links, special embeds, and other Obsidian-specific features.

   - **Connect Obsidiosaurus to Rails**:
     - Set up a script or a Rails service object that invokes Obsidiosaurus to convert Markdown files to HTML or Docusaurus-compatible Markdown. This could be triggered on new commits to the Git repository or periodically via a scheduled job.

### 4. **Render Markdown in Rails**
   - **Store Rendered HTML**:
     - After Obsidiosaurus processes the Markdown, store the rendered HTML in your database or serve it directly in views.
   - **Customize Rendering**:
     - If necessary, extend the rendering process to handle any custom Markdown syntax or Obsidian plugins you use. This might involve additional parsing or post-processing steps in Rails.

### 5. **Frontend Integration**
   - **View Templates**:
     - Use Rails views to render the HTML content processed by Obsidiosaurus. Ensure that the front-end design accommodates the Markdown features like internal links, images, and custom components.
   - **Live Preview (Optional)**:
     - Implement a live preview feature in your admin interface to show how the content will look after being processed by Obsidiosaurus.

### 6. **Deploy and Automate**
   - **CI/CD Pipeline**:
     - Set up a CI/CD pipeline to automate deployment and ensure that content updates are automatically deployed whenever the Git repository is updated.
   - **Backup and Monitoring**:
     - Implement backup strategies for your Git repository and monitor the integration to handle any issues that arise, such as rendering errors or syncing issues.

### 7. **Optional Enhancements**
   - **Obsidian Note Import/Export**:
     - Allow users to export their blog posts back into Obsidian-compatible Markdown files for local editing, and then re-import them into the Rails app.
   - **Search and Metadata**:
     - Implement full-text search using `pg_search` and ensure that metadata (e.g., tags, categories) is indexed and searchable.

By using Obsidiosaurus in this setup, your Rails blog will fully support the intricacies of Obsidian Markdown, including internal links and advanced formatting, while leveraging Git for content versioning and collaboration【21†source】.