---
title: Change Submit Button Text
tags:
- contact
- submitform
- customer_request_message
- updatecharactercount
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Change Submit Button Text

## ✅ TODOs
- [ ] |format|
- [ ] it over the controller?

## 📌 Summary
// about.js

## 🧠 Full Chat


// about.js
/* eslint-disable no-undef */
// Reason: This class is being used directly in the file the form is in.
// eslint-disable-next-line no-unused-vars
class HrContactUsV2 {
  static initialize() {
    this.setCounter();
    this.messageTypeHandler();
    this.messageCounterHandler();
  }

  static setCounter() {
    let counter = document.getElementById('characterCount');
    counter.innerHTML = document.getElementById('customer_request_message').value.length;
  }

  static messageTypeHandler() {
    document.getElementById('message_director')?.addEventListener('change', (event) => {
      switch (event.target.value) {
        case 'Product Information':
          this.showProductOptions();
          break;
        case 'Talk to an Analyst':
          this.showAnalystRoleOptions();
          break;
        default:
          this.hideExtraOptions();
          break;
      }
    });
  }

  static messageCounterHandler() {
    document.getElementById('customer_request_message')?.addEventListener('keyup', () => {
      this.setCounter();
    });
  }

  static showProductOptions() {
    document.getElementsByClassName('product-options')[0].style.display = 'block';
    document.getElementById('product_options').disabled = false;

    if (document.getElementsByClassName('analyst-role')[0]) {
      document.getElementsByClassName('analyst-role')[0].style.display = 'none';
      document.getElementById('analyst_role').disabled = true;
    }
  }

  static showAnalystRoleOptions() {
    document.getElementsByClassName('product-options')[0].style.display = 'none';
    document.getElementById('product_options').disabled = true;

    if (document.getElementsByClassName('analyst-role')[0]) {
      document.getElementsByClassName('analyst-role')[0].style.display = 'block';
      document.getElementById('analyst_role').disabled = false;
    }
  }

  static hideExtraOptions() {
    document.getElementsByClassName('product-options')[0].style.display = 'none';
    document.getElementById('product-options')[0].disabled = true;

    if (document.getElementsByClassName('analyst-role')[0]) {
      document.getElementsByClassName('analyst-role')[0].style.display = 'none';
      document.getElementById('analyst_role').disabled = true;
    }
  }
}

form_html_erb

<h3 class="hed-xs grey-900">Complete the contact form below</h3>
<%= simple_form_for customer_request, url: customer_requests_path, html: { honeypot: true }, remote: true do |f| %>
  <%= f.hidden_field :concerning_id if customer_request.concerning_id.present? %>
  <%= f.hidden_field :concerning_type if customer_request.concerning_type.present? %>
  <%= f.hidden_field :concerning_url, value: (customer_request.concerning_url || request.url) %>
  <%= f.hidden_field :reason %>
  <%= f.hidden_field :site_id, value: current_site.id %>
  <%= f.hidden_field :linkedin_autofill, value: customer_request.linkedin_autofill ? true : session[:omniauth].present? %>
  <%= f.hidden_field :form_handler_url %>
  <%= f.hidden_field :utm_campaign, value: params[:utm_campaign] %>
  <%= f.hidden_field :utm_medium, value: params[:utm_medium] %>
  <%= f.hidden_field :utm_source, value: params[:utm_source] %>
  <%= f.hidden_field :utm_content, value: params[:utm_content] %>
  <%= f.hidden_field :utm_term, value: params[:utm_term] %>

  <% if logged_in? && !trial? %>
    <%= f.hidden_field :name %>
    <%= f.hidden_field :email %>
    <%= f.hidden_field :company %>
    <%= f.hidden_field :job_title %>
    <%= f.hidden_field :phone %>
    <%= f.hidden_field :job_role %>
    <%= f.hidden_field :country_code, value: current_user.demographic&.country_code %>
    <%= f.hidden_field :employees, value: current_user.demographic&.employees %>
  <% else %>
    <div class="row">
      <div class="col-md-12 col-lg-6">
        <%= f.input :name,
                    wrapper: :mco,
                    value: default_name_value(customer_request, session),
                    label: 'Full Name',
                    required: true %>
        <%#
          full_name errors need to be displayed without simple_form since Customer Request don't have a full name,
          they've got first_name and last_name which get combined in the back end
        %>
        <% customer_request.errors[:full_name].each do |error| %>
          <div class="error-field">
            <span class="form-body-sm error red-500 fa fa-exclamation-circle"><%= error %></span>
          </div>
        <% end %>
      </div>
      <div class="col-md-12 col-lg-6">
        <%= f.input :email,
                    wrapper: :mco,
                    value: default_value('email', customer_request, session),
                    required: true %>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12 col-lg-6">
        <%= f.input :phone, wrapper: :mco, label: 'Phone', required: true %>
      </div>
      <div class="col-md-12 col-lg-6">
        <%= f.input :company,
                    wrapper: :mco,
                    value: default_value('company', customer_request, session),
                    required: true %>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12 col-lg-6">
        <%= f.input :job_role,
                    wrapper: :mco,
                    as: :select,
                    collection: job_role_options(current_site).map(&:title),
                    label: 'Job Function',
                    required: true %>
      </div>
      <div class="col-md-12 col-lg-6">
        <%= f.input :job_title,
                    wrapper: :mco,
                    value: default_value('job_title', customer_request, session),
                    label: 'Job Title',
                    required: true %>
      </div>
    </div>
  <% end %>

  <div class="row">
    <div class="col-md-12 col-lg-6">
      <%= f.input :contact,
                  wrapper: :mco,
                  as: :select,
                  input_html: { id: 'message_director' },
                  collection: hr_contact_options(logged_in?),
                  required: true,
                  label: 'How may we direct your message?' %>
    </div>
    <div class="col-md-12 col-lg-6 product-options">
      <%= f.input :contact,
                  wrapper: :mco,
                  input_html: { id: 'product_options', disabled: true },
                  as: :select,
                  collection: hr_product_options,
                  required: true,
                  label: 'Product Options' %>
    </div>
    <% if logged_in? %>
      <div class="col-md-12 col-lg-6 analyst-role">
        <%= f.input :contact,
                    wrapper: :mco,
                    input_html: { id: 'analyst_role', disabled: true },
                    as: :select,
                    collection: hr_analyst_roles,
                    required: true,
                    label: 'Role' %>
      </div>
    <% end %>
  </div>

  <div class="row">
    <div class="col-md-12">
      <span class="message-counter"><span id="characterCount">0</span>/350</span>
      <%= f.input :message,
                  wrapper: :mco,
                  label: 'Your Message',
                  required: true,
                  input_html: { maxlength: 350, minlength: 50 } %>
      <p class="form-body-sm hint">Note: Minimum 50 characters required (max. 350 characters).</p>
    </div>
  </div>

  <% unless logged_in? %>
    <div class="row">
      <div class="col-sm-12">
        <%= f.input :terms_agreed,
                    wrapper: :mco_boolean,
                    as: :boolean,
                    boolean_style: :inline,
                    label: t('helpers.label.wants_updates_html',
                             terms_path: help_terms_path,
                             privacy_path: privacy_path) %>
      </div>
    </div>
  <% end %>

  <div class="row">
    <div class="col-sm-12 short">
      <%= button_tag 'Submit',
                     class: 'button button-green-default',
                     id: 'contact-us-submit',
                     data: { gainsight: Gainsight::Hr::ContactUs::ContactUsSubmitEvent.new(gainsight_request_data).gainsight_properties } %>
      <p class="body-sm grey-900">We'll aim to get back to you within 2 <span class="no-br">business days</span></p>
    </div>
  </div>
<% end %>
<script> HrContactUsV2.initialize(); </script>

With those files tell me how to either
- set a submitting button to changes to 'Sent' and flush the form values, or
- a rails controller flash. For this approach I'm kinda confused cause dont know if need to add a erb js file or how to approach it



To achieve the desired behavior of changing the submit button text to 'Sent' and flushing the form values, you can use JavaScript to handle the form submission event and modify the button text. Here is how you can do it:

1. **Modify the JavaScript to handle the form submission and update the button text:**

