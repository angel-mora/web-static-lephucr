---
title: GraphQL LineItem Status Query
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Following this documentation, how can I make the GraphQL
  query for LineItem status?"
draft: false
---

# GraphQL LineItem Status Query

## 🧠 Full Chat

🙋 **You:**

Following this documentation, how can I make the GraphQL query for LineItem status?
https://www.printavo.com/docs/api/v2/operation/query/
https://www.printavo.com/docs/api/v2/enum/lineitemstatus

---

🤖 **Assistant:**

To query the status of a **LineItem** in Printavo's GraphQL API, you need to use the `lineItem` query and request the `status` field.

### Example Query:
```graphql
query {
  lineItem(id: "LINE_ITEM_ID") {
    id
    name
    status
  }
}
```

### Explanation:
- Replace `"LINE_ITEM_ID"` with the actual LineItem ID you are querying.
- The `status` field corresponds to the **LineItemStatus** enum, which includes possible values like `PENDING`, `IN_PROGRESS`, `COMPLETED`, etc. ([Reference](https://www.printavo.com/docs/api/v2/enum/lineitemstatus)).

Would you like help formatting the request for a specific tool (e.g., Postman, GraphiQL, or a Ruby client)?