---
title: TinaCMS and Docusaurus Integration
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  can tina and docusaurus live together? Tell me the
  best git compatible headless cms. I was thinking about Gollum in ruby but I'm open
  to get the best from multiple languages"
draft: false
---

# TinaCMS and Docusaurus Integration

## 🧠 Full Chat

🙋 **You:**

can tina and docusaurus live together? Tell me the best git compatible headless cms. I was thinking about Gollum in ruby but I'm open to get the best from multiple languages

---

🤖 **Assistant:**

Yes, **TinaCMS** and **Docusaurus** can live together, but their integration would require careful planning since they serve different purposes:

- **TinaCMS**: A headless CMS designed to edit Markdown, JSON, or YAML files stored in Git repositories. It's focused on in-place editing with a React-based interface.
- **Docusaurus**: A static site generator built for documentation websites, which also works with Markdown. It's Git-friendly but more tailored for organizing and presenting technical docs or blogs.

### How They Can Coexist
You can integrate TinaCMS as a front-end editing layer for the Markdown files that Docusaurus reads. In this case:
1. TinaCMS provides an easy editing interface for content creators.
2. Docusaurus handles static site generation and deployment.

The challenge lies in ensuring seamless synchronization between TinaCMS and the Docusaurus file structure. Some manual configuration or middleware might be necessary.

---

### Best Git-Compatible Headless CMS Options
If you’re looking for Git-compatible headless CMS options that work well with Markdown and provide good developer experience, here are some top choices:

#### **1. TinaCMS**
- **Language**: JavaScript/React
- **Strengths**: In-context editing, Git integration, great for Markdown-based workflows.
- **Ideal For**: Projects requiring a dynamic editing experience for non-developers.

#### **2. Netlify CMS**
- **Language**: JavaScript
- **Strengths**: Git-native, integrates with popular static site generators (e.g., Gatsby, Hugo), easy-to-set-up admin UI.
- **Ideal For**: Lightweight projects needing a simple Git-based CMS.

#### **3. Forestry**
- **Language**: Platform-independent (hosted service)
- **Strengths**: Visual editing for static site content, works well with Hugo, Jekyll, and Git.
- **Ideal For**: Developers who want a user-friendly CMS for clients.

#### **4. Strapi**
- **Language**: JavaScript/Node.js
- **Strengths**: API-first, supports Markdown, highly customizable.
- **Ideal For**: More complex content workflows where REST/GraphQL APIs are needed.

#### **5. Contentlayer**
- **Language**: JavaScript/Node.js
- **Strengths**: Directly integrates content into your JavaScript-based static site generator, reducing runtime overhead.
- **Ideal For**: Projects that value performance and use modern site generators like Next.js.

#### **6. Gollum (Ruby)**
- **Language**: Ruby
- **Strengths**: Git-backed wiki system, minimal setup, perfect for developer-focused documentation.
- **Ideal For**: Teams already using Ruby and needing a straightforward Markdown wiki.

#### **7. Obsidian-Digital-Garden (Customizable)**
- **Language**: Markdown-compatible tools (multi-language ecosystem)
- **Strengths**: Focused on interlinking notes, can integrate with Git for version control.
- **Ideal For**: Blogs, wikis, or note-taking systems with a focus on interlinking and extensibility.

#### **8. Headless Ghost**
- **Language**: JavaScript/Node.js
- **Strengths**: Markdown-first publishing, API support, Git workflows possible with additional tools.
- **Ideal For**: Content-heavy websites like blogs and magazines.

---

### Recommendation
For a **Git-compatible headless CMS**:
1. **If you want flexibility and interactivity**, go with **TinaCMS**.
2. **If you prefer minimalism and native Git workflows**, try **Gollum** or **Netlify CMS**.
3. **For a hybrid system with APIs and Markdown**, consider **Strapi** or **Contentlayer**.

Let me know if you'd like help configuring or comparing the setup for any of these!

---

🙋 **You:**

and how about strapi and obsidiosaurus?

---

🤖 **Assistant:**

### **Strapi and Obsidiosaurus Together**
Strapi and Obsidiosaurus can coexist in a hybrid setup if you're looking to combine the strengths of both systems:

