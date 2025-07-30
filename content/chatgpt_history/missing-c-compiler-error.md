---
title: Missing C Compiler Error
tags:
- include
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  > tail /tmp/ruby-build.20241028072829.8098.log"
draft: false
---

# Missing C Compiler Error

## ✅ TODOs
- [ ] it on Ubuntu:

## 🧠 Full Chat

🙋 **You:**

> tail /tmp/ruby-build.20241028072829.8098.log
-> ./config "--prefix=$HOME/.rbenv/versions/3.3.4/openssl" "--openssldir=$HOME/.rbenv/versions/3.3.4/openssl/ssl" --libdir=lib zlib-dynamic no-ssl3 shared

Failure!  build file wasn't produced.
Please read INSTALL.md and associated NOTES-* files.  You may also have to
look over your available compiler tool chain or change your configuration.

ERROR!
No C compiler found, please specify one with the environment variable CC,
or configure with an explicit configuration target.
external command failed with status 2

---

🤖 **Assistant:**

It looks like your Ruby build process is failing due to a missing C compiler. To resolve this issue, you'll need to install a C compiler on your system. Here are steps you can take depending on your operating system:

### For macOS:
1. **Install Xcode Command Line Tools**:
   Run the following command in your terminal:
   ```bash
   xcode-select --install
   ```
   This will install the necessary build tools, including `gcc` and other compilers.

2. **Re-run your Ruby installation**:
   Once the command-line tools are installed, try installing Ruby again using `rbenv` or `ruby-build`.

### For Ubuntu (or other Debian-based systems):
1. **Update and install build-essential**:
   Run the following commands:
   ```bash
   sudo apt update
   sudo apt install build-essential
   ```
   This will install `gcc`, `g++`, `make`, and other necessary tools for compiling software.

2. **Re-run your Ruby installation**:
   After the installation is complete, try the `ruby-build` command again.

### For other Linux distributions:
- Look for the package manager and install a package similar to `build-essential` or `gcc`.

After installing the necessary tools, you should be able to proceed with the Ruby build without encountering the missing compiler error. If the problem persists, let me know, and we can troubleshoot further.

---

🙋 **You:**

> rbenv install `cat .ruby-version` --skip-existing
==> Downloading openssl-3.0.15.tar.gz...
-> curl -q -fL -o openssl-3.0.15.tar.gz https://dqw8nmjcqpjn7.cloudfront.net/23c666d0edf20f14249b3d8f0368acaee9ab585b09e1de82107c66e1f3ec9533
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 14.6M  100 14.6M    0     0  52.2M      0 --:--:-- --:--:-- --:--:-- 52.3M
==> Installing openssl-3.0.15...
-> ./config "--prefix=$HOME/.rbenv/versions/3.3.4/openssl" "--openssldir=$HOME/.rbenv/versions/3.3.4/openssl/ssl" --libdir=lib zlib-dynamic no-ssl3 shared
-> make -j 4
-> make install_sw install_ssldirs
==> Installed openssl-3.0.15 to /home/amora/.rbenv/versions/3.3.4
==> Downloading ruby-3.3.4.tar.gz...
-> curl -q -fL -o ruby-3.3.4.tar.gz https://cache.ruby-lang.org/pub/ruby/3.3/ruby-3.3.4.tar.gz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 21.0M  100 21.0M    0     0  17.1M      0  0:00:01  0:00:01 --:--:-- 17.1M
==> Installing ruby-3.3.4...
-> ./configure "--prefix=$HOME/.rbenv/versions/3.3.4" "--with-openssl-dir=$HOME/.rbenv/versions/3.3.4/openssl" --enable-shared --with-ext=openssl,psych,+
-> make -j 4


*** Following extensions are not compiled:
psych:
	Could not be configured. It will not be installed.
	Check /tmp/ruby-build.20241028073738.9569.9HcIM2/ruby-3.3.4/ext/psych/mkmf.log for more details.

BUILD FAILED (Ubuntu 22.04 on x86_64 using ruby-build 20241017)

You can inspect the build directory at /tmp/ruby-build.20241028073738.9569.9HcIM2
See the full build log at /tmp/ruby-build.20241028073738.9569.log

> tail /tmp/ruby-build.20241028073738.9569.9HcIM2/ruby-3.3.4/ext/psych/mkmf.log for more details                                       
==> /tmp/ruby-build.20241028073738.9569.9HcIM2/ruby-3.3.4/ext/psych/mkmf.log <==
compilation terminated.
checked program was:
/* begin */
1: #include "ruby.h"
2: 
3: #include <yaml.h>
/* end */

--------------------

tail: cannot open 'for' for reading: No such file or directory
tail: cannot open 'more' for reading: No such file or directory
tail: cannot open 'details' for reading: No such file or directory

---

🤖 **Assistant:**

It looks like the build process is failing due to a missing dependency for the `psych` gem, which is the YAML parser used by Ruby. To resolve this issue, you need to install the necessary YAML development libraries on your system. Here's how to do it on Ubuntu:

### Install the required libraries:
```bash
sudo apt-get update
sudo apt-get install libyaml-dev
```

The `libyaml-dev` package contains the headers required to compile the `psych` extension. After installing this package, try reinstalling Ruby:

### Re-run the Ruby installation:
```bash
rbenv install $(cat .ruby-version) --skip-existing
```

This should resolve the issue with the missing YAML headers and allow Ruby to compile successfully. If you encounter further issues, please share the latest log output, and we can troubleshoot more.