```javascript
document.addEventListener('DOMContentLoaded', () => {
  const form = document.querySelector('form');
  const submitButton = document.getElementById('contact-us-submit');

  form.addEventListener('submit', (event) => {
    event.preventDefault(); // Prevent the default form submission

    // Update the button text
    submitButton.innerText = 'Sent';

    // Optionally, you can disable the button to prevent multiple submissions
    submitButton.disabled = true;

    // Flush the form values
    form.reset();

    // Here you can add any additional logic, such as making an AJAX request to submit the form data

    // Example of making an AJAX request (assuming jQuery is available)
    $.ajax({
      url: form.action,
      type: 'POST',
      data: $(form).serialize(),
      success: (response) => {
        // Handle successful form submission
        console.log('Form submitted successfully', response);
      },
      error: (error) => {
        // Handle errors
        console.error('Error submitting form', error);
      }
    });
  });
});
```

2. **Ensure your form includes the `id` attribute:**

Make sure the form in your `form_html_erb` has an `id` attribute so you can easily select it with JavaScript.

```erb
<%= simple_form_for customer_request, url: customer_requests_path, html: { id: 'contact-form', honeypot: true }, remote: true do |f| %>
  <!-- form fields -->
<% end %>
```

3. **Flash message approach (Rails controller):**

If you prefer to use flash messages in your Rails controller, you need to render a JavaScript response to update the button text and clear the form values.

First, ensure your form has `remote: true` set to enable AJAX submission.

**Controller:**

```ruby
class CustomerRequestsController < ApplicationController
  def create
    @customer_request = CustomerRequest.new(customer_request_params)
    
    if @customer_request.save
      flash.now[:notice] = "Form submitted successfully."
      respond_to do |format|
        format.js { render 'create_success' }
        format.html { redirect_to some_path, notice: 'Form submitted successfully.' }
      end
    else
      flash.now[:alert] = "Form submission failed."
      respond_to do |format|
        format.js { render 'create_failure' }
        format.html { render :new }
      end
    end
  end

  private

  def customer_request_params
    params.require(:customer_request).permit(:name, :email, :phone, :company, :job_role, :job_title, :contact, :message)
  end
end
```

**create_success.js.erb:**

```erb
document.getElementById('contact-us-submit').innerText = 'Sent';
document.getElementById('contact-us-submit').disabled = true;
document.getElementById('contact-form').reset();
```

**create_failure.js.erb:**

```erb
alert("Form submission failed. Please try again.");
```

With these changes, when the form is successfully submitted, the button text will change to 'Sent', the button will be disabled, and the form values will be cleared. If the submission fails, an alert will be shown. This approach combines the power of Rails and JavaScript to provide a seamless user experience.

this is the controller
class About::ContactUsController < ApplicationController

  BS3_ACTIONS = { hr: %w(index) }.freeze
  layout proc { layout_chooser(bs3_only: false, bs3_actions: BS3_ACTIONS, other_layout: 'it_acquire/application') }

  def index
    @event = Event.find_by(slug: params["event"], site: current_site)

    @contact_us_email = CustomerRequest.new_from_user(current_user, current_site, reason: 'contact-us-email', outcome: 'email', concerning_url: request.url, concerning_title: @event.try(:title))
    @hide_contact_forms = :true

    @contact_us_email.assign_attributes(JSON.parse(cookies.signed[:customer_request_prefill])) if cookies.signed[:customer_request_prefill] && !logged_in?
    flash[:success] = "Your message has been sent successfully."
  end

end


I dont think @contact_us_email is being save, how else can I test the response is successful? Recall the simple form I sent you. Should I refactor that button_tag so I can get the Gainsight service call from the controller to be able to add logic to the response? Think carefully and provide the most sustainable change. Consider that is better to go the rails way (hotwire) preferably but only if it's not too complicated

Given your requirements and preference for a sustainable and Rails-friendly solution, integrating Hotwire (Turbo) is a good approach. Hotwire allows you to handle form submissions and responses without writing a lot of custom JavaScript. Here's how you can refactor your code to use Hotwire effectively:

### 1. Update Your Controller

Ensure your controller handles form submissions correctly and responds with Turbo Streams.

```ruby
class About::ContactUsController < ApplicationController
  BS3_ACTIONS = { hr: %w(index) }.freeze
  layout proc { layout_chooser(bs3_only: false, bs3_actions: BS3_ACTIONS, other_layout: 'it_acquire/application') }

  def index
    @event = Event.find_by(slug: params["event"], site: current_site)
    @contact_us_email = CustomerRequest.new_from_user(current_user, current_site, reason: 'contact-us-email', outcome: 'email', concerning_url: request.url, concerning_title: @event.try(:title))
    @hide_contact_forms = :true

    @contact_us_email.assign_attributes(JSON.parse(cookies.signed[:customer_request_prefill])) if cookies.signed[:customer_request_prefill] && !logged_in?
  end

  def create
    @contact_us_email = CustomerRequest.new(customer_request_params)
    
    if @contact_us_email.save
      flash.now[:success] = "Your message has been sent successfully."
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to some_path, notice: 'Your message has been sent successfully.' }
      end
    else
      flash.now[:alert] = "There was an error sending your message."
      respond_to do |format|
        format.turbo_stream
        format.html { render :index }
      end
    end
  end

  private

  def customer_request_params
    params.require(:customer_request).permit(:name, :email, :phone, :company, :job_role, :job_title, :contact, :message)
  end
end
```

### 2. Update Your Routes

Ensure you have the correct routes for your form submission.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  namespace :about do
    resources :contact_us, only: [:index, :create]
  end
end
```

### 3. Update Your Form View

Update your form to use Turbo for handling the form submission.

```erb
<%= simple_form_for @contact_us_email, url: about_contact_us_index_path, method: :post, html: { id: 'contact-form', data: { turbo: true } } do |f| %>
  <!-- form fields as before -->

  <div class="row">
    <div class="col-sm-12 short">
      <%= button_tag 'Submit',
                     class: 'button button-green-default',
                     id: 'contact-us-submit',
                     data: { gainsight: Gainsight::Hr::ContactUs::ContactUsSubmitEvent.new(gainsight_request_data).gainsight_properties } %>
      <p class="body-sm grey-900">We'll aim to get back to you within 2 <span class="no-br">business days</span></p>
    </div>
  </div>
<% end %>
```

### 4. Create Turbo Stream Views

Create Turbo Stream views to handle the responses and update the button text and form.

**create.turbo_stream.erb:**

```erb
<%= turbo_stream.update "contact-us-submit" do %>
  <%= button_tag 'Sent', class: 'button button-green-default', disabled: true %>
<% end %>

<%= turbo_stream.update "contact-form" do %>
  document.getElementById('contact-form').reset();
<% end %>

<%= turbo_stream.prepend "flash-messages", partial: "shared/flash", locals: { flash: flash } %>
```

**shared/_flash.html.erb:**

This partial will display flash messages.

```erb
<% flash.each do |key, message| %>
  <div class="alert alert-<%= key %>"><%= message %></div>
<% end %>
```

### 5. Ensure Turbo is Set Up in Your Application

Make sure Turbo is set up in your application. You should have the following in your application layout or similar setup:

```erb
<!-- app/views/layouts/application.html.erb -->
<!DOCTYPE html>
<html>
<head>
  <title>YourApp</title>
  <%= csrf_meta_tags %>
  <%= csp_meta_tag %>
  <%= stylesheet_link_tag 'application', media: 'all', 'data-turbo-track': 'reload' %>
  <%= javascript_include_tag 'application', 'data-turbo-track': 'reload' %>
</head>
<body>
  <%= yield %>
  <div id="flash-messages"></div>
</body>
</html>
```

With these changes, your form submission will be handled via Turbo, updating the button text to 'Sent', disabling the button, resetting the form, and displaying flash messages without a full page reload. This approach ensures a clean and maintainable implementation using Rails and Hotwire.

but your create action wont work since the post is going to an external api

If your form submission needs to go to an external API and you still want to update the button text and reset the form using JavaScript, you can handle this entirely on the client side using JavaScript. Here is how you can do it:

### 1. Modify the JavaScript for Form Submission

Ensure your JavaScript intercepts the form submission, sends the data to the external API, and updates the UI accordingly.

```javascript
document.addEventListener('DOMContentLoaded', () => {
  const form = document.querySelector('#contact-form');
  const submitButton = document.getElementById('contact-us-submit');

  form.addEventListener('submit', (event) => {
    event.preventDefault(); // Prevent the default form submission

    const formData = new FormData(form);

    // Replace with your external API endpoint
    const apiEndpoint = 'https://api.external.com/contact';

    fetch(apiEndpoint, {
      method: 'POST',
      body: formData,
      headers: {
        'Accept': 'application/json',
      },
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        // Update the button text
        submitButton.innerText = 'Sent';
        // Optionally, disable the button to prevent multiple submissions
        submitButton.disabled = true;
        // Flush the form values
        form.reset();
        // Optionally, show a success message
        displayFlashMessage('Your message has been sent successfully.', 'success');
      } else {
        // Handle errors (e.g., show an error message)
        displayFlashMessage('There was an error sending your message. Please try again.', 'error');
      }
    })
    .catch(error => {
      console.error('Error:', error);
      displayFlashMessage('There was an error sending your message. Please try again.', 'error');
    });
  });
});

