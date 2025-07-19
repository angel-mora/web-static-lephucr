---
title: Vim VSCode Shortcuts Guide
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Vim VSCode Shortcuts Guide

## ✅ TODOs
- [ ] it:

## 📌 Summary
common commands in vim to replace vscode (to replace things in vscode like shift option i, cmd shift l, cmd option to select multiple lines, etc). I want to get the shortcuts to work as smooth as possible

## 🧠 Full Chat


common commands in vim to replace vscode (to replace things in vscode like shift option i, cmd shift l, cmd option to select multiple lines, etc). I want to get the shortcuts to work as smooth as possible

Certainly! Vim is a powerful text editor with a steep learning curve, but once you get the hang of it, you can be incredibly efficient. Here's a list of Vim commands and shortcuts that can help you achieve similar functionality to some of the common VSCode shortcuts:

1. **Multiple Cursor Selection (like `Cmd+Option+Down` in VSCode)**:
    - Vim doesn't have native multi-cursor support like VSCode. However, there's a popular plugin called `vim-multiple-cursors` that can provide similar functionality. Once installed, you can use:
        - `Ctrl-n` to start multi-cursor and select the next match.
        - `Ctrl-p` to remove the last cursor.
        - `Ctrl-x` to skip the next match.

2. **Select All Occurrences of Current Selection (like `Cmd+Shift+L` in VSCode)**:
    - With `vim-multiple-cursors`, after selecting a word, you can press `Ctrl-n` repeatedly to select all occurrences.

3. **Insert at the Beginning/End of a Line (like `Shift+Option+I` in VSCode)**:
    - To insert at the beginning of a line: `^i` or `0i`.
    - To insert at the end of a line: `$a`.

4. **Select Multiple Lines**:
    - Enter visual mode with `v`.
    - Move up or down to select multiple lines using `j` or `k`.
    - To select entire blocks of code or paragraphs, you can use `V` for line-wise visual mode.

5. **Find and Replace**:
    - To replace all occurrences of a word in a document:
        ```vim
        :%s/oldword/newword/g
        ```
    - To replace all occurrences in a selection:
        - First, select the lines in visual mode (`v` or `V`).
        - Then type `:s/oldword/newword/g`.

6. **Go to a Specific Line Number**:
    - `:123` to go to line 123.

7. **Move to the Beginning/End of the Document**:
    - `gg` to move to the beginning.
    - `G` to move to the end.

8. **Undo and Redo**:
    - `u` to undo.
    - `Ctrl-r` to redo.

9. **Split Windows**:
    - Horizontal split: `:split` or `:sp`.
    - Vertical split: `:vsplit` or `:vsp`.

10. **Switch Between Splits**:
    - `Ctrl-w h` to move to the left window.
    - `Ctrl-w j` to move to the window below.
    - `Ctrl-w k` to move to the window above.
    - `Ctrl-w l` to move to the right window.

Remember, Vim's power comes from its modal nature and the ability to combine commands. It might take some time to get used to, but once you do, you'll find it to be a very efficient way to navigate and edit text. If you're looking to replicate the exact feel and functionality of VSCode, you might also consider using the Vim extension in VSCode, which allows you to use Vim keybindings within the VSCode environment.

How to add an enter? Do i need to insert mode?

In Vim, to insert a newline (or "enter"), you typically enter insert mode. Here's how you can do it:

1. **Inserting a Newline Below the Current Line**:
    - Press `o` (lowercase 'o'). This will open a new line below the current line and put you in insert mode.

2. **Inserting a Newline Above the Current Line**:
    - Press `O` (uppercase 'O'). This will open a new line above the current line and put you in insert mode.

3. **Inserting a Newline in the Middle of a Line**:
    - Navigate to where you want to break the line.
    - Press `i` to enter insert mode.
    - Press `Enter` or `Return` to insert the newline.

After you've added your newline(s), you can press `Esc` to return to normal mode.

how can I add indentation to a block of code?

In Vim, you can easily add indentation to a block of code using the following steps:

1. **Select the Block of Code**:
    - Move to the start of the block.
    - Press `V` to start line-wise visual selection.
    - Move to the end of the block using the arrow keys or `j`/`k` to move down/up.

2. **Indent the Block**:
    - Press `>` to shift the block to the right (increase indentation).
    - Press `<` to shift the block to the left (decrease indentation).

