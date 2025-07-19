---
title: SQL Syntax Error Fix
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# SQL Syntax Error Fix

## ✅ TODOs


## 📌 Summary
select login, hr_membership_status from users where hr_membership_status is not null where hr_membership_status IN ('Advisory', 'Leadership');

## 🧠 Full Chat


select login, hr_membership_status from users where hr_membership_status is not null where hr_membership_status IN ('Advisory', 'Leadership');
Query 1 ERROR at Line 1: : You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where hr_membership_status IN ('Advisory', 'Leadership')' at line 1



It looks like there's an issue with your query syntax due to the use of two `WHERE` clauses. You should use a single `WHERE` clause and combine the conditions with the `AND` operator. Here's the corrected query:

```sql
SELECT login, hr_membership_status 
FROM users 
WHERE hr_membership_status IS NOT NULL 
AND hr_membership_status IN ('Advisory', 'Leadership');
```

This will return the results you're expecting without causing a syntax error.