function displayFlashMessage(message, type) {
  const flashContainer = document.getElementById('flash-messages');
  const flashMessage = document.createElement('div');
  flashMessage.className = `alert alert-${type}`;
  flashMessage.innerText = message;
  flashContainer.appendChild(flashMessage);

  // Remove the flash message after 5 seconds
  setTimeout(() => {
    flashMessage.remove();
  }, 5000);
}
```

### 2. Update Your Form View

Ensure your form has the correct `id` attribute and does not include the `remote: true` option, as we will handle the form submission entirely with JavaScript.

```erb
<%= simple_form_for @contact_us_email, url: about_contact_us_index_path, method: :post, html: { id: 'contact-form' } do |f| %>
  <!-- form fields as before -->

  <div class="row">
    <div class="col-sm-12 short">
      <%= button_tag 'Submit',
                     class: 'button button-green-default',
                     id: 'contact-us-submit',
                     data: { gainsight: Gainsight::Hr::ContactUs::ContactUsSubmitEvent.new(gainsight_request_data).gainsight_properties } %>
      <p class="body-sm grey-900">We'll aim to get back to you within 2 <span class="no-br">business days</span></p>
    </div>
  </div>
<% end %>

<div id="flash-messages"></div>
```

### 3. Flash Messages Container

Ensure you have a container for flash messages in your layout or form view to display success or error messages.

```erb
<div id="flash-messages"></div>
```

This approach uses JavaScript to handle the form submission, send the data to the external API, update the submit button text, reset the form, and display flash messages without requiring changes to your Rails controller. This keeps the logic straightforward and maintainable.

how can I call the simple form endpoint to javascript, like bringing that controller var into my js script. Remember that you have the data-gainsight and the simple form submission path

To call the simple form endpoint from JavaScript and integrate the data-gainsight attribute and the form submission path, follow these steps:

1. **Add a Data Attribute for the Form Action URL:**

First, make sure your form has a data attribute that contains the form action URL. This will allow you to access the URL in your JavaScript code.

```erb
<%= simple_form_for @contact_us_email, url: about_contact_us_index_path, method: :post, html: { id: 'contact-form', data: { action: about_contact_us_index_path } } do |f| %>
  <!-- form fields as before -->

  <div class="row">
    <div class="col-sm-12 short">
      <%= button_tag 'Submit',
                     class: 'button button-green-default',
                     id: 'contact-us-submit',
                     data: { gainsight: Gainsight::Hr::ContactUs::ContactUsSubmitEvent.new(gainsight_request_data).gainsight_properties } %>
      <p class="body-sm grey-900">We'll aim to get back to you within 2 <span class="no-br">business days</span></p>
    </div>
  </div>
<% end %>

<div id="flash-messages"></div>
```

2. **Update Your JavaScript to Use the Form Action URL:**

In your JavaScript, retrieve the form action URL from the data attribute and use it for the AJAX request.

```javascript
document.addEventListener('DOMContentLoaded', () => {
  const form = document.querySelector('#contact-form');
  const submitButton = document.getElementById('contact-us-submit');
  const formAction = form.getAttribute('data-action'); // Get the form action URL from the data attribute

  form.addEventListener('submit', (event) => {
    event.preventDefault(); // Prevent the default form submission

    const formData = new FormData(form);

    fetch(formAction, { // Use the form action URL for the request
      method: 'POST',
      body: formData,
      headers: {
        'Accept': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content') // Include CSRF token if necessary
      },
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        // Update the button text
        submitButton.innerText = 'Sent';
        // Optionally, disable the button to prevent multiple submissions
        submitButton.disabled = true;
        // Flush the form values
        form.reset();
        // Optionally, show a success message
        displayFlashMessage('Your message has been sent successfully.', 'success');
      } else {
        // Handle errors (e.g., show an error message)
        displayFlashMessage('There was an error sending your message. Please try again.', 'error');
      }
    })
    .catch(error => {
      console.error('Error:', error);
      displayFlashMessage('There was an error sending your message. Please try again.', 'error');
    });
  });
});

function displayFlashMessage(message, type) {
  const flashContainer = document.getElementById('flash-messages');
  const flashMessage = document.createElement('div');
  flashMessage.className = `alert alert-${type}`;
  flashMessage.innerText = message;
  flashContainer.appendChild(flashMessage);

  // Remove the flash message after 5 seconds
  setTimeout(() => {
    flashMessage.remove();
  }, 5000);
}
```

3. **Ensure the CSRF Token is Included:**

If your Rails application uses the CSRF protection, make sure to include the CSRF token in the AJAX request headers.

```javascript
headers: {
  'Accept': 'application/json',
  'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
}
```

4. **Handle Gainsight Data in Your JavaScript:**

Retrieve and use the Gainsight data from the button's data attribute.

```javascript
const gainsightData = submitButton.getAttribute('data-gainsight');
// Use the gainsightData as needed in your JavaScript logic
```

This approach ensures that you call the simple form endpoint from JavaScript, handle the submission, update the UI accordingly, and integrate the Gainsight data. The form submission path is dynamically obtained from the form's data attribute, making your code more maintainable and flexible.

is it possible to do it over the controller?

Yes, it's possible to handle the form submission over the controller and still update the button text and reset the form using Turbo (Hotwire). Here's how you can achieve this:

### 1. Update Your Controller

Ensure your controller handles form submissions correctly and responds with Turbo Streams.

```ruby
class About::ContactUsController < ApplicationController
  BS3_ACTIONS = { hr: %w(index) }.freeze
  layout proc { layout_chooser(bs3_only: false, bs3_actions: BS3_ACTIONS, other_layout: 'it_acquire/application') }

  def index
    @event = Event.find_by(slug: params["event"], site: current_site)
    @contact_us_email = CustomerRequest.new_from_user(current_user, current_site, reason: 'contact-us-email', outcome: 'email', concerning_url: request.url, concerning_title: @event.try(:title))
    @hide_contact_forms = :true

    @contact_us_email.assign_attributes(JSON.parse(cookies.signed[:customer_request_prefill])) if cookies.signed[:customer_request_prefill] && !logged_in?
  end

  def create
    @contact_us_email = CustomerRequest.new(customer_request_params)
    
    if @contact_us_email.save
      respond_to do |format|
        format.turbo_stream do
          flash.now[:success] = "Your message has been sent successfully."
        end
        format.html { redirect_to some_path, notice: 'Your message has been sent successfully.' }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          flash.now[:alert] = "There was an error sending your message."
        end
        format.html { render :index }
      end
    end
  end

  private

  def customer_request_params
    params.require(:customer_request).permit(:name, :email, :phone, :company, :job_role, :job_title, :contact, :message)
  end
end
```

### 2. Update Your Routes

Ensure you have the correct routes for your form submission.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  namespace :about do
    resources :contact_us, only: [:index, :create]
  end
end
```

### 3. Update Your Form View

Ensure your form is set up to use Turbo for handling the form submission.

```erb
<%= simple_form_for @contact_us_email, url: about_contact_us_index_path, method: :post, html: { id: 'contact-form', data: { turbo: true } } do |f| %>
  <!-- form fields as before -->

  <div class="row">
    <div class="col-sm-12 short">
      <%= button_tag 'Submit',
                     class: 'button button-green-default',
                     id: 'contact-us-submit',
                     data: { gainsight: Gainsight::Hr::ContactUs::ContactUsSubmitEvent.new(gainsight_request_data).gainsight_properties } %>
      <p class="body-sm grey-900">We'll aim to get back to you within 2 <span class="no-br">business days</span></p>
    </div>
  </div>
<% end %>

<div id="flash-messages"></div>
```

### 4. Create Turbo Stream Views

Create Turbo Stream views to handle the responses and update the button text and form.

**create.turbo_stream.erb:**

