---
title: SQL Delete Statement Check
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# SQL Delete Statement Check

## ✅ TODOs
- [ ] it in a single shot?
- [ ] it in a single shot.

## 📌 Summary
What is wrong with this query?

## 🧠 Full Chat


What is wrong with this query?
delete from reviews inner join users on reviews.user_id = users.id where users.id =2019222;


The query seems syntactically correct. However, it's important to note that blindly deleting data without proper verification can lead to unintended consequences and loss of data. It's advisable to always create a backup of your data before performing a delete operation, or to test the query on a small subset of data first to ensure that it's deleting the desired records.

Query 1 ERROR: Cannot delete or update a parent row: a foreign key constraint fails (`mongoose_development`.`approved_reviews`, CONSTRAINT `fk_rails_d3e2edaedc` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)

The error message you are encountering is indicating that there is a foreign key constraint in the "approved_reviews" table that references the "reviews" table. The constraint is configured to restrict deletion or updates on the referenced "reviews" table if there is still related data in the "approved_reviews" table. 

To resolve this issue, you can either:

1. Delete the related records in the "approved_reviews" table before deleting the records in the "reviews" table, or

2. Modify the foreign key constraint to allow deletion or updates by setting "ON DELETE CASCADE" or "ON UPDATE CASCADE", which would cause related records in the "approved_reviews" table to be automatically deleted or updated when records in the "reviews" table are deleted or updated. However, be careful with this option as it can result in data loss if not used properly.

It's important to always thoroughly review the data and dependencies before making any changes to the database schema or data.

What is wrong with this MySQL query now?
delete approved_reviews, r from reviews r inner join users on r.user_id = users.id inner join approved_reviews.review_id = r.id where users.id =2019222;


The query has a syntax error in the join statement of the "approved_reviews" table. The correct syntax should

How can I make this query a single one?
DELETE arf FROM reviews r
	INNER JOIN users ON r.user_id = users.id
	INNER JOIN approved_reviews ar ON ar.review_id = r.id
	INNER JOIN approved_review_fields arf ON arf.approved_review_id = ar.id
	WHERE users.id = 2019222;

DELETE ar FROM reviews r
	INNER JOIN users ON r.user_id = users.id
	INNER JOIN approved_reviews ar ON ar.review_id = r.id
	/*INNER JOIN approved_review_fields arf ON arf.approved_review_id = ar.id*/
	WHERE users.id = 2019222;

DELETE pr FROM reviews r
	INNER JOIN users ON r.user_id = users.id
	INNER JOIN product_reviews pr ON pr.review_id = r.id
	/*INNER JOIN approved_review_fields arf ON arf.approved_review_id = ar.id*/
	WHERE users.id = 2019222;

DELETE re FROM reviews r
	INNER JOIN users ON r.user_id = users.id
	INNER JOIN review_exchanges re ON re.review_id = r.id
	/*INNER JOIN approved_review_fields arf ON arf.approved_review_id = ar.id*/
	WHERE users.id = 2019222;

DELETE r FROM reviews r
	INNER JOIN users ON r.user_id = users.id
	/*INNER JOIN approved_reviews ar ON ar.review_id = r.id
	INNER JOIN approved_review_fields arf ON arf.approved_review_id = ar.id*/
	WHERE users.id = 2019222;

DELETE uc FROM user_consents uc
	INNER JOIN users ON uc.user_id = users.id
	WHERE users.id = 2019222;

DELETE u FROM users u WHERE u.id = 2019222;


You can make the multiple delete queries into a single query as follows:

```
DELETE arf, ar, pr, re, r, uc, u
FROM users u
	LEFT JOIN reviews r ON r.user_id = u.id
	LEFT JOIN approved_reviews ar ON ar.review_id = r.id
	LEFT JOIN approved_review_fields arf ON arf.approved_review_id = ar.id
	LEFT JOIN product_reviews pr ON pr.review_id = r.id
	LEFT JOIN review_exchanges re ON re.review_id = r.id
	LEFT JOIN user_consents uc ON uc.user_id = u.id
WHERE u.id = 2019222;
```

It's important to note that the order of the deletes is crucial here, as foreign key constraints may prevent deletes from being executed if there are still related records in other tables. The above query should work as long as there are no foreign key constraints between the tables that restrict deletion of records.

There are foreign constrains, how should I sort them if reviews and users are those giving trouble?

If you have foreign key constraints between the "reviews" and "users" tables, you may need to sort the deletes in a specific order to avoid constraint violations. You can do this as follows:

1. Delete any related records in the dependent tables that reference the "reviews" table, such as "approved_reviews", "approved_review_fields", "product_reviews", and "review_exchanges".

2. Delete the "reviews" records.