3. **Indent Multiple Times**:
    - After selecting the block, you can press `.` (dot) to repeat the last indentation command. For example, if you pressed `>` once to indent, and then press `.` three times, the block will be indented four times in total.

4. **Using Counts**:
    - After selecting the block, you can use a count before the `>` or `<` to indent multiple times. For example, `3>` will indent the block three levels to the right.

5. **Indent Using `=`**:
    - If you have a block of code and you want Vim to auto-indent it based on your `filetype` and indentation settings, you can use the `=` command. After selecting the block in visual mode, simply press `=` and Vim will auto-indent the block.

6. **Set Indentation Level**:
    - Ensure you have the correct indentation settings. For example, to set an indentation level of 4 spaces, you can use:
        ```vim
        :set shiftwidth=4
        :set expandtab
        ```
    - `shiftwidth` sets the number of spaces for each level of indentation.
    - `expandtab` ensures that spaces are used instead of tabs.

Remember, Vim is highly customizable, and there are many plugins and configurations available to enhance and modify its behavior. Adjust the settings to fit your coding style and preferences.

:s%/{ name/BreadcrumbsItemComponent.new(name/g does not work

It seems you have a typo in your Vim substitution command. The correct syntax for a substitution command in Vim is:

```
:[range]s/pattern/replacement/[flags]
```

From your command, it looks like you're trying to replace occurrences of `{ name` with `BreadcrumbsItemComponent.new(name`. Here's the corrected command:

```vim
:%s/{ name/BreadcrumbsItemComponent.new(name/g
```

Here's a breakdown:

- `%`: This specifies the range, which in this case is the entire file.
- `s`: This is the substitution command.
- `/{ name`: This is the pattern you're looking for.
- `/BreadcrumbsItemComponent.new(name`: This is what you're replacing the pattern with.
- `/g`: This flag means "global", so the substitution will replace all occurrences in each line, not just the first.

If you execute the above command, it should work as expected.

I select a /pattern, then how can I indent all matches

If you want to indent lines that match a specific pattern in Vim, you can use the `:global` command combined with the `>` command for indentation. Here's how you can do it:

1. **Indent Lines Matching a Pattern**:
   ```vim
   :g/pattern/normal >
   ```

   This command will find each line matching `pattern` and then apply the `>` command to indent that line.

2. **Indent Multiple Times**:
   If you want to indent each matching line by more than one level, you can repeat the `>` command the desired number of times. For example, to indent by two levels:
   ```vim
   :g/pattern/normal >>
   ```

3. **Un-indent (or Dedent) Lines Matching a Pattern**:
   If you want to reduce the indentation of lines matching a pattern, you can use the `<` command:
   ```vim
   :g/pattern/normal <
   ```

Remember to ensure your `shiftwidth` setting in Vim is set to your desired level of indentation (e.g., `:set shiftwidth=4` for 4 spaces).

select multiple lines and then go to the last char in the line (I am attempting to add a final } to those lines matching the pattern title: ANY_STRING followed by ) so ends up like title: ANY_STRING})

If you want to select multiple lines matching a pattern and then append a character (or characters) to the end of each of those lines, you can use the `:global` command combined with the `:normal` command in Vim.

Here's how you can achieve your specific requirement:

1. **Append `}` to Lines Matching the Pattern**:
   ```vim
   :g/title: .*)/normal A}
   ```

   Explanation:
   - `:g/title: .*)/`: This selects every line that matches the pattern `title: ANY_STRING)`.
   - `normal`: This tells Vim to execute the following commands as if they were typed in normal mode.
   - `A}`: The `A` command moves the cursor to the end of the line and enters insert mode. The `}` then appends the `}` character to the end of the line.

After executing the above command, every line in your file that matches the pattern `title: ANY_STRING)` will have a `}` appended to its end, resulting in `title: ANY_STRING})`.

what you suggested will give )}

I apologize for the oversight. You're right.

If you want to replace the trailing `)` with `})` on lines matching the pattern `title: ANY_STRING)`, you can use the following substitution command:

```vim
:g/title: .*)./s/)$/})/
```

Explanation:

- `:g/title: .*)./`: This selects every line that matches the pattern `title: ANY_STRING)`.
- `s/)$/})/`: This substitution command looks for a `)` at the end of the line (`$` denotes end of line) and replaces it with `})`.