```erb
<%= turbo_stream.update "contact-us-submit" do %>
  <%= button_tag 'Sent', class: 'button button-green-default', disabled: true %>
<% end %>

<%= turbo_stream.update "contact-form" do %>
  document.getElementById('contact-form').reset();
<% end %>

<%= turbo_stream.prepend "flash-messages", partial: "shared/flash", locals: { flash: flash } %>
```

**shared/_flash.html.erb:**

This partial will display flash messages.

```erb
<% flash.each do |key, message| %>
  <div class="alert alert-<%= key %>"><%= message %></div>
<% end %>
```

### 5. Ensure Turbo is Set Up in Your Application

Make sure Turbo is set up in your application. You should have the following in your application layout or similar setup:

```erb
<!-- app/views/layouts/application.html.erb -->
<!DOCTYPE html>
<html>
<head>
  <title>YourApp</title>
  <%= csrf_meta_tags %>
  <%= csp_meta_tag %>
  <%= stylesheet_link_tag 'application', media: 'all', 'data-turbo-track': 'reload' %>
  <%= javascript_include_tag 'application', 'data-turbo-track': 'reload' %>
</head>
<body>
  <%= yield %>
  <div id="flash-messages"></div>
</body>
</html>
```

With these changes, your form submission will be handled via Turbo, updating the button text to 'Sent', disabling the button, resetting the form, and displaying flash messages without a full page reload. This approach ensures a clean and maintainable implementation using Rails and Hotwire.

recall that you cant save the customer_request, come on!

If saving `customer_request` is not possible because the form submission is meant to go to an external API, you can still manage the form submission using JavaScript and handle the Turbo Streams for the UI updates. This allows you to keep the user interface responsive and maintainable. Here’s how you can do it:

### 1. Modify the Form to Include a Data Attribute for the Form Action URL

Ensure your form includes a data attribute for the form action URL, so you can use it in your JavaScript.

```erb
<%= simple_form_for @contact_us_email, url: about_contact_us_index_path, method: :post, html: { id: 'contact-form', data: { action: about_contact_us_index_path } } do |f| %>
  <!-- form fields as before -->

  <div class="row">
    <div class="col-sm-12 short">
      <%= button_tag 'Submit',
                     class: 'button button-green-default',
                     id: 'contact-us-submit',
                     data: { gainsight: Gainsight::Hr::ContactUs::ContactUsSubmitEvent.new(gainsight_request_data).gainsight_properties } %>
      <p class="body-sm grey-900">We'll aim to get back to you within 2 <span class="no-br">business days</span></p>
    </div>
  </div>
<% end %>

<div id="flash-messages"></div>
```

### 2. Add JavaScript to Handle the Form Submission

In your JavaScript, intercept the form submission, send the data to the external API, and handle the response to update the UI.

```javascript
document.addEventListener('DOMContentLoaded', () => {
  const form = document.querySelector('#contact-form');
  const submitButton = document.getElementById('contact-us-submit');
  const formAction = form.getAttribute('data-action'); // Get the form action URL from the data attribute

  form.addEventListener('submit', (event) => {
    event.preventDefault(); // Prevent the default form submission

    const formData = new FormData(form);
    const gainsightData = submitButton.getAttribute('data-gainsight'); // Get Gainsight data

    // Replace with your external API endpoint
    const apiEndpoint = 'https://api.external.com/contact';

    fetch(apiEndpoint, {
      method: 'POST',
      body: formData,
      headers: {
        'Accept': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content') // Include CSRF token if necessary
      },
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        // Update the button text
        submitButton.innerText = 'Sent';
        // Optionally, disable the button to prevent multiple submissions
        submitButton.disabled = true;
        // Flush the form values
        form.reset();
        // Optionally, show a success message
        displayFlashMessage('Your message has been sent successfully.', 'success');
      } else {
        // Handle errors (e.g., show an error message)
        displayFlashMessage('There was an error sending your message. Please try again.', 'error');
      }
    })
    .catch(error => {
      console.error('Error:', error);
      displayFlashMessage('There was an error sending your message. Please try again.', 'error');
    });
  });
});

function displayFlashMessage(message, type) {
  const flashContainer = document.getElementById('flash-messages');
  const flashMessage = document.createElement('div');
  flashMessage.className = `alert alert-${type}`;
  flashMessage.innerText = message;
  flashContainer.appendChild(flashMessage);

  // Remove the flash message after 5 seconds
  setTimeout(() => {
    flashMessage.remove();
  }, 5000);
}
```

### 3. Ensure the CSRF Token is Included

If your Rails application uses CSRF protection, make sure to include the CSRF token in the AJAX request headers.

```javascript
headers: {
  'Accept': 'application/json',
  'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
}
```

### 4. Handle Flash Messages and UI Updates

Ensure you have a container for flash messages in your layout or form view to display success or error messages.

```erb
<div id="flash-messages"></div>
```

### 5. Use Turbo Streams to Update the UI

Even though you're handling the form submission with JavaScript, you can still use Turbo Streams to handle UI updates if needed. For example, you can use Turbo Streams to update the button text and display flash messages.

**create.turbo_stream.erb:**

```erb
<%= turbo_stream.update "contact-us-submit" do %>
  <%= button_tag 'Sent', class: 'button button-green-default', disabled: true %>
<% end %>

<%= turbo_stream.update "contact-form" do %>
  document.getElementById('contact-form').reset();
<% end %>

<%= turbo_stream.prepend "flash-messages", partial: "shared/flash", locals: { flash: flash } %>
```

By handling the form submission with JavaScript and updating the UI with Turbo Streams, you can ensure a seamless and responsive user experience without relying on the Rails controller to save the `customer_request`. This approach keeps your code maintainable and leverages the strengths of both client-side and server-side rendering.

Got it, let's focus on handling the form submission to an external API while still using Turbo to update the UI. Here's how you can achieve this:

### 1. Modify the JavaScript to Handle the External API Submission

You can use Turbo to handle the form submission and update the button text and flash messages using Turbo Streams.

### 2. Update Your Controller

Modify the controller to handle the initial page load and to render Turbo Streams for the flash messages and button update.

```ruby
class About::ContactUsController < ApplicationController
  BS3_ACTIONS = { hr: %w(index) }.freeze
  layout proc { layout_chooser(bs3_only: false, bs3_actions: BS3_ACTIONS, other_layout: 'it_acquire/application') }

  def index
    @event = Event.find_by(slug: params["event"], site: current_site)
    @contact_us_email = CustomerRequest.new_from_user(current_user, current_site, reason: 'contact-us-email', outcome: 'email', concerning_url: request.url, concerning_title: @event.try(:title))
    @hide_contact_forms = :true

    @contact_us_email.assign_attributes(JSON.parse(cookies.signed[:customer_request_prefill])) if cookies.signed[:customer_request_prefill] && !logged_in?
  end

  def create
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to about_contact_us_index_path }
    end
  end
end
```

### 3. Update Your Form View

Ensure your form is set up to use Turbo for handling the form submission and add a data attribute for the external API URL.

```erb
<%= simple_form_for @contact_us_email, url: about_contact_us_index_path, method: :post, html: { id: 'contact-form', data: { turbo: true, action: 'submit->contact#submitForm', api_url: 'https://api.external.com/contact' } } do |f| %>
  <!-- form fields as before -->

  <div class="row">
    <div class="col-sm-12 short">
      <%= button_tag 'Submit',
                     class: 'button button-green-default',
                     id: 'contact-us-submit',
                     data: { gainsight: Gainsight::Hr::ContactUs::ContactUsSubmitEvent.new(gainsight_request_data).gainsight_properties } %>
      <p class="body-sm grey-900">We'll aim to get back to you within 2 <span class="no-br">business days</span></p>
    </div>
  </div>
<% end %>

<div id="flash-messages"></div>
```

### 4. Create Turbo Stream Views

Create Turbo Stream views to handle the responses and update the button text and form.

**create.turbo_stream.erb:**

```erb
<%= turbo_stream.update "contact-us-submit" do %>
  <%= button_tag 'Sent', class: 'button button-green-default', disabled: true %>
<% end %>

<%= turbo_stream.update "contact-form" do %>
  document.getElementById('contact-form').reset();
<% end %>

<%= turbo_stream.prepend "flash-messages", partial: "shared/flash", locals: { flash: flash } %>
```

**shared/_flash.html.erb:**

This partial will display flash messages.

```erb
<% flash.each do |key, message| %>
  <div class="alert alert-<%= key %>"><%= message %></div>
<% end %>
```

### 5. Update Your JavaScript to Handle the Form Submission to the External API

Add a Stimulus controller to handle the form submission and update the UI.

