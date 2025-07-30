---
title: Migration Code Review
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Is this the best way I can do this migration? Perform
  a Senior Code review:"
draft: false
---

# Migration Code Review

## 🧠 Full Chat

🙋 **You:**

Is this the best way I can do this migration? Perform a Senior Code review:
class RemoveTwilioFieldsFromAccounts < ActiveRecord::Migration[6.1]
  def change
    remove_column :accounts, :twilio_api_sid
    remove_column :accounts, :twilio_api_token
    remove_column :accounts, :twilio_api_phone
  end
end

---

🤖 **Assistant:**

Your migration is simple and mostly correct, but there are some considerations you might want to account for. Here's a detailed review with suggestions:

### Code Review:

1. **Null Safety and Downtime Concerns**:
   - If you are removing columns from a production database, you should be cautious about removing columns immediately, as it can result in downtime or data loss if this migration is run in an environment where the fields are still in use. It's best practice to **deprecate** the columns first (i.e., stop reading from and writing to them) before physically removing them in a later migration.

   - **Solution**: You might want to first migrate the data if needed, ensure your codebase no longer references these columns, and then remove them. If this is already done, proceed with removal.

2. **Irreversible Migration**:
   - While this migration is straightforward, removing columns is an irreversible action. Rails allows marking a migration as **reversible**, but in this case, since you are removing columns, you won’t be able to "reverse" it easily.

   - **Suggestion**: For safety, you can wrap the column removal in a `reversible` block. You don't have to, but this gives you a clear understanding of the non-reversibility of the migration.

### Improved Migration

Here's a slightly more cautious approach with the reversible block, even though the irreversible nature is understood:

```ruby
class RemoveTwilioFieldsFromAccounts < ActiveRecord::Migration[6.1]
  def change
    # Remove columns in a reversible manner for clarity
    reversible do |dir|
      dir.up do
        remove_column :accounts, :twilio_api_sid, :string
        remove_column :accounts, :twilio_api_token, :string
        remove_column :accounts, :twilio_api_phone, :string
      end

      # You can keep the down method empty or define how you'd want to revert the migration
      dir.down do
        add_column :accounts, :twilio_api_sid, :string
        add_column :accounts, :twilio_api_token, :string
        add_column :accounts, :twilio_api_phone, :string
      end
    end
  end
end
```

### Explanation of Improvements:

1. **Reversible Block**:
   - It explicitly handles both directions of the migration (`up` and `down`). This is useful in case you want to roll back the migration at some point and re-add the columns, though you probably won’t be inserting data into them again.

2. **Specifying Column Types**:
   - Although `remove_column` works without specifying column types, it's good practice to include the type (`:string`) to make the migration more explicit, especially when you want to make sure it aligns with the schema at the time of removal.

3. **Avoiding Data Loss**:
   - Before removing columns, ensure no data is required from these fields. If you need to retain data, consider backing it up or migrating it elsewhere first.

This cautious approach can help prevent issues during deployment and provides a clear structure for future maintenance.

Would you like advice on how to roll this out in production safely or with any additional strategies?

---

🙋 **You:**

Can I remove all the columns in a single line?

---

🤖 **Assistant:**

Yes, you can remove multiple columns in a single line using the `remove_columns` method, which allows you to remove multiple columns from the same table in a more concise manner. Here's how you can do it:

### Optimized Migration with Single-Line Column Removal

```ruby
class RemoveTwilioFieldsFromAccounts < ActiveRecord::Migration[6.1]
  def change
    remove_columns :accounts, :twilio_api_sid, :twilio_api_token, :twilio_api_phone
  end
end
```

### Key Notes:

- **Efficiency**: This is perfectly valid and efficient. The `remove_columns` method removes all specified columns in one go, simplifying the code.
  
- **Irreversible**: Like in the original approach, removing columns is still irreversible, so the same caution applies.

This one-liner is cleaner and makes the intent clear without compromising on functionality. If you're confident that these fields are no longer in use, this version will work just fine!

Let me know if you'd like further clarifications or production rollout strategies!

---

🙋 **You:**

Did this to comply with safe_migrations concern.
1) Explain the need for safe_migrations gem
2) Review the following migration and tell me why it's wrong:
class RemoveTwilioFieldsFromAccounts < ActiveRecord::Migration[6.1]
  def change
    safety_assured do
      remove_columns :accounts, :twilio_api_sid, :twilio_api_token, :twilio_api_phone
    end
  end
end

---

🤖 **Assistant:**

User is using the `safe_migrations` gem for database migration concerns.

---

**Tool:**

Model set context updated.

---

🤖 **Assistant:**

### 1) **Need for the `safe_migrations` Gem**

---

🙋 **You:**

