---
title: RSpec Capybara Test Refactoring
tags:
- save
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# RSpec Capybara Test Refactoring

## ✅ TODOs


## 📌 Summary
it 'Disable company' do

## 🧠 Full Chat


  it 'Disable company' do
    expect(
      find('.disabled-setting-checkbox').click
      find('#save').click
    ).to increase(CompanySetting.count).by(1)
  end

  it 'ElasticIndex off' do
    expect(
      find('.search-setting-checkbox').click
      find('#save').click
    ).to decrease(CompanySetting.count).by(1)
  end

Please make this functional in the latest rspec capybara syntax

The code snippets you provided are written in Ruby with RSpec and Capybara for testing web applications. However, the syntax and structure need some adjustments to adhere to the latest best practices and syntax for RSpec and Capybara. Here's how you can refactor these tests:

1. **Disable Company Test**
   This test seems to be checking whether clicking on a checkbox and a save button increases the `CompanySetting` count by 1. Here's the revised version:

   ```ruby
   it 'disables company', :js do
     expect do
       find('.disabled-setting-checkbox').click
       click_button 'Save'
       wait_for_ajax
     end.to change(CompanySetting, :count).by(1)
   end
   ```

   Key Changes:
   - Added `:js` tag to enable JavaScript, which is often needed for button clicks and other interactive elements.
   - Used `click_button 'Save'` for clarity and to ensure the correct button is clicked.
   - Introduced `wait_for_ajax` to handle potential asynchronous operations. This method needs to be defined in your support utilities for Capybara.

2. **ElasticIndex Off Test**
   This test checks if the action decreases the `CompanySetting` count by 1. Here's the revised version:

   ```ruby
   it 'turns ElasticIndex off', :js do
     expect do
       find('.search-setting-checkbox').click
       click_button 'Save'
       wait_for_ajax
     end.to change(CompanySetting, :count).by(-1)
   end
   ```

   The changes are similar to the first test, ensuring the test handles JavaScript elements and potential asynchronous behavior.

Remember to include necessary support configurations and helpers for RSpec and Capybara, especially if you're dealing with asynchronous JavaScript elements. Also, adjust the selectors ('.disabled-setting-checkbox', '.search-setting-checkbox', and '#save') as per your actual HTML structure.