**app/javascript/controllers/contact_controller.js:**

```javascript
import { Controller } from 'stimulus';

export default class extends Controller {
  static values = { apiUrl: String }

  submitForm(event) {
    event.preventDefault();
    const form = this.element;
    const submitButton = document.getElementById('contact-us-submit');
    const formData = new FormData(form);
    const apiEndpoint = this.apiUrlValue;

    fetch(apiEndpoint, {
      method: 'POST',
      body: formData,
      headers: {
        'Accept': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        Turbo.visit(window.location.href, { action: 'replace' });
      } else {
        this.displayFlashMessage('There was an error sending your message. Please try again.', 'error');
      }
    })
    .catch(error => {
      console.error('Error:', error);
      this.displayFlashMessage('There was an error sending your message. Please try again.', 'error');
    });
  }

  displayFlashMessage(message, type) {
    const flashContainer = document.getElementById('flash-messages');
    const flashMessage = document.createElement('div');
    flashMessage.className = `alert alert-${type}`;
    flashMessage.innerText = message;
    flashContainer.appendChild(flashMessage);

    // Remove the flash message after 5 seconds
    setTimeout(() => {
      flashMessage.remove();
    }, 5000);
  }
}
```

### 6. Register the Stimulus Controller

Ensure your Stimulus controller is registered.

**app/javascript/controllers/index.js:**

```javascript
import { Application } from 'stimulus';
import ContactController from './contact_controller';

const application = Application.start();
application.register('contact', ContactController);
```

With these changes, the form submission is handled via JavaScript to send the data to the external API, and Turbo Streams are used to update the button text, reset the form, and display flash messages upon successful or failed submission. This approach ensures a clean and maintainable implementation while integrating with the external API.

 cant you get the api endpoint from the form itself instead of defining it in a string var?

Yes, you can get the API endpoint from the form itself instead of hardcoding it into a string variable. This approach is more maintainable and flexible. Here’s how you can do it:

### 1. Update Your Form View

Ensure your form has a data attribute for the API endpoint URL. This way, you can dynamically retrieve the endpoint in your JavaScript.

```erb
<%= simple_form_for @contact_us_email, url: about_contact_us_index_path, method: :post, html: { id: 'contact-form', data: { action: 'https://api.external.com/contact' } } do |f| %>
  <!-- form fields as before -->

  <div class="row">
    <div class="col-sm-12 short">
      <%= button_tag 'Submit',
                     class: 'button button-green-default',
                     id: 'contact-us-submit',
                     data: { gainsight: Gainsight::Hr::ContactUs::ContactUsSubmitEvent.new(gainsight_request_data).gainsight_properties } %>
      <p class="body-sm grey-900">We'll aim to get back to you within 2 <span class="no-br">business days</span></p>
    </div>
  </div>
<% end %>

<div id="flash-messages"></div>
```

### 2. Update Your JavaScript to Retrieve the API Endpoint Dynamically

In your JavaScript, retrieve the API endpoint from the form’s data attribute and use it for the AJAX request.

```javascript
document.addEventListener('DOMContentLoaded', () => {
  const form = document.querySelector('#contact-form');
  const submitButton = document.getElementById('contact-us-submit');
  const apiEndpoint = form.getAttribute('data-action'); // Get the API endpoint from the form's data attribute

  form.addEventListener('submit', (event) => {
    event.preventDefault(); // Prevent the default form submission

    const formData = new FormData(form);
    const gainsightData = submitButton.getAttribute('data-gainsight'); // Get Gainsight data

    fetch(apiEndpoint, {
      method: 'POST',
      body: formData,
      headers: {
        'Accept': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content') // Include CSRF token if necessary
      },
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        // Update the button text
        submitButton.innerText = 'Sent';
        // Optionally, disable the button to prevent multiple submissions
        submitButton.disabled = true;
        // Flush the form values
        form.reset();
        // Optionally, show a success message
        displayFlashMessage('Your message has been sent successfully.', 'success');
      } else {
        // Handle errors (e.g., show an error message)
        displayFlashMessage('There was an error sending your message. Please try again.', 'error');
      }
    })
    .catch(error => {
      console.error('Error:', error);
      displayFlashMessage('There was an error sending your message. Please try again.', 'error');
    });
  });
});

function displayFlashMessage(message, type) {
  const flashContainer = document.getElementById('flash-messages');
  const flashMessage = document.createElement('div');
  flashMessage.className = `alert alert-${type}`;
  flashMessage.innerText = message;
  flashContainer.appendChild(flashMessage);

  // Remove the flash message after 5 seconds
  setTimeout(() => {
    flashMessage.remove();
  }, 5000);
}
```

### Summary

By updating the form view to include a data attribute for the API endpoint and retrieving this endpoint dynamically in your JavaScript, you can avoid hardcoding the API URL in your script. This approach makes your code more maintainable and easier to modify in the future.

Maybe I'm wrong. The requests goes to the server path declared in the simple form, right?

Yes, you are correct. The form submission in a Rails application typically goes to the server path declared in the form. The `url` attribute in the `simple_form_for` helper defines where the form data is submitted. 

Given this, let's update our approach to ensure the form submission works correctly with the server path and handles the response properly.

### 1. Form View

Ensure your form has the correct URL for submission. We don't need an external API endpoint here; the form should submit to the Rails controller.

```erb
<%= simple_form_for @contact_us_email, url: about_contact_us_index_path, method: :post, html: { id: 'contact-form', data: { turbo: true } } do |f| %>
  <!-- form fields as before -->

  <div class="row">
    <div class="col-sm-12 short">
      <%= button_tag 'Submit',
                     class: 'button button-green-default',
                     id: 'contact-us-submit',
                     data: { gainsight: Gainsight::Hr::ContactUs::ContactUsSubmitEvent.new(gainsight_request_data).gainsight_properties } %>
      <p class="body-sm grey-900">We'll aim to get back to you within 2 <span class="no-br">business days</span></p>
    </div>
  </div>
<% end %>

<div id="flash-messages"></div>
```

### 2. Controller

Handle the form submission in the controller. Ensure that you respond appropriately, especially if you're dealing with an external API internally.

```ruby
class About::ContactUsController < ApplicationController
  BS3_ACTIONS = { hr: %w(index) }.freeze
  layout proc { layout_chooser(bs3_only: false, bs3_actions: BS3_ACTIONS, other_layout: 'it_acquire/application') }

  def index
    @event = Event.find_by(slug: params["event"], site: current_site)
    @contact_us_email = CustomerRequest.new_from_user(current_user, current_site, reason: 'contact-us-email', outcome: 'email', concerning_url: request.url, concerning_title: @event.try(:title))
    @hide_contact_forms = :true

    @contact_us_email.assign_attributes(JSON.parse(cookies.signed[:customer_request_prefill])) if cookies.signed[:customer_request_prefill] && !logged_in?
  end

  def create
    @contact_us_email = CustomerRequest.new(customer_request_params)
    
    if @contact_us_email.valid? && submit_to_external_api(@contact_us_email)
      respond_to do |format|
        format.turbo_stream do
          flash.now[:success] = "Your message has been sent successfully."
        end
        format.html { redirect_to some_path, notice: 'Your message has been sent successfully.' }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          flash.now[:alert] = "There was an error sending your message."
        end
        format.html { render :index }
      end
    end
  end

  private

  def customer_request_params
    params.require(:customer_request).permit(:name, :email, :phone, :company, :job_role, :job_title, :contact, :message)
  end

  def submit_to_external_api(customer_request)
    # Example implementation for submitting to an external API
    # Replace with actual implementation
    external_api_endpoint = 'https://api.external.com/contact'
    response = HTTParty.post(external_api_endpoint, body: customer_request.to_json, headers: { 'Content-Type' => 'application/json' })

    response.success?
  end
end
```

### 3. Turbo Stream Views

Create Turbo Stream views to handle the responses and update the button text and form.

**create.turbo_stream.erb:**

```erb
<%= turbo_stream.update "contact-us-submit" do %>
  <%= button_tag 'Sent', class: 'button button-green-default', disabled: true %>
<% end %>

<%= turbo_stream.update "contact-form" do %>
  <script>
    document.getElementById('contact-form').reset();
  </script>
<% end %>

<%= turbo_stream.prepend "flash-messages", partial: "shared/flash", locals: { flash: flash } %>
```

**shared/_flash.html.erb:**

This partial will display flash messages.

