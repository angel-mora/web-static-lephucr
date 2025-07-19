---
title: Python 3.7.0 Installation Segfault
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Python 3.7.0 Installation Segfault

## ✅ TODOs


## 📌 Summary
> pyenv install 3.7.0

## 🧠 Full Chat


> pyenv install 3.7.0
Downloading Python-3.7.0.tar.xz...
-> https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tar.xz
Installing Python-3.7.0...
pyenv global 3.7.0 2.7.15'
BUILD FAILED (Ubuntu 22.04 using python-build 20180424)

Inspect or clean up the working tree at /tmp/python-build.20230926005453.25888
Results logged to /tmp/python-build.20230926005453.25888.log

Last 10 log lines:
if test "xupgrade" != "xno"  ; then \
        case upgrade in \
                upgrade) ensurepip="--upgrade" ;; \
                install|*) ensurepip="" ;; \
        esac; \
        LD_LIBRARY_PATH=/tmp/python-build.20230926005453.25888/Python-3.7.0 ./python -E -m ensurepip \
                $ensurepip --root=/ ; \
fi
Segmentation fault
make: *** [Makefile:1122: install] Error 139
when trying to install in windows 11 wsl

It seems like you are trying to install Python 3.7.0 using pyenv in Windows 11 WSL (Windows Subsystem for Linux) on Ubuntu 22.04, but the build fails with a segmentation fault error.

Segmentation faults during build processes can be somewhat challenging to troubleshoot, but here are a few steps that might help you resolve the issue:

1. **Install Dependencies**: Ensure that all the necessary build dependencies for Python are installed. Run the following command to install the required packages:
   
   ```sh
   sudo apt-get update
   sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
   libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
   xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
   ```

2. **Update pyenv**: Ensure that you are using the latest version of pyenv. You can update pyenv by navigating to the pyenv installation directory and pulling the latest changes from the Git repository:

   ```sh
   cd $(pyenv root)
   git pull
   ```

3. **Memory Limit**: WSL sometimes might have memory limits that can lead to build failures. Check if there are any memory limitations in place and try to increase them if possible.

4. **Check Logs**: Inspect the log file indicated in the error message to get more details on what might be causing the segmentation fault. This might give you clues on what’s going wrong.

5. **Alternative Python Version**: If you are not specifically tied to version 3.7.0, you might want to try installing a different patch version of Python 3.7, like 3.7.9, which might have fixes for build issues:

   ```sh
   pyenv install 3.7.9
   ```

