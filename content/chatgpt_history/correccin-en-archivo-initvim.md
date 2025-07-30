---
title: Corrección en archivo init.vim
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  nvim bootstrap with support for multiple languages.
  It returns the following error"
draft: false
---

# Corrección en archivo init.vim

## 🧠 Full Chat

🙋 **You:**

nvim bootstrap with support for multiple languages. It returns the following error
664 " ocaml
665 " Add Merlin to rtp
666 let g:opamshare = substitute(system('opam var share'),'\n$','','''')
667 execute "set rtp+=" . g:opamshare . "/merlin/vim"
668

Error detected while processing /Users/angel.mora.mx/.config/nvim/init.vim:
line  667:
E518: Unknown option: command

---

🤖 **Assistant:**

The error message you're seeing (`E518: Unknown option: command`) indicates that there's an issue with the command being executed on line 667 of your `init.vim` file.

The line in question is:
```vim
let g:opamshare = substitute(system('opam var share'),'\n$','','''')
```

The error is likely due to the fact that the `substitute` function has a syntax error. The correct syntax for the `substitute` function in Vimscript is:
```vim
substitute({expr}, {pattern}, {replace}, {flags})
```

In your case, you seem to have an extra set of single quotes (`''''`). The correct line should be:
```vim
let g:opamshare = substitute(system('opam var share'),'\n$','','')
```

So, update your `init.vim` file to use the corrected line, and that should resolve the error.

---

🙋 **You:**

it is nvim, would it be the same?

---

🤖 **Assistant:**

Yes, Neovim (`nvim`) is a fork of Vim, and they share a lot of the same Vimscript syntax and functionality, especially for basic operations like the `substitute` function.

The correction I provided should work for both Vim and Neovim. The error you're seeing is related to the Vimscript syntax, not a difference between Vim and Neovim.

So, in your Neovim `init.vim` configuration, the corrected line should be:
```vim
let g:opamshare = substitute(system('opam var share'),'\n$','','')
```

After making this change, try reloading your Neovim configuration or restarting Neovim to see if the error is resolved.

---

🙋 **You:**

E319: No "python3" provider found. Run ":checkhealth provider"

---

🤖 **Assistant:**

The error `E319: No "python3" provider found` indicates that Neovim cannot find a suitable Python 3 provider. This is often required for certain plugins or features that rely on Python 3 support.

To resolve this, follow these steps:

1. **Install Python 3**:
   If you haven't already, make sure Python 3 is installed on your system.

2. **Install the `pynvim` Python package**:
   This package allows Neovim to interface with Python. You can install it using `pip`:

   ```bash
   pip3 install pynvim
   ```

   If you're using a virtual environment or have multiple Python installations, make sure you're using the correct `pip3` associated with the Python 3 installation you intend to use with Neovim.

3. **Check Neovim's health**:
   After installing the `pynvim` package, open Neovim and run:

   ```vim
   :checkhealth provider
   ```

   This will give you a diagnostic about the Python 3 provider and other providers. Under the Python 3 section, you should now see that the provider is available and working correctly.

4. **Optional Configuration**:
   If you have a specific Python 3 interpreter you want Neovim to use, you can specify its path in your `init.vim`:

   ```vim
   let g:python3_host_prog = '/path/to/your/python3'
   ```

   Replace `/path/to/your/python3` with the actual path to your Python 3 interpreter. This step is optional and is only necessary if you have multiple Python installations and want to ensure Neovim uses a specific one.

After following these steps, any plugins or features in Neovim that require Python 3 support should work without issues.