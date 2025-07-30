---
title: Click Button Without ID
tags:
- clearallaction
- default
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  I have a capybara spec that produces this html"
draft: false
---

# Click Button Without ID

## 🧠 Full Chat

🙋 **You:**

I have a capybara spec that produces this html
      <input type="submit" name="commit" value="Clear All" id="button-clear-all" form="main-form" class="button button-apply button-dark-purple-default button-disabled-ghost" formmethod="post" style="display: none;" formaction="/training/learning-content-library/clear_all" data-disable-with="Clear All">
      <button name="button" type="submit" class="button button-clear button-blue-ghost" data-action="click->learning-content-library#clearAllAction">Clear All</button>

from a submit_tag. I want to test the button is clicked but I don't see any ids in the button but only in the input tag. What can I do? This is my spec and also the submit_tag

        scroll_to(find_by_id('button-clear-all', visible: :all))
        find_by_id('button-clear-all').click

      <%= submit_tag 'Clear All',
                     id: kebabize(LearningContentLibraryHelper::FORM_BUTTONS[:button_clear_all]),
                     form: kebabize(LearningContentLibraryHelper::FORM_ELEMENTS[:main_form]),
                     class: 'button button-apply button-dark-purple-default button-disabled-ghost',
                     formmethod: :post,
                     style: 'display: none;',
                     formaction: learning_content_library_clear_all_path
      %>

---

🤖 **Assistant:**

In your current HTML, you have a `button` element without an ID and an `input` element with an ID but with `display: none;` style. To click the `button` element in your Capybara spec, you can use the class selector instead of the ID. Here's how you can do it:

1. Update your Capybara spec to find and click the `button` element using its class:

```ruby
# Scroll to the input element (which is hidden) to ensure the page is in the correct state
scroll_to(find_by_id('button-clear-all', visible: :all))

# Find and click the button using its class
find('.button.button-clear.button-blue-ghost').click
```

Alternatively, you can add an ID to your `button` element in the HTML for easier selection:

2. Update your HTML to add an ID to the `button` element:

```erb
<input type="submit" name="commit" value="Clear All" id="button-clear-all" form="main-form" class="button button-apply button-dark-purple-default button-disabled-ghost" formmethod="post" style="display: none;" formaction="/training/learning-content-library/clear_all" data-disable-with="Clear All">
<button id="button-clear-action" name="button" type="submit" class="button button-clear button-blue-ghost" data-action="click->learning-content-library#clearAllAction">Clear All</button>
```

3. Update your Capybara spec to use the new ID:

```ruby
# Scroll to the input element (which is hidden) to ensure the page is in the correct state
scroll_to(find_by_id('button-clear-all', visible: :all))

# Find and click the button using its new ID
find_by_id('button-clear-action').click
```

By adding an ID to the `button` element, you make your spec more robust and easier to maintain, as you can directly reference the element by its ID.

---

🙋 **You:**

fix this selector
find_by_id('button-clear-all').click

to be able to find the button next to the input in this submit_tag
        <%= submit_tag 'defaultButton',
                       id: 'default-button',
                       form: kebabize(LearningContentLibraryHelper::FORM_ELEMENTS[:main_form]),
                       formmethod: :post,
                       style: 'display: none;',
                       onclick: 'return false;'
        %>

---

🤖 **Assistant:**

To fix the selector and find the button next to the input in the `submit_tag`, you can use the sibling combinator (`+`) in your CSS selector to select the button that follows the input with the specific ID. Here's how you can do it:

1. Ensure the HTML structure is as follows:
    ```erb
    <%= submit_tag 'defaultButton',
                   id: 'default-button',
                   form: kebabize(LearningContentLibraryHelper::FORM_ELEMENTS[:main_form]),
                   formmethod: :post,
                   style: 'display: none;',
                   onclick: 'return false;'
    %>
    <button name="button" type="submit" class="button button-clear button-blue-ghost" data-action="click->learning-content-library#clearAllAction">Clear All</button>
    ```

2. Use the Capybara CSS selector to find the `button` element that comes immediately after the input with the ID `default-button`:

    ```ruby
    # Scroll to the input element (which is hidden) to ensure the page is in the correct state
    scroll_to(find_by_id('default-button', visible: :all))

    # Find and click the button that follows the input with the ID 'default-button'
    find('#default-button + button').click
    ```

In this code:
- `#default-button + button` is the CSS selector that finds the `button` element immediately following the `input` element with the ID `default-button`.
- `scroll_to(find_by_id('default-button', visible: :all))` ensures the page scrolls to the hidden input element to ensure the page is in the correct state.

This way, your Capybara spec can accurately find and interact with the `button` element next to the `input` generated by the `submit_tag`.

