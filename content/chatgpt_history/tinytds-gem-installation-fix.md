---
title: TinyTDS Gem Installation Fix
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# TinyTDS Gem Installation Fix

## ✅ TODOs


## 📌 Summary
Remember I use macos:

## 🧠 Full Chat


Remember I use macos:

bundle install
Fetching gem metadata from https://rubygems.org/........
Fetching gem metadata from https://gems.contribsys.com/..
Fetching gem metadata from https://rails-assets.org/..
Installing tiny_tds 2.1.7 with native extensions
Gem::Ext::BuildError: ERROR: Failed to build gem native extension.

    current directory: /Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/gems/3.3.0/gems/tiny_tds-2.1.7/ext/tiny_tds
/Users/angel.mora.mx/.rbenv/versions/3.3.5/bin/ruby extconf.rb
looking for freetds headers in the following directories:
 - /opt/homebrew/include
 - /opt/homebrew/include/freetds
 - /opt/local/include
 - /opt/local/include/freetds
 - /usr/local/include
 - /usr/local/include/freetds
looking for freetds library in the following directories:
 - /opt/homebrew/lib
 - /opt/homebrew/lib/freetds
 - /opt/local/lib
 - /opt/local/lib/freetds
 - /usr/local/lib
 - /usr/local/lib/freetds
checking for sybfront.h... no
checking for sybdb.h... no
checking for tdsdbopen() in -lsybdb... no
checking for dbanydatecrack() in -lsybdb... no
Failed! Do you have FreeTDS 0.95.80 or higher installed?
*** extconf.rb failed ***
Could not create Makefile due to some reason, probably lack of necessary
libraries and/or headers.  Check the mkmf.log file for more details.  You may
need configuration options.

Provided configuration options:
	--with-opt-dir
	--without-opt-dir
	--with-opt-include=${opt-dir}/include
	--without-opt-include
	--with-opt-lib=${opt-dir}/lib
	--without-opt-lib
	--with-make-prog
	--without-make-prog
	--srcdir=.
	--curdir
	--ruby=/Users/angel.mora.mx/.rbenv/versions/3.3.5/bin/$(RUBY_BASE_NAME)
	--help
	--with-freetds-dir
	--without-freetds-dir
	--with-freetds-include=${freetds-dir}/include
	--without-freetds-include
	--with-freetds-lib=${freetds-dir}/lib
	--without-freetds-lib
	--with-sybdb-dir
	--without-sybdb-dir
	--with-sybdb-include=${sybdb-dir}/include
	--without-sybdb-include
	--with-sybdb-lib=${sybdb-dir}/lib
	--without-sybdb-lib
	--with-sybdblib
	--without-sybdblib
	--with-sybdblib
	--without-sybdblib

To see why this extension failed to compile, please check the mkmf.log which can be found here:

/Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/gems/3.3.0/extensions/arm64-darwin-23/3.3.0/tiny_tds-2.1.7/mkmf.log

extconf failed, exit code 1

Gem files will remain installed in /Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/gems/3.3.0/gems/tiny_tds-2.1.7
for inspection.
Results logged to
/Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/gems/3.3.0/extensions/arm64-darwin-23/3.3.0/tiny_tds-2.1.7/gem_make.out

  /Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/site_ruby/3.3.0/rubygems/ext/builder.rb:125:in `run'
  /Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/site_ruby/3.3.0/rubygems/ext/ext_conf_builder.rb:28:in `build'
  /Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/site_ruby/3.3.0/rubygems/ext/builder.rb:193:in `build_extension'
/Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/site_ruby/3.3.0/rubygems/ext/builder.rb:227:in `block in
build_extensions'
  /Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/site_ruby/3.3.0/rubygems/ext/builder.rb:224:in `each'
  /Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/site_ruby/3.3.0/rubygems/ext/builder.rb:224:in `build_extensions'
  /Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/site_ruby/3.3.0/rubygems/installer.rb:844:in `build_extensions'
/Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/gems/3.3.0/gems/bundler-2.5.22/lib/bundler/rubygems_gem_installer.rb:109:in
`build_extensions'
/Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/gems/3.3.0/gems/bundler-2.5.22/lib/bundler/rubygems_gem_installer.rb:28:in
`install'
/Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/gems/3.3.0/gems/bundler-2.5.22/lib/bundler/source/rubygems.rb:205:in
`install'
/Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/gems/3.3.0/gems/bundler-2.5.22/lib/bundler/installer/gem_installer.rb:55:in
`install'
/Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/gems/3.3.0/gems/bundler-2.5.22/lib/bundler/installer/gem_installer.rb:17:in
`install_from_spec'
/Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/gems/3.3.0/gems/bundler-2.5.22/lib/bundler/installer/parallel_installer.rb:133:in
`do_install'
/Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/gems/3.3.0/gems/bundler-2.5.22/lib/bundler/installer/parallel_installer.rb:124:in
`block in worker_pool'
/Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/gems/3.3.0/gems/bundler-2.5.22/lib/bundler/worker.rb:62:in
`apply_func'
/Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/gems/3.3.0/gems/bundler-2.5.22/lib/bundler/worker.rb:57:in `block
in process_queue'
  <internal:kernel>:187:in `loop'
/Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/gems/3.3.0/gems/bundler-2.5.22/lib/bundler/worker.rb:54:in
`process_queue'
/Users/angel.mora.mx/.rbenv/versions/3.3.5/lib/ruby/gems/3.3.0/gems/bundler-2.5.22/lib/bundler/worker.rb:90:in `block
(2 levels) in create_threads'

An error occurred while installing tiny_tds (2.1.7), and Bundler cannot continue.

In Gemfile:
  activerecord-sqlserver-adapter was resolved to 7.0.7, which depends on
    tiny_tds



The error suggests that the `tiny_tds` gem is failing to install because the required FreeTDS library is not found. FreeTDS is a dependency for `tiny_tds`, which provides connectivity to Microsoft SQL Server. Here's how you can resolve this issue on macOS:

### Steps to Fix:

1. **Install FreeTDS via Homebrew**:
   Open your terminal and install FreeTDS:
   ```bash
   brew install freetds
   ```

2. **Verify FreeTDS Installation**:
   Check if FreeTDS is installed correctly by running:
   ```bash
   tsql -C
   ```
   This should display the configuration of FreeTDS, including the version (make sure it's 0.95.80 or higher).

3. **Set Environment Variables**:
   If FreeTDS is not found, you may need to set environment variables to point to its location:
   ```bash
   export PATH="/opt/homebrew/bin:$PATH"
   export LDFLAGS="-L/opt/homebrew/lib"
   export CPPFLAGS="-I/opt/homebrew/include"
   export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig"
   ```

4. **Reinstall the `tiny_tds` Gem**:
   Try installing the gem again:
   ```bash
   gem install tiny_tds
   ```

5. **Re-run `bundle install`**:
   After successfully installing `tiny_tds`, run:
   ```bash
   bundle install
   ```

6. **Check for Other Issues**:
   If you still encounter issues, inspect the `mkmf.log` file mentioned in the error message. This file provides detailed logs about what went wrong during the gem installation process.

If you encounter further issues, let me know the additional details, and I can assist further!