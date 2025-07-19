---
title: Serve Jekyll in Next.js
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Serve Jekyll in Next.js

## ✅ TODOs


## 📌 Summary
Can I serve a jekyll blog within a nextjs app?

## 🧠 Full Chat


Can I serve a jekyll blog within a nextjs app? 



Yes, you can serve a Jekyll blog within a Next.js app by using a couple of approaches. Here are the steps for one of the more straightforward methods:

### Method 1: Using Static Export

1. **Generate the Static Files from Jekyll:**
   - Build your Jekyll site to generate the static files. You can do this by running:
     ```bash
     jekyll build
     ```
   - This will generate a `_site` directory containing your static Jekyll site.

2. **Move Jekyll Static Files to Next.js Public Directory:**
   - Copy the contents of the `_site` directory into the `public` directory of your Next.js project. The `public` directory is used by Next.js to serve static assets.

3. **Access Jekyll Pages in Next.js:**
   - Once the static files are in the `public` directory, they can be accessed directly via your Next.js app. For example, if your Jekyll site has a page at `about.html`, it will be available at `http://your-nextjs-site.com/about.html`.

### Method 2: Using a Proxy

1. **Run Jekyll and Next.js Together:**
   - Run your Jekyll site on a separate port using `jekyll serve`. By default, it will run on `http://localhost:4000`.
   - Run your Next.js application on another port, say `http://localhost:3000`.

2. **Set Up a Proxy in Next.js:**
   - Use a proxy to forward requests from your Next.js app to the Jekyll server. This can be done using `http-proxy-middleware`.

   - Install `http-proxy-middleware`:
     ```bash
     npm install http-proxy-middleware
     ```

   - Create a `next.config.js` file (if it doesn't already exist) and configure the proxy:
     ```javascript
     const { createProxyMiddleware } = require('http-proxy-middleware');

     module.exports = {
       async rewrites() {
         return [
           {
             source: '/jekyll/:path*',
             destination: 'http://localhost:4000/:path*' // Proxy to Jekyll
           }
         ];
       }
     };
     ```

3. **Access Jekyll Pages via Proxy:**
   - Now, any request to `/jekyll/*` in your Next.js app will be proxied to the Jekyll server. For example, `http://your-nextjs-site.com/jekyll/about` will serve the `about` page from the Jekyll site.

### Method 3: Embedding Jekyll Pages in Next.js

1. **Generate Jekyll Static Files:**
   - As in Method 1, build your Jekyll site to generate the static files.

2. **Serve Jekyll Files from Custom Next.js Pages:**
   - Instead of just copying files to the `public` directory, create custom Next.js pages that render the Jekyll content.

   - For example, create a `pages/jekyll/[...slug].js` file in your Next.js project:
     ```javascript
     import fs from 'fs';
     import path from 'path';

     export default function JekyllPage({ content }) {
       return <div dangerouslySetInnerHTML={{ __html: content }} />;
     }

     export async function getStaticPaths() {
       // Generate paths from Jekyll static files
       const jekyllFiles = fs.readdirSync(path.join(process.cwd(), '_site'));
       const paths = jekyllFiles.map(file => ({
         params: { slug: file.replace('.html', '').split('/') }
       }));

       return { paths, fallback: false };
     }

     export async function getStaticProps({ params }) {
       const filePath = path.join(process.cwd(), '_site', `${params.slug.join('/')}.html`);
       const content = fs.readFileSync(filePath, 'utf8');

       return { props: { content } };
     }
     ```

   - This setup allows you to serve Jekyll content within your Next.js pages while leveraging Next.js features like static generation.

Each method has its pros and cons, so you can choose the one that best fits your project requirements.