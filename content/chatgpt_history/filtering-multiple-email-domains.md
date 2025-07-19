---
title: Filtering Multiple Email Domains
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Filtering Multiple Email Domains

## ✅ TODOs


## 📌 Summary
I want to filter a bunch of emails in mysql. I now for one I can do users.email NOT LIKE "%@domain.com". How would I do it for NOT LIKE ("%@domain.com","%@domain2.com")?

## 🧠 Full Chat


I want to filter a bunch of emails in mysql. I now for one I can do users.email NOT LIKE "%@domain.com". How would I do it for NOT LIKE ("%@domain.com","%@domain2.com")?

In MySQL, you can't use the `NOT LIKE` operator with multiple patterns directly in the way you've shown. Instead, you'll need to use multiple `NOT LIKE` conditions combined with the `AND` operator.

If you want to filter out emails from multiple domains, you can do it like this:

```sql
SELECT * 
FROM users 
WHERE email NOT LIKE "%@domain.com" 
AND email NOT LIKE "%@domain2.com";
```

If you have a lot of domains to exclude, you can extend the `WHERE` clause with additional `AND email NOT LIKE "%@anotherdomain.com"` conditions as needed.

can't I use NOT IN ?

Yes, you can use `NOT IN` for exact matches, but not for pattern matching with wildcards like `%`.

For example, if you have a list of exact email addresses you want to exclude, you can do:

```sql
SELECT * 
FROM users 
WHERE email NOT IN ('example@domain.com', 'test@domain2.com');
```

However, if you want to exclude all emails from certain domains (i.e., using the `%` wildcard), you have to use `NOT LIKE` as shown in the previous answer.

If you're trying to exclude emails based on domain patterns, you'll need to stick with multiple `NOT LIKE` conditions.