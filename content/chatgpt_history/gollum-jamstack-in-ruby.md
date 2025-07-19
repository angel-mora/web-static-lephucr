---
title: Gollum & Jamstack in Ruby
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Gollum & Jamstack in Ruby

## ✅ TODOs
- [ ] this, or you could simply configure Gollum to use markdown as its default markup language.
- [ ] so, consider that it should be compatible with ObsidianMD.
- [ ] this, you would need a way to map the wikilink references to their actual URL representation.

## 📌 Summary
Can I combine Gollum git-based wiki editor with jamstack philosophy in ruby? If so, how?

## 🧠 Full Chat


Can I combine Gollum git-based wiki editor with jamstack philosophy in ruby? If so, how?

Yes, it's entirely possible to combine Gollum, a Git-based wiki editor, with the Jamstack philosophy in Ruby. Gollum can store your wiki content in a Git repository, while a static site generator such as Jekyll or Middleman can build your static site (as per Jamstack philosophy) from this content.

Here is a simplified version of how this can be done:

1. **Gollum Setup**

   First, you need to set up Gollum. You would typically install Gollum on your local machine or on a server and point it at a Git repository where your wiki content will be stored.

   You can follow the official instructions [here](https://github.com/gollum/gollum) to install and configure Gollum. Basically, you'll need Ruby and a couple of Ruby gems, which you can install with commands like these:

   ```
   sudo apt-get install ruby
   gem install gollum
   ```

2. **Write Your Content**

   You can write your wiki content directly in Gollum. Gollum supports multiple markup languages, and includes a simple interface for creating and editing pages. Each time you save a page, Gollum will commit the changes to the Git repository.

3. **Export Content to Markdown**

   For this step, you will need to export your Gollum content to markdown files that your static site generator can use. You could write a script to do this, or you could simply configure Gollum to use markdown as its default markup language.

4. **Static Site Generator Setup**

   Next, you'll want to set up a static site generator such as Jekyll or Middleman. These tools will take your markdown files and generate a static website from them.

   To install Jekyll, for example, you might run:

   ```
   gem install jekyll bundler
   ```

   Then, to create a new Jekyll site, you might run:

   ```
   jekyll new my-awesome-site
   ```

   You can find more detailed instructions in the official Jekyll docs [here](https://jekyllrb.com/docs/).

5. **Build Your Site**

   Finally, you'll want to build your site. With Jekyll, this is as simple as running the following command in your site's directory:

   ```
   bundle exec jekyll build
   ```

   This will create a `_site` directory with your static website. You can then deploy this directory to your hosting provider.

6. **Automate The Process**

   To truly follow the Jamstack philosophy, you might want to automate this process. You could use a CI/CD pipeline that will automatically rebuild your site whenever new commits are pushed to your Git repository. Tools like GitHub Actions, GitLab CI, or Jenkins can be used to create this kind of pipeline.

Remember, Gollum is great for small teams or personal projects, but it might not scale well to larger projects or teams. If you find that you need more features or flexibility, you might want to consider using a more fully-featured CMS or wiki system. But for simple, Git-based wikis, Gollum should work perfectly well.

I want to create a rails app for this purpose, providing the service of managing and publishing your git wikis. Give me a code tutorial to do so, consider that it should be compatible with ObsidianMD.

Creating a Rails application to manage and publish Git-based wikis is quite a big task, so let's break it down into smaller steps. The outline of the app would look something like this:

1. User Authentication
2. Git Repository Management
3. Markdown File Management
4. Markdown Rendering
5. Wiki Publishing

Below is a high-level guide on how to implement these features. However, please note that implementing a full application is beyond the scope of this conversation, and you should have a good understanding of Ruby on Rails development to follow along.

Before we start, make sure you have Rails installed by running `rails -v` in your terminal. If not, install it with `gem install rails`.

**1. User Authentication**

We will use Devise for user authentication.

Add this to your Gemfile and run `bundle install`:

```ruby
gem 'devise'
```

Install Devise:

```bash
rails generate devise:install
```

Create a User model:

```bash
rails generate devise User
```

**2. Git Repository Management**

We will use Rugged, a Ruby bindings to the libgit2 library, to interact with Git repositories.

Add this to your Gemfile:

```ruby
gem 'rugged'
```

Create a model for repositories:

```bash
rails generate model Repository name:string url:string user:references
```

**3. Markdown File Management**

We need a way to read and write Markdown files in the Git repositories.

You could use Ruby's built-in File class for this:

```ruby
File.read('path/to/your/file.md')
File.write('path/to/your/file.md', 'Your new content')
```

**4. Markdown Rendering**

Rendering markdown can be done using the Redcarpet gem.

Add this to your Gemfile:

```ruby
gem 'redcarpet'
```

Here's how you can use it to render markdown:

```ruby
markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
html = markdown.render(your_markdown_text)
```

**5. Wiki Publishing**

For the publishing part, you need a static site generator. Jekyll is a great choice and it's built in Ruby. You will need to create a Jekyll site from your Rails application, commit and push changes to the repository. 

Here's a very basic example of how you might do this:

```ruby
# create a new Jekyll site
`jekyll new my-wiki`

# navigate to the new directory
Dir.chdir('my-wiki') do
  # write a new file with Jekyll front matter and your content
  File.write('_posts/2023-06-22-my-wiki-page.md', "---\ntitle: My Wiki Page\n---\n#{your_markdown_content}")

  # add the new file to the git repository
  `git add .`

  # commit the changes
  `git commit -m 'Added a new wiki page'`

  # push the changes to the remote repository
  `git push origin master`
end
```

**Obsidian Compatibility**

Obsidian uses regular markdown files, so you should be able to use your Rails application with Obsidian without too much trouble. The main thing you need to ensure is that your Rails application is reading and writing files in a location that Obsidian is able to access.

**Conclusion**

Building a Rails application to manage and publish Git-based wikis is a significant task that involves several different components. The guide above should give you a good starting point, but you'll likely need to modify and expand on it to meet your specific needs. Good luck with your project!

How can I transform markdown with [[wikilinks]] to html in ruby?

If you are rendering Markdown to HTML and want to support `[[wikilinks]]`, one of the easiest ways is to pre-process your markdown, replacing wikilinks with markdown links, before passing it to your markdown renderer. To do this, you would need a way to map the wikilink references to their actual URL representation.

Here's an example of how you can do this in Ruby:

```ruby
require 'redcarpet'

def render_markdown_with_wikilinks(text)
  # Pre-process wikilinks
  processed = text.gsub(/\[\[(.*?)\]\]/) do |match|
    # Separate the link text and the link target
    link_text, link_target = $1.split('|', 2).reverse

    # Use the same text for the link target if it's not specified
    link_target ||= link_text

    # Convert the link target to a URL-friendly format
    link_target = link_target.downcase.gsub(/\s+/, '-')

    # Return the Markdown link
    "[#{link_text}](#{link_target})"
  end

  # Render the processed Markdown
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
  html = markdown.render(processed)

  return html
end

# Test the function
markdown = 'Hello, this is a [[wikilink]] and this is a [[wikilink|link with custom text]].'
html = render_markdown_with_wikilinks(markdown)

puts html
```

In this code, the `gsub` method is used to find all `[[wikilinks]]` and replace them with Markdown links. The `gsub` method is passed a block, which is executed for each match found in the text. The block separates the link text and the link target, converts the link target to a URL-friendly format, and returns a Markdown link.

The processed text is then passed to the `Redcarpet::Markdown` renderer as usual.

Please note that the URL conversion in this example is very basic and might not work correctly for all wikilinks. You might need to expand it to handle special characters, Unicode, etc.

Easiest markdown to html in ruby

The easiest way to convert Markdown to HTML in Ruby is by using the `redcarpet` gem, which is a fast, safe and extensible Markdown to (X)HTML converter.

First, add `redcarpet` to your `Gemfile`:

```ruby
gem 'redcarpet'
```

Then run `bundle install` to install the gem.

Afterwards, you can use the following code to convert Markdown to HTML:

```ruby
require 'redcarpet'

markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
html = markdown.render(your_markdown_text)
```

In the above code:

- `Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)` creates a new Markdown renderer. `autolink: true` means it will automatically convert URLs into links, and `tables: true` means it will support GFM-style tables.

- `markdown.render(your_markdown_text)` converts your markdown text to HTML.

Remember to replace `your_markdown_text` with the actual Markdown content you want to convert.