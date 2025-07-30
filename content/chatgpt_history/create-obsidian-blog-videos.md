---
title: Create Obsidian Blog Videos
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Script to create videos out of my obsidian blog posts
  (in markdown and obsidian config in front matter), ruby and python, one first I
  say continue and the second script. use existing libraries and Unix based tools
  whenever possible"
draft: false
---

# Create Obsidian Blog Videos

## 🧠 Full Chat

🙋 **You:**

Script to create videos out of my obsidian blog posts (in markdown and obsidian config in front matter), ruby and python, one first I say continue and the second script. use existing libraries and Unix based tools whenever possible

---

🤖 **Assistant:**

Creating videos from Obsidian blog posts involves multiple steps:

1. **Parse the Markdown and Front Matter**: Extract the title, content, and any configuration from the Obsidian markdown.
2. **Generate Images/Slides**: Create slides based on the parsed content.
3. **Convert Images/Slides to Video**: Turn those slides into a video.

For the first part, we'll use Ruby to parse the Markdown and Front Matter. For the second and third parts, we'll use Python because it has powerful libraries for image and video creation.

### 1. Ruby Script to Parse Markdown:

```ruby
require 'yaml'
require 'kramdown'

# Read the file content
file_content = File.read('your_obsidian_note.md')

# Split front matter and content
front_matter, content = file_content.split("---\n", 2)

# Parse YAML front matter
config = YAML.load(front_matter)

# Parse markdown to HTML (you can change this part if you want other formats)
html_content = Kramdown::Document.new(content).to_html

# Print or save the parsed data
puts "Title: #{config['title']}"
puts "Content: #{html_content}"
```

* Install the required gems:

```
gem install yaml kramdown
```

### 2. Python Script to Create Videos:

For this, we'll use the `imgkit` library to convert HTML content to images, and `moviepy` library to create videos from those images.

```python
import imgkit
from moviepy.editor import *

def create_video_from_html(html_content, title, duration_per_slide=5):
    # Convert HTML content to Image
    imgkit.from_string(html_content, 'slide.jpg')

    # Create a clip for the image
    clip = ImageClip('slide.jpg', duration=duration_per_slide)
    
    # Optionally add title text
    txt_clip = TextClip(title, fontsize=70, color='white').set_pos('center').set_duration(duration_per_slide)
    video = CompositeVideoClip([clip, txt_clip])
    
    # Write video to file
    video.write_videofile("output.mp4", fps=1/duration_per_slide)

# Replace the below placeholder with your actual HTML content and title
html_content = "<html><body>YOUR_HTML_CONTENT_HERE</body></html>"
title = "YOUR_TITLE_HERE"
create_video_from_html(html_content, title)
```

* Install the required packages:

```
pip install imgkit moviepy
```

For `imgkit` to work, you