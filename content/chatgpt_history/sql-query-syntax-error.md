---
title: SQL Query Syntax Error.
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# SQL Query Syntax Error.

## ✅ TODOs


## 📌 Summary
SELECT

## 🧠 Full Chat


SELECT
	users.first_name,
	users.last_name,
	users.email,
	users.phone,
	reviews.title,
	-- reviews.city
	-- reviews state
	users.location_country_code,
	users.okay_to_contact,
	users.software_reviews_contact_agreed,
	users.uuid,
	users.reviews_count,
	-- review_stats full_completed_review_count
	-- review_stats short_or_partial_review_count
	-- review_stats approved_full_completed_review_count
	-- review_stats approved_short_or_partial_review_count
	-- review_stats approved_review_count
	users.company,
	users.company_size,
	users.industry,
	reviews.uuid,
	reviews.approval_status,
	reviews.submitted_at,
	reviews.respondent_role,
	approved_reviews.exemplary,
	categories.name,
	reviews.reward_amount offerings.name
FROM
	review_stats
	JOIN reviews ON reviews_stats.review_id = reviews.id,
	JOIN users ON users.id = review_stats.user_id,
	JOIN approved_reviews ON approved_reviews.review_id = review_stats.review_id,
	JOIN categories ON categories.id = review_stats.category_id,
	JOIN offerings ON offerings.id = review_stats.offering_id
WHERE
	review_stats.approval_status = 1
	AND review_stats.short = 1;

Query 1 ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '.name
FROM
	review_stats
	JOIN reviews ON reviews_stats.review_id = reviews.id,
' at line 28

There seems to be a syntax error in the SQL query. The error message suggests that the error is located near the end of the query. 

The error is caused by a comma after the JOIN statement in line 20, which should be removed. Additionally, there are two missing JOIN statements, one after the first JOIN statement in line 9 and another one after the second JOIN statement in line 14. 

Here is the corrected SQL query:

```
SELECT
	users.first_name,
	users.last_name,
	users.email,
	users.phone,
	reviews.title,
	users.location_country_code,
	users.okay_to_contact,
	users.software_reviews_contact_agreed,
	users.uuid,
	users.reviews_count,
	users.company,
	users.company_size,
	users.industry,
	reviews.uuid,
	reviews.approval_status,
	reviews.submitted_at,
	reviews.respondent_role,
	approved_reviews.exemplary,
	categories.name,
	offerings.name AS offering_name
FROM
	review_stats
	JOIN reviews ON review_stats.review_id = reviews.id
	JOIN users ON users.id = review_stats.user_id
	JOIN approved_reviews ON approved_reviews.review_id = review_stats.review_id
	JOIN categories ON categories.id = review_stats.category_id
	JOIN offerings ON offerings.id = review_stats.offering_id
WHERE
	review_stats.approval_status = 1
	AND review_stats.short = 1;
```

I removed the commented-out lines to simplify the query, but you can uncomment them if they are needed for your analysis.

Same but with the commented out lines

Here's the same query with the commented-out lines included:

```
SELECT
	users.first_name,
	users.last_name,
	users.email,
	users.phone,
	reviews.title,
	reviews.city,
	reviews.state,
	users.location_country_code,
	users.okay_to_contact,
	users.software_reviews_contact_agreed,
	users.uuid,
	users.reviews_count,
	review_stats.full_completed_review_count,
	review_stats.short_or_partial_review_count,
	review_stats.approved_full_completed_review_count,
	review_stats.approved_short_or_partial_review_count,
	review_stats.approved_review_count,
	users.company,
	users.company_size,
	users.industry,
	reviews.uuid,
	reviews.approval_status,
	reviews.submitted_at,
	reviews.respondent_role,
	approved_reviews.exemplary,
	categories.name,
	reviews.reward_amount,
	offerings.name AS offering_name
FROM
	review_stats
	JOIN reviews ON review_stats.review_id = reviews.id
	JOIN users ON users.id = review_stats.user_id
	JOIN approved_reviews ON approved_reviews.review_id = review_stats.review_id
	JOIN categories ON categories.id = review_stats.category_id
	JOIN offerings ON offerings.id = review_stats.offering_id
WHERE
	review_stats.approval_status = 1
	AND review_stats.short = 1;
```

