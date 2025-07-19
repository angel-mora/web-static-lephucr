---
title: Update consents table.
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Update consents table.

## ✅ TODOs


## 📌 Summary
Is this going to work?

## 🧠 Full Chat


Is this going to work?
ActiveRecord::Base.transaction { "UPDATE consents SET body=REPLACE(body,'http://solutions.infotech.com/UnsubscribePage','srsupport@softwarereviews.com')WHERE body LIKE '%http://solutions.infotech.com/UnsubscribePage%';" }

The code you provided is an SQL statement wrapped in a Ruby on Rails ActiveRecord transaction block. The SQL statement updates a column in the "consents" table of the database by replacing all occurrences of the string "http://solutions.infotech.com/UnsubscribePage" with the string "srsupport@softwarereviews.com" in the "body" column of the table where the "body" column contains the string "http://solutions.infotech.com/UnsubscribePage".

Based on this code alone, I can tell you that it will work if the database connection is established, the "consents" table exists, and the "body" column exists in the table. If any of these conditions are not met, the code will raise an error.

However, please note that I am an AI language model and I do not have access to your specific environment or database, so I cannot guarantee that this code will work as intended in your particular case. It is recommended that you test this code in a development or staging environment before deploying it to a production environment.

Is that how to pass a sql statement to production?

It's possible to execute SQL statements in production through the Rails console, but it's not recommended to execute raw SQL queries directly in your Rails code, especially if the SQL statement includes user input or parameters, as this can lead to SQL injection vulnerabilities.

Instead, it's best practice to use ActiveRecord's built-in query interface or a higher-level ORM abstraction to interact with the database in a safer and more secure way.

For example, you can use ActiveRecord's `update_all` method to update all records that match a certain condition without loading them into memory. Here's an example:

```ruby
Consent.where("body LIKE ?", "%http://solutions.infotech.com/UnsubscribePage%").update_all("body = REPLACE(body, 'http://solutions.infotech.com/UnsubscribePage', 'srsupport@softwarereviews.com')")
```

This code will update all records in the `consents` table where the `body` column contains the string "http://solutions.infotech.com/UnsubscribePage" by replacing it with "srsupport@softwarereviews.com".

Using ActiveRecord's query interface like this is safer and more secure because it automatically escapes any user input or parameters to prevent SQL injection attacks.