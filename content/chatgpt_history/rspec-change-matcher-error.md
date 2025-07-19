---
title: RSpec change matcher error
tags:
- disabled
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# RSpec change matcher error

## ✅ TODOs


## 📌 Summary
Failure/Error: it { is_expected }.to change(CompanySetting, :count).by(1)

## 🧠 Full Chat


Failure/Error: it { is_expected }.to change(CompanySetting, :count).by(1)
  `change` is not available on an example group (e.g. a `describe` or `context` block). It is only available from within individual examples (e.g. `it` blocks) or from constructs that run in the scope of an example (e.g. `before`, `let`, etc).

It looks like you're encountering an issue with an RSpec test in Ruby. The error message you're receiving indicates that the `change` matcher is being used in the wrong scope. In RSpec, matchers like `change` are intended to be used within individual examples (inside `it` blocks) or in constructs that are evaluated in the context of an example (like `before` or `let` blocks).

To resolve this issue, ensure that your `change` matcher is used within an `it` block. Here's a corrected version of your test:

```ruby
describe 'some context' do
  it 'changes the CompanySetting count by 1' do
    expect { some_action_that_changes_company_setting }.to change(CompanySetting, :count).by(1)
  end
end
```

In this corrected version:

- The `expect { ... }.to change(...)` statement is inside an `it` block.
- `some_action_that_changes_company_setting` represents the action that you expect to change the `CompanySetting` count. Replace this with the actual code that triggers the change you want to test.

This structure ensures that the `change` matcher is used in the correct context and should resolve the error you're encountering.

  1) Edit Company Modal with settings created when company goes soft closed is expected to change `CompanySetting.count` by 1
     Failure/Error: it { expect(page).to change(CompanySetting, :count).by(1) }
       expected `CompanySetting.count` to have changed by 1, but was not given a block

The error message you're encountering in your RSpec test is due to the incorrect use of the `change` matcher. The `change` matcher in RSpec is designed to be used with a block of code that performs an action, and it checks if that action causes a change in some specified state. In your case, you're trying to test if a certain action changes the count of `CompanySetting` objects by 1.

However, the way you're using the `change` matcher is incorrect. You've placed it within an expectation on `page`, but you haven't provided a block of code that performs the action causing the change. 

Here's how you can correct this:

1. Identify the action that is expected to change the `CompanySetting.count`. This could be a form submission, a button click, or any other action within your test that triggers the change.

2. Wrap this action in a block and pass it to the `expect { ... }.to change { ... }` construct.

For example:

```ruby
it 'increases CompanySetting count by 1' do
  expect { perform_action_that_changes_setting }.to change { CompanySetting.count }.by(1)
end
```

In this example:

- Replace `perform_action_that_changes_setting` with the actual code that triggers the change. This could be something like `click_button 'Submit'` or any other action relevant to your test.
- The `change` matcher is now correctly used with a block (`{ perform_action_that_changes_setting }`) that performs the action causing the change.

This setup will correctly test if the specified action results in the expected change in `CompanySetting.count`.

refactor this to pass
    context 'when company goes soft closed' do
      before do
        within('.edit_company') do
          check('setting_disabled').click
          check('setting_search').click
        end
      end

      it { expect(page).to change { CompanySetting, :count }.by(1) }

      it 'turns ElasticIndex off', :js do
        is_expected.to change(CompanySetting, :count).by(-1)
      end
    end

To refactor the code snippet you provided and ensure the tests pass, there are a few changes needed. The primary issue is the incorrect usage of the `change` matcher in the `it` blocks. You need to wrap the action that causes the change in a block for the `change` matcher. Additionally, the `change` matcher should be used with a block that evaluates to the value you expect to change, not just passing the model and attribute as arguments.

Here's a refactored version of your test:

```ruby
context 'when company goes soft closed' do
  before do
    within('.edit_company') do
      check('setting_disabled').click
      check('setting_search').click
    end
  end

  it 'increases CompanySetting count by 1' do
    expect { 
      # Add the action here that triggers the change in CompanySetting count
      # For example, it could be a form submission like:
      # click_button 'Save Changes'
    }.to change { CompanySetting.count }.by(1)
  end

  it 'turns ElasticIndex off', :js do
    expect {
      # Add the action here that triggers the change in CompanySetting count by -1
      # This might be the same or a different action than the previous test
      # click_button 'Save Changes'
    }.to change { CompanySetting.count }.by(-1)
  end
end
```

In this refactor:

1. Each `it` block contains an `expect` block with a specific action that leads to a change in `CompanySetting.count`. You need to replace the comment inside the `expect` block with the actual code that performs the action in your test.

2. The `change` matcher is used correctly with a block that evaluates to `CompanySetting.count`.

Make sure to replace the placeholder comments with the actual actions that are relevant to your test scenario. This structure should help your tests to pass correctly.

dont you see that the clicks are what triggers the actions?


