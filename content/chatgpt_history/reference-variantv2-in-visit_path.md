---
title: Reference 'variant=v2' in visit_path
tags:
- show
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  I have a variant that is reachable over variant=v2
  in the  query params of my rails route. How can I reference it in the visit model_path(model)
  of my rspec feature test?"
draft: false
---

# Reference 'variant=v2' in visit_path

## 🧠 Full Chat

🙋 **You:**

I have a variant that is reachable over variant=v2 in the  query params of my rails route. How can I reference it in the visit model_path(model) of my rspec feature test?

---

🤖 **Assistant:**

In Rails, when you want to pass additional query parameters to a route in a feature test using RSpec's `visit` method, you can do so by passing a hash containing the query parameters as the second argument to `model_path`. To reference the `variant` parameter with a value of `v2`, you can use the following approach:

Assuming you have a route like this in your `routes.rb` file:

```ruby
get 'model', to: 'models#show', as: 'model'
```

And you want to visit the `model_path` with the `variant` query parameter set to `v2`, you can do it like this in your RSpec feature test:

```ruby
# Import your model class if necessary
# require 'model' 

RSpec.feature 'Visiting Model Path with Variant Parameter' do
  scenario 'Visiting the model_path with variant=v2' do
    # Use the visit method with model_path and the query parameter hash
    visit model_path(variant: 'v2')

    # Add your expectations or assertions here
    expect(page).to have_content('Model Details') # Example assertion
  end
end
```

In this example, we're using the `visit` method with `model_path(variant: 'v2')` to generate the URL with the `variant` query parameter set to `v2`. You can replace `'Model Details'` with the content you expect to see on the page. Adjust the test scenario and expectations to match your specific use case.

Remember to replace `'Model Details'` with the actual content or behavior you expect on the page after visiting the `model_path`.