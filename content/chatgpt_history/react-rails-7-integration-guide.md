---
title: React-Rails 7 Integration Guide
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  What is the best way to connect react and rails 7 in
  a web application?"
draft: false
---

# React-Rails 7 Integration Guide

## 🧠 Full Chat

🙋 **You:**

What is the best way to connect react and rails 7 in a web application?

---

🤖 **Assistant:**

Connecting React with Rails 7 in a web application is a common practice for creating a powerful full-stack application. Here's a streamlined approach to achieve this:

1. **Setup Rails API Backend:**
   - Create a new Rails 7 application using the API flag: `rails new myapp --api`. This sets up your Rails application to work as an API, which is ideal for React integration.
   - Configure your database and create models as per your application's requirements.
   - Set up controllers to handle requests and responses in JSON format.

2. **Enable Cross-Origin Resource Sharing (CORS):**
   - Install the `rack-cors` gem in your Rails app. This is necessary for handling Cross-Origin Resource Sharing (CORS), allowing your React frontend to communicate with the Rails API.
   - Configure CORS settings in `config/initializers/cors.rb` to define which domains can access your API.

3. **Create React Frontend:**
   - Use Create React App (`npx create-react-app my-react-app`) to set up the React frontend.
   - Organize your React components and manage state as needed (using React Context, Redux, or another state management library).

4. **API Communication:**
   - Use `fetch` or `axios` in your React components to make HTTP requests to the Rails API endpoints.
   - Handle JSON responses in React to display or manipulate data in your UI.

5. **Environment Setup:**
   - Ensure that Rails runs on a different port than React during development (Rails typically runs on port 3000, so you might run React on port 3001).
   - Configure environment variables to manage the API URLs between development and production environments.

6. **Deployment:**
   - For deployment, you can choose to deploy the frontend and backend separately (e.g., React on Netlify or Vercel, Rails API on Heroku) or together.
   - If deploying together, you can build your React app and serve it through Rails, or use a reverse proxy setup.

7. **Testing and Continuous Integration:**
   - Write tests for both Rails and React. Rails provides RSpec for backend testing, while React has Jest and React Testing Library.
   - Consider setting up Continuous Integration/Continuous Deployment (CI/CD) for automated testing and deployment.

8. **Optimizations and Best Practices:**
   - Optimize your API responses (e.g., using Active Model Serializers).
   - Ensure proper error handling and validation in both Rails and React.
   - Follow best practices for security, such as handling user authentication and authorization securely (JWT, OAuth, etc.).

This approach leverages the strengths of both Rails and React, with Rails serving as a robust API backend and React providing a dynamic frontend user experience. Remember, the exact setup can vary based on specific project requirements and preferences.

---

🙋 **You:**

I'm also using devise. Is api better than react within rails?

---

🤖 **Assistant:**

When using Devise with Rails and React, you have two primary architecture choices: either integrating React within your Rails application or setting up Rails as a separate API backend with React as an independent frontend. Each approach has its pros and cons:

### Integrating React within Rails (with Devise):
- **Pros:**
  - **Simpler Deployment:** Your entire application (frontend and backend) is contained within one codebase, which simplifies deployment and hosting.
  - **Direct Access to Rails Helpers and Libraries:** You can easily access Rails features, helpers, and libraries like Devise for authentication.
  - **Seamless Integration:** Integrating React directly into Rails views can lead to a more seamless blend of traditional Rails views and React components.

- **Cons:**
  - **Tighter Coupling:** React and Rails are more tightly coupled, which can make it harder to separate concerns and maintain the codebase as it grows.
  - **Limited Scalability:** It might be less scalable in terms of separating frontend and backend development, especially in large teams where responsibilities are divided.

### Rails API with Separate React Frontend:
- **Pros:**
  - **Clean Separation of Concerns:** Having a separate frontend and backend allows for a more modular architecture. It's easier to manage and scale, especially for larger applications.
  - **Flexibility in Frontend Technologies:** You can easily swap out React for another frontend framework if needed, without major backend changes.
  - **API Reusability:** The Rails API can be consumed by other clients (mobile apps, other web apps) as well.

- **Cons:**
  - **Complexity in Authentication:** Managing authentication (like with Devise) between a separate API and frontend can be more complex. You might need to use token-based authentication (JWT) instead of traditional session-based authentication.
  - **Cross-Origin Resource Sharing (CORS):** You need to properly configure CORS to allow communication between your separate frontend and backend.
  - **Two Codebases to Maintain:** You have two separate codebases to maintain, test, and deploy.

### Decision Factors:
- **Project Size and Team Structure:** If you have a larger team or anticipate scaling your application significantly, a separate API and frontend might be more manageable.
- **Future Flexibility:** If you think you might want to change your frontend technology in the future or extend your application to other platforms (like mobile), a separate API is advantageous.
- **Authentication Requirements:** Traditional session-based authentication is simpler to implement within a monolithic Rails app, but a token-based approach (required for a separate API) can offer more flexibility and security.