---

🙋 **You:**

fix this selector
find_by_id('button-clear-all').click

to be able to find the button next to the input in this submit_tag
        <%= submit_tag 'defaultButton',
                       id: 'default-button',
                       form: kebabize(LearningContentLibraryHelper::FORM_ELEMENTS[:main_form]),
                       formmethod: :post,
                       style: 'display: none;',
                       onclick: 'return false;'
        %>

---

🤖 **Assistant:**

To modify the selector to find the button next to the input generated by the `submit_tag`, you can use a CSS sibling selector. Assuming the button is directly after the input in the HTML structure, you can use the `+` combinator.

First, ensure your HTML structure is correct:

```erb
<%= submit_tag 'defaultButton',
               id: 'default-button',
               form: kebabize(LearningContentLibraryHelper::FORM_ELEMENTS[:main_form]),
               formmethod: :post,
               style: 'display: none;',
               onclick: 'return false;'
%>
<button name="button" type="submit" class="button button-clear button-blue-ghost" data-action="click->learning-content-library#clearAllAction">Clear All</button>
```

Then, update your Capybara spec to use a CSS sibling selector to find the button next to the input:

```ruby
# Scroll to the input element (which is hidden) to ensure the page is in the correct state
scroll_to(find_by_id('default-button', visible: :all))

# Find and click the button that follows the input with the ID 'default-button'
find('#default-button + button').click
```

Here's the breakdown:
- `#default-button + button` is the CSS selector used to find the `button` element that immediately follows the `input` element with the ID `default-button`.
- `scroll_to(find_by_id('default-button', visible: :all))` ensures the page scrolls to the hidden input element, ensuring the page is in the correct state.

This way, your Capybara spec will accurately find and interact with the button next to the input generated by the `submit_tag`.

---

🙋 **You:**

I'm sorry, it's like 
      <%= submit_tag 'Clear All',
                     id: kebabize(LearningContentLibraryHelper::FORM_BUTTONS[:button_clear_all]),
                     form: kebabize(LearningContentLibraryHelper::FORM_ELEMENTS[:main_form]),
                     class: 'button button-apply button-dark-purple-default button-disabled-ghost',
                     formmethod: :post,
                     style: 'display: none;',
                     formaction: learning_content_library_clear_all_path
      %>
      <%= clear_all_button(@filter_criteria) %>

and the clear_all_button(@filter_criteria)

  def clear_all_button(filter_criteria)
    disabled = filters_empty?(filter_criteria)
    button_tag(
      'Clear All',
      class: "button button-clear button-blue-ghost#{' button-disabled-ghost' if disabled}",
      disabled: disabled,
      data: {
        action: 'click->learning-content-library#clearAllAction'
      }
    )
  end

---

🤖 **Assistant:**

Given the structure you provided, the `submit_tag` generates a hidden input, and the `clear_all_button` method generates a visible button. To test the button click using Capybara, you need to find and click the visible button generated by `clear_all_button`.

Here's how you can modify your Capybara spec to find and click the visible button:

1. Ensure your HTML is structured correctly:

    ```erb
    <%= submit_tag 'Clear All',
                   id: kebabize(LearningContentLibraryHelper::FORM_BUTTONS[:button_clear_all]),
                   form: kebabize(LearningContentLibraryHelper::FORM_ELEMENTS[:main_form]),
                   class: 'button button-apply button-dark-purple-default button-disabled-ghost',
                   formmethod: :post,
                   style: 'display: none;',
                   formaction: learning_content_library_clear_all_path
    %>
    <%= clear_all_button(@filter_criteria) %>
    ```

2. Update your Capybara spec to find the visible button by its class or other attributes:

    ```ruby
    # Scroll to the hidden input element to ensure the page is in the correct state
    scroll_to(find_by_id(kebabize(LearningContentLibraryHelper::FORM_BUTTONS[:button_clear_all]), visible: :all))

    # Find and click the visible button generated by clear_all_button
    find('.button.button-clear.button-blue-ghost').click
    ```

If you want a more specific selector to avoid potential conflicts with other buttons that might have similar classes, you can add a data attribute or use a combination of classes and text. Here's an updated approach using text for specificity:

    ```ruby
    # Scroll to the hidden input element to ensure the page is in the correct state
    scroll_to(find_by_id(kebabize(LearningContentLibraryHelper::FORM_BUTTONS[:button_clear_all]), visible: :all))

    # Find and click the visible button generated by clear_all_button
    find('button', text: 'Clear All').click
    ```

Using the text inside the button makes sure you are clicking the correct button without adding an additional identifier. This approach should work correctly given your HTML structure and Capybara spec.