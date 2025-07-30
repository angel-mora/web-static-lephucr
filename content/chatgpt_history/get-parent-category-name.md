---
title: Get Parent Category Name
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  I have a query like this:"
draft: false
---

# Get Parent Category Name

## 🧠 Full Chat

🙋 **You:**

I have a query like this:
SELECT
    c.parent_id, # I want to get the category name using this parent_id
	c.title,
	count(p.id)
FROM
	publications p
	JOIN categories_publications cp ON cp.publication_id = p.id
	JOIN categories c ON cp.category_id = c.id
WHERE
	c.site_id = 2
	AND p.site_id = 2
	and(p.retire_date IS NULL
		OR date(p.retire_date) > NOW())
	AND p.is_published_version = 1
	and p.publication_type_id = 18
GROUP BY
	c.id;
Please do what the comment asks for

---

🤖 **Assistant:**

To fulfill your request to retrieve the category name using `parent_id` from the `categories` table, you need to modify the query to include a join that fetches the category name associated with each `parent_id`. Assuming the structure of the `categories` table allows for self-referencing to identify parent categories (which is common in hierarchical data models), you can achieve this by adding another join to the `categories` table.

Here's how you can modify your query:

```sql
SELECT
    parent_category.name AS parent_category_name, -- Get the name of the parent category
    c.title,
    COUNT(p.id) AS publication_count
FROM
    publications p
JOIN categories_publications cp ON cp.publication_id = p.id
JOIN categories c ON cp.category_id = c.id
LEFT JOIN categories parent_category ON c.parent_id = parent_category.id -- Join to get parent category name
WHERE
    c.site_id = 2
    AND p.site_id = 2
    AND (p.retire_date IS NULL OR DATE(p.retire_date) > NOW())
    AND p.is_published_version = 1
    AND p.publication_type_id = 18
GROUP BY
    c.id, parent_category.name; -- Include parent_category.name in GROUP BY
```

In this query, the key addition is the `LEFT JOIN categories parent_category ON c.parent_id = parent_category.id` line, which joins the `categories` table to itself (aliased as `parent_category`) on `c.parent_id = parent_category.id`. This join allows you to fetch the name of the parent category. The selection list is also updated to include `parent_category.name AS parent_category_name`, which retrieves the name of the parent category for each row.

Note that I used `LEFT JOIN` instead of `JOIN` for fetching the parent category name. This is to ensure that the query still returns rows for categories that do not have a parent (i.e., top-level categories), where `parent_id` might be `NULL` or not match any row in the `categories` table. If every category in your database has a valid, non-null `parent_id` that refers to another row in the `categories` table, you could use a regular `JOIN` instead.