3. Finally, delete the "users" record.

Here's the code:

```
DELETE arf, ar, pr, re
FROM approved_reviews ar
	LEFT JOIN approved_review_fields arf ON arf.approved_review_id = ar.id
	LEFT JOIN product_reviews pr ON pr.review_id = ar.review_id
	LEFT JOIN review_exchanges re ON re.review_id = ar.review_id
WHERE ar.review_id IN (
	SELECT r.id
	FROM reviews r
	INNER JOIN users ON r.user_id = users.id
	WHERE users.id = 2019222
);

DELETE r
FROM reviews r
	INNER JOIN users ON r.user_id = users.id
WHERE users.id = 2019222;

DELETE uc, u
FROM users u
	LEFT JOIN user_consents uc ON uc.user_id = u.id
WHERE u.id = 2019222;
```

It's important to thoroughly test the deletes in a safe environment before executing them on a production database, to ensure that the desired results are obtained and that there are no unintended consequences.

So with constrains it's not possible to do it in a single shot?

It is possible to perform the deletion in a single shot if there are no foreign key constraints between the tables, but if there are foreign key constraints between the tables, it can become more complicated to do it in a single shot.

In this case, you need to make sure to delete records in the dependent tables first, before deleting records in the parent table, in order to avoid constraint violations. 

Therefore, if there are foreign key constraints, it may not be possible to perform the deletion in a single shot, and multiple DELETE statements may be necessary.

Translate the following sql statement into active record queries

DELETE arf FROM reviews r
	INNER JOIN users ON r.user_id = users.id
	INNER JOIN approved_reviews ar ON ar.review_id = r.id
	INNER JOIN approved_review_fields arf ON arf.approved_review_id = ar.id
	WHERE users.id IN (2018557,2019222);

DELETE ar FROM reviews r
	INNER JOIN users ON r.user_id = users.id
	INNER JOIN approved_reviews ar ON ar.review_id = r.id
	WHERE users.id IN (2018557,2019222);

DELETE pr FROM reviews r
	INNER JOIN users ON r.user_id = users.id
	INNER JOIN product_reviews pr ON pr.review_id = r.id
	WHERE users.id IN (2018557,2019222);

DELETE re FROM reviews r
	INNER JOIN users ON r.user_id = users.id
	INNER JOIN review_exchanges re ON re.review_id = r.id
	WHERE users.id IN (2018557,2019222);

DELETE sda FROM reviews r
	INNER JOIN users u ON r.user_id = u.id
	INNER JOIN suspicious_data_alerts sda ON sda.review_id = r.id
	WHERE u.id IN (2018557,2019222);

DELETE r FROM reviews r
	INNER JOIN users u ON r.user_id = u.id
	WHERE u.id IN (2018557,2019222);

DELETE uc FROM user_consents uc
	INNER JOIN users ON uc.user_id = users.id
	WHERE users.id IN (2018557,2019222);

DELETE u FROM users u WHERE u.id IN (2018557,2019222);

Here is the equivalent code for each query in Active Record:

DELETE arf FROM reviews r
	INNER JOIN users ON r.user_id = users.id
	INNER JOIN approved_reviews ar ON ar.review_id = r.id
	INNER JOIN approved_review_fields arf ON arf.approved_review_id = ar.id
	WHERE users.id IN (2018557,2019222);

```
ApprovedReviewField.joins(approved_review: [{review: [:user]}]).where(users: {id: [2018557,2019222]}).delete_all
```

DELETE ar FROM reviews r
	INNER JOIN users ON r.user_id = users.id
	INNER JOIN approved_reviews ar ON ar.review_id = r.id
	WHERE users.id IN (2018557,2019222);

```
ApprovedReview.joins(review: [:user]).where(users: {id: [2018557,2019222]}).delete_all
```

DELETE pr FROM reviews r
	INNER JOIN users ON r.user_id = users.id
	INNER JOIN product_reviews pr ON pr.review_id = r.id
	WHERE users.id IN (2018557,2019222);

```
ProductReview.joins(review: [:user]).where(users: {id: [2018557,2019222]}).delete_all
```

DELETE re FROM reviews r
	INNER JOIN users ON r.user_id = users.id
	INNER JOIN review_exchanges re ON re.review_id = r.id
	WHERE users.id IN (2018557,2019222);

```
ReviewExchange.joins(review: [:user]).where(users: {id: [2018557,2019222]}).delete_all
```

DELETE sda FROM reviews r
	INNER JOIN users u ON r.user_id = u.id
	INNER JOIN suspicious_data_alerts sda ON sda.review_id = r.id
	WHERE u.id IN (2018557,2019222);

```
SuspiciousDataAlert.joins(review: [:user]).where(users: {id: [2018557,2019222]}).delete_all
```

