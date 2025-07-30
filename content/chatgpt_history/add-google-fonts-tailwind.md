---
title: Add Google Fonts Tailwind
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  add google fonts to rails 7 with tailwind. Follow best
  practices"
draft: false
---

# Add Google Fonts Tailwind

## 🧠 Full Chat

🙋 **You:**

add google fonts to rails 7 with tailwind. Follow best practices

---

🤖 **Assistant:**

To add Google Fonts to a Rails 7 application using Tailwind CSS, you can follow these steps:

### 1. **Choose the Fonts**
   - Go to [Google Fonts](https://fonts.google.com/) and select the fonts you want to use.
   - Copy the `@import` URL provided by Google Fonts.

### 2. **Add Google Fonts to Your Tailwind Configuration**
   - Open your `application.css` file (or any other main CSS file where you are managing your styles) in the `app/assets/stylesheets/` directory.
   - Add the `@import` statement at the top of this file.

   ```css
   /* app/assets/stylesheets/application.css */

   @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');
   ```

### 3. **Configure Tailwind to Use the Font**
   - Open your `tailwind.config.js` file, which is located in the root of your Rails project.
   - Extend the default theme to include the new fonts.

   ```javascript
   // tailwind.config.js

   module.exports = {
     content: [
       './app/helpers/**/*.rb',
       './app/javascript/**/*.js',
       './app/views/**/*.erb',
     ],
     theme: {
       extend: {
         fontFamily: {
           sans: ['Roboto', 'Helvetica', 'Arial', 'sans-serif'],
         },
       },
     },
     plugins: [],
   }
   ```

### 4. **Apply the Font in Your HTML or Components**
   - You can now use the font in your views or components by applying the appropriate Tailwind utility classes.

   ```html
   <!-- Example usage in an ERB view -->
   <h1 class="font-sans text-3xl">
     Welcome to My Rails 7 App!
   </h1>
   ```

### 5. **Optimize for Production**
   - Make sure to purge unused CSS for optimal performance. Tailwind automatically purges unused styles when you build your application for production.
   - If you need to manually configure it, ensure your `tailwind.config.js` file includes the correct paths to your templates:

   ```javascript
   module.exports = {
     content: [
       './app/views/**/*.html.erb',
       './app/helpers/**/*.rb',
       './app/assets/stylesheets/**/*.css',
       './app/javascript/**/*.js',
     ],
   }
   ```

### 6. **Deploy and Test**
   - Deploy your application and test it in different browsers to ensure the font is loading correctly.

Following these steps will help you integrate Google Fonts with Tailwind CSS in your Rails 7 application, adhering to best practices for maintainability and performance.

---

🙋 **You:**

Can I use @fontsource library instead?

---

🤖 **Assistant:**

Yes, you can use the `@fontsource` library as an alternative to directly importing Google Fonts. The `@fontsource` library allows you to install fonts as npm packages, giving you more control over the font loading process and potentially reducing the reliance on external requests.

Here’s how you can integrate `@fontsource` with a Rails 7 application using Tailwind CSS:

### 1. **Install the Fontsource Package**
   - Install the desired font via npm or yarn.

   ```bash
   # Using npm
   npm install @fontsource/roboto

   # Using yarn
   yarn add @fontsource/roboto
   ```

### 2. **Import the Font in Your Stylesheet**
   - Import the font in your main CSS or SCSS file. If you're using the `application.css` file, you can do it as follows:

   ```css
   /* app/assets/stylesheets/application.css */

   @import "@fontsource/roboto"; /* Defaults to weight 400 */
   @import "@fontsource/roboto/700.css"; /* For weight 700 */
   ```

   If you have an `application.scss` file:

   ```scss
   /* app/assets/stylesheets/application.scss */

   @import "@fontsource/roboto/index.css"; /* Defaults to weight 400 */
   @import "@fontsource/roboto/700.css"; /* For weight 700 */
   ```

   This method gives you more flexibility, as you can import specific font weights and styles as needed.

### 3. **Configure Tailwind to Use the Font**
   - Open your `tailwind.config.js` file.
   - Extend the default theme to include the new fonts, just as you would with any other font.

   ```javascript
   // tailwind.config.js

   module.exports = {
     content: [
       './app/helpers/**/*.rb',
       './app/javascript/**/*.js',
       './app/views/**/*.erb',
     ],
     theme: {
       extend: {
         fontFamily: {
           sans: ['Roboto', 'Helvetica', 'Arial', 'sans-serif'],
         },
       },
     },
     plugins: [],
   }
   ```

### 4. **Apply the Font in Your HTML or Components**
   - Use the font in your views or components with Tailwind’s utility classes.

   ```html
   <!-- Example usage in an ERB view -->
   <h1 class="font-sans text-3xl">
     Welcome to My Rails 7 App!
   </h1>
   ```

### 5. **Optimize for Production**
   - The `@fontsource` library allows you to self-host fonts, which can lead to better performance since the fonts are served directly from your server.
   - Additionally, ensure Tailwind CSS purges unused styles in production by including the correct paths in your `tailwind.config.js`.

### Benefits of Using `@fontsource`:
- **Self-Hosting**: Fonts are hosted on your own server, improving control over load times and privacy.
- **Specific Weights/Styles**: Import only the font weights and styles you need, which can reduce the size of your CSS.
- **Offline Development**: No need for an internet connection to load fonts during development.

By following these steps, you'll be able to use the `@fontsource` library with Tailwind CSS in your Rails 7 project, maintaining best practices for font loading and overall performance.