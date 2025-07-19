---
title: Same user_id dispatchers.
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Same user_id dispatchers.

## ✅ TODOs


## 📌 Summary
how can I get records with the same user_id in the dispatchers table?

## 🧠 Full Chat


how can I get records with the same user_id in the dispatchers table?

To retrieve records with the same `user_id` in a `dispatchers` table, you would typically use a SQL query to select from the table where the `user_id` matches a specific value. If you want to find all records where there are multiple entries for the same `user_id`, you can use a GROUP BY clause combined with HAVING to filter for `user_id`s that appear more than once. Here's how you can do it:

```sql
SELECT user_id, COUNT(*)
FROM dispatchers
GROUP BY user_id
HAVING COUNT(*) > 1;
```

This query will return a list of `user_id`s from the `dispatchers` table that have more than one record, along with the count of how many times each `user_id` appears. If you want to retrieve the full records for those `user_id`s, you can use the result of this query as a subquery or join it with the original table, like so:

```sql
SELECT d.*
FROM dispatchers d
INNER JOIN (
    SELECT user_id
    FROM dispatchers
    GROUP BY user_id
    HAVING COUNT(*) > 1
) dup ON d.user_id = dup.user_id;
```

This query will return all columns from the `dispatchers` table for every `user_id` that appears more than once in the table. Make sure to replace `dispatchers` and `user_id` with the actual table name and column name if they are different in your database schema.

where company id = 98


If you want to filter the records to only get those with a `company_id` of 98, in addition to having the same `user_id` appear more than once in the `dispatchers` table, you can add this condition to your query. Here's how you could adjust the query to include this requirement:

```sql
SELECT d.*
FROM dispatchers d
INNER JOIN (
    SELECT user_id
    FROM dispatchers
    WHERE company_id = 98
    GROUP BY user_id
    HAVING COUNT(*) > 1
) dup ON d.user_id = dup.user_id
WHERE d.company_id = 98;
```

This query does the following:
- Filters the records in the `dispatchers` table to only include those where `company_id` is 98.
- Groups these filtered records by `user_id` and identifies those `user_id`s that have more than one record (using the `HAVING COUNT(*) > 1` clause).
- Joins the result back to the original `dispatchers` table to get all records for these `user_id`s, again only including records where `company_id` is 98.

This way, you'll get all the records from the `dispatchers` table where the same `user_id` appears more than once and the `company_id` is 98.