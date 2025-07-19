---
title: Integrate React Native with Hotwire
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Integrate React Native with Hotwire

## ✅ TODOs


## 📌 Summary
React Native and Rails 7 monolith with Hotwire. How can both live together?

## 🧠 Full Chat


React Native and Rails 7 monolith with Hotwire. How can both live together?

Sure, integrating React Native with a Rails 7 monolith application that's using Hotwire can be an interesting and potentially beneficial architectural choice. Here's a general outline of how you can go about doing this:

### 1. **Rails Backend Setup with Hotwire:**
First, ensure that your Rails 7 application is set up with Hotwire. Hotwire is designed to make building modern web applications without much JavaScript by sending HTML instead of JSON over the wire. It's a combination of TurboDrive, TurboFrames, TurboStreams, and Stimulus. 

If you haven't already set it up, you can do so with:

```bash
rails hotwire:install
```

### 2. **React Native Frontend:**
Now, let's move to the React Native side. React Native is a mobile application framework, so you'd likely be using this for building a mobile client that interacts with your Rails backend.

### 3. **API Integration:**
You'll want to design a robust API on the Rails side to communicate with your React Native application. Consider using something like `ActiveModel::Serializers` or `Jbuilder` to create clean JSON responses that your React Native application can consume.

For authentication, you might use tokens (e.g., JWT) to manage authenticated requests between the React Native application and Rails server.

### 4. **Web Views with Hotwire (Optional):**
If you want to take advantage of Hotwire within the mobile application, you could consider using web views within React Native for specific portions of the app. This way, you can render HTML directly from your Rails application inside the mobile app, and Turbo can handle the navigation just like it would on a web browser.

### 5. **Real-time Communication:**
If you need real-time updates in the React Native application, you may want to set up Action Cable or another WebSocket solution to push updates directly to the mobile client.

### 6. **Consistent Design and UX:**
You'll need to ensure a consistent design and user experience between the Hotwire-driven web views and the native parts of your React Native application.

### 7. **Testing and Optimization:**
Make sure to thoroughly test the integration to ensure everything works smoothly, particularly around the hand-off between native React Native components and any web views you're using.

### Conclusion:
While this integration might not be typical, it can be achieved by clearly separating concerns and ensuring that the mobile client (React Native) communicates effectively with the backend (Rails 7 with Hotwire). The critical aspect is designing the right API endpoints and considering whether and how to incorporate Hotwire-driven web views within the React Native application.

Keep in mind that this approach requires careful planning and consideration of the user experience. Balancing the power of Hotwire for web-based views with the native capabilities of React Native may be challenging but could provide a compelling user experience when done thoughtfully.