DELETE r FROM reviews r
	INNER JOIN users u ON r.user_id = u.id
	WHERE u.id IN (2018557,2019222);

```
Review.joins(:user).where(users: {id: [2018557,2019222]}).delete_all
```

DELETE uc FROM user_consents uc
	INNER JOIN users ON uc.user_id = users.id
	WHERE users.id IN (2018557,2019222);

```
UserConsent.joins(:user).where(users: {id: [2018557,2019222]}).delete_all
```

DELETE u FROM users u WHERE u.id IN (2018557,2019222);

```
User.where(id: [2018557,2019222]).delete_all
```

all Active Record code in a single chunk of code

```
# Delete approved_review_fields where users.id is 2018557 or 2019222
ApprovedReviewField.joins(approved_review: {review: :user})
  .where("users.id IN (2018557,2019222)").delete_all

# Delete approved_reviews where users.id is 2018557 or 2019222
ApprovedReview.joins(review: :user)
  .where("users.id IN (2018557,2019222)").delete_all

# Delete product_reviews where users.id is 2018557 or 2019222
ProductReview.joins(review: :user)
  .where("users.id IN (2018557,2019222)").delete_all

# Delete review_exchanges where users.id is 2018557 or 2019222
ReviewExchange.joins(review: :user)
  .where("users.id IN (2018557,2019222)").delete_all

# Delete suspicious_data_alerts where users.id is 2018557 or 2019222
SuspiciousDataAlert.joins(review: :user)
  .where("users.id IN (2018557,2019222)").delete_all

# Delete reviews where users.id is 2018557 or 2019222
Review.joins(:user)
  .where("users.id IN (2018557,2019222)").delete_all

# Delete user_consents where users.id is 2018557 or 2019222
UserConsent.joins(:user)
  .where("users.id IN (2018557,2019222)").delete_all

# Delete users where id is 2018557 or 2019222
User.where(id: [2018557, 2019222]).delete_all
```

Replace delete_all for .each(&:really_destroy!) and remove the explanation comments

```
User.where(id: [2018557, 2019222]).each(&:really_destroy!)
Review.joins(:user).where("users.id IN (?)", [2018557, 2019222]).each(&:really_destroy!)
ApprovedReview.joins(:review).joins("INNER JOIN users ON reviews.user_id = users.id").where("users.id IN (?)", [2018557, 2019222]).each(&:really_destroy!)
ApprovedReviewField.joins(:approved_review).joins("INNER JOIN reviews ON approved_reviews.review_id = reviews.id").joins("INNER JOIN users ON reviews.user_id = users.id").where("users.id IN (?)", [2018557, 2019222]).each(&:really_destroy!)
ProductReview.joins(:review).joins("INNER JOIN users ON reviews.user_id = users.id").where("users.id IN (?)", [2018557, 2019222]).each(&:really_destroy!)
ReviewExchange.joins(:review).joins("INNER JOIN users ON reviews.user_id = users.id").where("users.id IN (?)", [2018557, 2019222]).each(&:really_destroy!)
SuspiciousDataAlert.joins(:review).joins("INNER JOIN users ON reviews.user_id = users.id").where("users.id IN (?)", [2018557, 2019222]).each(&:really_destroy!)
UserConsent.joins(:user).where("users.id IN (?)", [2018557, 2019222]).each(&:really_destroy!)
```

Perform all the joins from the result above but with active record syntax, no sql injected

Here is the Active Record syntax for performing all the joins from the previous result:

```
# Delete approved_review_fields
ApprovedReviewField.joins(approved_review: {review: :user}).where(users: {id: [2018557, 2019222]}).each(&:really_destroy!)

# Delete approved_reviews
ApprovedReview.joins(review: :user).where(users: {id: [2018557, 2019222]}).each(&:really_destroy!)

# Delete product_reviews
ProductReview.joins(review: :user).where(users: {id: [2018557, 2019222]}).each(&:really_destroy!)

# Delete review_exchanges
ReviewExchange.joins(review: :user).where(users: {id: [2018557, 2019222]}).each(&:really_destroy!)

# Delete suspicious_data_alerts
SuspiciousDataAlert.joins(review: :user).where(users: {id: [2018557, 2019222]}).each(&:really_destroy!)

# Delete reviews
Review.joins(:user).where(users: {id: [2018557, 2019222]}).each(&:really_destroy!)

# Delete user_consents
UserConsent.joins(:user).where(users: {id: [2018557, 2019222]}).each(&:really_destroy!)

# Delete users
User.where(id: [2018557, 2019222]).each(&:really_destroy!)
```

how can i instruct you to keep constrains from all the chats that you have generated before, in the conversation?