Note that I had to remove

Same but with the commented lines

Sure, here's the SQL query with the commented lines included:

```
SELECT
	users.first_name,
	users.last_name,
	users.email,
	users.phone,
	reviews.title,
	reviews.city,
	reviews.state,
	users.location_country_code,
	users.okay_to_contact,
	users.software_reviews_contact_agreed,
	users.uuid,
	users.reviews_count,
	review_stats.full_completed_review_count,
	review_stats.short_or_partial_review_count,
	review_stats.approved_full_completed_review_count,
	review_stats.approved_short_or_partial_review

Same but with the commented lines showing up as they are, commented

Here's the modified query with the commented-out lines included:

```
SELECT
	users.first_name,
	users.last_name,
	users.email,
	users.phone,
	reviews.title,
	-- reviews.city
	-- reviews state
	users.location_country_code,
	users.okay_to_contact,
	users.software_reviews_contact_agreed,
	users.uuid,
	users.reviews_count,
	-- review_stats.full_completed_review_count
	-- review_stats.short_or_partial_review_count
	-- review_stats.approved_full_completed_review_count
	-- review_stats.approved_short_or_partial_review_count
	-- review_stats.approved_review_count
	users.company,
	users.company_size,
	users.industry,
	reviews.uuid,
	reviews.approval_status,
	reviews.submitted_at,
	reviews.respondent_role,
	approved_reviews.exemplary,
	categories.name,
	review_stats.reward_amount,
	offerings.name AS offering_name
FROM
	review_stats
	JOIN reviews ON review_stats.review_id = reviews.id
	JOIN users ON users.id = review_stats.user_id
	JOIN approved_reviews ON approved_reviews.review_id = review_stats.review_id
	JOIN categories ON categories.id = review_stats.category_id
	JOIN offerings ON offerings.id = review_stats.offering_id
WHERE
	review_stats.approval_status = 1
	AND review_stats.short = 1;
```

This query includes the commented-out lines that were in the original query. Note that these lines will not affect the execution of the query, as they are simply comments and will be ignored by the SQL engine. You can uncomment them if you want to include those columns in the results of the query.

Fix this create table review_stats database mongoose_development;


To create a table named `review_stats` in a database called `mongoose_development` using Mongoose, you can define a schema for the table and then create the model using that schema. Here's an example:

```javascript
const mongoose = require('mongoose');

const reviewStatsSchema = new mongoose.Schema({
  review_id: { type: Number, required: true },
  user_id: { type: Number, required: true },
  category_id: { type: Number, required: true },
  offering_id: { type: Number, required: true },
  reward_amount: { type: Number, required: true },
  short: { type: Boolean, default: false },
  approval_status: { type: Number, required: true },
  approved_at: { type: Date },
  exemplary: { type: Boolean, default: false },
  created_at: { type: Date, default: Date.now },
  updated_at: { type: Date, default: Date.now }
});

const ReviewStats = mongoose.model('ReviewStats', reviewStatsSchema);

mongoose.connect('mongodb://localhost/mongoose_development')
  .then(() => {
    console.log('Connected to database');
    return ReviewStats.createCollection();
  })
  .then(() => {
    console.log('Created review_stats collection');
    mongoose.disconnect();
  })
  .catch((err) => {
    console.error(err);
    mongoose.disconnect();
  });
