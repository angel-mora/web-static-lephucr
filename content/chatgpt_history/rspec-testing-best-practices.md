---
title: RSpec Testing Best Practices
tags:
- perform
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  In the behavior vs implementation rspec debate, how
  should I test?"
draft: false
---

# RSpec Testing Best Practices

## ✅ TODOs
- [ ] from the perspective of the user, while testing implementation details can make the tests brittle and hard to maintain as changes to the implementation may cause the tests to fail even if the behavior has not changed.

## 🧠 Full Chat

🙋 **You:**

In the behavior vs implementation rspec debate, how should I test?

---

🤖 **Assistant:**

The behavior vs implementation debate in RSpec is about whether to write tests that focus on the behavior of the code or on the implementation details of the code. 

In general, it is recommended to focus on testing the behavior of the code rather than the implementation details. This is because testing the behavior of the code ensures that it is doing what it is supposed to do from the perspective of the user, while testing implementation details can make the tests brittle and hard to maintain as changes to the implementation may cause the tests to fail even if the behavior has not changed. 

To test behavior, you can use RSpec's built-in matcher library to describe the expected behavior of your code. This allows you to write tests that focus on the inputs and outputs of your code, without worrying about how the code accomplishes that behavior. 

For example, consider the following code that adds two numbers together:

```
def add_numbers(a, b)
  return a + b
end
```

To test the behavior of this code, you could write the following RSpec test:

```
describe "add_numbers" do
  it "adds two numbers together" do
    expect(add_numbers(2, 3)).to eq(5)
    expect(add_numbers(-1, 1)).to eq(0)
  end
end
```

This test describes the behavior of the `add_numbers` method, which is to add two numbers together and return the result. It doesn't care how the code achieves that behavior, only that it does so correctly. 

In summary, when writing RSpec tests, it is generally recommended to focus on testing the behavior of the code rather than the implementation details. This approach will result in tests that are more robust and maintainable over time.

---

🙋 **You:**

Give a random ip address within canada

---

🤖 **Assistant:**

Sure, here is a random IP address within Canada:

172.98.83.10

Note that IP addresses can be geolocated, but it's not always accurate, so the IP address I provided might not necessarily be physically located in Canada.

---

🙋 **You:**

require 'spec_helper'

RSpec.describe ConvertIpToLocationJob, type: :job do
  describe '#perform' do
    let(:user) { nil }
    let(:contact_us_detail) { FactoryBot.create(:contact_us_detail, user: user) }

    before do
      allow(CountryFromIp).to receive(:location_from_ip).and_return('US')
    end

    it 'successfully saves the country code' do
      described_class.perform_now(contact_us_detail)
      expect(contact_us_detail.country).to eq('US')
    end

    context 'when user is present' do
      let(:contact_us_detail_with_user) { FactoryBot.create(:contact_us_detail_with_user) }
      let(:contact_us_detail_with_user_and_location) { FactoryBot.create(:contact_us_detail_with_user_and_location) }
      let(:user) { contact_us_detail_with_user.user }

      it 'updates the user location if the user doesn\'t have it' do
        described_class.perform_now(contact_us_detail)
        expect(contact_us_detail.user.location_country_code).to eq(contact_us_detail.country)
      end

      it 'doesn\'t update the user location if already has it' do
        contact_us_detail.user.location_country_code = 'MX'
        described_class.perform_now(contact_us_detail)
        expect(contact_us_detail.user.location_country_code).to eq(user_with_location_country_code.location_country_code)
      end
    end
  end
end

I want this test to return US and is returning CA (from the contact_us_detail factory) instead

Here is the job:

class ConvertIpToLocationJob < ApplicationJob
  # sidekiq_options is required for version 6.0.7, we can remove this when Sidekiq upgrades beyond 6.3
  sidekiq_options queue: :default
  queue_as :default

  def perform(contact_us_detail)
    contact_us_detail.country = CountryFromIp.location_from_ip(contact_us_detail.ip_address)
    contact_us_detail.save!
    if contact_us_detail.user.present? && contact_us_detail.user.location_country_code.blank?
      contact_us_detail.user.location_country_code = contact_us_detail.country
      contact_us_detail.user.save(validate: false)
    end
  rescue StandardError => e
    log_error_to_rollbar(exception: e)
  end
