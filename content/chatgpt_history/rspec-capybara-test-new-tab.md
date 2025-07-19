---
title: 'Rspec Capybara Test: New Tab'
tags:
- learning
- hr
- first
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Rspec Capybara Test: New Tab

## ✅ TODOs


## 📌 Summary
How can I test this link_to opening in another tab in rspec / capybara?

## 🧠 Full Chat


How can I test this link_to opening in another tab in rspec / capybara?
  <%= link_to 'First Time Leader Learning', learning_content_library_external_search_path(audience_ids: [ResourceCenterHelper.first_time_leader.id]), method: :post, target: :_blank, id: ResourceCenterHelper.first_time_leader.slug %>

# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Learning and Development', type: :feature do
  describe 'Learning Content Library' do
    visit learning_and_development_path

    within '#learning-content-library' do
      it 'opens HR Professional Learning in another tab' do
        find('#hr-professional-learning').click

        expect()
      end
    end
  end
end




To test that a link opens in another tab using RSpec and Capybara, you need to verify that the link has the correct attributes and that clicking it opens a new window. Capybara itself doesn't directly handle new windows, so you'll need to use the `window_opened_by` method to test this behavior. Here's how you can write the test:

1. **Check that the link has the `target` attribute set to `_blank`.**
2. **Use the `window_opened_by` method to verify that a new window opens.**

Here is the updated RSpec test:

```ruby
# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Learning and Development', type: :feature do
  describe 'Learning Content Library' do
    before do
      visit learning_and_development_path
    end

    within '#learning-content-library' do
      it 'opens First Time Leader Learning in another tab' do
        # Check that the link has the correct target attribute
        link = find('a#first-time-leader-learning')
        expect(link[:target]).to eq('_blank')

        # Verify that clicking the link opens a new window
        new_window = window_opened_by { link.click }
        expect(new_window).not_to be_nil

        # Switch to the new window and check the URL
        within_window new_window do
          expect(current_url).to include(learning_content_library_external_search_path(audience_ids: [ResourceCenterHelper.first_time_leader.id]))
        end
      end
    end
  end
end
```

### Explanation:

1. **Checking the `target` attribute:**
   ```ruby
   link = find('a#first-time-leader-learning')
   expect(link[:target]).to eq('_blank')
   ```

   This part ensures that the link has the correct `target` attribute.

2. **Using `window_opened_by` to verify the new window:**
   ```ruby
   new_window = window_opened_by { link.click }
   expect(new_window).not_to be_nil
   ```

   This part checks that clicking the link opens a new window.

3. **Switching to the new window and checking the URL:**
   ```ruby
   within_window new_window do
     expect(current_url).to include(learning_content_library_external_search_path(audience_ids: [ResourceCenterHelper.first_time_leader.id]))
   end
   ```

   This part switches to the new window and verifies the URL to ensure the correct page is opened.

This way, you can comprehensively test that the link behaves as expected and opens in a new tab or window.