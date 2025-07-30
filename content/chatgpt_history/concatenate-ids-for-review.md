---
title: Concatenate IDs for Review.
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  SELECT"
draft: false
---

# Concatenate IDs for Review.

## 🧠 Full Chat

🙋 **You:**

SELECT
	group_concat(approved_reviews.id) AS ids
FROM
	`approved_reviews`
GROUP BY
	`approved_reviews`.`review_id`
HAVING (count(review_id) > 1);

Make the query above to give me just one row with all the ids concatenated

---

🤖 **Assistant:**

Sure! The query you provided groups the `approved_reviews` table by `review_id` and selects the concatenated `id` values for each group where there are more than one record. To return all the concatenated `id` values in a single row, you can wrap the query in a subquery and use `GROUP_CONCAT` again without grouping:

```
SELECT GROUP_CONCAT(ids) AS all_ids
FROM (
  SELECT
    GROUP_CONCAT(approved_reviews.id) AS ids
  FROM
    `approved_reviews`
  GROUP BY
    `approved_reviews`.`review_id`
  HAVING (count(review_id) > 1)
) AS subquery;
```

This query will return a single row with all the concatenated `id` values from the `approved_reviews` table where there are more than one record for a given `review_id`. The concatenated values will be separated by a comma by default, but you can specify a different separator by passing a second argument to `GROUP_CONCAT`.

---

🙋 **You:**

This active record query does the query I shared:
ApprovedReview.with_deleted.select('group_concat(approved_reviews.id) as ids').group(:review_id).having('count(review_id) > 1')

Give me the active record query for the query you just provided.

---

🤖 **Assistant:**

Certainly! Here's the equivalent Active Record query for the SQL query I provided:

```
subquery = ApprovedReview.with_deleted
  .select('GROUP_CONCAT(approved_reviews.id) AS ids')
  .group(:review_id)
  .having('COUNT(review_id) > 1')

result = ApprovedReview.from("(#{subquery.to_sql}) subquery")
  .select('GROUP_CONCAT(ids) AS all_ids')
  .first
```

This code creates a subquery using `ApprovedReview.with_deleted.select('GROUP_CONCAT(approved_reviews.id) AS ids').group(:review_id).having('COUNT(review_id) > 1')`, then wraps the subquery in a second query that concatenates all the `ids` values returned by the subquery into a single string using `GROUP_CONCAT`. Finally, it executes the query and returns the first result as an Active Record object.

Note that the `with_deleted` method is used to include "soft deleted" records in the result set, which may not be necessary depending on your use case. If you don't need to include soft deleted records, you can omit this method call.

---

🙋 **You:**

From that result variable, what would be the most optimal way to delete all duplicated recoreds with deleted_at: nil ? I want the active record total query

---

🤖 **Assistant:**

To delete all duplicated records with `deleted_at: nil`, you can use the `destroy_all` method with a condition that matches the `ids` of the duplicated records. Here's the Active Record query:

```
result = ApprovedReview.from("(#{subquery.to_sql}) subquery")
  .select('GROUP_CONCAT(ids) AS all_ids')
  .first

ids = result.all_ids.split(',')
ApprovedReview.where(id: ids, deleted_at: nil).destroy_all
```

This code first retrieves the concatenated `ids` values from the previous query and splits them into an array using `result.all_ids.split(',')`. Then it uses `where` to find all the duplicated records with `deleted_at: nil` whose `id` values are in the `ids` array, and calls `destroy_all` to delete them.

Note that this will permanently delete the records from the database, so make sure to back up your data and double-check that you want to delete them before running this code. If you want to soft-delete the records instead, you can use `update_all(deleted_at: Time.now)` instead of `destroy_all`.

---

🙋 **You:**

Is it possible to optimize this active record query?
      subquery = ApprovedReview.with_deleted
        .select('GROUP_CONCAT(approved_reviews.id) AS ids')
        .group(:review_id)
        .having('COUNT(review_id) > 1')

      result = ApprovedReview.from("(#{subquery.to_sql}) subquery")
        .select('GROUP_CONCAT(ids) AS all_ids')
        .first

      soft_deleted = ApprovedReview.with_deleted.where(id: result).where.not(deleted_at: nil) # this should be less than 166

      Paranoiac.delete_all!(soft_deleted)

---

🤖 **Assistant:**

Yes, it's possible to optimize this Active Record query! Instead of using `GROUP_CONCAT` to concatenate the `id` values into a string, which can be slow and memory-intensive for large datasets, you can use `pluck` to retrieve the `id` values as an array directly from the subquery. Here's the optimized version of the code:

```
subquery = ApprovedReview.with_deleted
  .select(:id)
  .group(:review_id)
  .having('COUNT(review_id) > 1')

ids = subquery.pluck(:id)
soft_deleted = ApprovedReview.with_deleted.where(id: ids, deleted_at: nil)
Paranoiac.delete_all!(soft_deleted)
```

