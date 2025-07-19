---
title: Find Files with Regex
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Find Files with Regex

## ✅ TODOs


## 📌 Summary
In nvchad how can I find files by regex when I press SPACE + f + f

## 🧠 Full Chat


In nvchad how can I find files by regex when I press SPACE + f + f

In NvChad, a popular Neovim configuration, you can find files using regular expressions (regex) by using the built-in Telescope functionality. To achieve this after pressing `SPACE + f + f`, which is the default keybinding to open Telescope's file finder, you can follow these steps:

1. **Open Telescope File Finder**:
   - Press `SPACE + f + f` to open the Telescope file finder.

2. **Enter Regex Mode**:
   - By default, Telescope's file finder uses fuzzy finding. To use regex, you'll need to switch to regex mode. This can usually be done by pressing a specific key combination or entering a command. However, NvChad's default configuration might not have a direct keybinding for this.

3. **Enter Your Regex Query**:
   - Once in regex mode, you can start typing your regex pattern. Telescope will dynamically filter the file list based on your regex pattern.

4. **Select the Desired File**:
   - Navigate through the filtered list and select the file you want to open.

If NvChad does not have a direct keybinding or mode for regex searching within Telescope, you might need to customize your NvChad configuration. This would involve editing the Telescope setup in your Neovim configuration files, usually found in `~/.config/nvim/lua/core/telescope.lua` or a similar path.

For more specific instructions or troubleshooting, consulting the NvChad and Telescope documentation is recommended, as they provide detailed information on customization and available features. Additionally, the NvChad community, found on platforms like GitHub or Discord, can be a valuable resource for personalized assistance.

So telescope also handles SPC f w ? I'd like to get the vscode functionality of search a pattern in specific files

Telescope, an extensible fuzzy finder over lists, is indeed a powerful tool in the Neovim ecosystem, and it can be used to achieve functionality similar to VSCode's pattern search in specific files. However, the exact keybindings may vary based on your Neovim configuration, especially if you are using a customized setup like NvChad.

For a feature similar to VSCode's search in specific files (where you can search for a pattern within files that match a certain pattern), you would generally use Telescope's `live_grep` functionality or a similar command. This allows you to search for text within files across your project.

Here's how you can typically use it:

1. **Open Live Grep**:
   - In a default Telescope setup, you might use a keybinding like `SPACE + f + g` to open `live_grep`. In NvChad, this might be different, and you should check your keybindings.

2. **Enter Your Search Pattern**:
   - After invoking `live_grep`, you can type the text pattern you're looking for. This search is not limited to a specific file or file type initially.

3. **Refine Search to Specific Files**:
   - Some configurations of Telescope allow you to refine your grep search to specific file types or names. This might involve additional commands or a specific syntax in the search bar.

If you want functionality that specifically matches VSCode's "search a pattern in specific files" (where you first specify the file pattern and then the text pattern), you might need to customize your Telescope setup. This could involve writing a custom Telescope picker or modifying an existing one to first filter files by a given pattern and then perform a text search within those files.

For exact details on how to achieve this in your NvChad setup, you would need to consult the NvChad and Telescope documentation. Also, exploring the community resources (like GitHub repositories, Discord channels, or forums) where experienced users and developers discuss such customizations can be very helpful.