- **Strapi**: A powerful headless CMS for managing structured content with REST/GraphQL APIs. Great for handling large-scale data models or creating APIs for web and mobile applications.
- **Obsidiosaurus**: A Markdown-based framework inspired by Obsidian, designed for knowledge management and digital gardens. It is Git-compatible and ideal for content interlinking and static site generation.

These tools serve complementary purposes, and integrating them can create a robust and flexible content management and publishing ecosystem.

---

### **Integration Use Cases**

1. **Content API + Markdown-based Publishing**  
   - Use **Strapi** to manage structured, database-driven content like blog posts, user-generated data, or e-commerce catalogs.
   - Use **Obsidiosaurus** for unstructured, Markdown-based, Git-friendly content like personal knowledge bases or digital gardens.
   - Sync between them: Push content from Strapi to Obsidiosaurus' Git repository in Markdown format.

2. **Unified Front-End**  
   - Use **Obsidiosaurus** to generate a static site that consumes Strapi's API for dynamic content.
   - Example: Serve Markdown files from Obsidiosaurus for documentation and fetch dynamic content like blogs or updates from Strapi's API.

3. **Obsidiosaurus as a Lightweight Editor**  
   - Let users write in Obsidiosaurus' Markdown environment for content creation and version control.
   - Sync Markdown files to Strapi via custom scripts or webhooks to store them as structured content.

---

### **Strengths of Strapi**
- **API-First**: Provides REST and GraphQL APIs out of the box.
- **Extensibility**: Highly customizable with plugins and custom code.
- **Database-Backed**: Supports relational databases (PostgreSQL, MySQL, SQLite) and NoSQL (MongoDB).
- **Multi-Language Support**: Easily manage translations.
- **Role-Based Access**: Secure CMS for team collaboration.

---

### **Strengths of Obsidiosaurus**
- **Markdown-First**: Ideal for interlinked Markdown documents.
- **Git Compatibility**: Built around version control, perfect for technical teams.
- **Static Output**: Generates fast static sites, making it lightweight and easy to deploy.
- **Extensibility**: Can be customized with plugins, similar to Obsidian.

---

### **Workflow Example**
1. **Use Case: Hybrid Digital Garden and Blog**
   - **Strapi**:  
     - Handle structured content like blog posts, events, or external data integrations.  
     - Create APIs for fetching content.
   - **Obsidiosaurus**:  
     - Maintain a personal wiki or digital garden with interlinked Markdown notes.  
     - Generate a static site from Markdown.  
   - **Integration**:  
     - Strapi fetches Markdown files from Obsidiosaurus for use in its APIs.  
     - Obsidiosaurus consumes Strapi's API for displaying blog posts or dynamic data alongside static content.

2. **Syncing Workflow**:
   - Create content in either **Markdown** (Obsidiosaurus) or **CMS** (Strapi).
   - Use **custom scripts** to sync between Markdown files and Strapi's API (e.g., Strapi writes to Obsidiosaurus' Git repo or Obsidiosaurus pushes to Strapi via its API).

---

### **When to Use Both Together**
- **When you need structured APIs and static interlinked content**: Use Strapi to handle dynamic content that scales with your database, and Obsidiosaurus for static content and Markdown-based workflows.
- **If you want flexibility in content management**: Strapi gives you structured, database-driven CMS features, while Obsidiosaurus keeps Markdown as the source of truth for knowledge management.

### **Conclusion**
- If you’re focusing on **scaling** and integrating multiple frontends, Strapi is unbeatable for structured APIs.  
- If your priority is **Markdown-driven workflows**, Git compatibility, and simplicity, Obsidiosaurus is excellent.  

Combining both gives you a best-of-both-worlds approach! Let me know if you want to discuss specific architectural decisions or integration examples!

---

🙋 **You:**

tell me the obsidiosaurus libraries I would just need to add to strapi. Also tell me how can I make the obsidian graph using a javascript library

---

🤖 **Assistant:**

### **Obsidiosaurus Libraries to Add to Strapi**
To integrate **Obsidiosaurus-style** features into **Strapi**, you'll primarily need libraries that handle Markdown processing, file management, and content graph visualization. Here are the main libraries and tools:

---

