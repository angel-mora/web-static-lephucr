---
title: MVP Hootsuite Integration
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# MVP Hootsuite Integration

## ✅ TODOs


## 📌 Summary
Would it be suitable for a MVP to output the markdown folder contents (a publication, from now on) processed with AI to a campaign in Hootsuite? Their API can pull back statistics of the campaigns' performance? Can it link to someone's website? Would it be a step before or after an integration with mailchimp or substack if we want to be able to find leads for someone's publication?

## 🧠 Full Chat


Would it be suitable for a MVP to output the markdown folder contents (a publication, from now on) processed with AI to a campaign in Hootsuite? Their API can pull back statistics of the campaigns' performance? Can it link to someone's website? Would it be a step before or after an integration with mailchimp or substack if we want to be able to find leads for someone's publication?



Building an MVP that integrates a markdown-based publication with Hootsuite, Mailchimp, or Substack could serve as a powerful workflow for managing and distributing content while leveraging AI. Here's a breakdown of your questions and considerations:

### 1. **Outputting Markdown Folder Contents Processed with AI to Hootsuite**
   - **Feasibility**: Yes, this is a suitable feature for an MVP. Hootsuite's API allows scheduling and posting content to various social media platforms. Your AI can process the markdown content (e.g., summarizing, creating headlines, generating hashtags) and format it for social media posts.
   - **Advantages**:
     - Automates social media content generation and scheduling.
     - Ensures consistency in messaging and branding.

### 2. **Pulling Back Statistics from Campaigns' Performance**
   - **Feasibility**: Hootsuite's API can provide analytics such as engagement rates, impressions, clicks, and more, depending on the social platform. Incorporating performance statistics into your app would allow users to gauge the effectiveness of their campaigns.
   - **Advantages**:
     - Provides actionable insights for optimizing future campaigns.
     - Enhances the app's value by offering a feedback loop.

### 3. **Linking to a Website**
   - **Feasibility**: Yes, your Hootsuite campaigns can include links back to a website or blog. This is standard practice for driving traffic to the source of the publication.
   - **Advantages**:
     - Increases website traffic and visibility.
     - Supports lead generation and audience building.

### 4. **Step Before or After Mailchimp/Substack Integration**
   - **Step Before**: If your priority is growing social media presence and engaging a broader audience quickly, integration with Hootsuite should come first. Social media is a top-of-funnel activity to generate awareness.
   - **Step After**: If you're focusing on nurturing an existing audience or leveraging content to build a mailing list, Mailchimp or Substack integration could follow. These platforms help retain leads and foster deeper connections via email.
   - **Suggested Workflow**:
     1. Publish content via Hootsuite to generate traffic and leads.
     2. Use Mailchimp or Substack for lead nurturing and direct communication.

### 5. **Finding Leads for the Publication**
   - **Social Media (via Hootsuite)**: Generates broad leads by targeting specific demographics and tracking interactions (likes, shares, comments).
   - **Mailchimp/Substack**: Converts leads into subscribers by offering gated content (e.g., exclusive articles or newsletters).
   - **AI Application**: Analyze social engagement data to identify high-potential leads, then target them with personalized email campaigns or suggestions to subscribe.

### Final Workflow Suggestion for an MVP:
1. **Markdown Processing with AI**: Enhance content for distribution.
2. **Hootsuite Integration**: Share AI-optimized content on social platforms, driving traffic and engagement.
3. **Website Link**: Include links in posts to direct traffic back to the publication site.
4. **Analytics Feedback**: Use Hootsuite analytics to refine content strategy.
5. **Mailchimp/Substack Integration**: Capture and nurture leads for a dedicated subscriber base.

This workflow ensures a seamless progression from content creation to lead generation and retention, making it a strong MVP for content creators or businesses.

How can I create a campaign for one single social media over the Hootsuite API? I'll be using Ruby on Rails

Creating a campaign for a single social media platform via the Hootsuite API using Ruby on Rails involves several steps. Here’s a guide to help you get started:

---

