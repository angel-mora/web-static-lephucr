---
title: Neovim Tree-sitter Highlight Error
tags:
- update
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Neovim Tree-sitter Highlight Error

## ✅ TODOs
- [ ] it from the github repository
- [ ] this:
- [ ] so
- [ ] wnload the font you want. For this example, I'll use the "FiraCode Nerd Font," but you can choose any other font from the Nerd Fonts collection.

## 📌 Summary
Error in decoration provider treesitter/highlighter.win:

## 🧠 Full Chat


Error in decoration provider treesitter/highlighter.win:
Error executing lua: /usr/local/share/nvim/runtime/lua/vim/treesitter/query.lua:248: Query error at 9:4. Invalid node type "heredoc_end":
  (heredoc_end) @injection.language)
   ^

stack traceback:
        [C]: in function '_ts_parse_query'
        /usr/local/share/nvim/runtime/lua/vim/treesitter/query.lua:248: in function 'fn'
        /usr/local/share/nvim/runtime/lua/vim/func/_memoize.lua:54: in function 'fn'
        /usr/local/share/nvim/runtime/lua/vim/func/_memoize.lua:54: in function 'get'
        ...l/share/nvim/runtime/lua/vim/treesitter/languagetree.lua:132: in function 'new'
        ...l/share/nvim/runtime/lua/vim/treesitter/languagetree.lua:503: in function 'add_child'
        ...l/share/nvim/runtime/lua/vim/treesitter/languagetree.lua:388: in function '_add_injections'
        ...l/share/nvim/runtime/lua/vim/treesitter/languagetree.lua:440: in function 'parse'
        ...al/share/nvim/runtime/lua/vim/treesitter/highlighter.lua:328: in function <...al/share/nvim/runtime/lua/vim/treesitter/highlighter.lua

The error you're seeing is related to Neovim's Tree-sitter integration, specifically the highlighting module. The error message indicates that there's an issue with a Tree-sitter query that's trying to match a node type named "heredoc_end", which apparently doesn't exist or isn't recognized in the grammar of the language you're working with.

Here's how you can troubleshoot and potentially fix the issue:

1. **Identify the Language**: First, identify which language's Tree-sitter grammar is causing the issue. The error message doesn't specify this, but you can usually deduce it from the context in which the error occurred.

2. **Check the Query File**: Neovim uses `.scm` (Scheme) files to define Tree-sitter queries for various features like highlighting, indentation, etc. Locate the `.scm` file for the problematic language, which should be somewhere in your Neovim configuration or in a plugin directory. Look for a line that contains `(heredoc_end) @injection.language` and inspect it.

3. **Update Plugins and Tree-sitter Grammars**: It's possible that the error is due to outdated plugins or Tree-sitter grammars. Update your plugins and Tree-sitter grammars to their latest versions. If you're using a plugin manager like `vim-plug`, you can do this with commands like `:PlugUpdate`.

4. **Check for Custom Queries**: If you have custom Tree-sitter queries defined in your Neovim configuration, ensure they are correct and compatible with the current version of the Tree-sitter grammar for the language in question.

5. **Report or Check for Known Issues**: If you can't resolve the issue yourself, it might be a bug or a known issue. Check the GitHub repositories of Neovim, the Tree-sitter grammar for the language, or any related plugins for reported issues. If you don't find a related issue, consider reporting it yourself with a detailed description and the error message.

6. **Temporary Workaround**: If you can't immediately fix the issue and it's disrupting your workflow, you can temporarily disable Tree-sitter highlighting for the problematic language. This isn't a solution, but it can help you continue working until you find a fix.

Remember, the Tree-sitter integration in Neovim is powerful and offers great syntax highlighting and other features, but it relies on a combination of Neovim's implementation, Tree-sitter grammars for various languages, and possibly custom queries. Any of these components can introduce issues, so it's a matter of identifying which component is causing the problem and addressing it.

I'm usign WSL. I think it uses lazy as package manager

If you're using WSL (Windows Subsystem for Linux), it doesn't come with a package manager named "lazy." WSL allows you to run a Linux distribution alongside your existing Windows installation. Each Linux distribution has its own package manager:

- Ubuntu uses `apt`
- Fedora uses `dnf`
- openSUSE uses `zypper`
- Debian uses `apt`
- ... and so on.

However, if you're referring to a specific tool or setup within a particular WSL distribution, please provide more context.

