---
title: NvChad Image Preview Setup
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# NvChad Image Preview Setup

## ✅ TODOs


## 📌 Summary
best image preview for nvchad

## 🧠 Full Chat


best image preview for nvchad



For an optimal image preview setup in **NvChad**, a popular Neovim configuration framework, you'll want to leverage plugins and settings that enhance the visual representation of images directly in your Neovim setup. Here’s a step-by-step guide to setting up image previews in NvChad:

### 1. Install an Image Preview Plugin

**Neovim** doesn’t natively support displaying images, but plugins like **[chrisbra/Colorizer](https://github.com/chrisbra/Colorizer)** can be used to preview images in a terminal-based environment. Another option is **[felipec/vim-image-viewer](https://github.com/felipec/vim-image-viewer)**, which uses terminal escape codes to display images.

To install a plugin in **NvChad**, follow these steps:

- Open your NvChad configuration file, typically located at `~/.config/nvim/lua/plugins.lua`.
- Add the plugin to the list under `user.plugins`:

```lua
user.plugins = {
  -- other plugins
  {
    "felipec/vim-image-viewer",
    config = function()
      -- Optional: add any configuration settings here
    end
  },
}
```

### 2. Configure the Plugin

After adding the plugin, you need to ensure it's properly configured for image preview:

```lua
-- Example configuration for vim-image-viewer:
vim.g.image_viewer_command = "ueberzug"  -- 'ueberzug' is recommended for image previews in terminal
vim.g.image_viewer_position = "top"  -- Positioning: 'top', 'bottom', 'left', 'right'
```

### 3. Additional Setup for Image Previews

You may need to install additional tools to enable image previews effectively. For instance:

- **[Ueberzug](https://github.com/seebye/ueberzug)**: A tool for displaying images in terminal emulators. Install it using your package manager:

  ```bash
  sudo apt install ueberzug
  ```

  Then, configure `vim-image-viewer` to use it, as shown in the plugin configuration above.

### 4. Use the Plugin

After installation and configuration, you can open an image file in Neovim to see the preview. Simply use the `:ImageViewer` command:

```vim
:ImageViewer
```

This command will render the image preview in your terminal, allowing you to see images while using Neovim.

### 5. Customize to Your Preferences

You might want to customize the plugin further, like setting keybindings or choosing a specific position for image previews. Check the plugin documentation for more details and customization options.

By following these steps, you should have a good setup for image previews in **NvChad**. Enjoy a more visually enriched Neovim experience!