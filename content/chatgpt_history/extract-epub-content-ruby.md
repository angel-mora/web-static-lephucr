---
title: Extract EPUB Content Ruby
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Extract EPUB Content Ruby

## ✅ TODOs


## 📌 Summary
ruby script to get all headers tree with words bold, cursives and special paragraphs within epub file

## 🧠 Full Chat


ruby script to get all headers tree with words bold, cursives and special paragraphs within epub file

Extracting content from an EPUB file and processing it requires a few steps. EPUB is essentially a zipped collection of HTML files, stylesheets, and metadata. To extract content from an EPUB file in Ruby, you can use the `gepub` gem. Once you have the content, you can use Nokogiri to parse the HTML and extract the desired elements.

Here's a basic script to get you started:

1. Install the required gems:

```bash
gem install gepub nokogiri
```

2. Use the following script:

```ruby
require 'gepub'
require 'nokogiri'

def extract_content_from_epub(epub_file)
  book = GEPUB::Book.parse(epub_file)
  contents = []

  book.each_item do |item|
    if item.media_type == 'application/xhtml+xml'
      doc = Nokogiri::HTML(item.content)
      headers = doc.css('h1, h2, h3, h4, h5, h6')
      bold_texts = doc.css('b, strong')
      italic_texts = doc.css('i, em')
      special_paragraphs = doc.css('p.special') # Assuming 'special' class for special paragraphs

      headers.each { |h| contents << ["Header (#{h.name})", h.text] }
      bold_texts.each { |b| contents << ['Bold', b.text] }
      italic_texts.each { |i| contents << ['Italic', i.text] }
      special_paragraphs.each { |p| contents << ['Special Paragraph', p.text] }
    end
  end

  contents
end

epub_file = 'path_to_your_epub_file.epub'
contents = extract_content_from_epub(epub_file)
contents.each do |type, text|
  puts "#{type}: #{text}"
end
```

This script will print all headers, bold texts, italic texts, and special paragraphs (assuming they have a class named "special") from the EPUB file. Adjust the CSS selectors as needed to fit the structure of the EPUB files you're working with.

Remember, EPUBs can have varying structures, so this script might not work perfectly for all EPUBs. Adjustments might be necessary depending on the specific structure and styling of the EPUB file you're working with.

I am expecting to have something as
# HEADING
  ## SUBHEADING 1
    ### SUBHEADING 2

To generate a tree-like structure for headers from an EPUB file, you can modify the script to keep track of the hierarchy of headers. Here's a modified version of the script:

```ruby
require 'gepub'
require 'nokogiri'

def extract_headers_from_epub(epub_file)
  book = GEPUB::Book.parse(epub_file)
  headers_tree = []

  book.each_item do |item|
    if item.media_type == 'application/xhtml+xml'
      doc = Nokogiri::HTML(item.content)
      headers = doc.css('h1, h2, h3, h4, h5, h6')

      current_headers = { h1: nil, h2: nil, h3: nil, h4: nil, h5: nil, h6: nil }

      headers.each do |header|
        level = header.name[1].to_i
        current_headers[:"h#{level}"] = { text: header.text, children: [] }

        if level > 1
          parent = current_headers[:"h#{level - 1}"]
          parent[:children] << current_headers[:"h#{level}"] if parent
        else
          headers_tree << current_headers[:"h#{level}"]
        end
      end
    end
  end

  headers_tree
end

def print_headers_tree(headers_tree, level = 0)
  headers_tree.each do |header|
    puts "#{'  ' * level}#{'#' * (level + 1)} #{header[:text]}"
    print_headers_tree(header[:children], level + 1) if header[:children].any?
  end
end

epub_file = 'path_to_your_epub_file.epub'
headers_tree = extract_headers_from_epub(epub_file)
print_headers_tree(headers_tree)
```

This script will print the headers in a tree-like structure, similar to what you described. The `extract_headers_from_epub` function extracts the headers and organizes them in a tree structure. The `print_headers_tree` function then prints this tree structure.

Again, keep in mind that EPUBs can have varying structures, so this script might need adjustments depending on the specific structure and styling of the EPUB file you're working with.

Is this something easier done with epub?

Working with EPUB files can be a bit tricky because they are essentially zipped collections of HTML files, stylesheets, and metadata. The structure and styling can vary significantly between different EPUB files, depending on how they were created.

If your goal is to extract a tree-like structure of headers

Is this something easier done with bash/pandoc?

Yes, using `pandoc` can simplify this task, especially if you're looking to convert the EPUB content into a markdown format. `pandoc` is a powerful document converter that can handle a variety of formats, including EPUB and Markdown.

Here's a basic approach using `pandoc` and `bash`:

1. Convert the EPUB to Markdown:

```bash
pandoc input.epub -o output.md
```

2. If you only want the headers, you can use `grep`:

```bash
grep '^#\+' output.md
```

This will print lines that start with one or more `#` characters, which in Markdown indicates headers.

However, note that the quality of the conversion can vary depending on the complexity and structure of the EPUB. Some EPUBs might convert perfectly, while others might require some manual cleanup.