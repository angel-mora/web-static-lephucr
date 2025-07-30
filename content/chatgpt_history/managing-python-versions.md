---
title: Managing Python Versions
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  How can I install python like rbenv with ruby. I want
  it to help me manage versions and be super reliable"
draft: false
---

# Managing Python Versions

## 🧠 Full Chat

🙋 **You:**

How can I install python like rbenv with ruby. I want it to help me manage versions and be super reliable

---

🤖 **Assistant:**

User wants to install Python in a way that helps them manage versions reliably, similar to how rbenv works with Ruby.

---

**Tool:**

Model set context updated.

---

🤖 **Assistant:**

To manage Python versions similarly to how you manage Ruby with rbenv, you can use `pyenv`. It’s a simple, reliable tool that lets you switch between multiple versions of Python on your system. Here's how you can install and use it:

### 1. Install `pyenv`

**On macOS:**
If you're using macOS, you can install `pyenv` with Homebrew:

```bash
brew update
brew install pyenv
```

**On Linux:**
For Linux, you can use the following commands:

```bash
curl https://pyenv.run | bash
```

This will install `pyenv` along with `pyenv-virtualenv`, `pyenv-update`, and other useful plugins.

### 2. Set Up Your Shell

After installation, you'll need to set up your shell environment to initialize `pyenv` every time a shell session starts. Add the following lines to your `.bashrc`, `.zshrc`, or `.bash_profile`:

```bash
# Add pyenv to the PATH
export PATH="$HOME/.pyenv/bin:$PATH"

# Initialize pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
```

For `zsh`, you might also need:

```bash
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
```

Then, restart your terminal or run `source ~/.bashrc` (or the equivalent for your shell).

### 3. Install Python Versions

You can now install different versions of Python using `pyenv`. For example, to install Python 3.10.0:

```bash
pyenv install 3.10.0
```

### 4. Set the Global or Local Python Version

You can set the global version (default for all sessions) like this:

```bash
pyenv global 3.10.0
```

Or set a local version for a specific project by navigating to the project directory and running:

```bash
pyenv local 3.10.0
```

### 5. Verify the Installation

To verify that `pyenv` is working, run:

```bash
pyenv versions
```

This command will list all Python versions installed by `pyenv`, and the currently active version will be highlighted.

### 6. Virtual Environments

`pyenv` can also manage virtual environments easily with the `pyenv-virtualenv` plugin. You can create and activate virtual environments like this:

```bash
pyenv virtualenv 3.10.0 myenv
pyenv activate myenv
```

To deactivate a virtual environment:

```bash
pyenv deactivate
```

This setup should give you a robust and flexible environment for managing Python versions, similar to how you might already manage Ruby with `rbenv`.

---

🙋 **You:**

can i just install the latest python?

---

🤖 **Assistant:**

Yes, you can easily install the latest version of Python using `pyenv`. Here's how:

### 1. Update `pyenv` to Get the Latest Python Versions

First, make sure that `pyenv` itself is up to date, as this will ensure you have access to the latest Python versions:

```bash
pyenv update
```

### 2. Install the Latest Python Version

You can install the latest stable version of Python with this command:

```bash
pyenv install 3.11.5  # Replace with the latest version if a newer one is available.
```

To find the latest available version, you can run:

```bash
pyenv install --list
```

This will show a list of all available versions. Look for the highest version number, which is typically the latest stable release.

### 3. Set the Latest Python Version as Global

After installing, you can set this version as the global default:

```bash
pyenv global 3.11.5  # Use the actual latest version number.
```

This ensures that the latest Python version will be used by default across your entire system.

---

🙋 **You:**

➜  lolo.international git:(main) pyenv install 3.12.3
python-build: use openssl@3 from homebrew
python-build: use readline from homebrew
Downloading Python-3.12.3.tar.xz...
-> https://www.python.org/ftp/python/3.12.3/Python-3.12.3.tar.xz
Installing Python-3.12.3...
python-build: use readline from homebrew
python-build: use zlib from xcode sdk
Traceback (most recent call last):
  File "<string>", line 1, in <module>
  File "/Users/spectech/.pyenv/versions/3.12.3/lib/python3.12/lzma.py", line 27, in <module>
    from _lzma import *