If you're trying to update or manage packages within your WSL distribution, you'd typically use the package manager associated with that distribution. For example, if you're using Ubuntu on WSL, you'd use:

```bash
sudo apt update
sudo apt upgrade
```

If you're referring to something else or have a different question related to WSL, please clarify, and I'll do my best to assist you!

How can I update nvim-lua?

If you're referring to updating Neovim with its Lua integration or plugins related to Lua in Neovim, here's what you can do:

1. **Update Neovim**: Neovim has built-in Lua support, and if you want to update Neovim itself, you'll use the package manager of your system.

   For example, on Ubuntu (or WSL with Ubuntu):

   ```bash
   sudo apt update
   sudo apt upgrade neovim
   ```

   If you installed Neovim using another method, like building from source, you'd need to follow the update process for that method.

2. **Update Lua Plugins**: If you're using a plugin manager for Neovim, you can update your plugins using that manager.

   - For `vim-plug`:

     ```vim
     :PlugUpdate
     ```

   - For `dein.vim`:

     ```vim
     :call dein#update()
     ```

   - For `packer.nvim`:

     ```vim
     :PackerUpdate
     ```

3. **Update Treesitter Parsers**: If you're using Tree-sitter with Neovim, you might want to update the Tree-sitter parsers for various languages. This is often done with a command like:

   ```vim
   :TSUpdate
   ```

4. **Check Neovim's Lua Version**: Neovim embeds its own version of Lua, so you don't need to update Lua separately for Neovim. If you want to check the version of Lua that Neovim is using, you can run:

   ```vim
   :echo has('nvim-0.5')
   ```

   If it returns `1`, then you're using Neovim 0.5 or newer, which has improved Lua integration.

5. **Update Lua Libraries**: If you've installed specific Lua libraries for use with Neovim (e.g., using `luarocks`), you'd update those libraries using the tools and processes specific to that installation method.

If you have a more specific aspect of "nvim-lua" you're referring to, or if there's a particular issue you're facing, please provide more details, and I'll be happy to help further!

I want to do it from the github repository

If you want to update Neovim from the GitHub repository, you're essentially looking to build Neovim from source. Here's a step-by-step guide on how to do this:

