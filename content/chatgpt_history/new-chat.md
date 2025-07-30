---
title: New chat
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Chrome Bookmarks: Ruby script to interact with bookmarks
  API and for all the folders I have saved, create a bookmark for each bookmark, add
  tags and other bookmark metadata"
draft: false
---

# New chat

## 🧠 Full Chat

🙋 **You:**

Chrome Bookmarks: Ruby script to interact with bookmarks API and for all the folders I have saved, create a bookmark for each bookmark, add tags and other bookmark metadata

---

🤖 **Assistant:**

As of my last training cut-off in September 2021, Google Chrome does not provide an API that allows direct interaction with bookmarks. Therefore, scripting interactions directly with Chrome's bookmarks isn't straightforward.

However, you can still manage your bookmarks by exporting them as an HTML file, manipulating the file, and then re-importing it back into Chrome. 

Here's a rough example in Ruby on how you could parse an exported bookmarks file using Nokogiri, a popular Ruby HTML/XML parser:

```ruby
require 'nokogiri'

def parse_bookmarks(file)
  doc = Nokogiri::HTML(open(file))
  bookmarks = []

  doc.css('a').each do |link|
    bookmarks << {
      href: link.attribute('href').value,
      add_date: link.attribute('add_date').value,
      tags: link.attribute('tags')&.value,
      text: link.text,
    }
  end

  bookmarks
end

bookmarks = parse_bookmarks('/path/to/bookmarks.html')
puts bookmarks
```

In this script, we're creating a method `parse_bookmarks` that takes a file path as an argument. It opens the file, parses the HTML, and collects all `a` elements (which represent your bookmarks) into an array. For each bookmark, it saves the href, add_date, tags, and the text of the bookmark.

Please note that tags aren't a default attribute in exported bookmarks. If you wish to add tags and other custom metadata, you would need to manipulate the HTML file by adding your own custom attributes, which can also be done via Nokogiri.

Remember, after making changes you would need to re-import the HTML file back into Chrome to see the changes reflected.

As APIs and libraries could be updated, please check the latest information on this topic.