```erb
<% flash.each do |key, message| %>
  <div class="alert alert-<%= key %>"><%= message %></div>
<% end %>
```

### Summary

By using Turbo Streams, you can handle the form submission on the server side and update the UI dynamically. The form submission goes to the declared URL in the form, and the server handles the request, including any interactions with an external API. The Turbo Streams then update the button text, reset the form, and display flash messages based on the server response. This approach ensures a clean and maintainable implementation leveraging Rails and Hotwire.

How can I make this switch to the simplest hotwire way?
<h3 class="hed-xs grey-900">Complete the contact form below</h3>
<%= simple_form_for customer_request, url: customer_requests_path, html: { honeypot: true }, remote: true do |f| %>
  <%= f.hidden_field :concerning_id if customer_request.concerning_id.present? %>
  <%= f.hidden_field :concerning_type if customer_request.concerning_type.present? %>
  <%= f.hidden_field :concerning_url, value: (customer_request.concerning_url || request.url) %>
  <%= f.hidden_field :reason %>
  <%= f.hidden_field :site_id, value: current_site.id %>
  <%= f.hidden_field :linkedin_autofill, value: customer_request.linkedin_autofill ? true : session[:omniauth].present? %>
  <%= f.hidden_field :form_handler_url %>
  <%= f.hidden_field :utm_campaign, value: params[:utm_campaign] %>
  <%= f.hidden_field :utm_medium, value: params[:utm_medium] %>
  <%= f.hidden_field :utm_source, value: params[:utm_source] %>
  <%= f.hidden_field :utm_content, value: params[:utm_content] %>
  <%= f.hidden_field :utm_term, value: params[:utm_term] %>

  <% if logged_in? && !trial? %>
    <%= f.hidden_field :name %>
    <%= f.hidden_field :email %>
    <%= f.hidden_field :company %>
    <%= f.hidden_field :job_title %>
    <%= f.hidden_field :phone %>
    <%= f.hidden_field :job_role %>
    <%= f.hidden_field :country_code, value: current_user.demographic&.country_code %>
    <%= f.hidden_field :employees, value: current_user.demographic&.employees %>
  <% else %>
    <div class="row">
      <div class="col-md-12 col-lg-6">
        <%= f.input :name,
                    wrapper: :mco,
                    value: default_name_value(customer_request, session),
                    label: 'Full Name',
                    required: true %>
        <%#
          full_name errors need to be displayed without simple_form since Customer Request don't have a full name,
          they've got first_name and last_name which get combined in the back end
        %>
        <% customer_request.errors[:full_name].each do |error| %>
          <div class="error-field">
            <span class="form-body-sm error red-500 fa fa-exclamation-circle"><%= error %></span>
          </div>
        <% end %>
      </div>
      <div class="col-md-12 col-lg-6">
        <%= f.input :email,
                    wrapper: :mco,
                    value: default_value('email', customer_request, session),
                    required: true %>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12 col-lg-6">
        <%= f.input :phone, wrapper: :mco, label: 'Phone', required: true %>
      </div>
      <div class="col-md-12 col-lg-6">
        <%= f.input :company,
                    wrapper: :mco,
                    value: default_value('company', customer_request, session),
                    required: true %>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12 col-lg-6">
        <%= f.input :job_role,
                    wrapper: :mco,
                    as: :select,
                    collection: job_role_options(current_site).map(&:title),
                    label: 'Job Function',
                    required: true %>
      </div>
      <div class="col-md-12 col-lg-6">
        <%= f.input :job_title,
                    wrapper: :mco,
                    value: default_value('job_title', customer_request, session),
                    label: 'Job Title',
                    required: true %>
      </div>
    </div>
  <% end %>

  <div class="row">
    <div class="col-md-12 col-lg-6">
      <%= f.input :contact,
                  wrapper: :mco,
                  as: :select,
                  input_html: { id: 'message_director' },
                  collection: hr_contact_options(logged_in?),
                  required: true,
                  label: 'How may we direct your message?' %>
    </div>
    <div class="col-md-12 col-lg-6 product-options">
      <%= f.input :contact,
                  wrapper: :mco,
                  input_html: { id: 'product_options', disabled: true },
                  as: :select,
                  collection: hr_product_options,
                  required: true,
                  label: 'Product Options' %>
    </div>
    <% if logged_in? %>
      <div class="col-md-12 col-lg-6 analyst-role">
        <%= f.input :contact,
                    wrapper: :mco,
                    input_html: { id: 'analyst_role', disabled: true },
                    as: :select,
                    collection: hr_analyst_roles,
                    required: true,
                    label: 'Role' %>
      </div>
    <% end %>
  </div>

  <div class="row">
    <div class="col-md-12">
      <span class="message-counter"><span id="characterCount">0</span>/350</span>
      <%= f.input :message,
                  wrapper: :mco,
                  label: 'Your Message',
                  required: true,
                  input_html: { maxlength: 350, minlength: 50 } %>
      <p class="form-body-sm hint">Note: Minimum 50 characters required (max. 350 characters).</p>
    </div>
  </div>

  <% unless logged_in? %>
    <div class="row">
      <div class="col-sm-12">
        <%= f.input :terms_agreed,
                    wrapper: :mco_boolean,
                    as: :boolean,
                    boolean_style: :inline,
                    label: t('helpers.label.wants_updates_html',
                             terms_path: help_terms_path,
                             privacy_path: privacy_path) %>
      </div>
    </div>
  <% end %>

  <div class="row">
    <div class="col-sm-12 short">
      <%= button_tag 'Submit',
                     class: 'button button-green-default',
                     id: 'contact-us-submit',
                     disable_with: 'Submitting...',
                     data: { gainsight: Gainsight::Hr::ContactUs::ContactUsSubmitEvent.new(gainsight_request_data).gainsight_properties } %>
      <p class="body-sm grey-900">We'll aim to get back to you within 2 <span class="no-br">business days</span></p>
    </div>
  </div>
<% end %>
<script> HrContactUsV2.initialize(); </script>


To switch this to the simplest Hotwire way, you'll need to ensure that the form submission is handled with Turbo and the form submission updates the UI accordingly. Here's how to refactor the form view and handle the response using Turbo:

### 1. Update the Form View

Ensure the form uses Turbo by adding the `data-turbo` attribute and set `remote: true` to false as Turbo handles this by default.

