---
title: RSpec Ignored Columns Test
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  RSPEC model spec for this one"
draft: false
---

# RSpec Ignored Columns Test

## 🧠 Full Chat

🙋 **You:**

RSPEC model spec for this one
  self.ignored_columns += [:twilio_api_sid, :twilio_api_token, :twilio_phone]

---

🤖 **Assistant:**

Here’s an RSpec model spec for testing that `ignored_columns` includes `:twilio_api_sid`, `:twilio_api_token`, and `:twilio_phone`:

```ruby
require 'rails_helper'

RSpec.describe YourModel, type: :model do
  it 'ignores the specified columns' do
    expect(described_class.ignored_columns).to include('twilio_api_sid', 'twilio_api_token', 'twilio_phone')
  end
end
```

In this spec:

- Replace `YourModel` with the actual name of the model you are testing.
- The `expect` block checks that `ignored_columns` includes the specified fields. Since `ignored_columns` stores strings, the symbols are converted to strings for the comparison.