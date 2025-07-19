---
title: EventMachine LoadError with Invoker
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# EventMachine LoadError with Invoker

## ✅ TODOs


## 📌 Summary
❯ invoker start

## 🧠 Full Chat


❯ invoker start
Unable to load the EventMachine C extension; To use the pure-ruby reactor, require 'em/pure_ruby'
Traceback (most recent call last):
	13: from /Users/angel.mora.mx/.rbenv/versions/2.7.5/bin/invoker:25:in `<main>'
	12: from /Users/angel.mora.mx/.rbenv/versions/2.7.5/bin/invoker:25:in `load'
	11: from /Users/angel.mora.mx/.rbenv/versions/2.7.5/lib/ruby/gems/2.7.0/gems/invoker-1.5.8/bin/invoker:5:in `<top (required)>'
	10: from /Users/angel.mora.mx/.rbenv/versions/2.7.5/lib/ruby/site_ruby/2.7.0/rubygems/core_ext/kernel_require.rb:86:in `require'
	 9: from /Users/angel.mora.mx/.rbenv/versions/2.7.5/lib/ruby/site_ruby/2.7.0/rubygems/core_ext/kernel_require.rb:86:in `require'
	 8: from /Users/angel.mora.mx/.rbenv/versions/2.7.5/lib/ruby/gems/2.7.0/gems/invoker-1.5.8/lib/invoker.rb:20:in `<top (required)>'
	 7: from /Users/angel.mora.mx/.rbenv/versions/2.7.5/lib/ruby/site_ruby/2.7.0/rubygems/core_ext/kernel_require.rb:86:in `require'
	 6: from /Users/angel.mora.mx/.rbenv/versions/2.7.5/lib/ruby/site_ruby/2.7.0/rubygems/core_ext/kernel_require.rb:86:in `require'
	 5: from /Users/angel.mora.mx/.rbenv/versions/2.7.5/lib/ruby/gems/2.7.0/gems/invoker-1.5.8/lib/invoker/power/setup.rb:1:in `<top (required)>'
	 4: from /Users/angel.mora.mx/.rbenv/versions/2.7.5/lib/ruby/site_ruby/2.7.0/rubygems/core_ext/kernel_require.rb:86:in `require'
	 3: from /Users/angel.mora.mx/.rbenv/versions/2.7.5/lib/ruby/site_ruby/2.7.0/rubygems/core_ext/kernel_require.rb:86:in `require'
	 2: from /Users/angel.mora.mx/.rbenv/versions/2.7.5/lib/ruby/gems/2.7.0/gems/eventmachine-1.0.9.1/lib/eventmachine.rb:8:in `<top (required)>'
	 1: from /Users/angel.mora.mx/.rbenv/versions/2.7.5/lib/ruby/site_ruby/2.7.0/rubygems/core_ext/kernel_require.rb:86:in `require'
/Users/angel.mora.mx/.rbenv/versions/2.7.5/lib/ruby/site_ruby/2.7.0/rubygems/core_ext/kernel_require.rb:86:in `require': dlopen(/Users/angel.mora.mx/.rbenv/versions/2.7.5/lib/ruby/gems/2.7.0/gems/eventmachine-1.0.9.1/lib/rubyeventmachine.bundle, 0x0009): symbol not found in flat namespace '_SSL_get1_peer_certificate' - /Users/angel.mora.mx/.rbenv/versions/2.7.5/lib/ruby/gems/2.7.0/gems/eventmachine-1.0.9.1/lib/rubyeventmachine.bundle (LoadError)

It looks like you are encountering a `LoadError` related to the EventMachine gem while trying to start Invoker. This error suggests that there is an issue with the native extensions of the EventMachine gem, specifically related to SSL functionality.

Here are a few steps you might consider to resolve this issue:

1. **Update the EventMachine Gem**: The version of EventMachine you are using might be outdated or incompatible with your Ruby version. You can update it using:
   ```bash
   gem install eventmachine
   ```

2. **Reinstall EventMachine**: Sometimes, simply reinstalling the gem can resolve issues with native extensions. Use the following commands:
   ```bash
   gem uninstall eventmachine
   gem install eventmachine
   ```

3. **Check Ruby Version Compatibility**: Ensure that the version of Ruby you are using is compatible with the version of EventMachine. Sometimes, newer versions of Ruby may require a different version of the EventMachine gem.

4. **Install Ruby Development Headers**: If you're missing development headers for Ruby, it might cause issues with building native extensions. You can install them (on a Debian-based system) with:
   ```bash
   sudo apt-get install ruby-dev
   ```

5. **Use a Different Ruby Version Manager**: If you're using a Ruby version manager like Rbenv or RVM, try switching to a different version of Ruby to see if that resolves the issue.

6. **Check for OpenSSL Issues**: The error message mentions SSL, which is related to OpenSSL. Make sure OpenSSL is properly installed and up-to-date on your system.

7. **Consult Documentation or Community Forums**: Sometimes, specific gems or tools have known issues on certain platforms. Checking the documentation or community forums for Invoker or EventMachine might provide additional insights or solutions specific to your setup.

If these steps do not resolve the issue, you might need to look into more specific configurations of your Ruby environment or additional dependencies that may be required for EventMachine and Invoker to work properly on your system.

symbol not found in flat namespace '_SSL_get1_peer_certificate' - /Users/angel.mora.mx/.rbenv/versions/2.7.5/lib/ruby/gems/2.7.0/gems/eventmachine-1.0.9.1/lib/rubyeventmachine.bundle (LoadError)

The error message you're encountering, `symbol not found in flat namespace '_SSL_get1_peer_certificate'`, indicates a compatibility issue between the EventMachine gem and the OpenSSL library in your Ruby environment. This is typically related to changes or incompatibilities in the OpenSSL library that EventMachine relies upon.

Here are some steps to troubleshoot and potentially resolve this issue:

1. **Update OpenSSL**: Make sure your OpenSSL library is up to date. Sometimes, a mismatch between the version of OpenSSL and the Ruby/EventMachine gem can cause these kinds of issues.

2. **Reinstall EventMachine with the Correct OpenSSL Paths**: When installing EventMachine, it's important to ensure it's built against the correct OpenSSL library. You can specify the path to the OpenSSL library when installing the gem. For example:
   ```bash
   gem uninstall eventmachine
   gem install eventmachine -- --with-openssl-dir=/path/to/openssl
   ```
   Replace `/path/to/openssl` with the actual path to your OpenSSL installation.

3. **Check Ruby and EventMachine Versions**: Compatibility between Ruby and EventMachine versions is crucial. Make sure that the versions you are using are compatible with each other. Sometimes, using an older version of Ruby or EventMachine can lead to these issues.

4. **Recompile Ruby with the Correct OpenSSL**: If the issue persists, there might be a problem with how Ruby was compiled with OpenSSL. Recompiling Ruby with the correct OpenSSL paths might be necessary.

5. **Use RVM or rbenv to Manage Ruby Versions**: If you're not already doing so, using a Ruby version manager like RVM or rbenv can help manage different Ruby environments and dependencies more effectively. These tools can also simplify the process of recompiling Ruby with the correct libraries.

6. **Consult Community Resources**: This issue might be specific to your system configuration. Checking Ruby and EventMachine community forums, GitHub issues, or Stack Overflow might provide insights from others who faced similar problems.

If none of these steps resolve the issue, it would be helpful to look for more specific information related to your operating system, the version of OpenSSL installed, and any peculiarities of your development environment that might affect how Ruby and its gems are compiled and run.