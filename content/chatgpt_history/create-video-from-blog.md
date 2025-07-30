---
title: Create Video from Blog
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Script to create videos out of blog posts, ruby and
  python, use existing libraries and Unix based tools"
draft: false
---

# Create Video from Blog

## 🧠 Full Chat

🙋 **You:**

Script to create videos out of blog posts, ruby and python, use existing libraries and Unix based tools

---

🤖 **Assistant:**

Creating videos out of blog posts involves several steps:

1. Extracting the content from the blog post.
2. Generating audio from the extracted content (usually using Text-to-Speech).
3. Creating video slides for the content (could be static images or dynamic visuals).
4. Combining the audio and video slides to form the final video.

Let's break down the process:

### Step 1: Extracting Content

Ruby has the Nokogiri gem that allows us to parse and extract HTML content.

```ruby
require 'nokogiri'
require 'open-uri'

url = 'YOUR_BLOG_POST_URL'
document = Nokogiri::HTML(open(url))
content = document.css('YOUR_CSS_SELECTOR').text
```

Replace `YOUR_BLOG_POST_URL` with your blog post's URL and `YOUR_CSS_SELECTOR` with the CSS selector that matches the content of your blog.

### Step 2: Generating Audio

Google Text-to-Speech is an option you can consider. Here's a simple way to generate an audio file using Python:

```python
from gtts import gTTS
import os

text = "YOUR_EX