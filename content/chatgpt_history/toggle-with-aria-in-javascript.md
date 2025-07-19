---
title: Toggle with ARIA in JavaScript
tags:
- display
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Toggle with ARIA in JavaScript

## ✅ TODOs
- [ ] that:

## 📌 Summary
{"content_type"=>"image_asset_pointer", "asset_pointer"=>"file-service://file-70yA6JhZXvgVZfXjNIqJUTnr", "size_bytes"=>89432, "width"=>1100, "height"=>612, "fovea"=>nil, "metadata"=>nil}

## 🧠 Full Chat


{"content_type"=>"image_asset_pointer", "asset_pointer"=>"file-service://file-70yA6JhZXvgVZfXjNIqJUTnr", "size_bytes"=>89432, "width"=>1100, "height"=>612, "fovea"=>nil, "metadata"=>nil}

how can I implement a toggle that has a button to show 'more' or 'less' when clicking, I have this controller and this show file in ruby 

import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [
    'toggleTrigger'
  ];

  get controls() {
    return this.element.getAttribute('aria-controls');
  }

  get expanded() {
    return this.element.getAttribute('aria-expanded');
  }

  display(e) {
    e.stopPropagation();

    document.getElementById(this.controls).classList.toggle('hidden');

    this.element.setAttribute('aria-expanded', this.expanded === 'true' ? 'false' : 'true');
  }

  hideAll() {
    this.toggleTriggerTargets.forEach(trigger => {
      trigger.setAttribute('aria-expanded', 'false');
      document.getElementById(trigger.getAttribute('aria-controls')).classList.add('hidden');
    });
  }

  hideAllCheck(e) {
    const controls = this.toggleTriggerTarget.getAttribute('aria-controls');
    const controlsEl = document.querySelector(`#${controls}`);

    if (!controlsEl.contains(e.target)) {
      this.hideAll();
    }
  }
}


and this is the view for toggle 

    <%= render(SoftwareReviewsShared::Toggle::ToggleComponent.new(
      controls: 'features-more',
      expanded: 'false',
      classes: 'group flex items-center p-0 font-bold text-base text-secondary-400 bg-transparent'
    )) do %>
      <%= tag.span I18n.t('software_reviews.show.intro.more'), class: 'group-aria-expanded:hidden underline' %>
      <%= render(SoftwareReviewsShared::UI::IconComponent.new(icon: 'plus', classes: 'group-aria-expanded:hidden ml-1')) %>
      <%= tag.span I18n.t('software_reviews.show.intro.less'), class: 'hidden group-aria-expanded:block underline' %>
      <%= render(SoftwareReviewsShared::UI::IconComponent.new(icon: 'minus', classes: 'hidden group-aria-expanded:block ml-1')) %>
    <% end %>  

I would like to use aria expanded intead of clases so I don't have issues using tailwind. I have this two hidden elements.
 

You can adjust your Stimulus controller and the view to fully utilize ARIA roles and properties. In the controller, modify the `display` method to toggle the `aria-expanded` attribute, and then use CSS to control the visibility of the content. In the view, you can use the `[aria-expanded='true']` and `[aria-expanded='false']` selectors.

Here's the adjusted JavaScript code for your controller:

```javascript
import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['toggleTrigger'];

  display(e) {
    e.stopPropagation();

    const content = document.getElementById(this.element.getAttribute('aria-controls'));
    const isExpanded = this.element.getAttribute('aria-expanded') === 'true';

    this.element.setAttribute('aria-expanded', !isExpanded);

    if (isExpanded) {
      content.classList.add('hidden');
    } else {
      content.classList.remove('hidden');
    }
  }
}
```

And here is how you might adjust your CSS:

```css
[aria-expanded='true'] .show-when-expanded {
  display: block !important;
}

[aria-expanded='false'] .hide-when-expanded {
  display: block !important;
}

[aria-expanded='true'] .hide-when-expanded,
[aria-expanded='false'] .show-when-expanded {
  display: none !important;
}
```

For your view, you might use:

```erb
<%= render(SoftwareReviewsShared::Toggle::ToggleComponent.new(
  controls: 'features-more',
  expanded: 'false',
  classes: 'group flex items-center p-0 font-bold text-base text-secondary-400 bg-transparent'
)) do %>
  <%= tag.span I18n.t('software_reviews.show.intro.more'), class: 'hide-when-expanded' %>
  <%= render(SoftwareReviewsShared::UI::IconComponent.new(icon: 'plus', classes: 'hide-when-expanded ml-1')) %>
  <%= tag.span I18n.t('software_reviews.show.intro.less'), class: 'show-when-expanded' %>
  <%= render(SoftwareReviewsShared::UI::IconComponent.new(icon: 'minus', classes: 'show-when-expanded ml-1')) %

To implement a toggle that shows "more" or "less" when clicking, and use ARIA attributes instead of class toggling, you can modify the JavaScript controller and the HTML view like this:

1. **JavaScript Controller:**

   - For the `display` method, toggle the `aria-expanded` attribute directly, and handle the visibility of the elements using this attribute in CSS.
   
   ```javascript
   import { Controller } from '@hotwired/stimulus';

   export default class extends Controller {
     static targets = ['toggleTrigger'];
   
     display(e) {
       e.stopPropagation();
   
       const content = document.getElementById(this.controls);


I dont want to edit css eaither 

If you'd like to manage the toggle functionality purely with JavaScript and ARIA attributes without modifying CSS, you can update the visibility of the elements directly within your `display` method in the controller. Here’s how you could modify the `display` method:

```javascript
import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['toggleContent', 'toggleTrigger'];

  display(e) {
    e.stopPropagation();

    const content = this.toggleContentTarget;
    const isExpanded = this.element.getAttribute('aria-expanded') === 'true';

    if (isExpanded) {
      content.classList.add('hidden');
      this.element.setAttribute('aria-expanded', 'false');
    } else {
      content.classList.remove('hidden');
      this.element.setAttribute('aria-expanded', 'true');
    }
  }
}
```

In your HTML view, you’d need to set the `data-toggle-content-target` attribute to the content that you want to toggle:

```erb
<%= render(SoftwareReviewsShared::Toggle::ToggleComponent.new(
  controls: 'features-more',
  expanded: 'false',
  classes: 'group flex items-center p-0 font-bold text-base text-secondary-400 bg-transparent'
)) do %>
  <%= tag.span I18n.t('software_reviews.show.intro.more'), 
               class: 'toggleTrigger',
               data: { action: 'click->toggle#display', toggle_content_target: 'toggleContent' } %>
  
  <div id="features-more" class="hidden" data-toggle-content-target="toggleContent">
    <!-- Your toggle content goes here -->
  </div>
<% end %>
```

In this example, clicking on the element with the class `toggleTrigger` will execute the `display` method, toggling the visibility of the element with the ID `features-more` and the `data-toggle-content-target="toggleContent"` attribute. The `hidden` class should be a utility class that applies a `display: none` style to the element. Since you’re using TailwindCSS, the `hidden` class is a standard utility class that you can use.

my colleage suggested that maybe we could pass in "content expanded" and "content collapsed" instead of class names. That way the class will exist in shared gem and we don't have to pass classes through the repository that calls the gem

Your colleague’s suggestion could indeed simplify the process and make the component more versatile. You can define two properties: `contentExpanded` and `contentCollapsed`, and then toggle between them based on the `aria-expanded` attribute. Here is how you might revise the controller:

```javascript
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["content", "trigger"];

  display(e) {
    e.stopPropagation();
    const content = this.contentTarget;
    const isExpanded = this.element.getAttribute("aria-expanded") === "true";

    if (isExpanded) {
      content.innerHTML = this.contentCollapsed;
      this.element.setAttribute("aria-expanded", "false");
    } else {
      content.innerHTML = this.contentExpanded;
      this.element.setAttribute("aria-expanded", "true");
    }
  }

  get contentExpanded() {
    return this.data.get("expanded");
  }

  get contentCollapsed() {
    return this.data.get("collapsed");
  }
}
```

Then in your HTML:

```erb
<%= render(SoftwareReviewsShared::Toggle::ToggleComponent.new(
  controls: 'features-more',
  expanded: 'false',
  classes: 'group flex items-center p-0 font-bold text-base text-secondary-400 bg-transparent'
)) do %>
  <button data-action="click->toggle#display"
          data-toggle-content-target="content"
          data-toggle-expanded="<%= your_expanded_content %>"
          data-toggle-collapsed="<%= your_collapsed_content %>">
    Toggle
  </button>

  <div id="features-more" data-toggle-target="content">
    <!-- Your initial content goes here, either expanded or collapsed -->
  </div>
<% end %>
```

In this version, the button has `data-toggle-expanded` and `data-toggle-collapsed` attributes that store the expanded and collapsed contents. When the button is clicked, the `display` method retrieves the content from these attributes and sets it inside the content div. 

Remember to replace `<%= your_expanded_content %>` and `<%= your_collapsed_content %>` with the actual content or variables that hold the content you wish to display in expanded and collapsed states.

can you explain "content expanded" and "content collapsed" 

Certainly! "Content expanded" and "content collapsed" refer to the two different states that your toggleable content can be in. 

1. **Content Expanded:**
   - This is the state where additional information is visible to the user. 
   - For instance, if you have a "Read More" toggle, clicking it would reveal more text or elements, showing the "expanded" state of the content.
   - The "content expanded" could be a block of HTML or text that you want to show when the toggle is activated/opened.

2. **Content Collapsed:**
   - This is the minimized or hidden state of the content.
   - Using the same "Read More" toggle example, the "collapsed" state would be the shorter version of the text or the hidden elements that are initially displayed before the toggle is activated.
   - The "content collapsed" would be a more concise block of HTML or text that is displayed when the toggle is deactivated/closed.

In the context of passing "content expanded" and "content collapsed" as data attributes, it means that you are providing the content for both states directly within the HTML element attributes. You might have something like this:

```html
<button data-action="click->toggle#display"
        data-toggle-expanded="<div>Expanded content here...</div>"
        data-toggle-collapsed="<div>Collapsed content here...</div>">
  Toggle
</button>
```

In this example, the `data-toggle-expanded` and `data-toggle-collapsed` attributes hold the HTML content for each state. The JavaScript would then swap these contents in and out based on user interaction with the toggle button.

This method allows you to encapsulate the toggleable content within the attributes of the toggling element, making your HTML and JavaScript somewhat cleaner and more maintainable. It can be particularly beneficial when the toggled content is not too extensive, keeping the data attributes reasonably short and manageable.

where does classes belong in the context of ruby on rails, tailwind,  js and stimulus

In a Ruby on Rails application using TailwindCSS, JavaScript, and Stimulus, classes can belong in various places, each serving a distinct purpose. Here’s a breakdown:

### 1. **Ruby on Rails (RoR) - View Templates:**
   - In your Rails views (e.g., ERB or Haml

where do these classes belong to in the context of ruby on rails, tailwind,  js and stimulus?

The classes in the context you are mentioning typically refer to CSS classes, predominantly from TailwindCSS, if that's what is being used in the project. Here’s where and how these classes are generally applied or manipulated within the realms of Ruby on Rails, TailwindCSS, JavaScript, and Stimulus:

### 1. **Ruby on Rails (RoR):**
   - In Rails, you will primarily apply classes in the view files (ERB, Haml, etc.). These classes are added to HTML elements to style and position them.
   - Components or partials may have predefined classes to maintain a consistent look and feel.

### 2. **TailwindCSS:**
   - TailwindCSS classes are utility classes that you apply directly in your markup.
   - In a Rails application, TailwindCSS classes will be used extensively

"content expanded" and "content collapsed"  are classes that belog to tailwind? 

No, "content expanded" and "content collapsed" are not classes from TailwindCSS or any CSS framework by default. In the context of your discussion, it seems like "content expanded" and "content collapsed" are being referred to as possible state descriptions or identifiers, not CSS classes per se.

If these terms are used to refer to CSS classes in your project, they would likely be custom classes that have been defined within your project’s stylesheet to manage the appearance or visibility of content based on its toggle state.

Here’s a possible interpretation in the context of CSS classes:

- `content-expanded`: A custom CSS class that might be applied to content that is currently visible or "expanded."
- `content-collapsed`: A custom CSS class that could be applied to

"content expanded" and "content collapsed"  are classes that belong to tailwind or aria-attributes? 

It seems like there might have been a misunderstanding. "content expanded" and "content collapsed" are neither TailwindCSS classes nor aria-attributes directly. Instead, they seem to be conceptual references made by your colleague to indicate two different states of the content you want to toggle.

- **Content Expanded:** A state where additional content is shown. In this state, the button or element controlling the toggle might have an `aria-expanded="true"` attribute to indicate accessibility tools that the content is currently expanded.

- **Content Collapsed:** A state where additional content is hidden or minimized. In this state, the button or element controlling the toggle might have an `aria-expanded="false"` attribute.

So, when your colleague mentioned "passing in 'content expanded' and 'content collapsed'," they might have been referring to passing different CSS classes or HTML content representing each state and then toggling between them based on user interactions.

For example, if you are passing these as CSS classes:

- The **class** or **classes** defining the "content expanded" state might style the content in a way that it's fully visible.
- The **class** or **classes** defining the "content collapsed" state might apply styles that hide or minimize the content.

But, if you're passing in HTML content:

- "Content expanded" might refer to the block of HTML that should be displayed when the content is in its expanded state.
- "Content collapsed" might refer to the block of HTML that should be displayed when the content is in its collapsed state.

In either case, these are not standard TailwindCSS classes or ARIA attributes, but rather custom classes or content blocks that you would define based on the needs of your toggle functionality.

how can I test it in devloper tools?

To test the toggling of "content expanded" and "content collapsed" states in Developer Tools (e.g., in Google Chrome), you could follow these general steps:

### 1. **Open Developer Tools:**
   - Right-click on the page and select 'Inspect', or use `Cmd + Option + I` (Mac) or `Ctrl + Shift + I` (Windows/Linux).

### 2. **Locate the Element:**
   - Find the HTML element that has the toggle functionality in the 'Elements' tab.
   - You can use the element selector tool in the top left corner of the Developer Tools to quickly find the element on the page.

### 3. **Toggle the State:**
   - If the toggle is being controlled via CSS classes:
     - You can manually add or remove the CSS classes that represent the expanded and collapsed states directly in the 'Elements' tab and observe how the appearance changes.

   - If it’s controlled via JavaScript (e.g., Stimulus):
     - You may want to go to the ‘Console’ tab and call the JavaScript function that toggles the state, or interact directly with the UI (clicking buttons) and observe how the element's content and attributes change.

### 4. **Observe ARIA Attributes:**
   - If ARIA attributes like `aria-expanded` are being used, you can observe how they change as you interact with the toggle.
   - Look for changes in the `aria-expanded` attribute in the 'Elements' tab as you interact with the toggle.

### 5. **Check Visibility or Styling:**
   - Check whether the visibility or the styling of the content changes appropriately when toggling between expanded and collapsed states.
   - The changes should be visible in the styles pane in the 'Elements' tab.

### 6. **Use the Console for JavaScript Debugging:**
   - If JavaScript (Stimulus)

I was meant to test it in sources 

Testing toggling functionality directly within the "Sources" tab in Chrome Developer Tools is typically related to debugging JavaScript. Here’s how you can do it:

### 1. **Open Developer Tools and Go to the "Sources" Tab:**
   - Right-click on your webpage and select 'Inspect', or use shortcut keys (`Cmd + Option + I` on Mac, `Ctrl + Shift + I` on Windows/Linux).
   - Click on the "Sources" tab.

### 2. **Navigate to Your JavaScript File:**
   - In the left sidebar, find and open the JavaScript file where your Stimulus controller (or other toggle functionality) is defined.
   - You might find your files organized by folder, based on your project’s structure.

### 3. **Set Breakpoints:**
   - Click on the line number next to the code where you want to pause execution. This will set a breakpoint.
   - You might want to set breakpoints where the toggle function gets executed, to inspect how variables and elements are being manipulated.

### 4. **Interact with the Toggle on Your Webpage:**
   - Go back to your webpage and interact with the toggle element (e.g., click the button that triggers the toggle).
   - The debugger should pause at your breakpoint, allowing you to inspect variables, the call stack, and other aspects.

### 5. **Step Through the Code:**
   - Use the controls in the Developer Tools to step through the code line by line, observing how variables and states change.
   - Check if the "content expanded" and "content collapsed" states are being toggled correctly according to your logic.

### 6. **Observe Console Logs:**
   - While paused at a breakpoint, you can also go to the "Console" tab to evaluate expressions or view any `console.log()` statements that you added to your code.

### 7. **Continue Execution:**
   - You can resume script execution by pressing the resume button in Developer Tools. The script will continue to run, and it will pause again if there are more breakpoints.

Doing this will allow you to step through your JavaScript code in real-time, observing how the toggling functionality is being handled and how the content is being manipulated between "expanded" and "collapsed" states.

I would like to understand better the previous suggestions you shared, could you explain al hel pe try this on without needing to change all controller?

Copy code
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["content", "trigger"];

  display(e) {
    e.stopPropagation();
    const content = this.contentTarget;
    const isExpanded = this.element.getAttribute("aria-expanded") === "true";

    if (isExpanded) {
      content.innerHTML = this.contentCollapsed;
      this.element.setAttribute("aria-expanded", "false");
    } else {
      content.innerHTML = this.contentExpanded;
      this.element.setAttribute("aria-expanded", "true");
    }
  }

  get contentExpanded() {
    return this.data.get("expanded");
  }

  get contentCollapsed() {
    return this.data.get("collapsed");
  }
}
Then in your HTML:

erb
Copy code
<%= render(SoftwareReviewsShared::Toggle::ToggleComponent.new(
  controls: 'features-more',
  expanded: 'false',
  classes: 'group flex items-center p-0 font-bold text-base text-secondary-400 bg-transparent'
)) do %>
  <button data-action="click->toggle#display"
          data-toggle-content-target="content"
          data-toggle-expanded="<%= your_expanded_content %>"
          data-toggle-collapsed="<%= your_collapsed_content %>">
    Toggle
  </button>

  <div id="features-more" data-toggle-target="content">
    <!-- Your initial content goes here, either expanded or collapsed -->
  </div>
<% end %>

Certainly! The given code is using the Stimulus JavaScript framework, and it's designed to toggle the content of an element between two states when a button is clicked. Let me break down the essential parts of the code and explain how it works:

### 1. **JavaScript (Stimulus Controller):**

   - **`static targets = ["content", "trigger"];`**
     - Declares two target elements that the controller will manage: the content to be toggled and the button that will trigger the toggle.
   
   - **`display(e)` Method:**
     - Triggered when the button is clicked.
     - It stops the event from propagating to avoid unintended side effects.
     - The method toggles the inner HTML of the content target based on the `aria-expanded` attribute.
   
   - **`get contentExpanded()` and `get contentCollapsed()` Methods:**
     - These getter methods retrieve the expanded and collapsed content from the data attributes (`data-toggle-expanded` and `data-toggle-collapsed`) of the HTML element.

### 2. **HTML (ERB Template):**

   - **Button Element:**
     - This button is the trigger. When clicked, it will call the `display(e)` method in the Stimulus controller.
     - The `data-toggle-expanded` and `data-toggle-collapsed` attributes hold the HTML content for the expanded and collapsed states.
   
   - **Div Element:**
     - This div holds the content that will be toggled.
     - The `data-toggle-target="content"` attribute associates this div with the `content` target in the Stimulus controller.

### How to Test and Modify:

- **In the Browser:**
  - When you click the button on the webpage, it should toggle the content in the specified div between the expanded and collapsed states.
  
- **In the Code:**
  - If you want to modify the expanded or collapsed content, you can change the values of the `data-toggle-expanded` and `data-toggle-collapsed` attributes directly in the HTML.
  - If you need to adjust the toggle behavior, you can modify the `display(e)` method in the JavaScript file.

So, in this setup, you're not strictly tied to using CSS classes to manage the toggle state. Instead, it directly manipulates the HTML content based on the button clicks, making the toggle functionality somewhat more dynamic and flexible based on the content you provide in the data attributes.

can you help me test collapsed without changing all file?

Certainly! You can test the "collapsed" state directly in the browser without modifying the actual files. Here is a step-by-step guide to do that:

### 1. **Open Your Application in a Browser:**
   - Load the page where the toggle functionality is implemented.

### 2. **Open Developer Tools:**
   - You can do this by right-clicking on the page and selecting 'Inspect', or using the shortcut `Cmd+Option+I` on Mac or `Ctrl+Shift+I` on Windows/Linux.

### 3. **Locate the Toggle Button Element:**
   - In the 'Elements' tab of Developer Tools, find the button element that triggers the toggle functionality.

### 4. **Modify the Data Attribute:**
   - You can manually edit the `data-toggle-collapsed` attribute to test different "collapsed" contents.
   - Double-click on the `data-toggle-collapsed` attribute within the button element and modify its value. 

### 5. **Trigger the Toggle:**
   - Go back to your webpage (outside of Developer Tools) and interact with the toggle button to see how the "collapsed" state appears based on your modifications.
   - You may need to refresh the page and repeat the process if you want to test different "collapsed" contents multiple times.

### 6. **Repeat as Necessary:**
   - You can repeat steps 4 and 5 to test different "collapsed" states without having to modify and save the actual source files.

Keep in mind that these changes are temporary and will be lost once you refresh the page. For permanent changes, you'll eventually need to modify the source files and re-deploy your application. This method allows for quick, temporary testing and visualization of different "collapsed" states directly within the browser.

I just need to test data toggle collapsed but apparently i need to change the view in rails, right 

To test changing the "collapsed" content without modifying the view file in Rails, you can do it directly in the browser using Developer Tools by editing the `data-toggle-collapsed` attribute value temporarily. Here’s a quick guide:

### 1. **Open Your Application in the Browser:**
   - Navigate to the webpage where your toggle functionality is located.

### 2. **Open Developer Tools:**
   - Right-click on the toggle button and select 'Inspect', or use the shortcut (`Cmd+Option+I` on Mac or `Ctrl+Shift+I` on Windows/Linux).

### 3. **Find the Toggle Button Element:**
   - In the 'Elements' tab, find the button that has the `data-toggle-collapsed` attribute.

### 4. **Edit the `data-toggle-collapsed` Attribute:**
   - Double-click on the `data-toggle-collapsed` attribute to make it editable.
   - Change the value to whatever content you want to test for the collapsed state.
   - Press Enter to

I didn't informed that I haven't implement your suggested code 

I see. If you haven't implemented the changes and you want to test the "collapsed" state, you'll need to manually trigger this state in the current implementation of your code. Here’s how you can do it:

### 1. **Open Your Application in a Browser:**
   - Load the page where the toggle functionality is implemented.

### 2. **Open Developer Tools:**
   - You can do this by right-clicking on the page and selecting 'Inspect', or using the shortcut `Cmd+Option+I` on Mac or `Ctrl+Shift+I` on Windows/Linux.

### 3. **Locate the Toggleable Content:**
   - In the 'Elements' tab of Developer Tools, find the element that contains the toggleable content.

### 4. **Manually Change the Visibility:**
   - If the "collapsed" state is controlled by CSS classes (like `hidden`), you can manually add or remove these classes in the 'Elements' tab to mimic the collapsed state.
   - If the "collapsed" state is controlled by JavaScript, you might need to manually trigger the JavaScript function or event handler responsible for collapsing the content. This might be done by interacting with the webpage UI or using the JavaScript console in the Developer Tools to execute the necessary function or method.

### 5. **Review the Changes:**
   - After manually triggering the "collapsed" state, review how the content appears and behaves on the webpage.

These manual changes are temporary and just for testing purposes. They allow you to visually and functionally inspect the "collapsed" state without making changes to the actual codebase. Remember, to make permanent changes or to systematically alter the toggle behavior, you’ll eventually need to modify the source files, whether they are JavaScript, CSS, or Rails view files.