You are correct, and I apologize for the oversight. If the clicks within the `before` block are what trigger the changes to `CompanySetting.count`, then the structure of your tests needs to be adjusted to account for this. In RSpec, the `expect { ... }.to change { ... }` syntax is used to wrap the action that causes the change, but in your case, the action is happening in the `before` block, not within the `it` block.

Here's a revised approach:

1. Move the actions that cause the changes into the `it` blocks.
2. Use `expect { ... }.to change { ... }` to wrap these actions.

Here's how you can refactor your tests:

```ruby
context 'when company goes soft closed' do
  it 'increases CompanySetting count by 1' do
    expect { 
      within('.edit_company') do
        check('setting_disabled').click
        check('setting_search').click
      end
      # Add any additional steps here that are needed to finalize the changes, 
      # such as submitting a form.
    }.to change { CompanySetting.count }.by(1)
  end

  it 'turns ElasticIndex off', :js do
    expect {
      within('.edit_company') do
        check('setting_disabled').click
        check('setting_search').click
      end
      # Again, add any additional steps here to finalize the changes.
    }.to change { CompanySetting.count }.by(-1)
  end
end
```

In this refactoring:

- The actions (`check('setting_disabled').click` and `check('setting_search').click`) are moved inside the `it` blocks.
- These actions are wrapped within the `expect { ... }.to change { ... }` block.
- This setup should correctly trigger and test the changes in `CompanySetting.count`.

Remember to include any additional steps needed to finalize the changes, like form submissions, after the `check` actions within the `expect` block.

can't I simply use is expected syntax instead?

Yes, you can use the `is_expected` syntax in your RSpec tests. The `is_expected` syntax is a shorthand for `expect(subject)`, where `subject` is an implicit subject of the test. However, in the case of testing changes like in your example, you'll need to ensure that the action causing the change is part of the subject or is properly encapsulated in a block that `is_expected` can work with.

In the context of your tests, since the actions that cause the changes to `CompanySetting.count` are performed in the `before` block, you'll need to slightly adjust your approach to use `is_expected`. 

Here is how you can refactor your tests using `is_expected`:

```ruby
context 'when company goes soft closed' do
  subject do
    within('.edit_company') do
      check('setting_disabled').click
      check('setting_search').click
    end
    # Include any additional actions here if necessary, such as form submission.
  end

  it 'increases CompanySetting count by 1' do
    expect { subject }.to change { CompanySetting.count }.by(1)
  end

  it 'turns ElasticIndex off', :js do
    expect { subject }.to change { CompanySetting.count }.by(-1)
  end
end
```

In this refactor:

- The `subject` block contains the actions that trigger the change.
- Each `it` block tests the change using `expect { subject }.to change { ... }`.

This approach should work for your scenario. However, do note that `is_expected` is more commonly used for simpler assertions and might not always be the best fit for more complex scenarios like testing changes resulting from a series of interactions. In such cases, directly using `expect { ... }` for clarity and explicitness might be more appropriate.

       expected `Company#disabled?` to have changed from false to true, but did not change

The error message you're encountering suggests that the test expects a change in the state of a `Company` object's `disabled?` method, from `false` to `true`, but this change is not happening during the test. This could be due to several reasons, such as the action supposed to trigger this change not working as intended, or the test setup not correctly reflecting the state of the `Company` object.

Here are some steps to troubleshoot and fix this issue:

1. **Ensure Correct Test Setup**: Make sure that the `Company` object's initial state is indeed set to `false` for the `disabled?` method. You might need a setup step where you explicitly set this state.

2. **Trigger the Correct Action**: Ensure that the action which is supposed to change the state of `disabled?` from `false` to `true` is correctly implemented in your test. This might involve interacting with the UI elements or directly changing the object state in the test.

3. **Check for Immediate Change**: Ensure that the change in state happens immediately after the action, as RSpec's `change` matcher checks the state before and after the block of code is executed.

4. **Database Persistence**: If the change involves a database write, make sure that the change is saved to the database. For example, if you're changing an attribute, ensure that you call `save` on the object.

5. **Debugging Information**: Adding debugging information to the test can help. For example, you can print out the value of `Company#disabled?` before and after the action to ensure it's what you expect.

Here is a revised version of your test considering these points:

```ruby
it 'changes the disabled state from false to true' do
  company = Company.find(<<your_company_id>>)
  expect(company.disabled?).to eq(false) # Ensure initial state is as expected

  expect {
    within('.edit_company') do
      check('setting_disabled').click
      # Add any additional actions here that are needed to finalize the change.
    end
    # If needed, explicitly save the changes.
    company.reload # Reload the object if changes are saved to the database.
  }.to change { company.disabled? }.from(false).to(true)
end
```

In this example, replace `<<your_company_id>>` with the actual ID of the company you are testing. This test ensures the initial state is `false`, performs the action, and then checks that the state changes to `true`. The `company.reload` line is crucial if the change involves a database write and you need to refresh the state of the object from the database.