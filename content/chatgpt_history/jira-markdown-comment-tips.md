---
title: Jira Markdown Comment Tips
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Jira Markdown Comment Tips

## ✅ TODOs
- [ ] what they were able to do before
- [ ] Ask @adam_bilyea for it.

## 📌 Summary
How can I make a markdown comment show properly in a jira description?

## 🧠 Full Chat


How can I make a markdown comment show properly in a jira description?



To make a markdown comment show properly in a Jira description, you can use Jira’s native markup syntax, as Jira doesn’t fully support standard Markdown. For adding comments (which are usually hidden or meant to be ignored in Markdown), Jira allows you to hide text or add formatting in specific ways.

Here’s how you can make a comment-like text in Jira:

1. **Use a blockquote for comments:**
   You can add a comment by formatting it as a blockquote. Use `>` followed by your comment text.

   Example:
   ```
   > This is a comment.
   ```

2. **Use code block syntax:**
   If you want the comment to appear as code (though it won’t be hidden), you can use the code block format with curly braces `{}` or the monospace format using double curly braces `{{ }}`.

   Example:
   ```
   { This is a comment. }
   ```

3. **Using HTML comments (may vary based on your Jira instance):**
   Some Jira instances allow you to include HTML comments that will be hidden from the rendered text. You can try:
   ```html
   <!-- This is a comment -->
   ```

However, Jira's exact rendering of markdown can vary based on configuration, so these approaches might behave slightly differently depending on how your Jira instance is set up.

Do that for this markdown:
## Summary
Business is planning on a new membership level for Leadership type tier. Currently this exists but doesn’t really do anything in terms of functionality. The idea is that a Leadership member will have same membership access as existing advisory plus some additional access.

## Background 
Salesforce is our source of truth since the attributes are defined there and then synced to InfoTech.
It is required to enable the Leadership logic as there are a couple of fields modified in following Salesforce flows:
### Contact Object
- `HR_Membership_Status_c` has a Leadership value added. Expectancy is to be able to switch a user from 'Advisory' to 'Leadership' in Salesforce and be able to log in and have the same access for the membership.

### Product Object
- `Ranking_c` for the Leadership membership will be 1500. Previously it was 2000. The existing business logic will acount for Advisory if it is lower or equal to 2000. **Let's clarify if we want to constrain new Leadership membership to only match with the 1500 score if we can let old Leadership membership scored to 2000 to also be valid.**
Leaving the ranking logic as is won't actually impact a lot, though.

### Meaningful Business Logic
Object Equivalents:

|Salesforce|ITRG Website|
|---|---|
|Contact|User|
|Account|Account|

A Salesforce Contact is equivalent to a User in the app.
Users can have multiple memberships (expirable).
Memberships have many subscription and suscriptions have many products.
In other words, an user has a membership to a subscription, tied to a product.
Also accounts contains suscriptions.
Accounts represent organizations.
Membership joins users and subscription.
Subscriptions tie product and account_ids.

Rank is determined by Salesforce and goes to the products table.
Currently, rank of 2000 or lower is advisory seat.
A lot of advisory seats have the same ranking and some advisory has wrong rank_order.
Check the `products.rank_order` to confirm it.

Initially, advisory and leadership are kinda design synonims but they will take their own path. Consider this for the implementation.
The fact that IT and HR memberships are differenciate it makes it simpler.

## Work Required
- Change `products.account_management_category = 'Leadership'` from 2000 to 1500. Currently, advisory logic is for numbers < 2000.
- Modify `valid_membership`in `api/v4/users_controller` to add Leadership
- Add proper `leadership_seat?` in the users model
- Understand what logic will differenciate the Leadership rank from Advisory
- `highest_seat_type` in OnboardingHelper class
- Add something like `advisory_plus` in the products model
- Update `products` and `product_categories` rankings
- `hr_membership_status` on the user model

## Acceptance Criteria
- Feature or request specs to make sure leadership and advisory have the same access
- As leadership they should be able to do what they were able to do before
- Any function where only an advisor is able, leadership will be able
- Make sure no IT memberships change

## QA Plan
- Change an existing user membership from Advisory to Leadership, sync back to the website and expect to see the same things as in Advisory membership while confirming the new user membership is Leadership in the db
- Make sure to write down the verified routes in the QA process so people can directly see if there is a missing route for advisory that was not tested

## Worth having a look at
- [CPQ Entities diagram]() TODO: Ask @adam_bilyea for it.


Here’s how you can format the provided markdown using Jira's markup:

