---
title: Static Blog Metrics Setup
tags:
- citations
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Static Blog Metrics Setup

## ✅ TODOs
- [ ] my book in TinaCMS and tell me which would be the really easiest approach so I have access to metrics about my blog? I saw ButterCMS but there are sooo many that I really don't know. Would love to handle everything in markdown and no database
- [ ] now is just to be able to show my markdown content with bibtex and wikilinks, would Quartz be the option?

## 📌 Summary
Forget a minute about my requirement to do my book in TinaCMS and tell me which would be the really easiest approach so I have access to metrics about my blog? I saw ButterCMS but there are sooo many that I really don't know. Would love to handle everything in markdown and no database

## 🧠 Full Chat


Forget a minute about my requirement to do my book in TinaCMS and tell me which would be the really easiest approach so I have access to metrics about my blog? I saw ButterCMS but there are sooo many that I really don't know. Would love to handle everything in markdown and no database



The **easiest** approach for handling everything in Markdown **without a database** while getting **metrics** would be:

### **1. Use a Static Site Generator (SSG) + Git-based CMS**
Since you want to write in Markdown, an SSG like **Eleventy (11ty)** or **Hugo** would be lightweight and fast. Pair it with a Git-based CMS like **CloudCannon** or **NetlifyCMS** to edit Markdown from a UI.

### **2. Host on Vercel or Netlify**
These platforms make deployment seamless and support analytics.

### **3. Use Plausible or Umami for Metrics**
Both are **privacy-friendly** and **lightweight** Google Analytics alternatives that can track visitors, referrers, and page views without slowing your site down.

### **Easiest Tech Stack**
- **SSG:** 11ty (simpler than Next.js if you just want a blog)
- **CMS:** NetlifyCMS (or skip and just push to Git)
- **Hosting:** Vercel (best DX) or Netlify
- **Metrics:** Plausible (simple dashboard, no cookies)

Would this work for you, or do you need more interactivity in your blog?

I meant the easiest to start just putting the markdown content right away and without needing to code

If you want the absolute **easiest** way to start posting Markdown content **right away**, with built-in analytics and zero coding, here are your best options:

