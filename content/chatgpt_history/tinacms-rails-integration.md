---
title: TinaCMS Rails Integration
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Is there any tinacms and rails project?"
draft: false
---

# TinaCMS Rails Integration

## 🧠 Full Chat

🙋 **You:**

Is there any tinacms and rails project?

---

🤖 **Assistant:**

There are very few public examples of **TinaCMS** being integrated with **Ruby on Rails**, as TinaCMS is primarily designed for **Next.js** and **static site generators** like Hugo. However, integrating TinaCMS with a Rails backend is possible, especially if you use Rails as an API.

### Possible Approaches to Integrating TinaCMS with Rails:
1. **Rails as a Headless CMS API**  
   - Set up Rails with **Active Storage** or **Shrine** for image uploads.  
   - Expose a **GraphQL** or **REST API** for TinaCMS to fetch and update content.  
   - Use **TinaCMS with Next.js** or another frontend framework to edit content.

2. **Serving Markdown from Rails**  
   - Store Markdown content in a Rails database (e.g., using **ActiveRecord**).  
   - Use Rails to serve Markdown files that TinaCMS can edit.  
   - TinaCMS updates the Markdown content via API requests to Rails.

### Example Projects & Resources:
There aren’t widely known projects combining TinaCMS and Rails, but you could adapt from:
- **TinaCMS GraphQL API**: Can be used with Rails' **GraphQL-Ruby** gem.
- **Decap CMS (formerly Netlify CMS) + Rails**: Some Rails developers have used DecapCMS, which has a similar purpose to TinaCMS.

Would you like help setting up a minimal working example of Rails + TinaCMS?

---

🙋 **You:**

TinaCMS vs CosmicCMS

---

🤖 **Assistant:**

### **TinaCMS vs. CosmicCMS: A Comparison**  

Both **TinaCMS** and **CosmicCMS** are modern content management systems, but they have different architectures and use cases.  

| Feature        | **TinaCMS** | **CosmicCMS** |
|--------------|-----------|------------|
| **Type** | Git-based, real-time CMS | Headless CMS with cloud storage |
| **Hosting** | Client-side (works with Git repositories like GitHub) | Cloud-based SaaS |
| **Content Storage** | Markdown/JSON files in Git | Hosted database (NoSQL) |
| **Best For** | Static sites (Next.js, Hugo, Jekyll) | Dynamic websites & apps |
| **API Support** | No backend API (Git-based) | GraphQL & REST API |
| **Editor Interface** | In-context, live-editing | Dashboard-based CMS |
| **Pricing** | Free for self-hosted, paid for TinaCloud | Paid (free tier available) |
| **Integration with Rails** | Needs API layer (Rails as backend) | Directly usable with Rails via API |
| **Use Cases** | JAMstack, documentation sites, marketing pages | Blogs, SaaS apps, mobile apps |

### **Which One Should You Use?**
- **TinaCMS**: Best if you're working with a **Git-based static site** and want inline editing. However, it requires extra work if used with Rails.  
- **CosmicCMS**: Ideal if you want a **headless CMS with API access** that integrates directly with a Rails backend.  

Would you like help setting up either of them with Rails?