```

This code defines a schema for the `review_stats` table with the necessary columns and their data types. It then creates a Mongoose model for the table using the schema. After that, it connects to the `mongoose_development` database, creates the `review_stats` collection, logs a message to indicate that the collection was created, and finally disconnects from the database.

You can modify the `reviewStatsSchema` object to match the schema for the `review_stats` table in your specific use case. Also, you can change the database name, and adjust the code accordingly to match the environment you are working in.

translate this rails migration to sql
    create_table :review_stats, primary_key: [:review_id, :category_id] do |t|
      t.references :review, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.references :offering, foreign_key: true
      t.references :user, foreign_key: true
      t.integer    :status, index: true, default: 0
      t.integer    :approval_status, index: true, default: 0
      t.integer    :category_status, index: true, default: 0
      t.boolean    :short, default: false
      t.date       :approval_status_on
      t.date       :review_created_on
      t.string     :campaign_type_slug

      t.timestamps

Here's the SQL equivalent of the Rails migration:

```sql
CREATE TABLE review_stats (
  review_id INT NOT NULL,
  category_id INT NOT NULL,
  offering_id INT,
  user_id INT,
  status INT DEFAULT 0,
  approval_status INT DEFAULT 0,
  category_status INT DEFAULT 0,
  short BOOLEAN DEFAULT false,
  approval_status_on DATE,
  review_created_on DATE,
  campaign_type_slug VARCHAR(255),
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  PRIMARY KEY (review_id, category_id),
  FOREIGN KEY (review_id) REFERENCES reviews (id),
  FOREIGN KEY (category_id) REFERENCES categories (id),
  FOREIGN KEY (offering_id) REFERENCES offerings (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);
```

This SQL statement creates a `review_stats` table with columns that match the Rails migration. It also sets up the primary key to be a combination of `review_id` and `category_id`. It creates foreign key constraints to link to the `reviews`, `categories`, `offerings`, and `users` tables, assuming that those tables already exist in the database.

Query 1 ERROR: Referencing column 'review_id' and referenced column 'id' in foreign key constraint 'review_stats_ibfk_1' are incompatible.

The error message indicates that the data types of the columns used in the foreign key constraint do not match. To fix this error, you need to ensure that the data types of the `review_id` column in the `review_stats` table and the `id` column in the `reviews` table match. Here's an example of how you can modify the foreign key constraint to make it work:

```sql
ALTER TABLE review_stats
ADD FOREIGN KEY (review_id) REFERENCES reviews (id);
```

If the `id` column in the `reviews` table is of a different data type, you will need to modify the data type of the `review_id` column in the `review_stats` table to match it. For example, if the `id` column in the `reviews` table is of type `BIGINT`, you can modify the `review_id` column in the `review_stats` table like this:

```sql
ALTER TABLE review_stats
MODIFY review_id BIGINT NOT NULL;
```

Then you can add the foreign key constraint like this:

```sql
ALTER TABLE review_stats
ADD FOREIGN KEY (review_id) REFERENCES reviews (id);
```

Make sure to modify the foreign key constraints for all other tables as well, if necessary.

how migrate table instead of create, handle column if not exists so it doesn't error

To migrate an existing table in SQL, you can use the `ALTER TABLE` statement. Here's an example of how you can modify an existing table to add a new column if it doesn't exist:

```sql
ALTER TABLE my_table
ADD COLUMN IF NOT EXISTS new_column INT;
```

This statement adds a new column called `new_column` with the data type `INT` to the `my_table` table, but only if the column doesn't already exist. This way, you can avoid errors if you run the migration script multiple times.

If you want to modify the attributes of an existing column, you can use the `MODIFY COLUMN` clause in the `ALTER TABLE` statement. Here's an example:

```sql
ALTER TABLE my_table
MODIFY COLUMN existing_column VARCHAR(255);
```

This statement modifies the `existing_column` column in the `my_table` table to change its data type to `VARCHAR(255)`.

Note that the exact syntax may vary depending on the SQL database you're using, so you should consult the documentation for your specific database for more information on how to use the `ALTER TABLE` statement.

Change this create query for the "alter table version if not exist" of it
CREATE TABLE review_stats (
  review_id INT NOT NULL,
  category_id INT NOT NULL,
  offering_id INT,
  user_id INT,
  status INT DEFAULT 0,
  approval_status INT DEFAULT 0,
  category_status INT DEFAULT 0,
  short BOOLEAN DEFAULT false,
  approval_status_on DATE,
  review_created_on DATE,
  campaign_type_slug VARCHAR(255),
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  PRIMARY KEY (review_id, category_id),
  FOREIGN KEY (review_id) REFERENCES reviews (id),
  FOREIGN KEY (category_id) REFERENCES categories (id),
  FOREIGN KEY (offering_id) REFERENCES offerings (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

Here's an example of how you can modify the existing `review_stats` table to add a new column and change the foreign key constraints:

```sql
ALTER TABLE review_stats
ADD COLUMN IF NOT EXISTS uuid VARCHAR(255);

ALTER TABLE review_stats
DROP FOREIGN KEY IF EXISTS review_stats_ibfk_1,
DROP FOREIGN KEY IF EXISTS review_stats_ibfk_2,
DROP FOREIGN KEY IF EXISTS review_stats_ibfk_3,
DROP FOREIGN KEY IF EXISTS review_stats_ibfk_4;

ALTER TABLE review_stats
ADD CONSTRAINT review_stats_fk_review
FOREIGN KEY (review_id) REFERENCES reviews (id);

ALTER TABLE review_stats
ADD CONSTRAINT review_stats_fk_category
FOREIGN KEY (category_id) REFERENCES categories (id);

ALTER TABLE review_stats
ADD CONSTRAINT review_stats_fk_offering
FOREIGN KEY (offering_id) REFERENCES offerings (id);

ALTER TABLE review_stats
ADD CONSTRAINT review_stats_fk_user
FOREIGN KEY (user_id) REFERENCES users (id);
```

This script adds a new column called `uuid` to the `review_stats` table if it doesn't already exist, and drops the existing foreign key constraints if they exist. It then adds new foreign key constraints for each column, which reference the corresponding column in the parent tables. Note that the exact syntax may vary depending on the SQL database you're using, so you should consult the documentation for your specific database for more information on how to use the `ALTER TABLE` statement.

That one is not working for mysql
Query 1 ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'IF NOT EXISTS uuid VARCHAR(255)' at line 2

I apologize for the error in my previous response. Here's an updated version that should work for MySQL:

```
ALTER TABLE review_stats
ADD COLUMN uuid VARCHAR(255) AFTER campaign_type_slug;

ALTER TABLE review_stats
DROP FOREIGN KEY IF EXISTS review_stats_fk_review,
DROP FOREIGN KEY IF EXISTS review_stats_fk_category,
DROP FOREIGN KEY IF EXISTS review_stats_fk_offering,
DROP FOREIGN KEY IF EXISTS review_stats_fk_user;

ALTER TABLE review_stats
ADD CONSTRAINT review_stats_fk_review
FOREIGN KEY (review_id) REFERENCES reviews (id);

ALTER TABLE review_stats
ADD CONSTRAINT review_stats_fk_category
FOREIGN KEY (category_id) REFERENCES categories (id);

ALTER TABLE review_stats
ADD CONSTRAINT review_stats_fk_offering
FOREIGN KEY (offering_id) REFERENCES offerings (id);

ALTER TABLE review_stats
ADD CONSTRAINT review_stats_fk_user
FOREIGN KEY (user_id) REFERENCES users (id);
```

This script adds a new column called `uuid` to the `review_stats` table after the `campaign_type_slug` column, and drops the existing foreign key constraints if they exist. It then adds new foreign key constraints for each column, which reference the corresponding column in the parent tables. Note that the `AFTER` keyword is used to specify the position of the new column after the `campaign_type_slug` column. You can adjust this position as needed.

rails aborted!
ActiveRecord::UnknownMigrationVersionError: 

No migration with version number 20230228201947.

This error occurs when Rails can't find a migration file with the specified version number in the `db/migrate` directory.

There are a few possible causes for this error:

1. The migration file has been deleted or moved. In this case, you can try restoring the missing file from a backup or creating a new migration file with the same version number.

2. The migration file has a different version number than the one specified in the error message. Double-check the version number of the migration file to ensure it matches the one specified in the error message.

3. There is a typo in the version number specified in the error message. Check for any typos or mistakes in the version number and correct them.

Once you have identified the correct migration file, you can run the migration using the `rails db:migrate` command to apply the changes to the database. If the migration has already been run, you can use the `rails db:rollback` command to revert the changes and then re-run the migration.