In summary, if you're comfortable managing the complexity of a separate frontend and backend and foresee a need for scalability and flexibility, using Rails as an API with a separate React frontend is often the better choice. However, if your project is smaller or you value simplicity in deployment and maintenance, integrating React within Rails might be more suitable.

---

🙋 **You:**

Tutorial for rails 7 with react in monolith

---

🤖 **Assistant:**

Creating a monolithic Rails 7 application with React involves integrating React components directly into your Rails views. Here's a step-by-step guide to set up a basic application:

### Prerequisites
- Basic knowledge of Ruby, Rails, and React.
- Ruby and Node.js installed on your system.
- Rails 7 installed (`gem install rails`).

### Step 1: Create a New Rails Application
```bash
rails new myapp --webpack=react
cd myapp
```
This command creates a new Rails application with Webpack and React pre-configured.

### Step 2: Install Dependencies
Ensure you have all necessary gems and npm packages:

```bash
bundle install
yarn install
```

### Step 3: Create a React Component
Create a new React component. For example, create a file named `HelloReact.jsx` in `app/javascript/components`:

```jsx
// app/javascript/components/HelloReact.jsx
import React from "react";

const HelloReact = () => {
  return <h1>Hello from React!</h1>;
};

export default HelloReact;
```

### Step 4: Integrate React Component into Rails View
In your Rails view, use the `react_component` helper to render the React component. First, ensure you have imported the component in `application.js`:

```javascript
// app/javascript/packs/application.js
import React from "react";
import ReactDOM from "react-dom";
import HelloReact from "../components/HelloReact";

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(
    <HelloReact />,
    document.body.appendChild(document.createElement("div")),
  );
});
```

Then, in your Rails view (e.g., `app/views/home/index.html.erb`), you can directly include the React component:

```erb
<%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
```

### Step 5: Start the Rails Server
Run your Rails server:

```bash
rails s
```

Visit `http://localhost:3000` in your browser, and you should see the message from your React component.

### Step 6: More Complex Integration (Optional)
As your application grows, you might want to:
- Create more complex React components and manage state using hooks or Redux.
- Set up routes in React for client-side navigation.
- Handle API calls from React to Rails controllers, if you need dynamic data.

### Step 7: Testing and Deployment
- Write tests for both your Rails application and React components.
- Deploy your application using services like Heroku, ensuring that both Ruby and Node.js environments are properly set up.

### Additional Tips:
- Keep your React components modular and manageable.
- Use React Router for complex client-side routing if needed.
- Regularly update dependencies for security and performance improvements.

This tutorial gives you a basic setup. Depending on your application's complexity, you might need to add additional configurations and optimizations.

---

🙋 **You:**

Continue the tutorial adding devise so the react client can login

---

🤖 **Assistant:**

Continuing the tutorial, let's integrate Devise for user authentication in your Rails application with React components. This will allow your React client to perform login operations.

### Step 1: Add Devise to Your Rails Application
First, add Devise to your Rails application for handling user authentication.

1. **Add Devise Gem:**
   - Add `gem 'devise'` to your Gemfile.
   - Run `bundle install`.

2. **Install and Configure Devise:**
   - Run `rails generate devise:install`.
   - Follow the instructions printed in the console (e.g., setting up default URL options in the development environment, creating a root route, setting up the action mailer).

3. **Generate User Model:**
   - Run `rails generate devise User`.
   - Run `rails db:migrate` to apply the migration.

### Step 2: Set Up Devise Views
Devise comes with default views for authentication, but you'll likely want to customize these.

1. **Generate Devise Views:**
   - Run `rails generate devise:views`.

2. **Customize Views:**
   - Customize the login and registration views located in `app/views/devise/sessions/new.html.erb` and `app/views/devise/registrations/new.html.erb`.

### Step 3: Create API Endpoints for Authentication
Since React will be handling the front end, you need to expose API endpoints for signup, login, and logout.

1. **Create a Sessions Controller:**
   - Generate a custom controller: `rails generate controller Api::V1::Sessions`.
   - In `app/controllers/api/v1/sessions_controller.rb`, override Devise methods to handle JSON requests.

2. **Implement Sign In and Sign Out:**
   - In `sessions_controller.rb`, implement `create` for sign-in and `destroy` for sign-out, responding with JSON.

### Step 4: Handling CSRF Protection
Rails uses CSRF tokens for security, which you need to handle in your API responses and React requests.

1. **Update ApplicationController:**
   - In `app/controllers/application_controller.rb`, add a method to set the CSRF token and include it in the API responses.

### Step 5: Integrate Authentication in React
Now, let's integrate these functionalities in the React front end.

1. **Create Login and Logout Components:**
   - In `app/javascript/components`, create components for Login and Logout.
   - Use `fetch` or `axios` to make POST requests to your Rails backend for login/logout.

