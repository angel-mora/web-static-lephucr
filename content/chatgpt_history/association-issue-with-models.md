---
title: Association issue with models.
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Failure/Error: it { is_expected.to have_one(:offering_including_deleted).class_name('Offering').with_foreign_key('id').with_primary_key('offering_id').inverse_of(:offering_categories)
  }"
draft: false
---

# Association issue with models.

## 🧠 Full Chat

🙋 **You:**

Failure/Error: it { is_expected.to have_one(:offering_including_deleted).class_name('Offering').with_foreign_key('id').with_primary_key('offering_id').inverse_of(:offering_categories) }
       Expected OfferingCategory to have a has_one association called offering_including_deleted (Offering does not have a offering_id foreign key.)

---

🤖 **Assistant:**

This error message indicates that there is an issue with the association between the `OfferingCategory` and `Offering` models. 

The `OfferingCategory` model is expected to have a `has_one` association called `offering_including_deleted` with the `Offering` model. The association is expected to use the `id` attribute of `OfferingCategory` as the foreign key and the `offering_id` attribute of `Offering` as the primary key. 

However, the error message states that the `Offering` model does not have a `offering_id` foreign key. This suggests that there may be an issue with the database schema or the associations defined in the models.

To resolve this issue, you can check the database schema to ensure that the `Offering` model has a `offering_id` attribute and that it is set up as the primary key. You can also check the associations defined in the `Offering` and `OfferingCategory` models to ensure that they are set up correctly and are consistent with the database schema.

Additionally, you may want to check that the model classes are defined correctly and that the associations are being called with the correct names and parameters.

---

🙋 **You:**

this my offering_categories model:
  has_one :offering_including_deleted, -> { with_deleted },
          class_name: 'Offering',
          foreign_key: 'id',
          primary_key: 'offering_id',
          inverse_of: :offering_categories

---

🤖 **Assistant:**

Based on the code snippet you provided, the `OfferingCategory` model has a `has_one` association called `offering_including_deleted` with the `Offering` model.

The association uses a lambda function with the `with_deleted` method to include deleted records in the query. The `class_name` option specifies the name of the associated model, which is `Offering` in this case.

The `foreign_key` option specifies the foreign key used by the `Offering` model to reference the `OfferingCategory` model, which is `id` in this case. 

The `primary_key` option specifies the primary key of the `Offering` model that is used to reference the `OfferingCategory` model, which is `offering_id` in this case.

Finally, the `inverse_of` option specifies the name of the association on the associated model that is the inverse of this association. In this case, it is `offering_categories`.

Overall, the `has_one` association looks to be set up correctly. However, if you are encountering an error message related to this association, you may need to investigate further to determine the cause of the error.

---

🙋 **You:**

Expected OfferingCategory to have a has_one association called offering_including_deleted (Offering does not have a offering_id foreign key.)

---

🤖 **Assistant:**

The error message suggests that there is an issue with the foreign key used in the `has_one` association between the `OfferingCategory` and `Offering` models. 

Based on the error message, it appears that the `Offering` model does not have a `offering_id` foreign key, which conflicts with the `primary_key` option specified in the `has_one` association in the `OfferingCategory` model.

To resolve this issue, you should confirm the names and data types of the primary key and foreign key attributes in the database schema for the `Offering` and `OfferingCategory` models. You should also check the associations in the `Offering` model to ensure that they are set up correctly.

If the primary key and foreign key attributes are named differently in the database schema, you can specify the correct foreign key attribute name in the `foreign_key` option of the `has_one` association in the `OfferingCategory` model.

For example, if the foreign key attribute in the `Offering` model is named `category_id`, you can update the `has_one` association in the `OfferingCategory` model as follows:

```
has_one :offering_including_deleted, -> { with_deleted },
        class_name: 'Offering',
        foreign_key: 'category_id',
        primary_key: 'id',
        inverse_of: :offering_category
```

This would set up the `has_one` association between the `OfferingCategory` and `Offering` models using the `category_id` foreign key in the `Offering` model and the `id` primary key in the `OfferingCategory` model.