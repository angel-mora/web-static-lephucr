---
title: Host PDF in Next.js
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  where to put a pdf in my portfolio repo done with nextjs
  so people can download it quickly and self hosted in the github repo"
draft: false
---

# Host PDF in Next.js

## ✅ TODOs
- [ ] wnload that PDF directly from your website, here's how you can do it:

## 🧠 Full Chat

🙋 **You:**

where to put a pdf in my portfolio repo done with nextjs so people can download it quickly and self hosted in the github repo

---

🤖 **Assistant:**

If you're looking to include a PDF in your Next.js-based portfolio repository hosted on GitHub, and you want users to be able to download that PDF directly from your website, here's how you can do it:

1. **Add the PDF to Your Repo**:
   
   Create a new directory named `public` in the root of your Next.js project (if it doesn't already exist). This is a special directory in Next.js where all static assets go. Add your PDF to this directory. For example, if your PDF is named `resume.pdf`, the path would be `/public/resume.pdf`.

2. **Link to the PDF on Your Website**:

   In whichever component or page you want to provide the download link, add an anchor tag linking to the PDF. For instance:

   ```jsx
   <a href="/resume.pdf" download>Download My Resume</a>
   ```

   The `download` attribute indicates that the link will download the linked resource rather than navigate to it. If you omit it, the browser will display the PDF instead of downloading it.

3. **Push Changes to GitHub**:

   Commit your changes and push them to your GitHub repository:

   ```bash
   git add .
   git commit -m "Added resume.pdf and download link"
   git push
   ```

4. **Deploy Your Next.js App**:

   Deploy your Next.js app as you normally would, using Vercel, Netlify, or any other platform you prefer. When users visit the page or component where you added the link, they'll be able to click it and download the PDF.

By placing the PDF in the `public` directory, it'll be served as a static asset by Next.js, which means there's no need for additional configuration or server-side logic. It'll be available directly at the specified path. And since it's in your GitHub repo, it's self-hosted and version-controlled.