2. **Manage User State:**
   - Use React Context or a state management library to manage user authentication states (logged in/logged out).

### Step 6: Handle Routes in React
If you're using React Router, protect certain routes based on the authentication state.

1. **Protected Routes:**
   - Create higher-order components or utilize React Router’s features to protect routes that require authentication.

### Step 7: Testing and Debugging
- Test your API endpoints separately using tools like Postman.
- Write integration tests for both Rails and React to ensure the login/logout flow works as expected.

### Additional Considerations:
- **Error Handling:** Implement proper error handling for login/logout requests.
- **Security:** Ensure that your authentication flow is secure. Consider implementing token-based authentication if needed.
- **User Experience:** Smoothly handle authentication states in the UI to provide feedback to the user.

This setup provides a basic framework for integrating Devise authentication in a Rails application with a React frontend. Depending on your specific requirements, you might need to add more complex functionalities such as password recovery, email confirmations, or two-factor authentication.

---

🙋 **You:**

Continue tutorial to use redux toolkit

---

🤖 **Assistant:**

Continuing the tutorial, we'll integrate Redux Toolkit into your Rails 7 with React and Devise setup. Redux Toolkit simplifies state management in React applications and is particularly useful in larger applications or those with complex state logic.

### Step 1: Install Redux Toolkit and React-Redux
Add Redux Toolkit and React-Redux to your project:

```bash
yarn add @reduxjs/toolkit react-redux
```

### Step 2: Set Up the Redux Store
Create a Redux store to hold the state of your application.

1. **Create Store:**
   - In `app/javascript`, create a new folder named `store`.
   - Inside `store`, create a file `index.js`.
   - Set up the Redux store using the `configureStore` function from Redux Toolkit.

   ```javascript
   // app/javascript/store/index.js
   import { configureStore } from '@reduxjs/toolkit';

   export const store = configureStore({
     reducer: {
       // Add reducers here
     },
   });
   ```

### Step 3: Create a Slice for Authentication
Redux Toolkit uses the concept of 'slices' to manage a piece of the Redux state.

1. **Create an Auth Slice:**
   - Inside `store`, create a file for your authentication slice (e.g., `authSlice.js`).
   - Define the initial state, reducers, and actions for authentication.

   ```javascript
   // app/javascript/store/authSlice.js
   import { createSlice } from '@reduxjs/toolkit';

   const initialState = {
     user: null,
     isLoggedIn: false,
   };

   const authSlice = createSlice({
     name: 'auth',
     initialState,
     reducers: {
       // Define reducers and actions like login, logout
     },
   });

   export const { login, logout } = authSlice.actions;
   export default authSlice.reducer;
   ```

### Step 4: Provide the Store to React
Use the `Provider` component from `react-redux` to provide the Redux store to your React application.

1. **Wrap Your Application in Provider:**
   - In your main JavaScript file (e.g., `application.js`), use the `Provider` to make the Redux store available to all components.

   ```javascript
   // app/javascript/packs/application.js
   import React from 'react';
   import ReactDOM from 'react-dom';
   import { Provider } from 'react-redux';
   import { store } from '../store';
   import App from '../components/App';

   document.addEventListener('DOMContentLoaded', () => {
     ReactDOM.render(
       <Provider store={store}>
         <App />
       </Provider>,
       document.body.appendChild(document.createElement('div')),
     );
   });
   ```

### Step 5: Connect React Components to Redux
Use the `useSelector` and `useDispatch` hooks from `react-redux` to interact with the Redux store in your React components.

1. **Use Redux in Components:**
   - In your React components, use `useSelector` to access the Redux state and `useDispatch` to dispatch actions.

   ```javascript
   // Example in a React component
   import React from 'react';
   import { useSelector, useDispatch } from 'react-redux';
   import { login, logout } from '../store/authSlice';

   const MyComponent = () => {
     const dispatch = useDispatch();
     const isLoggedIn = useSelector(state => state.auth.isLoggedIn);

     const handleLogin = () => {
       // Dispatch login action
       dispatch(login(/* user data */));
     };

     // Render your component
   };
   ```

### Step 6: Handling Authentication State
Use the authentication slice to manage user login/logout state.

1. **Update Auth Slice on Login/Logout:**
   - When the user logs in or out, dispatch the corresponding actions to update the Redux state.

### Step 7: Testing
- Ensure you thoroughly test your Redux state management, especially the authentication flows.

### Additional Tips:
- **Modularity:** Keep your Redux logic modular and maintainable. Large applications can benefit from structuring the Redux store into multiple slices.
- **Asynchronous Actions:** For handling asynchronous logic, such as API requests, consider using Redux Toolkit's `createAsyncThunk`.
- **Developer Tools:** Utilize Redux DevTools for debugging and inspecting your Redux state changes.

Integrating Redux Toolkit into your Rails + React + Devise setup will help manage application state more effectively, especially as your application grows in complexity. Remember to keep your Redux logic as clean and modular as possible for maintainability.