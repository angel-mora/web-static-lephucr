---
title: 'Rails: Populate Checkbox with Param'
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Rails: Populate Checkbox with Param

## ✅ TODOs


## 📌 Summary
How can I paste a param in the browser so it populates the audience_ids 2 checkbox?

## 🧠 Full Chat


How can I paste a param in the browser so it populates the audience_ids 2 checkbox?
Tried like this but didn't work.
http://localhost:3000/training/learning-content-library?filter_change=audience_ids[2]
We are using hotwire and turbo, recall the way how rails processes query params to help me reformulate. filter_change is an action controller



To correctly populate the `audience_ids[2]` checkbox using query parameters in a Rails application with Hotwire and Turbo, you'll need to ensure that the parameter format is correctly interpreted by Rails. The query parameter should reflect how Rails expects array parameters in the URL.

Typically, Rails expects array parameters to be in the following format: `audience_ids[]=2`.

Here's how you can modify your URL to fit this format:

```
http://localhost:3000/training/learning-content-library?filter_change=audience_ids[]&audience_ids[]=2
```

This format tells Rails that `audience_ids` is an array and that it should include the value `2`.

In your specific case, if `filter_change` is an action that expects `audience_ids` as part of the parameters, you should structure the URL accordingly. Here is an example:

```
http://localhost:3000/training/learning-content-library?filter_change=true&audience_ids[]=2
```

In this URL:
- `filter_change=true` ensures that the `filter_change` action is triggered.
- `audience_ids[]=2` correctly formats the array parameter for Rails to process.

If `filter_change` is supposed to be a boolean flag or some other specific value, adjust it accordingly in the URL.

### Example Scenario

If `filter_change` is an action parameter and `audience_ids` is supposed to be an array parameter, here is how the controller might handle it:

```ruby
class TrainingController < ApplicationController
  def learning_content_library
    if params[:filter_change]
      @filtered_audience_ids = params[:audience_ids] # This will be ["2"]
      # Additional logic for handling the filter change
    end
  end
end
```

This will correctly process the `audience_ids` parameter as an array with the value `2`. Make sure your front-end code correctly binds the values to the checkboxes based on this array.

Ensure your checkbox input names reflect the array structure, for example:

```erb
<%= check_box_tag 'audience_ids[]', 2, @filtered_audience_ids.include?("2") %>
```

This should bind the checkbox to the array and check it if `2` is included in `@filtered_audience_ids`.