end

---

🤖 **Assistant:**

It seems that the issue is with the `CountryFromIp` module and the `location_from_ip` method. Since the `location_from_ip` method is returning "CA" instead of "US", you might want to investigate why that is happening.

One possibility is that the IP address being used by the test is not located in the US. You could try using a different IP address to see if that changes the result.

Another possibility is that there is a bug in the `CountryFromIp` module that is causing it to incorrectly map the IP address to Canada instead of the US. You might want to review the code in the `CountryFromIp` module to see if there are any issues with it.

In any case, to fix the failing test, you can modify the `before` block in the test to set the return value of `location_from_ip` to "US" explicitly:

```
before do
  allow(CountryFromIp).to receive(:location_from_ip).with(contact_us_detail.ip_address).and_return('US')
end
```

This will ensure that the test always receives "US" as the country code from the `location_from_ip` method, regardless of the actual location of the IP address.

---

🙋 **You:**

require 'spec_helper'

RSpec.describe ConvertIpToLocationJob, type: :job do
  describe '#perform' do
    let(:user) { nil }
    let(:contact_us_detail) { FactoryBot.create(:contact_us_detail, user: user) }

    before do
      allow(CountryFromIp).to receive(:location_from_ip).and_return('US')
    end

    it 'successfully saves the country code' do
      described_class.perform_now(contact_us_detail)
      expect(contact_us_detail.country).to eq('US')
    end

    context 'when user is present' do
      let(:contact_us_detail_with_user) { FactoryBot.create(:contact_us_detail_with_user) }
      let(:contact_us_detail_with_user_and_location) { FactoryBot.create(:contact_us_detail_with_user_and_location) }
      let(:user) { contact_us_detail_with_user.user }

      it 'updates the user location if the user doesn\'t have it' do
        described_class.perform_now(contact_us_detail)
        expect(contact_us_detail.user.location_country_code).to eq(contact_us_detail.country)
      end

      it 'doesn\'t update the user location if already has it' do
        contact_us_detail.user.location_country_code = 'MX'
        described_class.perform_now(contact_us_detail)
        expect(contact_us_detail_with_user_and_location.user.location_country_code).to eq(user.location_country_code)
      end
    end
  end
end

 1) ConvertIpToLocationJob#perform when user is present updates the user location if the user doesn't have it
     Failure/Error: expect(contact_us_detail.user.location_country_code).to eq(contact_us_detail.country)

       expected: "US"
            got: "CA"

       (compared using ==)
     # ./spec/jobs/convert_ip_to_location_job_spec.rb:25:in `block (4 levels) in <top (required)>'
     # -e:1:in `<main>'

  2) ConvertIpToLocationJob#perform when user is present doesn't update the user location if already has it
     Failure/Error: expect(contact_us_detail_with_user_and_location.user.location_country_code).to eq(user.location_country_code)

       expected: "MX"
            got: "CA"

       (compared using ==)
     # ./spec/jobs/convert_ip_to_location_job_spec.rb:31:in `block (4 levels) in <top (required)>'
     # -e:1:in `<main>'

Why am I getting this error? The first one passes and is quite similar. The only difference is that it has no user

---

🤖 **Assistant:**

It looks like the `contact_us_detail` instance used in the `it 'successfully saves the country code'` test is different from the `contact_us_detail` instance used in the two tests inside the `context 'when user is present'` block. 

The `contact_us_detail` instance in the first test doesn't have a user associated with it, so it's not affected by the second test's setup. However, in the second test, you're using a different `contact_us_detail` instance that has a user associated with it. 

In the second test, you're setting the `contact_us_detail.user.location_country_code` to "MX" before calling `perform_now` on the job with the `contact_us_detail` instance. But in the `perform` method, you're setting `contact_us_detail.country` to "US". Therefore, when you assert that `contact_us_detail_with_user_and_location.user.location_country_code` is equal to `user.location_country_code`, it fails because they are not the same. 

To fix this, you need to update the `contact_us_detail` instance used in the two tests inside the `context 'when user is present'` block to have the same IP address that returns "US" instead of "CA".