### 1. **Set Up Hootsuite Developer Account**
   - **Create a Hootsuite Developer Account**: [Sign up here](https://developer.hootsuite.com/).
   - **Register Your App**: Once registered, you’ll receive a client ID and client secret. These will be used for authentication.

---

### 2. **Integrate Hootsuite API with Rails**
   - **Install Required Gems**:
     ```bash
     gem install httparty
     gem install dotenv-rails
     ```
   - **Add to `Gemfile`**:
     ```ruby
     gem 'httparty'
     gem 'dotenv-rails'
     ```

---

### 3. **Set Up Authentication**
   Hootsuite uses OAuth 2.0 for authentication.

   - **Environment Variables**:
     Add the following to `.env`:
     ```env
     HOOTSUITE_CLIENT_ID=your_client_id
     HOOTSUITE_CLIENT_SECRET=your_client_secret
     HOOTSUITE_REDIRECT_URI=http://localhost:3000/callback
     ```

   - **Generate OAuth URL**:
     Create a method to redirect users for authentication:
     ```ruby
     def hootsuite_auth_url
       client_id = ENV['HOOTSUITE_CLIENT_ID']
       redirect_uri = ENV['HOOTSUITE_REDIRECT_URI']
       scope = 'content.write'
       "https://platform.hootsuite.com/oauth2/auth?client_id=#{client_id}&redirect_uri=#{redirect_uri}&response_type=code&scope=#{scope}"
     end
     ```

   - **Exchange Code for Access Token**:
     After the user authorizes your app, Hootsuite will redirect to your `callback` URL with a `code` parameter:
     ```ruby
     require 'httparty'

     def get_access_token(code)
       response = HTTParty.post('https://platform.hootsuite.com/oauth2/token', body: {
         client_id: ENV['HOOTSUITE_CLIENT_ID'],
         client_secret: ENV['HOOTSUITE_CLIENT_SECRET'],
         redirect_uri: ENV['HOOTSUITE_REDIRECT_URI'],
         grant_type: 'authorization_code',
         code: code
       })

       JSON.parse(response.body)['access_token']
     end
     ```

---

### 4. **Create a Campaign for a Single Social Media Platform**
   - **Retrieve Social Media Profile ID**:
     Use the `/me` endpoint to fetch connected social media profiles:
     ```ruby
     def get_social_profiles(access_token)
       response = HTTParty.get('https://platform.hootsuite.com/v1/me', headers: {
         'Authorization' => "Bearer #{access_token}"
       })
       JSON.parse(response.body)['socialProfiles']
     end
     ```

   - **Create a Campaign**:
     Use the `POST /v1/messages` endpoint to post content.
     ```ruby
     def create_campaign(access_token, profile_id, message, link)
       response = HTTParty.post('https://platform.hootsuite.com/v1/messages', headers: {
         'Authorization' => "Bearer #{access_token}",
         'Content-Type' => 'application/json'
       }, body: {
         text: message,
         socialProfileIds: [profile_id],
         scheduledSendTime: nil, # Omit or set a specific time for scheduling
         targeting: nil,         # Add targeting details if necessary
         media: {
           link: link
         }
       }.to_json)

       JSON.parse(response.body)
     end
     ```

   - **Example Usage**:
     ```ruby
     access_token = 'your_access_token'
     profiles = get_social_profiles(access_token)
     profile_id = profiles.find { |p| p['type'] == 'FACEBOOK' }['id'] # Adjust for platform
     create_campaign(access_token, profile_id, "Check out our new product!", "https://example.com")
     ```

---

### 5. **Testing and Debugging**
   - Use tools like [Postman](https://www.postman.com/) to test API endpoints manually before integrating them into Rails.
   - Log responses for debugging:
     ```ruby
     Rails.logger.info(response.body)
     ```

---

### 6. **Extend for Analytics**
   Once your campaign is running, fetch analytics data via the `/v1/analytics` endpoint to measure performance:
   ```ruby
   def fetch_analytics(access_token, profile_id)
     response = HTTParty.get("https://platform.hootsuite.com/v1/analytics", headers: {
       'Authorization' => "Bearer #{access_token}"
     }, query: {
       socialProfileIds: [profile_id]
     })

     JSON.parse(response.body)
   end
   ```

---

This setup provides a basic structure for creating a single-platform campaign in Hootsuite from Rails, while leaving room for extensions like analytics tracking or multiple social profiles. Let me know if you’d like to refine or expand any part of this!

Do they handle url tracking?
How about pulling back the results of the campaign?

Yes, **Hootsuite handles URL tracking** and allows you to **pull back the results of a campaign** using their API. Here’s how you can work with these features in your Rails app:

---

### 1. **URL Tracking in Hootsuite**
Hootsuite can add URL parameters for tracking purposes, such as UTM parameters, to measure campaign performance in tools like Google Analytics.

#### Automatic Link Shortening and Tracking
When you post a link using the Hootsuite API, it is automatically shortened using the **ow.ly** service (if enabled for your account). You can also specify custom UTM parameters for detailed tracking.

- **Example**: Adding UTM parameters manually to the link:
   ```ruby
   def create_campaign_with_tracking(access_token, profile_id, message, link)
     # Append UTM parameters to the URL
     tracked_link = "#{link}?utm_source=hootsuite&utm_medium=social&utm_campaign=my_campaign"

     response = HTTParty.post('https://platform.hootsuite.com/v1/messages', headers: {
       'Authorization' => "Bearer #{access_token}",
       'Content-Type' => 'application/json'
     }, body: {
       text: message,
       socialProfileIds: [profile_id],
       media: {
         link: tracked_link
       }
     }.to_json)

     JSON.parse(response.body)
   end
   ```

- **Optional**: You can use link shorteners like Bitly or ow.ly to shorten these tracked links for better presentation.

---

### 2. **Pulling Back Campaign Results**
Hootsuite provides **analytics data** for campaigns, such as clicks, impressions, engagement, and other key performance metrics.

#### Fetching Campaign Results
Use the `/v1/analytics` endpoint to retrieve campaign performance data:

- **Example**: Pull analytics for a specific campaign
   ```ruby
   def fetch_campaign_results(access_token, profile_id, start_date, end_date)
     response = HTTParty.get("https://platform.hootsuite.com/v1/analytics", headers: {
       'Authorization' => "Bearer #{access_token}"
     }, query: {
       socialProfileIds: [profile_id],
       startDate: start_date,  # Format: YYYY-MM-DD
       endDate: end_date,      # Format: YYYY-MM-DD
       metrics: ['clicks', 'impressions', 'engagement'] # Select metrics to track
     })

     JSON.parse(response.body)
   end
   ```

- **Response Example**:
   ```json
   {
     "data": [
       {
         "profileId": "12345",
         "metrics": {
           "clicks": 120,
           "impressions": 1000,
           "engagement": 50
         }
       }
     ]
   }
   ```

#### Metrics Supported:
Hootsuite typically tracks:
- **Clicks**: Number of times a link was clicked.
- **Impressions**: Total views of the post.
- **Engagement**: Likes, shares, and comments.
- **Reach**: Unique viewers who saw the post.

---

### 3. **How to Combine URL Tracking and Results**
1. **Set UTM Parameters**:
   Track campaign performance via URLs using tools like Google Analytics.
2. **Shorten URLs**:
   Shortened links like `ow.ly` make tracking links less cumbersome and integrate seamlessly with Hootsuite.
3. **Pull Analytics**:
   Retrieve campaign-specific analytics for performance reporting and insights.

---

### Example Workflow in Rails
Here’s how you might tie it all together:

```ruby
def create_and_track_campaign(access_token, profile_id, message, link, start_date, end_date)
  # Add UTM parameters
  tracked_link = "#{link}?utm_source=hootsuite&utm_medium=social&utm_campaign=my_campaign"

  # Create campaign
  campaign_response = HTTParty.post('https://platform.hootsuite.com/v1/messages', headers: {
    'Authorization' => "Bearer #{access_token}",
    'Content-Type' => 'application/json'
  }, body: {
    text: message,
    socialProfileIds: [profile_id],
    media: {
      link: tracked_link
    }
  }.to_json)

  campaign_data = JSON.parse(campaign_response.body)

  # Fetch analytics
  analytics_response = fetch_campaign_results(access_token, profile_id, start_date, end_date)

  { campaign: campaign_data, analytics: analytics_response }
end
```

---

### 4. **Use Cases**
- **Generate Insights**: See how a specific campaign performed (e.g., clicks on tracked URLs).
- **Optimize Campaigns**: Use analytics to refine future posts and targeting strategies.
- **Client Reporting**: Pull data for detailed performance reports.

---

Let me know if you'd like further clarification or help implementing this!

Provide a json I can upload in postman so I only need to add the proper env variables. It should contain all the requests to push a campaign (obviously including auth and whatever it takes) and the requests to pull back the proper analytics

Here’s a **Postman collection JSON** you can use. Replace the placeholders with your environment variables, such as `{{access_token}}`, `{{client_id}}`, `{{client_secret}}`, and others.

```json
{
  "info": {
    "name": "Hootsuite Campaign Management",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "item": [
    {
      "name": "Authenticate with Hootsuite",
      "request": {
        "method": "POST",
        "header": [
          { "key": "Content-Type", "value": "application/x-www-form-urlencoded" }
        ],
        "body": {
          "mode": "urlencoded",
          "urlencoded": [
            { "key": "client_id", "value": "{{client_id}}" },
            { "key": "client_secret", "value": "{{client_secret}}" },
            { "key": "grant_type", "value": "client_credentials" },
            { "key": "redirect_uri", "value": "{{redirect_uri}}" }
          ]
        },
        "url": {
          "raw": "https://platform.hootsuite.com/oauth2/token",
          "protocol": "https",
          "host": ["platform", "hootsuite", "com"],
          "path": ["oauth2", "token"]
        }
      }
    },
    {
      "name": "Get Social Profiles",
      "request": {
        "method": "GET",
        "header": [
          { "key": "Authorization", "value": "Bearer {{access_token}}" }
        ],
        "url": {
          "raw": "https://platform.hootsuite.com/v1/me",
          "protocol": "https",
          "host": ["platform", "hootsuite", "com"],
          "path": ["v1", "me"]
        }
      }
    },
    {
      "name": "Create Campaign",
      "request": {
        "method": "POST",
        "header": [
          { "key": "Authorization", "value": "Bearer {{access_token}}" },
          { "key": "Content-Type", "value": "application/json" }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\n  \"text\": \"Check out our latest blog post!\",\n  \"socialProfileIds\": [\n    \"{{social_profile_id}}\"\n  ],\n  \"media\": {\n    \"link\": \"{{link}}\"\n  }\n}"
        },
        "url": {
          "raw": "https://platform.hootsuite.com/v1/messages",
          "protocol": "https",
          "host": ["platform", "hootsuite", "com"],
          "path": ["v1", "messages"]
        }
      }
    },
    {
      "name": "Fetch Campaign Analytics",
      "request": {
        "method": "GET",
        "header": [
          { "key": "Authorization", "value": "Bearer {{access_token}}" }
        ],
        "url": {
          "raw": "https://platform.hootsuite.com/v1/analytics?socialProfileIds={{social_profile_id}}&startDate={{start_date}}&endDate={{end_date}}",
          "protocol": "https",
          "host": ["platform", "hootsuite", "com"],
          "path": ["v1", "analytics"],
          "query": [
            { "key": "socialProfileIds", "value": "{{social_profile_id}}" },
            { "key": "startDate", "value": "{{start_date}}" },
            { "key": "endDate", "value": "{{end_date}}" }
          ]
        }
      }
    }
  ]
}
```

### Steps to Use:
1. **Import to Postman**:
   - Save the JSON as a file, e.g., `hootsuite_collection.json`.
   - Open Postman → Click **Import** → Select the JSON file.
   
2. **Set Up Environment Variables**:
   Create an environment in Postman with the following variables:
   - `client_id`: Your Hootsuite app's client ID.
   - `client_secret`: Your Hootsuite app's client secret.
   - `redirect_uri`: Your app's redirect URI.
   - `access_token`: The token retrieved from the **Authenticate** request.
   - `social_profile_id`: The ID of the social profile (retrieved from the **Get Social Profiles** request).
   - `link`: The URL you want to include in the campaign.
   - `start_date`: Start date for analytics (format: `YYYY-MM-DD`).
   - `end_date`: End date for analytics (format: `YYYY-MM-DD`).

3. **Run the Requests**:
   - Start with the **Authenticate with Hootsuite** request to get your `access_token`.
   - Use the **Get Social Profiles** request to retrieve the `social_profile_id`.
   - Run the **Create Campaign** request to schedule or post content.
   - Finally, use **Fetch Campaign Analytics** to pull back the results.

Let me know if you need further assistance!