---
title: Dynamic SQL excluding columns.
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Mysql select * except field1, field2, etc"
draft: false
---

# Dynamic SQL excluding columns.

## 🧠 Full Chat

🙋 **You:**

Mysql select * except field1, field2, etc
Is that possible?

---

🤖 **Assistant:**

In MySQL, there isn't a direct command or syntax to select all fields except for specifying ones (like `SELECT * EXCEPT(field1, field2)`). MySQL doesn't have this `EXCEPT` functionality in its `SELECT` statement syntax. When you want to select columns from a table but exclude one or more columns, you have to explicitly list the columns you want to include in your `SELECT` statement.

However, there are workarounds to achieve a similar effect:

1. **Manually Specify Columns:** The most straightforward way is to manually specify all the columns you want to select in your query, excluding the ones you don't want.

2. **Dynamic SQL with Information Schema:** If you have a table with many columns and you want to exclude just a few, you can use a dynamic SQL approach to automatically generate the list of columns to include. This involves querying the `INFORMATION_SCHEMA.COLUMNS` table to get the list of columns for your table and then constructing a SQL statement that includes all columns except the ones you want to exclude.

Here's an example of how you might do it for a table named `your_table` excluding `field1` and `field2`:

```sql
SET @cols = NULL;

SELECT GROUP_CONCAT(COLUMN_NAME)
INTO @cols
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'your_table'
  AND TABLE_SCHEMA = 'your_database_name' -- the name of your database
  AND COLUMN_NAME NOT IN ('field1', 'field2');

SET @query = CONCAT('SELECT ', @cols, ' FROM your_table');

PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
```

This code snippet dynamically constructs a `SELECT` statement that includes all columns except `field1` and `field2`. Note that you'll need to replace `'your_table'` and `'your_database_name'` with your actual table name and database name. Also, be aware that using dynamic SQL can be tricky and may introduce security risks (e.g., SQL injection) if not handled carefully, especially when incorporating user input.

For most cases, explicitly listing the columns you need is the safest and most straightforward approach.