Executing this command will replace the trailing `)` with `})` on every line that matches the pattern.

Do you know nvchad?



Yes, as of my last update in January 2022, NvChad is a Neovim configuration that aims to make Neovim feel like a full-fledged IDE while still being minimal. It's built on top of the Lua language for configuration and uses various plugins to enhance the Neovim experience. NvChad provides a set of defaults and configurations that make it easier for users to get started with a powerful Neovim setup without having to configure everything from scratch.

NvChad typically includes features like:

- Aesthetic themes and icons.
- Built-in LSP (Language Server Protocol) configurations for code autocompletion, diagnostics, etc.
- Useful keybindings.
- Integration with popular plugins for enhanced functionality.

If you have specific questions about NvChad or need help with its configuration, feel free to ask!

How can I install typescript features in nvchad?

To add TypeScript support to NvChad, you'll primarily need to set up the built-in LSP (Language Server Protocol) for TypeScript. Here's a step-by-step guide to get TypeScript features in NvChad:

1. **Install the TypeScript Language Server**:
   First, you need to have the TypeScript Language Server installed globally. You can do this using npm:
   ```bash
   npm install -g typescript typescript-language-server
   ```

2. **Update NvChad's LSP Configuration**:
   NvChad typically uses `nvim-lspconfig` to configure language servers. You'll need to ensure that the TypeScript server (`tsserver`) is set up.

   Navigate to the directory where your LSP configurations are stored in NvChad. This is typically in a directory like `~/.config/nvim/lua/lsp/`. 

   If there's a file named `tsserver.lua` or similar, it's likely already set up. If not, create or modify the file to include:

   ```lua
   require'lspconfig'.tsserver.setup {
       on_attach = function(client)
           -- This makes sure tsserver is not used for formatting, since NvChad might be using a different formatter
           client.resolved_capabilities.document_formatting = false
           -- Add other custom configurations if needed
       end
   }
   ```

3. **Ensure Proper Plugins for TypeScript**:
   While the LSP will provide features like autocompletion, diagnostics, and hover documentation, you might also want other features like snippets or formatting. Ensure you have plugins like `nvim-compe` for autocompletion and maybe `nvim-treesitter` for enhanced syntax highlighting and indentation.

4. **Formatting**:
   If you want to use a specific formatter for TypeScript, like Prettier, ensure it's installed:

   ```bash
   npm install -g prettier
   ```

   Then, configure NvChad to use Prettier for TypeScript files. This might involve setting up a plugin like `neoformat` or `nvim-lspconfig`'s formatting capabilities.

5. **Restart Neovim**:
   After making these changes, restart Neovim to ensure all configurations are loaded properly.

6. **Test Your Setup**:
   Open a TypeScript file and test the features. You should have autocompletion, diagnostics, hover documentation, etc.

Remember, NvChad's configurations and structure might evolve over time, so it's a good idea to refer to the official NvChad documentation or repository for any recent changes or recommendations related to setting up language servers or other features.

yank multiple lines (6,8) at once in vim



In Vim, to yank (copy) multiple lines, you can use a range with the `y` command. Here's how you can yank lines 6 through 8:

1. **Using the Command Line**:
   ```vim
   :6,8y
   ```

2. **Using Normal Mode**:
   - Move the cursor to line 6 using `:6`.
   - Enter visual mode by pressing `V`.
   - Move the cursor down to line 8 using `j` (or directly jump to line 8 with `:8`).
   - Press `y` to yank the selected lines.

After yanking, you can paste the lines with the `p` command to put them below the cursor or `P` to put them above the cursor.

not a range, only 6 and 8

Ah, I see. If you want to yank non-consecutive lines, like only lines 6 and 8, you'll need to use a slightly different approach. Here's one way to do it:

1. **Using Marks and Normal Mode**:
   - Move to line 6 with `:6`.
   - Yank the line with `yy`.
   - Set a mark (let's use `a` as an example) with `ma`. This marks the position where you'll later paste line 8.
   - Move to line 8 with `:8`.
   - Yank the line with `yy`.
   - Return to the mark `a` with `'a`.
   - Paste line 8 below line 6 with `p`.

Now, in your buffer, you'll have lines 6 and 8 yanked one after the other. If you want to paste them somewhere else, they'll be in the correct order in the unnamed register. You can paste them with `p` or `P` as needed.