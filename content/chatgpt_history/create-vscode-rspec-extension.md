---
title: '"Create VSCode RSpec Extension"'
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# "Create VSCode RSpec Extension"

## ✅ TODOs
- [ ] this, you can use the VSCode API to create a TextDocumentContentProvider that scans the current file for RSpec context/describe blocks and generates breadcrumb items for them.
- [ ] this, you will need to create an account on the VSCode marketplace and follow their instructions for publishing a new extension.

## 📌 Summary
I want to write a bredcrumbs extension for rspec context/describe blocks in vscode

## 🧠 Full Chat


I want to write a bredcrumbs extension for rspec context/describe blocks in vscode

Great! Writing a breadcrumbs extension for RSpec context/describe blocks in VSCode can be a useful tool for developers who use RSpec for testing their Ruby code. Here are the steps you can follow to create this extension:

1. Install the necessary dependencies: You will need to install the VSCode extension development kit and the RSpec Ruby gem. You can install the VSCode extension development kit by running `npm install -g yo generator-code` in your terminal, and the RSpec gem by running `gem install rspec` in your terminal.

2. Create a new VSCode extension: Open a terminal window and run `yo code` to create a new VSCode extension. Follow the prompts to name your extension, choose the language (TypeScript or JavaScript), and set up the extension's directory structure.

3. Implement breadcrumbs functionality: To implement the breadcrumbs functionality, you will need to create a provider that generates breadcrumb items for RSpec context/describe blocks. To do this, you can use the VSCode API to create a TextDocumentContentProvider that scans the current file for RSpec context/describe blocks and generates breadcrumb items for them.

4. Test your extension: Once you've implemented the breadcrumbs functionality, you can test your extension by launching a new VSCode window and opening a Ruby file that contains RSpec context/describe blocks. You should see breadcrumb items appear in the VSCode breadcrumbs bar when you hover over the RSpec context/describe blocks in the file.

5. Publish your extension: Once you're satisfied with your extension, you can publish it to the VSCode marketplace for others to use. To do this, you will need to create an account on the VSCode marketplace and follow their instructions for publishing a new extension.

I hope these steps are helpful in creating your RSpec breadcrumbs extension for VSCode!