### **1. Ghost (Hosted) – Easiest & Best for Growth**  
   - You can write in **Markdown** directly.  
   - **No coding required**—just sign up and start publishing.  
   - **Built-in analytics** and memberships if you want to monetize later.  
   - **Downside:** It's a paid service (starts at ~$9/month).  
   - **Try it:** [https://ghost.org](https://ghost.org)  

### **2. Bear Blog – Minimalist & Free**  
   - Super simple, **Markdown-based blogging**.  
   - **No setup**—just create an account and start writing.  
   - Has **basic analytics** (visits, referrers).  
   - **Free with a paid upgrade** for custom domains.  
   - **Try it:** [https://bearblog.dev](https://bearblog.dev)  

### **3. Blot – Markdown-powered, Zero UI**  
   - Drop Markdown files into a **Google Drive or Git repo**, and it becomes a blog.  
   - **No CMS or UI**—just your files.  
   - **Basic analytics via integrations** (like Plausible).  
   - **$4/month** (super cheap).  
   - **Try it:** [https://blot.im](https://blot.im)  

If you want **pure Markdown with no setup**, **Bear Blog** is the fastest way to start. If you want **scalability**, **Ghost** is better.  

Would you prefer something free, or are you okay with a small cost for convenience?

any of those have wikilinks support?

Yes! If you want **Markdown-based blogging with Wikilinks support**, here’s how the options compare:

### ✅ **Supports Wikilinks Natively**
1. **Blot** ([blot.im](https://blot.im))  
   - **Fully supports [[wikilinks]]** for internal linking.  
   - Just drop Markdown files into a folder (Google Drive, Git, Dropbox).  
   - Lightweight and simple ($4/month).  

2. **Ghost** (with a Plugin) ([ghost.org](https://ghost.org))  
   - Doesn’t support Wikilinks out of the box, but you can use a **custom theme** or a **short JS snippet** to enable them.  
   - If you’re okay tweaking a bit, this could work.  

### ❌ **No Native Wikilink Support** (but might be hackable)  
- **Bear Blog**: Doesn’t support [[wikilinks]] natively, but you can manually create links (`[Link Text](/page-slug)`).
- **Other Static Site Generators (like 11ty, Hugo)**: Support Wikilinks only with plugins or custom processing.

### **Best Choice for Easy Wikilinks + Markdown + No Coding?**
👉 **Blot** is your best bet. **No setup, full wikilink support, and just works.** Would that work for you?

does blot support bib files? To render stuff like Zettlr does?

Blot **does not** natively support `.bib` files or citation rendering like **Zettlr** does with Pandoc. However, here are some workarounds:  

### **1. Use Manual Citations (Not Ideal)**
   - You can reference `.bib` files manually and format citations in Markdown, but there’s no automatic bibliography rendering.

### **2. Convert Citations to Markdown Before Uploading**
   - You can use **Pandoc** to pre-render citations from `.bib` into Markdown before uploading to Blot:  
     ```sh
     pandoc --citeproc -s input.md --bibliography=references.bib -o output.md
     ```
   - This will replace citation keys (`[@key]`) with formatted references in Markdown.

### **3. Alternative: Quartz or Obsidian Publish**
   - If you want a **Zettelkasten-like blog with citations**, consider:
     - **Quartz** ([github.com/jackyzha0/quartz](https://github.com/jackyzha0/quartz)): A **Hugo-based** system built for Obsidian notes, including **wikilinks & citation rendering**.
     - **Obsidian Publish** (Paid): If you’re already using Obsidian, this is the easiest no-code way to publish **wikilinks & citations**.

### **Best Option for Easy Bib Support?**
👉 If **bib support is critical**, Blot **isn’t the best**. Instead, **Quartz or Obsidian Publish** will give you the **wikilinks + citations** without coding. Would one of those work for you?

so nothing super simple that supports bib out of the box, like zettlr or in some way, supports wikilinks and also can be customized without coding at first?

For something **super simple**, that **supports Wikilinks** and **BibTeX citations out of the box**, while also being **customizable without coding**, there’s no **perfect** one-size-fits-all solution, but here are the closest options:  

---

### **1. Obsidian Publish (Paid, No Coding, Best for Wikilinks & BibTeX)**  
✅ **Fully supports Wikilinks (`[[page]]`)**  
✅ **Supports BibTeX citations** (via plugins like Citation & Pandoc)  
✅ **No coding required**—you just click **Publish**  
✅ **Customizable via themes/plugins**  
❌ **Paid** ($20/month)  

👉 If you're already using **Obsidian** and want **Zettlr-like** behavior online **without coding**, this is **the simplest choice**.  
🔗 [Obsidian Publish](https://obsidian.md/publish)  

---

### **2. Quartz (Free, Markdown-based, Supports Wikilinks & Citations with Pandoc)**
✅ **Supports Wikilinks (`[[page]]`)**  
✅ **Can handle `.bib` citations** (with Pandoc preprocessing)  
✅ **Free & Open Source**  
✅ **Runs on GitHub Pages (no server required)**  
❌ **Some setup required (not 100% no-code at first)**  

👉 **Best free alternative** if you're okay with **a little bit** of initial setup.  
🔗 [Quartz](https://github.com/jackyzha0/quartz)  

---

### **3. Logseq + Logseq Publish (Planned, but Not Yet Available)**
✅ **Supports Wikilinks (`[[page]]`)**  
✅ **Has BibTeX integration**  
✅ **Graph-based, Zettelkasten-friendly**  
❌ **No official publishing yet (coming soon)**  

👉 **Might be the best choice** once publishing is fully released.  

---

### **Easiest No-Code Option Today?**
👉 **Obsidian Publish** is the simplest & fastest. **Quartz** is the best free alternative **if you don’t mind some setup**.  

Would you rather pay a little for zero setup (**Obsidian Publish**) or go with a **free** but slightly more technical setup (**Quartz**)?

Obsidian Publish does not support bibtex citations, does it?

You're right—**Ob

Obsidian Publish does not support bibtex citations, does it?

You're right—**Obsidian Publish does not natively support BibTeX citations**. While Obsidian itself supports BibTeX through plugins like **Citations** and **Pandoc**, these do not work directly on **Obsidian Publish** since plugins aren’t supported on the published site.  

### **Closest No-Code Options with BibTeX Support**  

#### **1. Quartz (Best Free Option, Some Setup)**
✅ **Supports Wikilinks (`[[page]]`)**  
✅ **Supports BibTeX citations (via Pandoc integration)**  
✅ **Runs on GitHub Pages (no server required)**  
✅ **Markdown-based, like Obsidian/Zettlr**  
❌ **Requires initial setup (but no coding once running)**  

👉 **Best for academic blogging with BibTeX & Markdown**.  
🔗 [Quartz on GitHub](https://github.com/jackyzha0/quartz)  

---

#### **2. Jekyll + Pandoc (If You Want Full Control)**
✅ **Supports Wikilinks (`[[page]]`)**  
✅ **Full BibTeX citation support (via Pandoc + `.bib` files)**  
✅ **Customizable themes**  
❌ **Requires minimal setup (host on GitHub Pages, Netlify, or Vercel)**  

👉 If you want **Zettlr-like behavior online**, this is **closest to what you’re looking for**.  
🔗 [Guide on Jekyll & Pandoc](https://pandoc.org/MANUAL.html#citations)  

---

### **TL;DR – Easiest Path for Wikilinks + BibTeX**  
- **Easiest with no coding:** ❌ No perfect solution yet.  
- **Easiest with a bit of setup:** ✅ **Quartz** (best Markdown + BibTeX support).  
- **Most powerful for academic work:** ✅ **Jekyll + Pandoc** (but more setup).  

Would you prefer a **hosted** solution, or are you okay with a small **local setup** for more features?

if all I want to do now is just to be able to show my markdown content with bibtex and wikilinks, would Quartz be the option?

Yes, **Quartz is your best option** if you just want to **show Markdown content with BibTeX citations and Wikilinks** right away.  

### ✅ **Why Quartz?**
✔️ **Supports Wikilinks (`[[page]]`)** automatically  
✔️ **Handles BibTeX citations** using Pandoc (with a `.bib` file)  
✔️ **No database needed—just Markdown files**  
✔️ **Free & easy to deploy on GitHub Pages (or Netlify/Vercel)**  
✔️ **Minimal setup—no coding required once it's running**  

### 🔧 **Steps to Get Started (Quick Version)**  
1. **Fork the Quartz repo** → [Quartz GitHub](https://github.com/jackyzha0/quartz)  
2. **Add your Markdown files** (including `.bib` for citations)  
3. **Configure `config.toml`** to enable Pandoc citation processing  
4. **Deploy using GitHub Pages** (or Netlify/Vercel)  

If you **just want to start fast** without worrying about setup, I can guide you through the exact steps. Would that help? 🚀

is it the absolute best? Better than TinaCMS, obsidian-digital-garden (Jekyll), Obsidiosaurus and any other alternative?

It depends on what you mean by **"best"**—Quartz is the most **straightforward** free option for Wikilinks + BibTeX, but let’s break it down based on your needs:  

---

### **💡 Absolute Best for Wikilinks + BibTeX?**
| Feature | **Quartz** | **TinaCMS** | **Obsidian Digital Garden (Jekyll)** | **Obsidiosaurus** |
|---------|------------|------------|---------------------------------|----------------|
| ✅ Wikilinks (`[[page]]`) | ✔️ Yes | ❌ No native support | ✔️ Yes (with plugins) | ✔️ Yes |
| ✅ BibTeX Citations | ✔️ Yes (via Pandoc) | ❌ No | ✔️ Yes (via Jekyll-Pandoc) | ✔️ Yes (via Pandoc) |
| 💻 No-Code Setup | ⚠️ Some setup (fork repo) | ❌ Requires GraphQL & config | ❌ Needs Ruby/Jekyll setup | ⚠️ Medium setup |
| 🌎 Free & Hosted | ✔️ Yes (GitHub Pages) | ❌ Paid (needs hosting) | ✔️ Yes (GitHub Pages) | ✔️ Yes |
| 🎨 Customizable | ⚠️ Limited | ✔️ Full control | ✔️ Full control | ✔️ Full control |

---

### **🏆 Which One is the Best for You?**
- **🔥 Quartz = Best balance of simplicity + features.** *(Easiest way to get Wikilinks & BibTeX online for free.)*  
- **🛠️ Jekyll-based (Obsidian Digital Garden) = Best for long-term control.** *(More work to set up, but highly customizable.)*  
- **⚡ TinaCMS = Not a good fit** (doesn't support Wikilinks/BibTeX easily).  
- **🦖 Obsidiosaurus = Good but more niche.** *(Great if you like SSGs but want full control.)*  

---

### **🚀 Verdict**
👉 If you want **the absolute easiest Wikilinks + BibTeX solution today** → **Quartz.**  
👉 If you want **maximum customization later** → **Jekyll (Obsidian Digital Garden).**  

Would you like a step-by-step Quartz setup guide? 🚀

so you said Ghost doesnt have support for bibtex and wikilinks in any way?

Correct—**Ghost does NOT natively support BibTeX or Wikilinks (`[[page]]`)**. However, there are **some workarounds** if you really want to use Ghost:  

---

### **1️⃣ Wikilinks Workaround in Ghost**  
Ghost doesn’t support **`[[wikilinks]]`**, but you can:  
- Use **Markdown-style links**: `[My Page](/my-page)`  
- Add a **JavaScript snippet** to convert `[[wikilinks]]` into proper links dynamically  

**How?**  
- Add this script to Ghost’s **Code Injection (Footer)**:  
  ```js
  document.body.innerHTML = document.body.innerHTML.replace(/\[\[(.*?)\]\]/g, '<a href="/$1">$1</a>');
  ```
- This **auto-converts** `[[page]]` into `/page` links.  
- **Downside?** Doesn't support slugs, just exact filenames.  

---

### **2️⃣ BibTeX Workaround in Ghost**  
Ghost doesn’t support `.bib` citations, but you can:  
- **Manually format citations** (`[1]`, `[Doe2023]`, etc.)  
- **Use Pandoc before publishing** to convert `[@key]` citations into static text  
  ```sh
  pandoc --citeproc my-post.md --bibliography=my-bib.bib -o output.md
  ```
  - This **replaces** citation keys with formatted references before uploading to Ghost.  

---

### **3️⃣ Alternative: Using Ghost with a Headless CMS Approach**  
If you're comfortable with a hybrid approach:  
- **Write in Obsidian or a Static Site Generator (like Quartz or Jekyll)**  
- **Publish to Ghost automatically** (via API or Zapier)  

---

### **🚀 Conclusion: Is Ghost a Good Fit?**  
❌ **Not ideal** if Wikilinks + BibTeX are must-haves.  
✅ **Works for Wikilinks with minor hacks.**  
⚠️ **Citations require Pandoc preprocessing.**  

👉 If you want a **clean Markdown-first, no-hacks approach**, **Quartz or Jekyll** are still better than Ghost for your needs.  

Would you like help setting up one of those instead? 🚀

ButterCMS vs Ghost

### **ButterCMS vs. Ghost – Which One is Better for You?**  

| Feature | **ButterCMS** | **Ghost** |
|---------|--------------|-----------|
| **Markdown Support** | ✅ Yes, but content is stored in their CMS | ✅ Yes, full Markdown support |
| **Wikilinks (`[[page]]`)** | ❌ No native support | ❌ No native support (needs JavaScript hack) |
| **BibTeX Citations (`[@ref]`)** | ❌ No support | ❌ No support (requires Pandoc preprocessing) |
| **Hosting** | ✅ Fully hosted (no setup) | ✅ Fully hosted (Ghost Pro) or self-hosted |
| **No-Code Setup** | ✅ Yes (WYSIWYG interface) | ✅ Yes (Ghost Pro) |
| **Customizability** | ⚠️ Limited (API-driven, not file-based) | ✅ Full control over themes & code |
| **Best Use Case** | API-driven content for headless sites | Blogging & newsletters |
| **Price** | ❌ Expensive ($83+/mo for personal plan) | ✅ Free (self-hosted) / $9+/mo (Ghost Pro) |

---

### **🏆 Which One is Better for You?**  
- **🔥 Ghost = Better for Markdown-heavy blogging** (closer to Obsidian/Zettlr).  
- **🛠️ ButterCMS = Better if you need an API-based CMS** (good for integrating into apps).  
- **❌ Neither support BibTeX or Wikilinks well without workarounds.**  

If you’re looking for **Markdown + Wikilinks + BibTeX**, **Ghost is slightly better** than ButterCMS but still not ideal.  

👉 If **writing-first simplicity** matters, I’d still recommend **Quartz or Jekyll** over both. Do you need help choosing an alternative? 🚀

So what would be the best marketing strategy for my Quartz blog? I like that Ghost helps a lot with newsletter and analytics

If you’re going with **Quartz** but still want **Ghost-like marketing tools** (newsletter, analytics, audience growth), here’s how to build an effective strategy:  

---

## **🚀 Best Marketing Strategy for a Quartz Blog**
Since Quartz is a **static site generator**, it lacks built-in marketing tools. You’ll need to **integrate** some key tools to get the benefits of Ghost **without switching platforms**.  

### **📩 1. Add a Newsletter (Like Ghost’s)**
Ghost shines in newsletters, but you can **replicate this with Quartz**:  

#### ✅ **Best Option: ConvertKit**  
- **Why?** Free plan available, powerful automation, easy signup forms  
- **How?** Add a ConvertKit signup form to your Quartz site  
  - Embed a form in your Quartz blog:  
    ```html
    <form action="https://convertkit.com/your-form-url">
      <input type="email" name="email" placeholder="Your email">
      <button type="submit">Subscribe</button>
    </form>
    ```
- **Alternative:** Mailchimp (good for beginners)  

🔗 [ConvertKit Signup](https://convertkit.com/)  

---

### **📊 2. Get Analytics Without Ghost Pro**
Ghost has built-in analytics, but with Quartz, use **Google Analytics** or **Plausible** for a lightweight solution.  

#### ✅ **Best Option: Plausible Analytics** (Privacy-friendly, No cookies)  
- Add this to `head.html` in Quartz:  
  ```html
  <script defer data-domain="yourblog.com" src="https://plausible.io/js/script.js"></script>
  ```
🔗 [Plausible.io](https://plausible.io/)  

---

### **🔄 3. Automate Social Media Sharing**
Ghost has native integrations, but you can **automate Quartz blog posts** using:  

✅ **Zapier** → Auto-share new posts to Twitter, LinkedIn, Facebook  
- **Trigger:** New file added to your GitHub repo  
- **Action:** Auto-post on social media  

✅ **Typefully** (Best for Twitter/X threads)  
- **Schedule** blog-to-thread breakdowns  
🔗 [Typefully](https://typefully.com/)  

---

### **🌎 4. Improve SEO for More Traffic**
Quartz is **fast**, but static sites need SEO optimization:  

✅ **Add Open Graph meta tags** (for Twitter/Facebook previews)  
- Edit `config.toml` in Quartz:  
  ```toml
  [params.opengraph]
  title = "Your Blog Name"
  description = "A blog about XYZ"
  image = "https://yourblog.com/og-image.jpg"
  ```

✅ **Submit to Google Search Console**  
🔗 [Google Search Console](https://search.google.com/search-console)  

✅ **Use SEO-friendly URLs & headings**  
- **Bad:** `/posts/123.html`  
- **Good:** `/best-marketing-strategy-quartz-blog/`  

---

## **💡 TL;DR – How to Market a Quartz Blog Like Ghost**  
✔️ **Newsletter** → ConvertKit (for email lists)  
✔️ **Analytics** → Plausible or Google Analytics  
✔️ **Social Media Automation** → Zapier + Typefully  
✔️ **SEO Boost** → Open Graph tags + Google Search Console  

Would you like a **step-by-step guide** for any of these integrations? 🚀