1. **Clone the Neovim Repository (if you haven't already)**:
   ```bash
   git clone https://github.com/neovim/neovim.git
   cd neovim
   ```

   If you've already cloned the repository before, navigate to the directory and pull the latest changes:
   ```bash
   cd neovim
   git pull
   ```

2. **Install Build Dependencies**:
   
   For Ubuntu (or WSL with Ubuntu):
   ```bash
   sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
   ```

   The exact packages might vary depending on your distribution. Check the Neovim GitHub repository's build instructions for details specific to your distribution.

3. **Build Neovim**:

   From the `neovim` directory:
   ```bash
   make clean
   make CMAKE_BUILD_TYPE=Release
   sudo make install
   ```

   This will build Neovim and install it. By default, it gets installed to `/usr/local/bin/nvim`.

4. **Verify the Installation**:

   After installation, you can verify the version of Neovim:
   ```bash
   nvim --version
   ```

   This should show the latest version you've just built from the GitHub repository.

5. **Update Plugins**:

   If you're using any plugins, it's a good idea to update them as well, especially if there have been significant changes or updates to Neovim. Use your plugin manager to update the plugins.

Remember, when you build from source, you're getting the absolute latest version, which might include changes that are not yet in stable releases. While this means you get the latest features and fixes, it also means you might encounter new bugs or issues. Always check the Neovim GitHub repository for any known issues or updates.

I just want to pull nvim-lua github repo

Ah, I see. If you're referring to a specific GitHub repository related to Neovim's Lua functionality or a plugin, and you want to update it by pulling the latest changes, here's a general approach:

1. **Navigate to the Repository's Directory**:
   
   First, navigate to the directory where you've cloned the repository. For example:

   ```bash
   cd path/to/nvim-lua
   ```

   Replace `path/to/nvim-lua` with the actual path to the directory.

2. **Pull the Latest Changes**:

   Once you're in the directory:
   ```bash
   git pull
   ```

   This will fetch the latest changes from the default remote (usually `origin`) and the default branch (often `main` or `master`).

3. **Handle Submodules (if any)**:

   If the repository uses Git submodules:
   ```bash
   git submodule update --init --recursive
   ```

   This ensures that any submodules are also updated to their latest versions.

4. **Rebuild or Reinstall (if necessary)**:

   Depending on the nature of the repository, you might need to rebuild or reinstall something after pulling the latest changes. Refer to the repository's README or documentation for any post-update steps.

If you're referring to a specific GitHub repository and need more tailored instructions, please provide the exact repository URL or name, and I can guide you further.

what is the actual path in nvchad?

[NvChad](https://github.com/NvChad/NvChad) is an opinionated Neovim configuration that uses Lua for configuration and extension. If you've installed NvChad, it will typically reside in the Neovim configuration directory.

For a standard installation, the path would be:

```
~/.config/nvim
```

If you want to update NvChad to the latest version, you would:

1. Navigate to the NvChad directory:

```bash
cd ~/.config/nvim
```

2. Pull the latest changes:

```bash
git pull
```

3. If NvChad uses submodules or has made updates to them:

```bash
git submodule update --init --recursive
```

4. After updating, it's a good idea to also update the plugins managed by NvChad's plugin manager (packer.nvim):

Open Neovim:

```bash
nvim
```

And then in Neovim:

```vim
:PackerUpdate
```

This will ensure that all plugins are also updated to their latest versions.

Remember to check NvChad's official documentation or GitHub repository for any additional update instructions or changes.

I see nvim lua not loaded

If you're seeing an issue where Neovim's Lua integration isn't working or "Lua not loaded" with NvChad or any other configuration, there could be several reasons. Here's how you can troubleshoot and potentially resolve the issue:

1. **Verify Neovim Version**: Neovim's Lua integration is a feature of Neovim 0.5 and later. Ensure you're using Neovim 0.5 or a newer version:

   ```bash
   nvim --version
   ```

   If you're using an older version, consider updating Neovim.

2. **Check Your `init.vim` or `init.lua`**: Ensure that your Neovim configuration is correctly set up to use Lua. If you're using `init.vim`, you might have a line like:

   ```vim
   lua require'config_name'
   ```

   Ensure that this line points to the correct Lua configuration file.

3. **Lua Errors**: If there's an error in one of your Lua configuration files, Neovim might fail to load it. Launch Neovim and check for any error messages. They can give you clues about what's wrong.

4. **Check NvChad Configuration**: If you're using NvChad, ensure that you've followed all the installation steps correctly. NvChad heavily relies on Lua for configuration, so any missteps during installation or configuration can lead to issues.

5. **Reinstall NvChad**: Consider reinstalling NvChad. Sometimes, starting fresh can resolve any lingering issues:

   - Backup your current Neovim configuration:
     ```bash
     mv ~/.config/nvim ~/.config/nvim_backup
     ```

   - Follow the [NvChad installation instructions](https://github.com/NvChad/NvChad/wiki/Installation) again.

6. **Lua Path Issues**: Neovim uses its own embedded Lua interpreter. If there are issues with the Lua `package.path` or `package.cpath`, it might cause problems. You can check these paths by launching Neovim and running:

   ```vim
   :lua print(package.path)
   :lua print(package.cpath)
   ```

   Ensure that these paths are correctly set and don't have any conflicts.

7. **Check for Plugin Conflicts**: Sometimes, plugins can conflict with each other or with Neovim's core functionality. Consider disabling plugins one by one to see if one of them is causing the issue.

8. **Consult NvChad Community**: If you're still facing issues, consider reaching out to the NvChad community. They might have insights into specific issues related to the configuration.

Remember, when troubleshooting, it's essential to make changes incrementally and test after each change. This way, you can pinpoint the exact cause of the issue.

the error only happens under a typescript folder

If the error is specific to a TypeScript folder, it's likely related to a TypeScript-specific plugin or configuration in Neovim. Here's how you can narrow down and potentially resolve the issue:

1. **TypeScript Plugin**: If you have a TypeScript-specific plugin (e.g., `nvim-treesitter`, `typescript-vim`, `nvim-lspconfig` with TypeScript server, etc.), it might be the source of the issue.

   - **Update the Plugin**: Ensure that your TypeScript plugin and any related plugins are up-to-date. Sometimes, issues are fixed in newer versions of plugins.

   - **Check Plugin Configuration**: Ensure that the configuration for the TypeScript plugin is correct. For example, if you're using the TypeScript language server with `nvim-lspconfig`, ensure that the server is correctly installed and configured.

2. **Treesitter**: If you're using `nvim-treesitter` for syntax highlighting and other features, the Treesitter parser for TypeScript might be causing the issue.

   - **Update Treesitter Parsers**: In Neovim, run:
     ```vim
     :TSUpdate
     ```
     This will update the Treesitter parsers, including the one for TypeScript.

   - **Check Treesitter Configuration**: Ensure that your Treesitter configuration for TypeScript is correct.

3. **Neovim LSP**: If you're using Neovim's built-in LSP with a TypeScript language server (e.g., `tsserver`), there might be an issue with the LSP configuration or the server itself.

   - **Check LSP Logs**: Neovim's LSP logs can provide insights into what's going wrong. You can view the logs with:
     ```vim
     :lua vim.lsp.log.get_logs()
     ```

   - **Reinstall `tsserver`**: If you're using `tsserver`, consider reinstalling it:
     ```bash
     npm install -g typescript
     ```

4. **Filetype Detection**: Ensure that Neovim correctly detects TypeScript files. In Neovim, open a TypeScript file and run:
   ```vim
   :set filetype?
   ```
   It should return `filetype=typescript`. If not, there might be an issue with filetype detection.

5. **Minimal Configuration**: To pinpoint the issue, consider creating a minimal Neovim configuration that only loads the TypeScript-related plugins and configurations. If the error doesn't occur with the minimal configuration, you can gradually add back other parts of your configuration to identify the culprit.

6. **Check for Errors**: Open a TypeScript file in Neovim and check for any error messages. These messages can provide clues about the source of the problem.

7. **Consult Plugin Documentation/Community**: If you've identified a specific plugin as the source of the issue, check its documentation or GitHub repository for known issues. The plugin's community or maintainers might have insights or fixes for the problem.

By narrowing down the potential sources of

fixed it with TSInstall all. Now, I want to install a font that renders all kinds of icons from nvchad in wsl. Provide commands to do so

To render icons properly in Neovim (like those used by NvChad), you'll typically need a patched font that includes the necessary glyphs. One popular choice is the Nerd Fonts collection, which patches multiple fonts to include a variety of glyphs.

Here's how you can install a Nerd Font for use in WSL:

1. **Download the Font**:
   
   First, you'll need to download the font you want. For this example, I'll use the "FiraCode Nerd Font," but you can choose any other font from the Nerd Fonts collection.

   In your WSL terminal:

   ```bash
   wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
   ```

   This will download the FiraCode Nerd Font. Adjust the URL if you want a different font.

2. **Unzip the Font**:

   ```bash
   unzip FiraCode.zip -d FiraCodeNerdFont
   ```

3. **Install the Font**:

   Fonts in WSL need to be installed on the Windows side to be usable in Windows Terminal or any other terminal emulator you're using.

   - Navigate to the directory where you unzipped the font.
   - Find the `.ttf` files (TrueType font files).
   - For each `.ttf` file, right-click and choose "Install" to install the font on Windows.

4. **Configure Your Terminal**:

   After installing the font, you'll need to configure your terminal emulator to use it.

   - If you're using **Windows Terminal**:
     - Open Windows Terminal settings (usually by clicking the down arrow in the tab bar and selecting "Settings").
     - Find the profile for your WSL distribution.
     - Set the `fontFace` setting to the name of the Nerd Font you installed, e.g., `"fontFace": "FiraCode Nerd Font"`.

   - If you're using another terminal emulator, consult its documentation to change the font.

5. **Restart Your Terminal**:

   Close and reopen your terminal to see the changes.

Now, when you open Neovim with NvChad in WSL, it should correctly display all icons and glyphs. If some icons still don't render correctly, ensure that the specific icons are part of the Nerd Font you chose, or consider trying a different Nerd Font.

how to verify the font used in wsl (ubuntu command)

In WSL (Windows Subsystem for Linux), the font used to display the terminal's content is determined by the terminal emulator you're using on Windows, not by WSL or Ubuntu itself. For example, if you're using Windows Terminal, Alacritty, ConEmu, or any other terminal emulator, the font settings will be in that specific application.

However, if you want to check the font settings for terminal applications within WSL (like the font used in `tmux` or `screen`), you'd typically check their configuration files.

To verify the font used in the terminal emulator:

1. **Windows Terminal**:
   - Open Windows Terminal settings (usually by clicking the down arrow in the tab bar and selecting "Settings").
   - Find the profile for your WSL distribution.
   - Look for the `fontFace` setting. This will tell you the font being used.

2. **Other Terminal Emulators**:
   - For other terminal emulators, you'd need to check their specific settings or configuration files.

If you're trying to verify the font settings of a specific application within WSL:

1. **Tmux**:
   - Check the `~/.tmux.conf` file for any font settings (though tmux itself doesn't directly handle fonts; it's more about styling).

2. **Vim or Neovim**:
   - While Vim or Neovim doesn't directly control the terminal font, they can use specific fonts for GUI versions or when specifying fonts for certain plugins. Check the configuration files (`~/.vimrc` or `~/.config/nvim/init.vim`) for any font-related settings.

3. **Terminal-based Text User Interfaces (TUI)**:
   - Some TUI applications might have font or glyph settings in their configuration. Check the specific application's documentation or configuration files.

Remember, in most cases, the font you see in WSL is determined by the Windows-side terminal emulator, not by any setting within WSL or Ubuntu itself.

why do I have two profiles for ubuntu? Can I delete one? One of them goes to C:\WINDOWS\system32\wsl.exe -d Ubuntu and the other to ubuntu.exe

If you see two profiles for Ubuntu in your terminal emulator (e.g., Windows Terminal), it's likely because:

1. **Default WSL Profile**: One profile is the default profile created by the terminal emulator for WSL. This profile typically uses the `wsl.exe -d Ubuntu` command to launch the Ubuntu distribution.

2. **Ubuntu App Profile**: The other profile is created when you install the Ubuntu app from the Microsoft Store. This app registers itself as `ubuntu.exe`, which is a shortcut to launch the same Ubuntu distribution.

Both commands essentially do the same thing: they launch the Ubuntu distribution in WSL. However, they are different entry points.

### Can You Delete One?

Yes, you can delete one of the profiles if you find it redundant. Here's how you can do it for Windows Terminal:

1. Open Windows Terminal.
2. Click on the dropdown arrow (next to the tabs) and select "Settings." This will open the `settings.json` file for Windows Terminal in your default text editor.
3. In the `profiles` section, you'll see a list of profiles. Find the two profiles for Ubuntu.
4. Delete the entire profile block (including the curly braces `{}`) for the profile you don't want. Ensure you don't leave any trailing commas that might invalidate the JSON format.
5. Save the `settings.json` file and close it.
6. Restart Windows Terminal, and you should see only one profile for Ubuntu.

Remember to be careful while editing the `settings.json` file. Any syntax errors (like missing commas or extra commas) can cause Windows Terminal to not load correctly. Always keep a backup of the file before making changes.

but which is the one I could safely remove?

Both `wsl.exe -d Ubuntu` and `ubuntu.exe` are essentially different entry points to the same Ubuntu distribution in WSL. Therefore, from a functionality standpoint, you can safely remove either profile without affecting the underlying WSL Ubuntu distribution.

However, here are some considerations:

1. **`wsl.exe -d Ubuntu`**:
   - This is a more generic way to launch a WSL distribution. The `-d Ubuntu` flag specifies the Ubuntu distribution. If you have multiple WSL distributions installed, you can replace `Ubuntu` with the name of another distribution (e.g., `Debian`, `openSUSE`, etc.) to launch it.
   - It's more explicit in specifying which distribution to launch, especially useful if you have multiple WSL distributions.

2. **`ubuntu.exe`**:
   - This is a convenience shortcut created when you install the Ubuntu app from the Microsoft Store.
   - It's specific to the Ubuntu distribution. If you only have Ubuntu and no other WSL distributions, this might feel more straightforward.

### Recommendation:

If you're unsure which to remove and want a more flexible approach for potential future WSL distributions, consider removing the `ubuntu.exe` profile and keeping the `wsl.exe -d Ubuntu` profile. This way, if you ever install another WSL distribution, you can easily add a profile for it using the same `wsl.exe -d` format.

However, if you're confident that you'll only be using the Ubuntu distribution and prefer the simplicity of the dedicated executable, you can remove the `wsl.exe -d Ubuntu` profile and keep the `ubuntu.exe` profile.

Ultimately, the choice is yours, and either option is safe in terms of not affecting the actual WSL Ubuntu installation.