```erb
<h3 class="hed-xs grey-900">Complete the contact form below</h3>
<%= simple_form_for customer_request, url: customer_requests_path, html: { honeypot: true, data: { turbo: true } } do |f| %>
  <%= f.hidden_field :concerning_id if customer_request.concerning_id.present? %>
  <%= f.hidden_field :concerning_type if customer_request.concerning_type.present? %>
  <%= f.hidden_field :concerning_url, value: (customer_request.concerning_url || request.url) %>
  <%= f.hidden_field :reason %>
  <%= f.hidden_field :site_id, value: current_site.id %>
  <%= f.hidden_field :linkedin_autofill, value: customer_request.linkedin_autofill ? true : session[:omniauth].present? %>
  <%= f.hidden_field :form_handler_url %>
  <%= f.hidden_field :utm_campaign, value: params[:utm_campaign] %>
  <%= f.hidden_field :utm_medium, value: params[:utm_medium] %>
  <%= f.hidden_field :utm_source, value: params[:utm_source] %>
  <%= f.hidden_field :utm_content, value: params[:utm_content] %>
  <%= f.hidden_field :utm_term, value: params[:utm_term] %>

  <% if logged_in? && !trial? %>
    <%= f.hidden_field :name %>
    <%= f.hidden_field :email %>
    <%= f.hidden_field :company %>
    <%= f.hidden_field :job_title %>
    <%= f.hidden_field :phone %>
    <%= f.hidden_field :job_role %>
    <%= f.hidden_field :country_code, value: current_user.demographic&.country_code %>
    <%= f.hidden_field :employees, value: current_user.demographic&.employees %>
  <% else %>
    <div class="row">
      <div class="col-md-12 col-lg-6">
        <%= f.input :name,
                    wrapper: :mco,
                    value: default_name_value(customer_request, session),
                    label: 'Full Name',
                    required: true %>
        <% customer_request.errors[:full_name].each do |error| %>
          <div class="error-field">
            <span class="form-body-sm error red-500 fa fa-exclamation-circle"><%= error %></span>
          </div>
        <% end %>
      </div>
      <div class="col-md-12 col-lg-6">
        <%= f.input :email,
                    wrapper: :mco,
                    value: default_value('email', customer_request, session),
                    required: true %>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12 col-lg-6">
        <%= f.input :phone, wrapper: :mco, label: 'Phone', required: true %>
      </div>
      <div class="col-md-12 col-lg-6">
        <%= f.input :company,
                    wrapper: :mco,
                    value: default_value('company', customer_request, session),
                    required: true %>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12 col-lg-6">
        <%= f.input :job_role,
                    wrapper: :mco,
                    as: :select,
                    collection: job_role_options(current_site).map(&:title),
                    label: 'Job Function',
                    required: true %>
      </div>
      <div class="col-md-12 col-lg-6">
        <%= f.input :job_title,
                    wrapper: :mco,
                    value: default_value('job_title', customer_request, session),
                    label: 'Job Title',
                    required: true %>
      </div>
    </div>
  <% end %>

  <div class="row">
    <div class="col-md-12 col-lg-6">
      <%= f.input :contact,
                  wrapper: :mco,
                  as: :select,
                  input_html: { id: 'message_director' },
                  collection: hr_contact_options(logged_in?),
                  required: true,
                  label: 'How may we direct your message?' %>
    </div>
    <div class="col-md-12 col-lg-6 product-options">
      <%= f.input :contact,
                  wrapper: :mco,
                  input_html: { id: 'product_options', disabled: true },
                  as: :select,
                  collection: hr_product_options,
                  required: true,
                  label: 'Product Options' %>
    </div>
    <% if logged_in? %>
      <div class="col-md-12 col-lg-6 analyst-role">
        <%= f.input :contact,
                    wrapper: :mco,
                    input_html: { id: 'analyst_role', disabled: true },
                    as: :select,
                    collection: hr_analyst_roles,
                    required: true,
                    label: 'Role' %>
      </div>
    <% end %>
  </div>

  <div class="row">
    <div class="col-md-12">
      <span class="message-counter"><span id="characterCount">0</span>/350</span>
      <%= f.input :message,
                  wrapper: :mco,
                  label: 'Your Message',
                  required: true,
                  input_html: { maxlength: 350, minlength: 50 } %>
      <p class="form-body-sm hint">Note: Minimum 50 characters required (max. 350 characters).</p>
    </div>
  </div>

  <% unless logged_in? %>
    <div class="row">
      <div class="col-sm-12">
        <%= f.input :terms_agreed,
                    wrapper: :mco_boolean,
                    as: :boolean,
                    boolean_style: :inline,
                    label: t('helpers.label.wants_updates_html',
                             terms_path: help_terms_path,
                             privacy_path: privacy_path) %>
      </div>
    </div>
  <% end %>

  <div class="row">
    <div class="col-sm-12 short">
      <%= button_tag 'Submit',
                     class: 'button button-green-default',
                     id: 'contact-us-submit',
                     disable_with: 'Submitting...',
                     data: { gainsight: Gainsight::Hr::ContactUs::ContactUsSubmitEvent.new(gainsight_request_data).gainsight_properties } %>
      <p class="body-sm grey-900">We'll aim to get back to you within 2 <span class="no-br">business days</span></p>
    </div>
  </div>
<% end %>
<script> HrContactUsV2.initialize(); </script>
```

### 2. Controller

Handle the form submission in the controller. Ensure you respond with Turbo Streams to update the UI.

```ruby
class CustomerRequestsController < ApplicationController
  def create
    @customer_request = CustomerRequest.new(customer_request_params)

    if @customer_request.valid? && submit_to_external_api(@customer_request)
      respond_to do |format|
        format.turbo_stream do
          flash.now[:success] = "Your message has been sent successfully."
        end
        format.html { redirect_to some_path, notice: 'Your message has been sent successfully.' }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          flash.now[:alert] = "There was an error sending your message."
        end
        format.html { render :new }
      end
    end
  end

  private

  def customer_request_params
    params.require(:customer_request).permit(:name, :email, :phone, :company, :job_role, :job_title, :contact, :message)
  end

  def submit_to_external_api(customer_request)
    # Example implementation for submitting to an external API
    # Replace with actual implementation
    external_api_endpoint = 'https://api.external.com/contact'
    response = HTTParty.post(external_api_endpoint, body: customer_request.to_json, headers: { 'Content-Type' => 'application/json' })

    response.success?
  end
end
```

### 3. Turbo Stream Views

Create Turbo Stream views to handle the responses and update the button text and form.

**create.turbo_stream.erb:**

```erb
<%= turbo_stream.update "contact-us-submit" do %>
  <%= button_tag 'Sent', class: 'button button-green-default', disabled: true %>
<% end %>

<%= turbo_stream.update "contact-form" do %>
  <script>
    document.getElementById('contact-form').reset();
  </script>
<% end %>

<%= turbo_stream.prepend "flash-messages", partial: "shared/flash", locals: { flash: flash } %>
```

**shared/_flash.html.erb:**

This partial will display flash messages.

```erb
<% flash.each do |key, message| %>
  <div class="alert alert-<%= key %>"><%= message %></div>
<% end %>
```

###

would it make sense to change the HrContactUsV2 class to stimulus? That way I could catch the response from the form submission? Do I still need to use js erb templating?

Yes, converting the `HrContactUsV2` class to a Stimulus controller makes sense for handling the form interactions and catching the response from the form submission. By using Stimulus, you can cleanly manage the form's behavior and responses without relying on inline JavaScript or JS ERB templates.

### 1. Set Up Stimulus

Ensure you have Stimulus set up in your Rails application. If not, you can follow the steps to install it:

Add Stimulus to your application:

```bash
bin/rails webpacker:install:stimulus
```

### 2. Create a Stimulus Controller

Create a new Stimulus controller to handle the form submission and response. 

Create the file `app/javascript/controllers/contact_form_controller.js`:

```javascript
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["submitButton", "characterCount", "form", "messageDirector", "productOptions", "analystRole"];

  initialize() {
    this.updateCharacterCount();
    this.toggleExtraOptions();
  }

  connect() {
    this.formTarget.addEventListener("turbo:submit-end", this.handleResponse.bind(this));
  }

  updateCharacterCount() {
    const messageField = this.formTarget.querySelector("#customer_request_message");
    this.characterCountTarget.innerText = messageField.value.length;
    messageField.addEventListener("input", () => {
      this.characterCountTarget.innerText = messageField.value.length;
    });
  }

  toggleExtraOptions() {
    this.messageDirectorTarget.addEventListener("change", (event) => {
      switch (event.target.value) {
        case 'Product Information':
          this.productOptionsTarget.style.display = 'block';
          this.productOptionsTarget.disabled = false;
          if (this.hasAnalystRoleTarget) {
            this.analystRoleTarget.style.display = 'none';
            this.analystRoleTarget.disabled = true;
          }
          break;
        case 'Talk to an Analyst':
          this.productOptionsTarget.style.display = 'none';
          this.productOptionsTarget.disabled = true;
          if (this.hasAnalystRoleTarget) {
            this.analystRoleTarget.style.display = 'block';
            this.analystRoleTarget.disabled = false;
          }
          break;
        default:
          this.productOptionsTarget.style.display = 'none';
          this.productOptionsTarget.disabled = true;
          if (this.hasAnalystRoleTarget) {
            this.analystRoleTarget.style.display = 'none';
            this.analystRoleTarget.disabled = true;
          }
          break;
      }
    });
  }

  handleResponse(event) {
    const { success } = event.detail.response;

    if (success) {
      this.submitButtonTarget.innerText = 'Sent';
      this.submitButtonTarget.disabled = true;
      this.formTarget.reset();
      this.displayFlashMessage('Your message has been sent successfully.', 'success');
    } else {
      this.displayFlashMessage('There was an error sending your message. Please try again.', 'error');
    }
  }

  displayFlashMessage(message, type) {
    const flashContainer = document.getElementById('flash-messages');
    const flashMessage = document.createElement('div');
    flashMessage.className = `alert alert-${type}`;
    flashMessage.innerText = message;
    flashContainer.appendChild(flashMessage);

    setTimeout(() => {
      flashMessage.remove();
    }, 5000);
  }
}
```

### 3. Update Your Form View

Ensure your form uses the Stimulus controller and the necessary targets:

