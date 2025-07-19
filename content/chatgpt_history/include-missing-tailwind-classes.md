---
title: Include Missing Tailwind Classes
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Include Missing Tailwind Classes

## ✅ TODOs


## 📌 Summary
In tailwind I have a few css classes that are not built because I don't reference them explicitly in a gem that has view_components (rails). How can I pass in the missing tailwind properly? It's called aria-group-expanded:block

## 🧠 Full Chat


In tailwind I have a few css classes that are not built because I don't reference them explicitly in a gem that has view_components (rails). How can I pass in the missing tailwind properly? It's called aria-group-expanded:block

If you're using Tailwind CSS with a Rails application and some of the utility classes aren't getting generated because they aren't detected in your templates, there are several ways to ensure they're included in the final build:

1. **Using Comments in CSS:**

   You can specify classes that you want to include within the stylesheets (typically in `application.css` or `tailwind.css`) using a comment. This way, they'll be picked up by Tailwind's JIT mode.

   ```css
   /* 
     These classes are always included in the build.
     @layers base, components, and utilities {
       .always-included-class {}
     }
   */

   /* 
     Or specifically for your case:
     @layers utilities {
       .aria-group-expanded\:block {}
     }
   */
   ```

2. **Tailwind Configuration (`tailwind.config.js`):**

   Another approach is to extend the default set of generated utilities directly in the Tailwind configuration file:

   ```javascript
   module.exports = {
     // ... other config settings ...
     theme: {
       // ...
     },
     variants: {},
     plugins: [],
     purge: {
       // ... your purge settings ...
     },
     extend: {
       display: ['aria-group-expanded']
     }
   }
   ```

   Note that this example assumes you're trying to add a new variant named `aria-group-expanded` for the `display` utility. Adjust as needed for your use case.

3. **Safelisting in Purge Configuration:**

   If you're using Tailwind's purge feature (and you likely are, especially in a production build), then you might be inadvertently purging certain classes. You can safelist certain classes to make sure they're not purged.

   In `tailwind.config.js`:

   ```javascript
   module.exports = {
     // ... other settings ...
     purge: {
       content: ['./path/to/your/files/**/*.html.erb', './path/to/your/files/**/*.rb', /* ... other file types ... */],
       options: {
         safelist: ['aria-group-expanded:block']
       }
     },
   }
   ```

Pick the method that makes the most sense for your application. The comment method in the CSS files is straightforward and works best if you have just a handful of classes that are not detected. If you find yourself adding more and more classes this way, you might want to consider using the configuration methods for better maintainability.

it seems like this is the aria attributes plugin. How can I add a block config?
  plugins: [
    pluginAriaAtts,
    plugin(function plugins({ addUtilities, addVariant }) {
      addUtilities({
        '.visible': {
          visibility: 'visible'
        },
        '.invisible': {
          visibility: 'hidden'
        }
      });
      addVariant('hocus', ['&:hover', '&:focus']);
    })
  ]


The ARIA attributes plugin for Tailwind is a custom plugin, and if you're trying to add a utility for `aria-group-expanded` that sets the `display` property to `block`, you can do so by extending your existing plugin configuration.

Here's an example of how you can extend your existing `plugins` array to include the new utility:

```javascript
const plugin = require('tailwindcss/plugin');

module.exports = {
  // ... other Tailwind config settings ...

  plugins: [
    pluginAriaAtts,
    plugin(function ({ addUtilities, addVariant }) {
      addUtilities({
        '.visible': {
          visibility: 'visible',
        },
        '.invisible': {
          visibility: 'hidden',
        },
        '.aria-group-expanded\\:block': {
          display: 'block',
        },
      });
      addVariant('hocus', ['&:hover', '&:focus']);
    }),
  ],
};
```

In the above code:

1. We're using the `require('tailwindcss/plugin')` function to access the plugin API.
2. We're adding a new utility `.aria-group-expanded\\:block` with the double backslashes `\\` in front of the colon `:` to escape it in JavaScript string literals.
3. This new utility will apply the CSS property `display: block` when the class is used.

With this configuration, the new utility class will be generated, and you can use it in your HTML like this:

```html
<div class="aria-group-expanded:block">...</div>
```

Remember to rebuild your Tailwind CSS file for the changes to take effect. If you're using the Just-In-Time (JIT) mode, it should pick up the changes immediately, but for other modes, you might need to rebuild.