This code uses `pluck` to retrieve the `id` values directly from the subquery, then passes the `ids` array to `where` to find all the duplicated records with `deleted_at: nil`. Finally, it calls `Paranoiac.delete_all!` to soft-delete the records.

By using `pluck` instead of `GROUP_CONCAT`, this code should be faster and use less memory for large datasets. Note that the `with_deleted` method is still used to include soft deleted records in the result set. If you don't need to include soft deleted records, you can omit this method call.

---

🙋 **You:**

subquery = ApprovedReview.with_deleted
  .select(:id)
  .group(:review_id)
  .having('COUNT(review_id) > 1')

ids = subquery.pluck(:id)
soft_deleted = ApprovedReview.with_deleted.where(id: ids, deleted_at: nil)
Paranoiac.delete_all!(soft_deleted)

that query you shared is deleting records not soft deleted. It should be WHERE NOT deleted_at: nil

---

🤖 **Assistant:**

You're right, I apologize for the mistake. To delete only the soft-deleted records, you can use `where.not(deleted_at: nil)` as you pointed out. Here's the corrected version of the code:

```
subquery = ApprovedReview.with_deleted
  .select(:id)
  .group(:review_id)
  .having('COUNT(review_id) > 1')

ids = subquery.pluck(:id)
soft_deleted = ApprovedReview.with_deleted.where(id: ids).where.not(deleted_at: nil)
Paranoiac.delete_all!(soft_deleted)
```

This code retrieves the `id` values using `pluck` as before, then uses `where.not(deleted_at: nil)` to find only the soft-deleted records whose `id` values are in the `ids` array. Finally, it calls `Paranoiac.delete_all!` to soft-delete the records.

Thank you for catching my mistake and helping to improve the code!

---

🙋 **You:**

Why subquery is returning less records if soft_deleted should have less and subquery more, as soft_deleted is a subset of subquery

      subquery = ApprovedReview.with_deleted.select(:review_id).group(:review_id).having('COUNT(review_id) > 1')

      ids = subquery.pluck(:review_id)
      soft_deleted = ApprovedReview.with_deleted.where(review_id: ids).where.not(deleted_at: nil)

---

🤖 **Assistant:**

The reason why the `subquery` is returning more records than the `soft_deleted` query is that they are aggregating different columns.

The `subquery` is aggregating the `:review_id` column and selecting only those that have more than one record associated with it (i.e., duplicates). This means that there may be multiple records with the same `review_id`, including both soft-deleted and non-deleted records.

On the other hand, the `soft_deleted` query is selecting all records that have a matching `review_id` value in the `ids` array and have a non-nil `deleted_at` value. This means that it only includes soft-deleted records that have a matching `review_id` value in the `ids` array.

Therefore, the `subquery` may return more records than the `soft_deleted` query if there are duplicates that include both soft-deleted and non-deleted records. To avoid counting non-deleted records as duplicates, you can modify the `subquery` to exclude non-deleted records:

```
subquery = ApprovedReview.with_deleted
  .select(:review_id)
  .where.not(deleted_at: nil)
  .group(:review_id)
  .having('COUNT(review_id) > 1')

ids = subquery.pluck(:review_id)
soft_deleted = ApprovedReview.with_deleted.where(review_id: ids).where.not(deleted_at: nil)
```

This code adds a `where.not(deleted_at: nil)` condition to the `subquery` to exclude non-deleted records from the aggregation. This should ensure that the `subquery` and `soft_deleted` queries are consistent and have the same number of records.

---

🙋 **You:**

soft_deleted should only provide the records that were not deleted_at, so if subquery is 166, soft_deleted should be > 166

---

🤖 **Assistant:**

You're right, I apologize for the confusion. If the `subquery` is returning 166 records, then the `soft_deleted` query should return at least that many records, since it only selects soft-deleted records that match the `review_id` values in the `subquery`. If the `soft_deleted` query returns fewer records than the `subquery`, then there may be a problem with the query logic.

Here's a revised version of the code that should return all soft-deleted records that have duplicates:

```
subquery = ApprovedReview.with_deleted
  .select(:review_id)
  .group(:review_id)
  .having('COUNT(review_id) > 1')

ids = subquery.pluck(:review_id)
soft_deleted = ApprovedReview.only_deleted.where(review_id: ids)
```

This code selects all `review_id` values that have duplicates using the `subquery`, then selects all soft-deleted records that match those `review_id` values using the `soft_deleted` query. Note that I've replaced `with_deleted` with `only_deleted` to select only soft-deleted records.

This should ensure that the `soft_deleted` query returns all soft-deleted records that have duplicates.