Did this to comply with safe_migrations concern.
1) Explain the need for safe_migrations gem
2) Review the following migration and tell me why it's wrong:
class RemoveTwilioFieldsFromAccounts < ActiveRecord::Migration[6.1]
  def change
    safety_assured do
      remove_columns :accounts, :twilio_api_sid, :twilio_api_token, :twilio_api_phone
    end
  end
end

== 20241013181604 RemoveTwilioFieldsFromAccounts: migrating ===================
-- remove_columns(:accounts, :twilio_api_sid, :twilio_api_token, :twilio_api_phone)
rails aborted!
StandardError: An error has occurred, this and all later migrations canceled: (StandardError)

PG::UndefinedColumn: ERROR:  column "twilio_api_phone" of relation "accounts" does not exist
/app/db/migrate/20241013181604_remove_twilio_fields_from_accounts.rb:4:in `block in change'
/app/db/migrate/20241013181604_remove_twilio_fields_from_accounts.rb:3:in `change'

Caused by:
ActiveRecord::StatementInvalid: PG::UndefinedColumn: ERROR:  column "twilio_api_phone" of relation "accounts" does not exist (ActiveRecord::StatementInvalid)
/app/db/migrate/20241013181604_remove_twilio_fields_from_accounts.rb:4:in `block in change'
/app/db/migrate/20241013181604_remove_twilio_fields_from_accounts.rb:3:in `change'

Caused by:
PG::UndefinedColumn: ERROR:  column "twilio_api_phone" of relation "accounts" does not exist (PG::UndefinedColumn)
/app/db/migrate/20241013181604_remove_twilio_fields_from_accounts.rb:4:in `block in change'
/app/db/migrate/20241013181604_remove_twilio_fields_from_accounts.rb:3:in `change'
Tasks: TOP => db:migrate

---

🤖 **Assistant:**

User is using the `safe_migrations` gem for database migration concerns.

---

**Tool:**

Model set context updated.

---

🤖 **Assistant:**

### 1. **The Need for the `safe_migrations` Gem**

The `safe_migrations` gem helps ensure database migrations are performed in a way that minimizes risks such as downtime, locking large tables, or creating inconsistencies in production environments. It enforces best practices for:

- **Long-running queries**: It warns you if a migration could cause excessive table locking (e.g., adding a column with a default value that causes a table scan).
- **Preventing database locks**: Especially with large datasets, migrations can lock tables and affect availability. `safe_migrations` helps you avoid such issues.
- **Ensuring safety**: It encourages use of non-blocking, non-destructive migrations (e.g., adding new columns as `NULL` first, or removing columns in stages).
- **Reminding developers**: It provides prompts to think critically about migrations and avoid risky operations in production, like removing a column that might still be in use.

In your case, using `safety_assured` is a signal to the gem that you're confident the migration is safe and should proceed despite typical concerns.

### 2. **Review of the Migration and the Problem**

#### Migration Code:

```ruby
class RemoveTwilioFieldsFromAccounts < ActiveRecord::Migration[6.1]
  def change
    safety_assured do
      remove_columns :accounts, :twilio_api_sid, :twilio_api_token, :twilio_api_phone
    end
  end
end
```

#### The Problem:

- **Error Message**: `PG::UndefinedColumn: ERROR: column "twilio_api_phone" of relation "accounts" does not exist`

The error indicates that the column `twilio_api_phone` does **not** exist in the `accounts` table when the migration is executed. This could happen for several reasons:

1. **The column was already removed** in a previous migration or manually.
2. **The column never existed**, possibly due to a typo in earlier migrations or schema setup.

#### Why the Migration is Incorrect:

- **Non-existent Column**: If a column doesn't exist, attempting to remove it will throw the error you're seeing. The migration assumes all three columns (`twilio_api_sid`, `twilio_api_token`, and `twilio_api_phone`) exist, but at least one (`twilio_api_phone`) does not.

#### How to Fix It:

You can ensure that the migration doesn't fail if a column doesn't exist by checking for the existence of the column before attempting to remove it. This avoids errors in cases where the column has already been removed or doesn't exist.

### Fixed Migration with Checks:

```ruby
class RemoveTwilioFieldsFromAccounts < ActiveRecord::Migration[6.1]
  def change
    safety_assured do
      remove_column :accounts, :twilio_api_sid if column_exists?(:accounts, :twilio_api_sid)
      remove_column :accounts, :twilio_api_token if column_exists?(:accounts, :twilio_api_token)
      remove_column :accounts, :twilio_api_phone if column_exists?(:accounts, :twilio_api_phone)
    end
  end
end
```

### Key Improvements:

1. **`column_exists?`**: This method ensures the migration won’t fail if the column has already been removed or never existed.
2. **`safety_assured`**: Since you know the columns should be removed and you've verified their existence, the `safety_assured` block is justified.

This approach will prevent errors and ensure a smooth migration. Let me know if you need any further adjustments!