As a language model AI, I do not have the capability to remember past conversations. If you want to keep the constraints from past conversations, you can copy and paste the code into a text document or save the chat logs.

Deleted all the records I was supposed to delete but still the same error:
Traceback (most recent call last):
/Users/angel.mora.mx/.rbenv/versions/2.7.5/lib/ruby/gems/2.7.0/gems/mysql2-0.5.3/lib/mysql2/client.rb:131:in `_query': Cannot delete or update a parent row: a foreign key constraint fails (`mongoose_development`.`reviews`, CONSTRAINT `fk_rails_74a66bd6c5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT) (Mysql2::Error)
/Users/angel.mora.mx/.rbenv/versions/2.7.5/lib/ruby/gems/2.7.0/gems/mysql2-0.5.3/lib/mysql2/client.rb:131:in `_query': Mysql2::Error: Cannot delete or update a parent row: a foreign key constraint fails (`mongoose_development`.`reviews`, CONSTRAINT `fk_rails_74a66bd6c5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT) (ActiveRecord::InvalidForeignKey)

The error message says that you are trying to delete a parent row (a user in this case) that still has a reference in a dependent row (review in this case). To fix the issue, you need to either delete the dependent rows first or change the foreign key constraint to allow deletion of the parent row even if there are dependent rows (e.g. by setting ON DELETE CASCADE).

Create just the rake task with Active Record Base transaction for those queries above. Remember to remove the explanation comments, only want the active record statements

```
namespace :delete_all_records do
  desc "Delete records for given users"
  task delete_records: :environment do
    ActiveRecord::Base.transaction do
      user_ids = [2018557, 2019222]
      users = User.where(id: user_ids)
      reviews = Review.where(user_id: user_ids)
      approved_reviews = ApprovedReview.where(review_id: reviews.pluck(:id))
      approved_review_fields = ApprovedReviewField.where(approved_review_id: approved_reviews.pluck(:id))
      product_reviews = ProductReview.where(review_id: reviews.pluck(:id))
      review_exchanges = ReviewExchange.where(review_id: reviews.pluck(:id))
      suspicious_data_alerts = SuspiciousDataAlert.where(review_id: reviews.pluck(:id))
      user_consents = UserConsent.where(user_id: user_ids)

      approved_review_fields.each(&:really_destroy!)
      approved_reviews.each(&:really_destroy!)
      product_reviews.each(&:really_destroy!)
      review_exchanges.each(&:really_destroy!)
      suspicious_data_alerts.each(&:really_destroy!)
      reviews.each(&:really_destroy!)
      user_consents.each(&:really_destroy!)
      users.each(&:really_destroy!)
    end
  end
end
```

Re-generate but now DRY it

```ruby
namespace :data_cleanup do
  desc "Delete all records related to specific users"
  task delete_records: :environment do
    user_ids = [2018557,2019222]

    ActiveRecord::Base.transaction do
      # Delete approved_review_fields
      ApprovedReviewField.joins(approved_review: {review: :user}).where("users.id IN (?)", user_ids).each(&:really_destroy!)
      # Delete approved_reviews
      ApprovedReview.joins(review: :user).where("users.id IN (?)", user_ids).each(&:really_destroy!)
      # Delete product_reviews
      ProductReview.joins(review: :user).where("users.id IN (?)", user_ids).each(&:really_destroy!)
      # Delete review_exchanges
      ReviewExchange.joins(review: :user).where("users.id IN (?)", user_ids).each(&:really_destroy!)
      # Delete suspicious_data_alerts
      SuspiciousDataAlert.joins(review: :user).where("users.id IN (?)", user_ids).each(&:really_destroy!)
      # Delete reviews
      Review.joins(:user).where("users.id IN (?)", user_ids).each(&:really_destroy!)
      # Delete user_consents
      UserConsent.joins(:user).where("users.id IN (?)", user_ids).each(&:really_destroy!)
      # Delete users
      User.where(id: user_ids).each(&:really_destroy!)
    end
  end
end
```

DRY this with ruby metaprogramming
      approved_review_fields.each(&:really_destroy!)
      approved_reviews.each(&:really_destroy!)
      product_reviews.each(&:really_destroy!)
      review_exchanges.each(&:really_destroy!)
      suspicious_data_alerts.each(&:really_destroy!)
      reviews.each(&:really_destroy!)
      user_consents.each(&:really_destroy!)
      users.each(&:really_destroy!)

```
[:approved_review_fields, :approved_reviews, :product_reviews, :review_exchanges, :suspicious_data_alerts, :reviews, :user_consents, :users].each do |association|
  model = Object.const_get(association.to_s.classify)
  model.all.each(&:really_destroy!)
end
```