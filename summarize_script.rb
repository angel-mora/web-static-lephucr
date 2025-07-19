require 'json'
require 'yaml'
require 'fileutils'
require 'date'

# === Settings ===
input_file = 'conversations.json'
output_dir = 'content/chatgpt_history'

FileUtils.mkdir_p(output_dir)

# === Utility functions ===
def sanitize_title(title)
  title.downcase.strip.gsub(/[^\w\s-]/, '').gsub(/\s+/, '-')[0..60]
end

def extract_todos(text)
  text.scan(/(?:TODO|todo|to do)[:\-]?\s*(.+)/i).flatten.map(&:strip).uniq
end

def extract_tags(text)
  text.scan(/#\w+/).map { |t| t.downcase }.uniq
end

def generate_summary(text)
  text.split("\n").first(3).join(" ").strip
end

def to_frontmatter(title, tags, date)
  {
    'title' => title,
    'tags' => tags.map { |t| t.gsub('#', '') },
    'created' => date.iso8601,
    'updated' => date.iso8601,
    'summary' => nil,
    'draft' => false
  }.to_yaml + "---\n"
end

# === Main processor ===
data = JSON.parse(File.read(input_file))

data.each_with_index do |chat, idx|
  title = chat["title"] || "chat-#{idx}"
  sanitized = sanitize_title(title)
  chunks = chat["mapping"].values.map { |m| m.dig("message", "content", "parts") }.compact.flatten
  body = chunks.join("\n\n")

  todos = extract_todos(body)
  tags = extract_tags(body)
  summary = generate_summary(body)

  frontmatter = to_frontmatter(title, tags, Date.today)
  content = <<~MD
    #{frontmatter}
    # #{title}

    ## ✅ TODOs
    #{todos.map { |t| "- [ ] #{t}" }.join("\n") unless todos.empty?}

    ## 📌 Summary
    #{summary}

    ## 🧠 Full Chat
    #{body}
  MD

  file_path = File.join(output_dir, "#{sanitized}.md")
  File.write(file_path, content.strip)
end

puts "✅ Exported #{data.size} chats to #{output_dir}/"
