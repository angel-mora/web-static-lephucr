---
title: Elasticsearch Indices Query
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  elasticsearch rest query to match pattern in indices"
draft: false
---

# Elasticsearch Indices Query

## 🧠 Full Chat

🙋 **You:**

elasticsearch rest query to match pattern in indices

---

🤖 **Assistant:**

In Elasticsearch, you can use the `_cat/indices` endpoint along with a wildcard pattern to match indices based on a pattern. The `_cat/indices` endpoint provides a simple way to retrieve information about indices in a human-readable format.

Here's an example of a REST query to match indices based on a pattern:

```bash
curl -X GET "http://localhost:9200/_cat/indices/your_index_pattern*?v"
```

Replace `your_index_pattern*` with the actual pattern you want to match. The `v` parameter is optional and is used to display additional information in a tabular format.

Here's a breakdown of the query:

- `-X GET`: Specifies the HTTP method as GET.
- `"http://localhost:9200/_cat/indices/your_index_pattern*?v"`: The URL of the Elasticsearch cluster with the `_cat/indices` endpoint and the specified index pattern. Adjust the host and port accordingly.

If you are using authentication, you might need to include the appropriate credentials in your request. Additionally, make sure to replace the placeholder values with your actual Elasticsearch cluster information.

Note: The `_cat/indices` endpoint is a convenient way to get information about indices, but it's not suitable for more complex queries. For more advanced querying, you might want to use the `_search` endpoint with the Query DSL (Domain-Specific Language).