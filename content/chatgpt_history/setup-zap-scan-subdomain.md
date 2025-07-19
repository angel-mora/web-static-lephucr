---
title: Setup ZAP Scan Subdomain.
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Setup ZAP Scan Subdomain.

## ✅ TODOs
- [ ] this:

## 📌 Summary
How to setup ZAP scan for a subdomain.localhost:3000

## 🧠 Full Chat


How to setup ZAP scan for a subdomain.localhost:3000

Setting up a ZAP (Zed Attack Proxy) scan for a subdomain that is mapped to `localhost:3000` involves a few steps. ZAP is an open-source web application security scanner. It's designed to find security vulnerabilities in web applications. Here’s a basic guide on how to do this:

### 1. Download and Install OWASP ZAP

First, you need to have ZAP installed on your computer. If you haven't done this yet:

- Go to the [OWASP ZAP website](https://www.zaproxy.org/download/) and download the appropriate version for your operating system.
- Install the application following the provided instructions.

### 2. Start ZAP

Open ZAP. You might have to wait a few moments for it to fully start and load its components.

### 3. Configure Local Proxy Settings

By default, ZAP acts as a proxy server on your local machine. You need to configure your browser to use this proxy to allow ZAP to intercept and inspect HTTP(S) requests and responses. The default settings are:

- **Address:** `localhost`
- **Port:** `8080`

Configure your browser’s proxy settings accordingly or use ZAP's integrated browser.

### 4. Set Up a Context for Your Subdomain

- In ZAP, go to the **Sites** tab, right-click on it, and choose **Include in Context > New Context**. Give it a meaningful name related to your subdomain.
- Inside your context settings, you can specify the exact subdomain and port to ensure ZAP only targets the intended scope. Navigate to **Contexts** tab > your context > **Include in Context** and then specify your subdomain pattern, like `subdomain.localhost:3000`.

### 5. Running the Spider

Before actively scanning, it’s a good idea to use the ZAP Spider to crawl the application:

- Right-click your subdomain under the **Sites** tab.
- Select **Attack** > **Spider**. This process will discover the URLs and endpoints in your web application.

### 6. Active Scanning

After spidering, you can perform an active scan:

- Right-click your subdomain in the **Sites** tab.
- Select **Attack** > **Active Scan**. Choose the policy and the strength. Be aware that active scanning will attempt to exploit known vulnerabilities, which can be disruptive.

### 7. Analyzing the Results

After the scan completes, review the **Alerts** tab for potential vulnerabilities. ZAP provides detailed information about each finding, including a description, risk level, and possible mitigation steps.

### Additional Tips

- **Localhost Tunneling:** If ZAP does not recognize `subdomain.localhost`, you may need to map `localhost` to a local IP or use a service like `ngrok` to tunnel your local development server to an externally accessible URL.
- **Authentication:** If your application requires authentication, you'll need to configure ZAP to either use a logged-in session or perform authentication steps automatically.
- **APIs:** For API scanning, you can directly import or manually input API definitions (like OpenAPI) into ZAP to assist in thorough testing.

Remember, scanning your own applications for vulnerabilities is legal and ethical, but scanning applications that you do not own or have explicit permission to test is not. Always ensure you have the right to scan the target application.

I am trying to debug a vuln. How can I modify action controller params in my debugging sesion? I hit hash['value

Debugging issues in web applications, especially related to security vulnerabilities, often requires a deep dive into how parameters are handled and manipulated. If you're working with a Ruby on

I am trying to debug a vuln. How can I modify action controller params in my debugging sesion? I hit hash['value']['another'] = 'new value' and nothing happens

When you're debugging an application and need to modify the parameters received by an action controller, it can be a bit tricky, especially if you're dealing with nested parameters within a Rails application. Based on your description, it sounds like you're trying to modify a nested hash within the parameters but are not seeing the expected outcome. Here are some steps and tips to effectively modify action controller parameters during a debugging session:

### Understanding `ActionController::Parameters`

First, it's important to understand that Rails wraps request parameters in an `ActionController::Parameters` object, which allows for permitted scalar values and does not treat it as a plain Ruby hash. This is particularly relevant for Rails 5 and later.

### Modifying Nested Parameters

If you're trying to modify a nested parameter, like `params['value']['another'] = 'new value'`, and it doesn't seem to work, consider the following approach:

1. **Permitting Parameters**: Ensure that the parameters you are trying to modify are permitted if you are working with strong parameters. Unpermitted parameters will not be accessible in the same way as permitted ones.

2. **Converting to a Hash**: If you need to manipulate the parameters more freely, you might need to convert them to a plain Ruby hash. However, be cautious with this approach because it bypasses the safety provided by strong parameters.

   ```ruby
   modified_params = params.to_unsafe_h # Converts parameters to a plain hash
   modified_params['value']['another'] = 'new value'
   ```

3. **Direct Manipulation**: For direct manipulation without converting to a hash, you should be able to modify the values if they are already permitted. If you're encountering issues, ensure you're working on the correct part of the parameters and that the parameters have been permitted if using strong parameters.

4. **Debugging Tip**: Use debugging tools like `byebug` or `pry` effectively. Insert a breakpoint right before the line where you want to modify the parameters, and inspect the `params` object to ensure you understand its structure correctly.

   ```ruby
   # Insert a breakpoint
   binding.pry # or binding.byebug

   # Now you can inspect and modify params in the console
   ```

5. **Applying Changes**: After modifying the parameters, ensure that you are using the modified version in your controller actions. Since you might be working with a copy or a converted version of the original parameters, any changes need to be explicitly used in subsequent operations.

### Example

Here's a quick example of how you might debug and modify parameters in a Rails controller action:

```ruby
def update
  # Debugging: Inspect original params
  binding.pry

  # Assuming 'params' needs to be modified
  modified_params = params.to_unsafe_h
  modified_params['value']['another'] = 'new value'

  # Use modified_params instead of params for further operations
  if my_model.update(modified_params)
    redirect_to my_model_path, notice: 'Model updated successfully.'
  else
    render :edit
  end
end
```

Remember, directly modifying parameters like this can be risky, especially if you're working with user input. Always ensure that any changes to parameters do not introduce security vulnerabilities, such as permitting values that should not be modifiable by the user.