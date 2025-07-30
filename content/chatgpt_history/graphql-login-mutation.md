---
title: GraphQL Login Mutation
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  # Write your query or mutation here"
draft: false
---

# GraphQL Login Mutation

## 🧠 Full Chat

🙋 **You:**

# Write your query or mutation here
mutation ($email:String!, $password:String!) {
    login(email:$email, password:$password) { token }
}
 {
  "email": "angel.mora@inktavo.com",
  "token": "<USER_SESSION_TOKEN>",
  "client-type": "mobile",
  "client-token": "rCRZZvtSqfx752g7pyr4wqkfJfDhDyv0"
}
Plis make the graphql query from it

---

🤖 **Assistant:**

Here’s the properly formatted GraphQL mutation based on your input:

```graphql
mutation Login($email: String!, $password: String!) {
  login(email: $email, password: $password) {
    token
  }
}
```

And an example of the JSON variables you would pass along with the request:

```json
{
  "email": "angel.mora@inktavo.com",
  "password": "<USER_PASSWORD>"
}
```

Your additional fields (`token`, `client-type`, and `client-token`) are not typically part of the login mutation itself, but they might be headers or metadata that should be sent with the request instead of being inside the mutation payload. Let me know if you need further adjustments!

---

🙋 **You:**

tell me what is the actual mutation with actual params

---

🤖 **Assistant:**

Here’s the actual GraphQL mutation with the parameters you provided:  

```graphql
mutation {
  login(email: "angel.mora@inktavo.com", password: "<USER_PASSWORD>") {
    token
  }
}
```

Replace `<USER_PASSWORD>` with the actual password when making the request.  

If `token`, `client-type`, and `client-token` are required, they should likely be included as headers in your request, not within the mutation itself. Let me know if you need help with setting that up!