```erb
<h3 class="hed-xs grey-900">Complete the contact form below</h3>
<%= simple_form_for customer_request, url: customer_requests_path, html: { data: { controller: "contact-form" }, turbo: true } do |f| %>
  <%= f.hidden_field :concerning_id if customer_request.concerning_id.present? %>
  <%= f.hidden_field :concerning_type if customer_request.concerning_type.present? %>
  <%= f.hidden_field :concerning_url, value: (customer_request.concerning_url || request.url) %>
  <%= f.hidden_field :reason %>
  <%= f.hidden_field :site_id, value: current_site.id %>
  <%= f.hidden_field :linkedin_autofill, value: customer_request.linkedin_autofill ? true : session[:omniauth].present? %>
  <%= f.hidden_field :form_handler_url %>
  <%= f.hidden_field :utm_campaign, value: params[:utm_campaign] %>
  <%= f.hidden_field :utm_medium, value: params[:utm_medium] %>
  <%= f.hidden_field :utm_source, value: params[:utm_source] %>
  <%= f.hidden_field :utm_content, value: params[:utm_content] %>
  <%= f.hidden_field :utm_term, value: params[:utm_term] %>

  <% if logged_in? && !trial? %>
    <%= f.hidden_field :name %>
    <%= f.hidden_field :email %>
    <%= f.hidden_field :company %>
    <%= f.hidden_field :job_title %>
    <%= f.hidden_field :phone %>
    <%= f.hidden_field :job_role %>
    <%= f.hidden_field :country_code, value: current_user.demographic&.country_code %>
    <%= f.hidden_field :employees, value: current_user.demographic&.employees %>
  <% else %>
    <div class="row">
      <div class="col-md-12 col-lg-6">
        <%= f.input :name,
                    wrapper: :mco,
                    value: default_name_value(customer_request, session),
                    label: 'Full Name',
                    required: true %>
        <% customer_request.errors[:full_name].each do |error| %>
          <div class="error-field">
            <span class="form-body-sm error red-500 fa fa-exclamation-circle"><%= error %></span>
          </div>
        <% end %>
      </div>
      <div class="col-md-12 col-lg-6">
        <%= f.input :email,
                    wrapper: :mco,
                    value: default_value('email', customer_request, session),
                    required: true %>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12 col-lg-6">
        <%= f.input :phone, wrapper: :mco, label: 'Phone', required: true %>
      </div>
      <div class="col-md-12 col-lg-6">
        <%= f.input :company,
                    wrapper: :mco,
                    value: default_value('company', customer_request, session),
                    required: true %>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12 col-lg-6">
        <%= f.input :job_role,
                    wrapper: :mco,
                    as: :select,
                    collection: job_role_options(current_site).map(&:title),
                    label: 'Job Function',
                    required: true %>
      </div>
      <div class="col-md-12 col-lg-6">
        <%= f.input :job_title,
                    wrapper: :mco,
                    value: default_value('job_title', customer_request, session),
                    label: 'Job Title',
                    required: true %>
      </div>
    </div>
  <% end %>

  <div class="row">
    <div class="col-md-12 col-lg-6">
      <%= f.input :contact,
                  wrapper: :mco,
                  as: :select,
                  input_html: { id: 'message_director', data: { target: "contact-form.messageDirector" } },
                  collection: hr_contact_options(logged_in?),
                  required: true,
                  label: 'How may we direct your message?' %>
    </div>
    <div class="col-md-12 col-lg-6 product-options">
      <%= f.input :contact,
                  wrapper: :mco,
                  input_html: { id: 'product_options', disabled: true, data: { target: "contact-form.productOptions" } },
                  as: :select,
                  collection: hr_product_options,
                  required: true,
                  label: 'Product Options' %>
    </div>
    <% if logged_in? %>
      <div class="col-md-12 col-lg-6 analyst-role">
        <%= f.input :contact,
                    wrapper: :mco,
                    input_html: { id: 'analyst_role', disabled: true, data: { target: "contact-form.analystRole" } },
                    as: :select,
                    collection: hr_analyst_roles,
                    required: true,
                    label: 'Role' %>
      </div>
    <% end %>
  </div>

  <div class="row">
    <div class="col-md-12">
      <span class="message-counter"><span id="characterCount" data-target="contact-form.characterCount">0</span>/350</span>
      <%= f.input :message,
                  wrapper: :mco,
                  label: 'Your Message',
                  required: true,
                  input_html: { id: 'customer_request_message', maxlength: 350, minlength: 50, data: { action: "input->contact-form#updateCharacterCount" } } %>
      <p class="form-body-sm hint">Note: Minimum 50 characters required (max. 350 characters).</p>
    </div>
  </div>

  <% unless logged_in? %>
    <div class="row">
      <div class

="col-sm-12">
        <%= f.input :terms_agreed,
                    wrapper: :mco_boolean,
                    as: :boolean,
                    boolean_style: :inline,
                    label: t('helpers.label.wants_updates_html',
                             terms_path: help_terms_path,
                             privacy_path: privacy_path) %>
      </div>
    </div>
  <% end %>

  <div class="row">
    <div class="col-sm-12 short">
      <%= button_tag 'Submit',
                     class: 'button button-green-default',
                     id: 'contact-us-submit',
                     data: { target: "contact-form.submitButton", gainsight: Gainsight::Hr::ContactUs::ContactUsSubmitEvent.new(gainsight_request_data).gainsight_properties } %>
      <p class="body-sm grey-900">We'll aim to get back to you within 2 <span class="no-br">business days</span></p>
    </div>
  </div>
<% end %>

<div id="flash-messages"></div>
```

### 4. Turbo Stream Views

Create Turbo Stream views to handle the responses and update the button text and form.

**create.turbo_stream.erb:**

```erb
<%= turbo_stream.update "contact-us-submit" do %>
  <%= button_tag 'Sent', class: 'button button-green-default', disabled: true %>
<% end %>

<%= turbo_stream.update "contact-form" do %>
  <script>
    document.getElementById('contact-form').reset();
  </script>
<% end %>

<%= turbo_stream.prepend "flash-messages", partial: "shared/flash", locals: { flash: flash } %>
```

**shared/_flash.html.erb:**

This partial will display flash messages.

```erb
<% flash.each do |key, message| %>
  <div class="alert alert-<%= key %>"><%= message %></div>
<% end %>
```

### Summary



what is honeypot in the form? Is that a gem?

The term "honeypot" in the context of a web form usually refers to an anti-spam technique rather than a gem. It's a hidden form field that is not visible to users but can be seen and filled out by bots. If this hidden field is filled out upon form submission, it indicates that the form was likely submitted by a bot rather than a human, and the submission can be discarded or flagged as spam.

### Implementing Honeypot in a Form

To implement a honeypot field in a Rails form without any gem, you can do the following:

1. **Add a Hidden Field in the Form:**

In your form, add a hidden field that should remain empty. This can be done with plain HTML.

```erb
<%= simple_form_for customer_request, url: customer_requests_path, html: { id: 'contact-form', data: { turbo: true } } do |f| %>
  <div style="display:none;">
    <%= f.input :extra_field, label: "Leave this field blank", value: "", autocomplete: "off" %>
  </div>
  <!-- Rest of the form fields -->
<% end %>
```

2. **Modify the Controller to Check the Honeypot Field:**

In your controller, check if the honeypot field is filled out. If it is, treat the submission as spam.

```ruby
class CustomerRequestsController < ApplicationController
  def create
    if params[:customer_request][:extra_field].present?
      # Handle spam submission
      redirect_to root_path, alert: "Your submission has been flagged as spam."
      return
    end

    @customer_request = CustomerRequest.new(customer_request_params)

    if @customer_request.valid? && submit_to_external_api(@customer_request)
      respond_to do |format|
        format.turbo_stream do
          flash.now[:success] = "Your message has been sent successfully."
        end
        format.html { redirect_to some_path, notice: 'Your message has been sent successfully.' }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          flash.now[:alert] = "There was an error sending your message."
        end
        format.html { render :new }
      end
    end
  end

  private

  def customer_request_params
    params.require(:customer_request).permit(:name, :email, :phone, :company, :job_role, :job_title, :contact, :message, :extra_field)
  end

  def submit_to_external_api(customer_request)
    # Example implementation for submitting to an external API
    # Replace with actual implementation
    external_api_endpoint = 'https://api.external.com/contact'
    response = HTTParty.post(external_api_endpoint, body: customer_request.to_json, headers: { 'Content-Type' => 'application/json' })

    response.success?
  end
end
```

### Summary

The honeypot field technique is a simple and effective way to reduce spam submissions without impacting the user experience. It involves adding a hidden field to your form and checking for its presence upon form submission. If a bot fills out this field, the submission is flagged as spam. This technique does not require any external gems and can be easily implemented with standard Rails form helpers and controller logic.