6. **Reinstall pyenv**: If all else fails, try reinstalling pyenv following the installation instructions in the [pyenv GitHub repository](https://github.com/pyenv/pyenv).

Remember to replace any commands, paths, or version numbers as necessary based on your specific environment and requirements.

when trying to install nvim in wsl:


## Python 2 provider (optional)
  - INFO: pyenv: Path: /home/user/.pyenv/libexec/pyenv
  - INFO: pyenv: $PYENV_ROOT is not set. Infer from `pyenv root`.
  - INFO: pyenv: Root: /home/user/.pyenv
  - WARNING: No Python executable found that can `import neovim`. Using the first available executable for diagnostics.
  - ERROR: Python provider error:
    - ADVICE:
      - provider/pythonx: Could not load Python 2:
          /home/user/.pyenv/shims/python2 does not have the "neovim" module. :help |provider-python|
          /home/user/.pyenv/shims/python2.7 does not have the "neovim" module. :help |provider-python|
          python2.6 not found in search path or not executable.
          /home/user/.pyenv/shims/python does not have the "neovim" module. :help |provider-python|
  - INFO: Executable: Not found

## Python 3 provider (optional)
  - INFO: Disabled (g:loaded_python3_provider=0).

## Python virtualenv
  - OK: no $VIRTUAL_ENV

The error message indicates that the Python 2 provider for Neovim is not properly configured because the `neovim` Python module is not found in any of the available Python 2 executables. Also, Python 3 provider is disabled.

Here's how you can resolve these issues:

### 1. Install `neovim` Python Module for Python 2
If you need Python 2 support in Neovim, you can install the `neovim` Python module for the Python 2 version available in your pyenv:

```sh
pyenv shell 2.7.18  # Replace with the actual Python 2 version you have installed
pip install neovim
```

After this, recheck the Neovim health by running `:checkhealth` inside Neovim.

### 2. Enable and Configure Python 3 Provider
Since Python 2 is end-of-life, it is better to use the Python 3 provider. First, install a Python 3 version using pyenv, and then install the `pynvim` module (the `neovim` module has been renamed to `pynvim`):

```sh
pyenv install 3.9.7  # Replace with your desired Python 3 version
pyenv shell 3.9.7  # Replace with the installed Python 3 version
pip install pynvim
```

Then, enable the Python 3 provider in Neovim by removing or commenting out the line that disables it in your Neovim configuration file (`init.vim` or `init.lua` depending on your setup). If you are using `init.vim`, you might have a line like this:

```vim
let g:loaded_python3_provider = 0
```

Comment out or remove this line to enable the Python 3 provider.

After making these changes, restart Neovim and run `:checkhealth` again to verify that the Python providers are correctly configured.

### 3. Optionally, Ignore Python 2 Provider
If you do not need Python 2 support in Neovim, you can explicitly disable the Python 2 provider by adding the following line to your Neovim configuration file:

```vim
let g:loaded_python_provider = 0
```

This will suppress warnings and errors related to the Python 2 provider. Restart Neovim and run `:checkhealth` to confirm that the configuration is correct.

Remember to replace version numbers and paths as necessary based on your specific environment and requirements.

Error detected while processing /home/user/.config/nvim/init.lua:
E5113: Error while calling lua chunk: /home/user/.config/nvim/lua/core/init.lua:67: attempt to call local 'autocmd' (a n
il value)
stack traceback:
        /home/user/.config/nvim/lua/core/init.lua:67: in main chunk
        [C]: in function 'require'
        /home/user/.config/nvim/init.lua:1: in main chunk
Press ENTER or type command to continue

The error message indicates that in your Neovim configuration, specifically in the file `/home/user/.config/nvim/lua/core/init.lua` at line 67, there is an attempt to call a local variable `autocmd`, which is `nil` (not initialized or defined).

To resolve this issue, you'll need to inspect the code around line 67 in `/home/user/.config/nvim/lua/core/init.lua` and determine why `autocmd` is `nil`. Here are a few general steps to help troubleshoot and fix this issue:

1. **Open the File and Inspect the Code:**
   Open `/home/user/.config/nvim/lua/core/init.lua` in a text editor and go to line 67. Examine the surrounding code to understand how `autocmd` is being used and why it might be `nil`.

   ```sh
   nvim +67 /home/user/.config/nvim/lua/core/init.lua
   ```

2. **Check Variable Definition:**
   Ensure that the `autocmd` variable is correctly defined before it’s being called. If `autocmd` is supposed to be a function or a table, check that it is properly initialized.

3. **Check Module Import:**
   If `autocmd` is supposed to be imported from another module, check that the module is correctly imported and that the import statement is not throwing any errors.

4. **Debugging:**
   Add print statements around the problematic line to debug the values of variables and the flow of the program:

   ```lua
   print("autocmd value:", autocmd)
   ```

5. **Check for Typos:**
   Ensure that there are no typos in the variable name `autocmd`. Lua is case-sensitive, so make sure the case matches the variable definition.

6. **Neovim Configuration:**
   If you are unsure about the purpose of the `autocmd` variable, review the Neovim configuration documentation or any comments/documentation provided by the Lua configuration files you are using.

After identifying the issue and making the necessary corrections, save the file and restart Neovim to check if the error is resolved.

If you're still having trouble, you might want to share the relevant code around line 67 of `/home/user/.config/nvim/lua/core/init.lua` for more specific advice.