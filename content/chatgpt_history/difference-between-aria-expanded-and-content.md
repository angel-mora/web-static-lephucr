---
title: Difference Between aria-expanded and Content
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Difference Between aria-expanded and Content

## ✅ TODOs


## 📌 Summary
what is the difference between "content expanded" and aria-group-expanded and "content collapsed"

## 🧠 Full Chat


what is the difference between "content expanded" and aria-group-expanded and "content collapsed"

The terms you're referring to seem to be a mix of general descriptive terms ("content expanded" and "content collapsed") and an attribute used in web accessibility ("aria-expanded"). Here's a breakdown of each:

1. "Content Expanded":
   This term isn't an official HTML or ARIA (Accessible Rich Internet Applications) attribute. It's a general description that could be used to indicate that a section of content on a webpage is currently in an expanded state, meaning it is fully visible to the user. This could apply to accordions, dropdown menus, or any content that can be toggled between showing and hiding.

2. `aria-expanded`:
   This is an actual attribute used in ARIA, a set of attributes that make web content more accessible to people with disabilities. The `aria-expanded` attribute is used to indicate the current state of collapsible content. It can have the values "true" or "false", and when assistive technologies (like screen readers) encounter this attribute, they can communicate to users whether the content is expanded or collapsed. For example:

   ```html
   <button aria-expanded="true">More Details</button>
   ```

   In this case, `aria-expanded="true"` indicates that the content associated with the button is currently expanded.

3. "Content Collapsed":
   Similar to "content expanded," this term isn't an official HTML or ARIA attribute. It's a descriptive phrase that refers to the state of content when it is not currently visible to the user—typically because the user has chosen to hide or collapse it.

4. `aria-controls` (possibly what you meant by "aria-group-expanded"):
   This attribute links an interactive element that controls the expansion of content with the content that it controls. For example, if a button is used to expand or collapse a section of content, the `aria-controls` attribute on the button would reference the ID of the content section. There's no attribute called "aria-group-expanded" in the ARIA specification.

Here’s an example that shows both `aria-expanded` and `aria-controls` in use:

```html
<button aria-expanded="false" aria-controls="contentSection">More Details</button>
<div id="contentSection" hidden>
   This is the content that will be shown or hidden when the button is pressed.
</div>
```

In this example, when the button is clicked, a JavaScript function would typically toggle the `hidden` attribute of the `div` and update the `aria-expanded` attribute on the button accordingly, to maintain accessibility.

{"content_type"=>"image_asset_pointer", "asset_pointer"=>"file-service://file-jhO9nSt71S9kyOqm4ySyT5Zz", "size_bytes"=>79057, "width"=>838, "height"=>594, "fovea"=>nil, "metadata"=>nil}

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

Based on the code you’ve provided, you already have the foundation for a toggle functionality implemented using the Stimulus JavaScript framework. The JavaScript controller you have handles the toggling of visibility of an element and updating the `aria-expanded` attribute.

However, there are a few enhancements you could make to the view and controller to ensure that the toggle button text and icons change between "More" and "Less".

### JavaScript Controller:

In your controller, you could add an action to specifically handle the toggle of text and icons within the button. For this, you can make use of the `static targets` array to define new targets that will be toggled.

```javascript
export default class extends Controller {
  static targets = ["toggleTrigger", "moreText", "lessText", "moreIcon", "lessIcon"];

  display(e) {
    e.stopPropagation();

    // Toggle the content visibility
    document.getElementById(this.controls).classList.toggle('hidden');

    // Toggle aria-expanded attribute
    this.element.setAttribute('aria-expanded', this.expanded === 'true' ? 'false' : 'true');
    
    // Toggle visibility of text and icons
    this.toggleDisplayElements();
  }

  toggleDisplayElements() {
    this.moreTextTargets.forEach(el => el.classList.toggle('hidden'));
    this.lessTextTargets.forEach(el => el.classList.toggle('hidden'));
    this.moreIconTargets.forEach(el

=> el.classList.toggle('hidden'));
    this.less

You have already implemented most parts of the toggle functionality. However, you might be missing the correct CSS and Javascript functionality to handle the visual toggle of