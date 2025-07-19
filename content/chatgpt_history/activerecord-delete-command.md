---
title: ActiveRecord Delete Command
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# ActiveRecord Delete Command

## ✅ TODOs


## 📌 Summary
activerecord command to delete in sql, my initial attempt was

## 🧠 Full Chat


activerecord command to delete in sql, my initial attempt was 
FriendlyIdSlug.where(id:[70408,70409,70645]).each(&:destroy)



Your code will trigger a callback for each record and delete them individually. If you want to delete the records directly in the database with a single SQL command (bypassing callbacks), you can use `delete_all`:

```ruby
FriendlyIdSlug.where(id: [70408, 70409, 70645]).delete_all
```

### Key Differences:
1. **`each(&:destroy)`**:
   - Deletes each record individually.
   - Runs any `before_destroy` and `after_destroy` callbacks.
   - Useful if you need the callbacks for additional logic.

2. **`delete_all`**:
   - Deletes records directly in the database in a single query.
   - Does not run any callbacks.
   - Faster and more efficient for large batches.

### SQL Generated:
For your query, `delete_all` will generate something like:
```sql
DELETE FROM friendly_id_slugs WHERE id IN (70408, 70409, 70645);
```

Choose the method that fits your requirements! If you need to preserve logic in callbacks, stick to `destroy`. If not, `delete_all` is the way to go.

i want to execute it over an active record connecgtion

If you want to execute a raw SQL query over an ActiveRecord connection, you can use `ActiveRecord::Base.connection.execute`. Here's how you can do it:

```ruby
sql = "DELETE FROM friendly_id_slugs WHERE id IN (70408, 70409, 70645);"
ActiveRecord::Base.connection.execute(sql)
```

### Explanation:
1. **SQL Command**:
   - The `DELETE` statement removes rows directly from the database.
   - Specify the `table_name` (`friendly_id_slugs`) and the condition (`id IN (...)`).

2. **`ActiveRecord::Base.connection.execute`**:
   - Executes the SQL query on the database.
   - Skips all ActiveRecord callbacks and validations.

### Benefits:
- This approach is highly efficient for large datasets or when you want fine-grained control over your SQL queries.

### Considerations:
- Ensure the query is correct and safe to avoid unintended data loss.
- If you're using table names with special characters or that differ across environments, use `FriendlyIdSlug.table_name` to dynamically resolve the table name:
  ```ruby
  sql = "DELETE FROM #{FriendlyIdSlug.table_name} WHERE id IN (70408, 70409, 70645);"
  ActiveRecord::Base.connection.execute(sql)
  ``` 

This approach is best for cases where you don't need callbacks or ActiveRecord's lifecycle hooks.