ModuleNotFoundError: No module named '_lzma'
WARNING: The Python lzma extension was not compiled. Missing the lzma lib?
Installed Python-3.12.3 to /Users/spectech/.pyenv/versions/3.12.3

---

🤖 **Assistant:**

The error you're encountering indicates that the `lzma` module, which is part of the Python standard library, was not compiled during installation. This typically happens when the required `lzma` library is not installed on your system.

To resolve this issue, you need to install the `xz` library, which provides the `lzma` compression support. Here’s how you can fix this on macOS:

### 1. Install the `xz` Library via Homebrew

First, install `xz` using Homebrew:

```bash
brew install xz
```

### 2. Reinstall Python 3.12.3 with `pyenv`

After installing `xz`, reinstall Python 3.12.3 using `pyenv`:

```bash
pyenv uninstall 3.12.3
pyenv install 3.12.3
```

This time, the `lzma` module should compile correctly, and the installation should complete without errors.

### 3. Verify the Installation

To check if Python 3.12.3 is installed correctly, run:

```bash
python --version
```

Or:

```bash
pyenv versions
```

This will confirm that Python 3.12.3 is installed and working properly.

---

🙋 **You:**

how can i install jupyter notebooks from there?

---

🤖 **Assistant:**

You can easily install Jupyter Notebooks within the Python version you've set up using `pyenv`. Here's how:

### 1. Activate Your Python Environment

First, ensure that you are using the desired Python version installed via `pyenv`:

```bash
pyenv global 3.12.3  # Or the specific version you want to use
```

If you're using a virtual environment created with `pyenv-virtualenv`, activate it:

```bash
pyenv activate myenv  # Replace `myenv` with your environment name
```

### 2. Upgrade pip

It's always a good idea to ensure that `pip` is up-to-date:

```bash
pip install --upgrade pip
```

### 3. Install Jupyter

Now, you can install Jupyter Notebook:

```bash
pip install jupyter
```

### 4. Launch Jupyter Notebook

To start Jupyter Notebook, simply run:

```bash
jupyter notebook
```

This will open a new tab in your default web browser with the Jupyter Notebook interface.

### 5. Verify Installation

To ensure everything is working correctly, create a new notebook in the browser and run a simple Python command, like:

```python
print("Hello, Jupyter!")
```

If it executes correctly, you're all set!

### Optional: Install JupyterLab

If you prefer to use JupyterLab (a more advanced interface), you can install it with:

```bash
pip install jupyterlab
```

Then, launch it with:

```bash
jupyter lab
```

This setup will allow you to work seamlessly with Jupyter Notebooks within your `pyenv` Python environment.

---

🙋 **You:**

zsh: command not found: pip

---

🤖 **Assistant:**

The error `zsh: command not found: pip` suggests that `pip` is not installed or not correctly linked to the Python version managed by `pyenv`. Here’s how to resolve it:

### 1. Ensure You're Using the Correct Python Version

First, check that you're using the Python version managed by `pyenv`:

```bash
pyenv global 3.12.3
```

Then verify:

```bash
python --version
```

If the output shows the correct version, proceed to install `pip`.

### 2. Install `pip` Manually

Sometimes, `pip` might not be installed with your Python installation. You can manually install `pip` by using `ensurepip`, which is bundled with Python:

```bash
python -m ensurepip --upgrade
```

After this, try running `pip` again:

```bash
pip --version
```

### 3. Reinstall Python (if Necessary)

If `pip` is still not found, you might need to reinstall Python using `pyenv`:

```bash
pyenv uninstall 3.12.3
pyenv install 3.12.3
```

Then, check if `pip` is available:

```bash
pip --version
```

### 4. Adding `pyenv` to Your Path (if Necessary)

Ensure that your shell is properly configured to use `pyenv`. Add the following lines to your `.zshrc` file (or equivalent for your shell):

```bash
export PATH="$HOME/.pyenv/shims:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
```

Then, reload your shell configuration:

```bash
source ~/.zshrc
```

### 5. Install Jupyter Notebooks

Once `pip` is available, you can proceed to install Jupyter Notebooks:

```bash
pip install jupyter
```

This should resolve the issue and allow you to use `pip` and install Jupyter.