```
h2. Summary
Business is planning on a new membership level for Leadership type tier. Currently, this exists but doesn’t really do anything in terms of functionality. The idea is that a Leadership member will have the same membership access as existing advisory plus some additional access.

h2. Background
Salesforce is our source of truth since the attributes are defined there and then synced to InfoTech.
It is required to enable the Leadership logic as there are a couple of fields modified in the following Salesforce flows:

h3. Contact Object
- *HR_Membership_Status_c* has a Leadership value added. Expectancy is to be able to switch a user from 'Advisory' to 'Leadership' in Salesforce and be able to log in and have the same access for the membership.

h3. Product Object
- *Ranking_c* for the Leadership membership will be 1500. Previously it was 2000. The existing business logic will account for Advisory if it is lower or equal to 2000. *Let's clarify if we want to constrain new Leadership membership to only match with the 1500 score or if we can let old Leadership membership scored to 2000 to also be valid.*
Leaving the ranking logic as is won't actually impact a lot, though.

h3. Meaningful Business Logic
Object Equivalents:

|| Salesforce || ITRG Website ||
| Contact | User |
| Account | Account |

A Salesforce Contact is equivalent to a User in the app.
Users can have multiple memberships (expirable).
Memberships have many subscriptions, and subscriptions have many products.
In other words, a user has a membership to a subscription, tied to a product.
Also, accounts contain subscriptions.
Accounts represent organizations.
Membership joins users and subscription.
Subscriptions tie product and account_ids.

Rank is determined by Salesforce and goes to the products table.
Currently, a rank of 2000 or lower is an advisory seat.
A lot of advisory seats have the same ranking and some advisory has the wrong rank_order.
Check the *products.rank_order* to confirm it.

Initially, advisory and leadership are design synonyms, but they will take their own path. Consider this for the implementation.
The fact that IT and HR memberships are differentiated makes it simpler.

h2. Work Required
- Change *products.account_management_category = 'Leadership'* from 2000 to 1500. Currently, advisory logic is for numbers < 2000.
- Modify *valid_membership* in *api/v4/users_controller* to add Leadership
- Add proper *leadership_seat?* in the users model
- Understand what logic will differentiate the Leadership rank from Advisory
- *highest_seat_type* in OnboardingHelper class
- Add something like *advisory_plus* in the products model
- Update *products* and *product_categories* rankings
- *hr_membership_status* on the user model

h2. Acceptance Criteria
- Feature or request specs to make sure leadership and advisory have the same access
- As leadership, they should be able to do what they were able to do before
- Any function where only an advisor is able, leadership will be able
- Make sure no IT memberships change

h2. QA Plan
- Change an existing user membership from Advisory to Leadership, sync back to the website, and expect to see the same things as in the Advisory membership while confirming the new user membership is Leadership in the DB
- Make sure to write down the verified routes in the QA process so people can directly see if there is a missing route for advisory that was not tested

h2. Worth having a look at
- [CPQ Entities diagram](). TODO: Ask @adam_bilyea for it.
```

This will display your markdown correctly within a Jira issue description.

That didn't work. Is that valid for 2024?

You're right. Jira has been updating how it handles formatting over time, and the syntax I provided was based on earlier versions of Jira. For 2024, Jira now supports more **Markdown**-like syntax but with limitations. Since Jira doesn’t fully support standard Markdown or comments as you would expect in markdown, here's an updated approach:

Jira still doesn’t allow "hidden" comments, but you can add a workaround by either:

1. **Using blockquotes** for pseudo-comments to distinguish between the text.
2. **Incorporating HTML comments** (if your Jira instance allows it).

For Jira in 2024, here's how you can adjust your markdown:

```markdown
## Summary
Business is planning on a new membership level for Leadership type tier. Currently this exists but doesn’t really do anything in terms of functionality. The idea is that a Leadership member will have same membership access as existing advisory plus some additional access.

## Background 
Salesforce is our source of truth since the attributes are defined there and then synced to InfoTech.
It is required to enable the Leadership logic as there are a couple of fields modified in following Salesforce flows:

### Contact Object
- `HR_Membership_Status_c` has a Leadership value added. Expectancy is to be able to switch a user from 'Advisory' to 'Leadership' in Salesforce and be able to log in and have the same access for the membership.

### Product Object
- `Ranking_c` for the Leadership membership will be 1500. Previously it was 2000. The existing business logic will account for Advisory if it is lower or equal to 2000. **Let's clarify if we want to constrain new Leadership membership to only match with the 1500 score if we can let old Leadership membership scored to 2000 to also be valid.**
Leaving the ranking logic as is won't actually impact a lot, though.

### Meaningful Business Logic
Object Equivalents:

||Salesforce||ITRG Website||
|---|---|
|Contact|User|
|Account|Account|

A Salesforce Contact is equivalent to a User in the app.
Users can have multiple memberships (expirable).
Memberships have many subscription and subscriptions have many products.
In other words, a user has a membership to a subscription, tied to a product.
Also, accounts contain subscriptions.
Accounts represent organizations.
Membership joins users and subscriptions.
Subscriptions tie product and account_ids.

Rank is determined by Salesforce and goes to the products table.
Currently, a rank of 2000 or lower is an advisory seat.
A lot of advisory seats have the same ranking and some advisory has the wrong rank_order.
Check the `products.rank_order` to confirm it.

Initially, advisory and leadership are design synonyms but they will take their own path. Consider this for the implementation.
The fact that IT and HR memberships are differentiated makes it simpler.

## Work Required
- Change `products.account_management_category = 'Leadership'` from 2000 to 1500. Currently, advisory logic is for numbers < 2000.
- Modify `valid_membership` in `api/v4/users_controller` to add Leadership
- Add proper `leadership_seat?` in the users model
- Understand what logic will differentiate the Leadership rank from Advisory
- `highest_seat_type` in OnboardingHelper class
- Add something like `advisory_plus` in the products model
- Update `products` and `product_categories` rankings
- `hr_membership_status` on the user model

## Acceptance Criteria
- Feature or request specs to make sure leadership and advisory have the same access
- As leadership, they should be able to do what they were able to do before
- Any function where only an advisor is able, leadership will be able
- Make sure no IT memberships change

## QA Plan
- Change an existing user membership from Advisory to Leadership, sync back to the website, and expect to see the same things as in Advisory membership while confirming the new user membership is Leadership in the DB
- Make sure to write down the verified routes in the QA process so people can directly see if there is a missing route for advisory that was not tested

## Worth having a look at
- [CPQ Entities diagram]() TODO: Ask @adam_bilyea for it.
```

For hidden comments, unfortunately, **Jira still doesn’t support hidden comments** like HTML's `<!-- comment -->` in Markdown syntax.

Instead of hidden comments, consider adding visible blockquotes (`> This is a comment`) to make notes without affecting the actual content of the description.