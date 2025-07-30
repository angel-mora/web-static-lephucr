---
title: JS Wiki Alternatives
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  things like gollum but for javascript"
draft: false
---

# JS Wiki Alternatives

## 🧠 Full Chat

🙋 **You:**

things like gollum but for javascript

---

🤖 **Assistant:**

If you're looking for **tools similar to Gollum** (a Git-based wiki written in Ruby) but built with **JavaScript**, here are some modern alternatives you can explore:

---

### 1. **Wiki.js**
- **Overview**: A robust, open-source, and modern wiki engine built with Node.js.
- **Git Integration**: Supports storing content in Git repositories, similar to Gollum.
- **Features**:
  - Markdown, HTML, and WYSIWYG editing.
  - Authentication support (LDAP, OAuth, etc.).
  - Customizable themes and multilingual support.
- **Tech Stack**: Node.js, Vue.js
- **Website**: [https://js.wiki](https://js.wiki)

---

### 2. **GitBook**
- **Overview**: A collaborative documentation platform with Git-based workflows.
- **Git Integration**: Content versioning via Git.
- **Features**:
  - Markdown-based content editing.
  - Team collaboration tools.
  - Simple API documentation integration.
- **Tech Stack**: Node.js, React
- **Website**: [https://www.gitbook.com](https://www.gitbook.com)

---

### 3. **Hedgedoc**
- **Overview**: An open-source, collaborative Markdown editor similar to Etherpad.
- **Git Integration**: Supports saving documents into Git workflows.
- **Features**:
  - Real-time collaboration.
  - LaTeX support for technical documentation.
- **Tech Stack**: Node.js, Express, and Socket.IO
- **Website**: [https://hedgedoc.org](https://hedgedoc.org)

---

### 4. **MkDocs + MkDocs Material**
- **Overview**: A static site generator tailored for project documentation.
- **Git Integration**: Markdown content stored and versioned in Git.
- **JavaScript Compatibility**: While it primarily uses Python, it generates static HTML sites, and custom JavaScript can be added.
- **Features**:
  - Fast, static rendering of Markdown files.
  - Material design themes.
- **Website**: [https://www.mkdocs.org](https://www.mkdocs.org)

---

### 5. **Docusaurus**
- **Overview**: A static site generator for documentation websites.
- **Git Integration**: Designed to work seamlessly with Git and Markdown.
- **Features**:
  - React-based with strong customizability.
  - Optimized for developer documentation.
- **Tech Stack**: React, Node.js
- **Website**: [https://docusaurus.io](https://docusaurus.io)

---

### 6. **Codex Wiki**
- **Overview**: A lightweight, Markdown-based wiki powered by Node.js.
- **Features**:
  - Fast and minimalistic.
  - Easy Git-based collaboration.
- **Tech Stack**: Node.js, Markdown
- **GitHub Repo**: [Codex Wiki](https://github.com/codex-team/codex.wiki)

---

### 7. **Jekyll with JavaScript Framework**
- While Jekyll itself is Ruby-based, you can pair it with a JavaScript-based frontend like React or Vue.js to render Git-backed Markdown files dynamically.

---

### 8. **VuePress**
- **Overview**: A static site generator powered by Vue.js.
- **Git Integration**: Directly supports Markdown stored in Git repositories.
- **Features**:
  - Lightweight and fast.
  - Built for documentation sites.
- **Website**: [https://vuepress.vuejs.org](https://vuepress.vuejs.org)

---

### Summary Table

| **Tool**         | **Core Tech**     | **Git Integration** | **Best For**                      |
|------------------|-------------------|---------------------|----------------------------------|
| Wiki.js          | Node.js + Vue.js  | Yes                 | Modern wikis with authentication |
| GitBook          | Node.js + React   | Yes                 | Team-based documentation         |
| Hedgedoc         | Node.js + Express | Yes                 | Real-time Markdown collaboration |
| MkDocs           | Python + JS       | Yes                 | Static documentation             |
| Docusaurus       | React + Node.js   | Yes                 | Dev-focused documentation        |
| Codex Wiki       | Node.js           | Yes                 | Lightweight Markdown wikis       |
| VuePress         | Vue.js            | Yes                 | Static Vue-based docs            |

If you want full **JavaScript-based customization** with **Git-backed Markdown content**, **Wiki.js** or **Docusaurus** are excellent options.

---

🙋 **You:**

any of them have support for wikilinks and can show wikilink graphs like in obsidian?

---

🤖 **Assistant:**

Yes, **Wiki.js** and **Docusaurus** have some degree of support for **Wikilinks** and graph visualizations, though it may require plugins or additional configurations. If you want functionality similar to **Obsidian**'s graph view and Wikilink handling, here are the top options:

---

## 1. **Obsidian Publish (Closest to Obsidian)**
- **Overview**: While not open-source, **Obsidian Publish** is a paid, hosted service that lets you publish your Obsidian vault (supports wikilinks, graphs, etc.).
- **Graph View**: Exactly like Obsidian's graph view.
- **Wikilinks**: Full support for Obsidian-style `[[wikilinks]]`.
- **Customization**: Can customize appearance and links through CSS.

**Why Consider**: If you need seamless **Obsidian functionality** online without rebuilding it, this is the best.

- **Website**: [https://obsidian.md/publish](https://obsidian.md/publish)

---

## 2. **Docusaurus + Wikilink Plugin**
- **Wikilink Support**: You can extend Docusaurus with a Markdown plugin to parse and resolve `[[wikilinks]]`.
   - Example: `remark-wiki-link` (or custom MDX plugins).
- **Graph Visualization**: You can integrate **Obsidian-like graph views** using:
   - **Graphlib** or **Cytoscape.js** for dynamic, interactive graph views.
   - Use **markdown-it** parsers to connect pages and visualize links.

**How**:
1. Use the `remark-wiki-link` plugin to parse and render wikilinks.
2. Use Cytoscape.js or similar libraries to render the graph visualization.

**Why Consider**: Highly customizable, modern, React-based framework.

- **Website**: [https://docusaurus.io](https://docusaurus.io)

---

## 3. **Wiki.js + Wikilink Support**
- **Wikilink Support**: Built-in **Markdown** rendering does not natively support `[[wikilinks]]`. You can:
   - Extend it with a **custom parser** or JavaScript plugin.
   - Convert wikilinks to standard Markdown `[Link](page.md)`.
- **Graph View**: You can integrate graph libraries like **Graphviz** or **Cytoscape.js** to render relationships visually.

**Why Consider**: Flexible and powerful for self-hosted setups.

- **Website**: [https://js.wiki](https://js.wiki)

---

## 4. **Foam (VSCode-Based Obsidian Alternative)**
- **Overview**: Foam is an open-source second-brain tool that works in VSCode and supports:
   - Full **Obsidian-like Wikilinks** (`[[link]]`).
   - Markdown note graph visualizations.
- **Graph View**: Built-in graph visualization via extensions like **Graph Visualizer**.
- **Git Integration**: All content is Git-backed.

**Why Consider**: Foam integrates deeply into VSCode and is ideal for local workflows.

- **Website**: [https://foambubble.github.io](https://foambubble.github.io)

---

## 5. **Quartz (Hugo-Based Static Site with Graphs)**
- **Overview**: A Hugo-based static site generator specifically for digital gardens.
- **Features**:
   - Supports `[[wikilinks]]` out-of-the-box.
   - Includes **interactive graph views** similar to Obsidian's graph feature.
   - Fast, Git-backed, and Markdown-based.
- **Graph View**: Visualize content relationships natively.

**Why Consider**: Quartz is tailored for **digital garden enthusiasts** and mirrors Obsidian functionality online.

- **GitHub**: [Quartz Repo](https://github.com/jackyzha0/quartz)

---

### Summary of Options

| **Tool**         | **Wikilink Support** | **Graph Visualization**         | **Best For**                           |
|------------------|----------------------|---------------------------------|---------------------------------------|
| **Obsidian Publish** | Full                | Obsidian-like graph view         | Seamless, hosted Obsidian functionality |
| **Docusaurus**   | Plugin-based         | Extendable via Cytoscape.js     | Dev-focused, highly customizable      |
| **Wiki.js**      | Custom extensions    | Extendable with graph libraries | Modern, self-hosted wikis             |
| **Foam**         | Full (native)        | Graph view in VSCode            | Local Markdown wikis (VSCode users)   |
| **Quartz**       | Full (native)        | Built-in graph visualizations   | Digital gardens, static sites         |

---

### Recommendation for Obsidian-Like Features
1. **Quartz**: For quick setup with `[[wikilinks]]` and built-in graph views.
2. **Docusaurus + Cytoscape.js**: For full control and customization.
3. **Foam**: If you prefer VSCode for note-taking and development.

Would you like help setting up one of these options or integrating plugins for a specific platform?

---

🙋 **You:**

are all of those open source libraries in js ecosystem?

---

🤖 **Assistant:**

Here is a breakdown of the tools I mentioned and their **open-source status** within the **JavaScript ecosystem**:

---

### **Open-Source Libraries in the JS Ecosystem**

| **Tool**             | **Open Source** | **Core Tech**          | **Details**                                                                          |
|-----------------------|-----------------|------------------------|-------------------------------------------------------------------------------------|
| **Obsidian Publish**  | ❌ (Proprietary)| Electron (Obsidian)    | Not open-source. Paid, hosted service for publishing Obsidian vaults.               |
| **Docusaurus**        | ✅ (Open Source)| Node.js + React        | Full open-source framework for documentation with plugin support.                   |
| **Wiki.js**           | ✅ (Open Source)| Node.js + Vue.js       | Fully open-source, extensible wiki engine for modern wikis.                         |
| **Foam**              | ✅ (Open Source)| Node.js (VSCode-based) | Open-source, Git-backed tool for Markdown-based wikis with graph views.             |
| **Quartz**            | ✅ (Open Source)| Hugo + JS Extensions   | Open-source digital garden framework with graph visualizations and Wikilink support.|
| **remark-wiki-link**  | ✅ (Open Source)| Node.js (remark plugin)| Parses `[[wikilinks]]` in Markdown. Ideal for extending tools like Docusaurus.      |
| **Cytoscape.js**      | ✅ (Open Source)| Node.js (Graph Library)| Powerful open-source JS library for interactive graph visualizations.               |

---

### Open-Source Highlights

1. **Docusaurus**  
   - Fully open-source (MIT License).  
   - Highly extensible with plugins like `remark-wiki-link` for Wikilink support.  
   - Graph libraries like **Cytoscape.js** or **Graphlib** can be integrated.

2. **Wiki.js**  
   - Fully open-source (AGPL License).  
   - Markdown-based but requires extensions for Wikilinks and graphs.  

3. **Foam**  
   - Open-source (MIT License).  
   - Integrates seamlessly into VSCode.  
   - Extensions provide **Obsidian-like graph views**.

4. **Quartz**  
   - Open-source (MIT License).  
   - Includes built-in graph visualizations and Wikilink support for static sites.

5. **Graph Libraries** (for Custom Solutions):  
   - **Cytoscape.js**: Open-source, interactive graph visualizations.  
   - **Graphlib**: JavaScript library for graph manipulation and rendering.

---

### Summary of Fully Open-Source Options in the JS Ecosystem:
1. **Docusaurus** with `remark-wiki-link` and **Cytoscape.js** for graphs.  
2. **Wiki.js** with custom plugins/extensions for Wikilinks and graph support.  
3. **Foam** for a VSCode-based experience (ideal for developers).  
4. **Quartz** for a Hugo/JS-powered static site with Wikilinks and graph views.  
5. **Cytoscape.js** for building custom Obsidian-like graph visualizations.

If you want a highly customizable, JavaScript-native setup, I recommend **Docusaurus** or **Wiki.js** with graph libraries like **Cytoscape.js**. Let me know if you'd like help configuring these tools! 🚀

---

🙋 **You:**

so if I want to be able to also edit through a web url my git-based cms, is gollum my best option?? Provide the best comprehensive alternatives you can

---

🤖 **Assistant:**

If you want a **Git-based CMS** that allows you to **edit content through a web URL** (similar to Gollum), while maintaining **modern flexibility**, here’s a comprehensive list of alternatives:

---

### 1. **Gollum**
- **Overview**: A **Git-based wiki** that provides a simple web interface to edit Markdown and other formats.
- **Core Features**:
   - Built-in editing through a browser.
   - Git-backed version control.
   - Supports Markdown, Textile, MediaWiki markup, and others.
   - Lightweight and self-hosted.
- **Tech Stack**: Ruby.
- **Strengths**:
   - Easy to set up and works out-of-the-box.
   - Pure Git integration with instant web-based editing.
- **Limitations**:
   - Lacks modern UI/UX features.
   - Not as extensible as some alternatives.

**Best For**: Simple Git-based wikis where Markdown editing through the browser is critical.

---

### 2. **Wiki.js** ⭐ (Top Gollum Alternative)
- **Overview**: A modern **Git-backed wiki** that allows editing through a beautiful **web-based interface**.
- **Core Features**:
   - Git integration for version control.
   - Modern Markdown editor with live preview.
   - Full-featured authentication (SSO, OAuth, LDAP).
   - Supports custom themes, search, and media embedding.
- **Tech Stack**: Node.js + Vue.js.
- **Strengths**:
   - Sleek, modern UI with robust web-based editing.
   - Highly customizable and extensible.
   - Supports multiple backends (Git, local filesystem, databases).
- **Limitations**:
   - Setup may be slightly more complex than Gollum.
   - Requires Node.js hosting.

**Best For**: Users wanting a modern web-editable, Git-backed CMS/wiki with powerful features.

---

### 3. **Netlify CMS** (Git-Based Headless CMS)
- **Overview**: A **headless CMS** that works directly with Git repositories to edit Markdown files.
- **Core Features**:
   - Web-based content editing (through a clean admin UI).
   - Git integration: saves changes directly to your repository.
   - Supports Markdown, YAML, and JSON formats.
   - Works with static site generators like Jekyll, Hugo, and Gatsby.
- **Tech Stack**: React + Git + Static Site Generators.
- **Strengths**:
   - Excellent for managing static sites or blogs.
   - Easy-to-use UI for non-technical users.
- **Limitations**:
   - Requires configuration for the static site generator.
   - Doesn't natively provide "wiki-like" structure.

**Best For**: A modern Git-based CMS for editing Markdown content through the web, especially for blogs and static sites.

---

### 4. **Prose.io** (Simpler Git Editor)
- **Overview**: A simple web-based editor for GitHub-hosted Markdown files.
- **Core Features**:
   - Direct GitHub integration for file editing.
   - Works seamlessly with Markdown content.
   - Lightweight and minimalist.
- **Tech Stack**: Node.js + GitHub API.
- **Strengths**:
   - No hosting required; works directly with GitHub.
   - Perfect for simple GitHub documentation or static sites.
- **Limitations**:
   - Limited functionality compared to Gollum or Wiki.js.
   - Not self-hostable.

**Best For**: Lightweight editing of GitHub-hosted Markdown files via a web URL.

---

### 5. **Forestry.io** (Modern Headless CMS for Static Sites)
- **Overview**: A modern headless CMS that integrates with Git for managing Markdown content.
- **Core Features**:
   - Web-based editing with live preview.
   - Git integration for saving Markdown and frontmatter files.
   - Works with Jekyll, Hugo, Gatsby, and more.
- **Tech Stack**: React + Git API.
- **Strengths**:
   - Modern interface and user-friendly.
   - Great for collaborative Markdown-based content management.
- **Limitations**:
   - Not a traditional wiki system.
   - Requires setup for static site generators.

**Best For**: A sleek, modern CMS for managing Markdown files in Git repositories.

---

### 6. **Docusaurus with Custom Admin Panel**
- **Overview**: A React-based static site generator for documentation websites with custom Git integration.
- **Core Features**:
   - Custom admin panels (e.g., using TinaCMS) for web-based editing.
   - Markdown support with **Wikilinks**.
   - Extendable to include live preview and real-time editing.
- **Strengths**:
   - Extremely customizable to build a Git-backed CMS.
   - Supports interactive features like graphs and Obsidian-like structures.
- **Limitations**:
   - Requires development effort to set up admin editing.

**Best For**: Users who want to combine React-based tools with web-based Markdown editing.

---

### 7. **TinaCMS**
- **Overview**: A **Git-backed headless CMS** with real-time editing.
- **Core Features**:
   - Markdown editing through an inline web-based editor.
   - Real-time updates while editing content.
   - Git-based versioning.
- **Tech Stack**: React + Git.
- **Strengths**:
   - Works seamlessly with static site frameworks like Next.js.
   - Excellent user experience for editing Markdown.
- **Limitations**:
   - Not a ready-made solution; requires integration.
   - More CMS-like than a wiki.

**Best For**: Building a customizable Git-backed CMS with inline editing.

---

## **Comparison Table**

| **Tool**           | **Web Editing** | **Git-Backed** | **Modern UI** | **Best For**                          |
|--------------------|-----------------|---------------|--------------|---------------------------------------|
| **Gollum**         | ✅ Simple       | ✅ Yes        | ❌ Minimal   | Basic, quick setup Git-based wiki     |
| **Wiki.js**        | ✅ Full         | ✅ Yes        | ✅ Modern    | Full-featured, modern Git-based wiki  |
| **Netlify CMS**    | ✅ Full         | ✅ Yes        | ✅ Modern    | Static sites, blogs                   |
| **Prose.io**       | ✅ Simple       | ✅ Yes (GitHub)| ❌ Minimal  | Lightweight GitHub file editor        |
| **Forestry.io**    | ✅ Full         | ✅ Yes        | ✅ Modern    | Static site Markdown CMS              |
| **Docusaurus + Admin** | ✅ Custom   | ✅ Yes        | ✅ Modern    | Custom React-based documentation      |
| **TinaCMS**        | ✅ Inline       | ✅ Yes        | ✅ Modern    | Modern inline editing with Git        |

---

### **Recommendation**

1. **Best Drop-in Replacement for Gollum**:  
   - **Wiki.js**: Modern, powerful, and easy to deploy. Offers Git integration and a web-based editor.  
   
2. **For Simpler Editing**:  
   - **Prose.io**: Lightweight, integrates directly with GitHub.

3. **For Modern Static Sites**:  
   - **Netlify CMS** or **TinaCMS** if you're managing content for a static site or documentation.

4. **For Maximum Customization**:  
   - **Docusaurus + Cytoscape/TinaCMS** for a tailored Git-based CMS with advanced features.

Would you like setup instructions for one of these, or help configuring it to suit your needs? 🚀

---

🙋 **You:**

So if I want my rails app to publish the website for my users from git and let them edit it over the web ui as well, should I use Docusaurus + Cytoscape/TinaCMS or go straight to Gollum? I'm creating an mvp

---

🤖 **Assistant:**

If you're building an **MVP** where your Rails app:

1. Publishes websites for users based on **Git-backed content**.
2. Allows users to **edit content via a web UI**.

Here's a clear recommendation based on priorities:

---

### **Straight to Gollum for MVP**  
**Why?**
- **Simplicity**: Gollum is Git-native and provides a ready-to-use web UI for editing content.  
- **Fast Setup**: Gollum integrates easily into a Rails app because it uses Rack, a common Ruby middleware.  
- **Minimal Development Effort**: You get web-based editing and publishing out-of-the-box.  

**Pros of Gollum**:
- Lightweight and easy to deploy alongside Rails.  
- Users can edit their content directly using a clean web interface.  
- Git handles the version control transparently.  

**Cons of Gollum**:
- The UI is basic and might not look modern enough for a polished MVP.  
- Limited extensibility compared to JavaScript-based frameworks like Docusaurus.

---

### **Docusaurus + TinaCMS for the Future**
If you're aiming for a **highly modern and extensible solution** but willing to invest **more development time**, then:

1. Use **Docusaurus** to publish the content as a static website.  
2. Integrate **TinaCMS** (or a similar headless CMS) for inline editing directly on the web.  
3. Use Rails to **orchestrate** the Git workflow and manage user permissions.

**Pros of Docusaurus + TinaCMS**:
- Fully modern **React-based** stack.  
- Provides inline editing (users see changes live).  
- You can customize the editing experience and add features like **graphs** (via Cytoscape.js).  
- Excellent for scaling beyond an MVP.

**Cons**:
- Requires **significant development effort** to integrate Docusaurus/TinaCMS with Rails.  
- Inline editing and Git management add complexity.  

---

### **Decision Path**

- **For a Simple MVP (Fastest Path)**:  
   Use **Gollum**. Focus on providing a functional editing and publishing system. It’s minimal, Git-based, and integrates smoothly with Rails.  

- **For Long-Term Scalability**:  
   Use **Docusaurus + TinaCMS** for a modern UI and inline editing, but start simple by just orchestrating content with Git and Rails.  

---

### Final MVP Recommendation: **Start with Gollum**  

1. Integrate Gollum into your Rails app as a mounted Rack middleware for editing.
2. Let Rails handle user authentication and permissions to restrict Gollum access.  
3. Rails can serve the content or generate static HTML from Git for the published site.  

Once your MVP gains traction, you can consider migrating to a **Docusaurus/TinaCMS** setup for a polished, scalable product.  

Would you like step-by-step instructions on integrating Gollum into your Rails app? 🚀

---

🙋 **You:**

Does Gollum handle frontmatter for configuration as Jekyll does?

---

🤖 **Assistant:**

No, **Gollum** does not natively handle **frontmatter** (like Jekyll, which processes YAML frontmatter for configurations such as titles, tags, or layouts). Gollum primarily focuses on rendering Markdown, Textile, and other text formats as a Git-backed wiki with a web editor. It doesn’t process or parse frontmatter for configuration purposes out-of-the-box.

---

### **How Gollum Handles Content**:
- It directly renders file formats like **Markdown** or other supported syntaxes.
- There is no inherent mechanism for treating **YAML frontmatter** as metadata.

---

### **Solutions to Use Gollum with Frontmatter**:

If you need frontmatter support (like Jekyll), here are some approaches:

1. **Custom Rendering Plugins**:
   - Gollum allows you to extend its rendering pipeline using **custom plugins**.
   - You can write a plugin to parse YAML frontmatter and handle the metadata before rendering.
   - Use libraries like `yaml` or `kramdown` for parsing.

   Example plugin workflow:
   - Read the file content.
   - Extract YAML frontmatter from the top of the file.
   - Pass the rest of the content to Gollum’s Markdown renderer.

---

2. **Pre-process Files with Frontmatter**:
   - Use a **build step** or background job to strip YAML frontmatter from content files before displaying them in Gollum.
   - Store the metadata elsewhere (e.g., a separate JSON/YAML config file or database).

---

3. **Consider Alternatives (If Frontmatter Is Critical)**:
   - Tools like **Jekyll**, **Hugo**, or **Docusaurus** handle frontmatter natively and integrate it into static site generation.  
   - For a web-editable Git-based CMS with frontmatter support, consider **Netlify CMS** or **Forestry.io**.

---

### **Summary**:
- Gollum does **not** support YAML frontmatter natively.
- You can extend Gollum’s functionality with **custom plugins** to handle frontmatter.
- For a more straightforward solution where frontmatter is critical, use tools like **Jekyll**, **Docusaurus**, or other static site generators.

If you want help writing a Gollum plugin to parse frontmatter or explore other options, let me know! 🚀