#### **1. Markdown Parsing and Rendering**
- **[markdown-it](https://github.com/markdown-it/markdown-it)**:
  - A fast and flexible Markdown parser that can convert Markdown into HTML.
  - Use this to process and render Markdown content stored in Strapi.

  ```bash
  npm install markdown-it
  ```

  ```javascript
  const MarkdownIt = require('markdown-it');
  const md = new MarkdownIt();
  const htmlContent = md.render(markdownContent);
  ```

---

#### **2. Frontmatter Parsing**
- **[gray-matter](https://github.com/jonschlinkert/gray-matter)**:
  - Parses frontmatter (YAML or JSON) from Markdown files, useful for metadata like tags, categories, and dates.
  - Add this to handle metadata extraction when importing Markdown content into Strapi.

  ```bash
  npm install gray-matter
  ```

  ```javascript
  const matter = require('gray-matter');
  const { content, data } = matter(markdownFile);
  console.log(data); // Metadata
  console.log(content); // Markdown content
  ```

---

#### **3. Graph Visualization**
- To create the Obsidian-style **content graph**, integrate:
  - **[D3.js](https://d3js.org/)**: For creating interactive graphs.
  - **[vis-network](https://github.com/visjs/vis-network)**: Lightweight and simpler to use than D3.js, ideal for visualizing nodes and edges.

  ```bash
  npm install vis-network
  ```

  ```javascript
  import { Network } from 'vis-network';

  const nodes = [
    { id: 1, label: 'Note 1' },
    { id: 2, label: 'Note 2' },
  ];

  const edges = [
    { from: 1, to: 2 },
  ];

  const container = document.getElementById('graphContainer');
  const data = { nodes, edges };
  const options = {};
  const network = new Network(container, data, options);
  ```

---

#### **4. File Management**
- **[fs-extra](https://github.com/jprichardson/node-fs-extra)**:
  - Handle Markdown files on the server-side, including reading, writing, and importing them into Strapi.
  - Use this to sync Obsidiosaurus-style Markdown files with Strapi's database.

  ```bash
  npm install fs-extra
  ```

  ```javascript
  const fs = require('fs-extra');
  const content = await fs.readFile('path/to/markdown.md', 'utf8');
  ```

---

### **Making the Obsidian Graph with JavaScript**
To create a graph like Obsidian’s **knowledge graph**, use the **vis-network** library (or **D3.js** for more customization).

---

#### **Steps to Create the Graph**
1. **Extract Metadata and Links**:
   - Parse your Markdown files using **gray-matter** to extract metadata and interlinks.

     ```javascript
     const links = [];
     markdownFiles.forEach((file) => {
       const { data, content } = matter(file);
       const internalLinks = content.match(/\[\[(.*?)\]\]/g); // Extract [[WikiLinks]]
       internalLinks.forEach((link) => {
         links.push({ source: fileName, target: link });
       });
     });
     ```

2. **Build Nodes and Edges**:
   - Create nodes for each Markdown file and edges for their links.

     ```javascript
     const nodes = markdownFiles.map((file, index) => ({
       id: index + 1,
       label: file.name,
     }));

     const edges = links.map((link) => ({
       from: nodes.find((node) => node.label === link.source).id,
       to: nodes.find((node) => node.label === link.target).id,
     }));
     ```

3. **Render the Graph**:
   - Use **vis-network** to visualize nodes and edges.

     ```javascript
     const container = document.getElementById('graphContainer');
     const data = { nodes: new vis.DataSet(nodes), edges: new vis.DataSet(edges) };
     const options = { physics: { enabled: true } }; // Enable interactive physics
     const network = new Network(container, data, options);
     ```

4. **Add Interactivity**:
   - Enable clicking on nodes to open their corresponding Markdown files.

     ```javascript
     network.on('click', (params) => {
       const nodeId = params.nodes[0];
       const clickedNode = nodes.find((node) => node.id === nodeId);
       if (clickedNode) {
         window.open(`/markdown/${clickedNode.label}`, '_blank');
       }
     });
     ```

---

### **Why Use Both Strapi and Obsidiosaurus?**
1. **Strapi**: Provides robust APIs and user-friendly interfaces for managing structured content like blogs, events, or e-commerce products.
2. **Obsidiosaurus**: Adds Markdown-first, Git-native content workflows and interlinking, great for technical teams or digital gardens.

By integrating these tools, you get a modern CMS with the flexibility of Markdown workflows and the power of dynamic API-driven content.

Let me know if you'd like code samples or detailed setup instructions!