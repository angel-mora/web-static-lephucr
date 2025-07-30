---
title: Rails ngrok config fix
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Fix this rails error"
draft: false
---

# Rails ngrok config fix

## 🧠 Full Chat

🙋 **You:**

Fix this rails error
To allow requests to 23ec-189-217-94-223.ngrok-free.app, add the following to your environment configuration:
config.hosts << "23ec-189-217-94-223.ngrok-free.app"

---

🤖 **Assistant:**

The error you're seeing is due to a security feature introduced in Rails 6 that prevents against DNS rebinding attacks. By default, Rails will only allow requests from `localhost` to prevent against these types of attacks. When you're using services like `ngrok` to expose your local development server to the web, you'll need to whitelist the `ngrok` domain in your Rails configuration.

To fix the error:

1. **Locate the appropriate environment configuration file**:
   
   If you're running in the development environment (which is most likely if you're using `ngrok`), you'll want to edit `config/environments/development.rb`.

2. **Add the configuration**:

   Open the file in your preferred text editor and add the following line:

   ```ruby
   config.hosts << "23ec-189-217-94-223.ngrok-free.app"
   ```

   Make sure you add this line within the `Rails.application.configure do ... end` block.

3. **Restart your Rails server**:

   After making the change, you'll need to restart your Rails server for the changes to take effect.

4. **Test**:

   Once you've made the change and restarted your server, try accessing your application through the `ngrok` URL again. The error should be resolved.

Remember, if you restart `ngrok` or if the subdomain changes for any reason, you'll need to update the configuration with the new domain. If you frequently use `ngrok` and don't want to keep updating the domain, you can allow all `ngrok` subdomains by doing:

```ruby
config.hosts << /\.ngrok-free\.app\z/
```

However, be cautious with this approach as it's less restrictive.