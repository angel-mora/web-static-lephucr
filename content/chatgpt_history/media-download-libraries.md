---
title: Media Download Libraries
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Media Download Libraries

## ✅ TODOs
- [ ] wnload media from social networks

## 📌 Summary
Libraries to download media from social networks

## 🧠 Full Chat


Libraries to download media from social networks



Here are some libraries for downloading media from social networks:

### **YouTube, TikTok, Instagram, Twitter (X), Facebook, etc.**
1. **[yt-dlp](https://github.com/yt-dlp/yt-dlp)** (Python)  
   - Fork of `youtube-dl`, supports YouTube, TikTok, Instagram, Twitter (X), Facebook, and many other platforms.  
   - Example:  
     ```sh
     yt-dlp <video_url>
     ```

2. **[gallery-dl](https://github.com/mikf/gallery-dl)** (Python)  
   - Focuses on image-based sites like Instagram, Twitter (X), and DeviantArt.  
   - Example:  
     ```sh
     gallery-dl <image_url>
     ```

3. **[instaloader](https://github.com/instaloader/instaloader)** (Python)  
   - Specialized for Instagram.  
   - Example:  
     ```sh
     instaloader <profile_name>
     ```

4. **[Twint](https://github.com/twintproject/twint)** (Python)  
   - Scrapes tweets without Twitter API restrictions.  
   - Example:  
     ```python
     import twint
     c = twint.Config()
     c.Username = "username"
     twint.run.Search(c)
     ```

5. **[TikTok-Scraper](https://github.com/drawrowfly/tiktok-scraper)** (Node.js)  
   - Scrapes TikTok videos and metadata.  
   - Example:  
     ```sh
     tiktok-scraper user <username> -d
     ```

6. **[Facebook-Scraper](https://github.com/kevinzg/facebook-scraper)** (Python)  
   - Extracts Facebook posts, videos, and images without API.  
   - Example:  
     ```python
     from facebook_scraper import get_posts
     for post in get_posts('nasa', pages=1):
         print(post['text'])
     ```

### **General Web Scraping (if APIs/Libraries Fail)**
- **[Selenium](https://www.selenium.dev/)** (Python, Java, etc.) – Automates browser actions.  
- **[BeautifulSoup](https://www.crummy.com/software/BeautifulSoup/)** (Python) – Parses HTML to extract links.  
- **[Playwright](https://playwright.dev/)** (Python, JS) – Headless browser for scraping JavaScript-heavy sites.  

Would you like a recommendation based on a specific platform or type of media?