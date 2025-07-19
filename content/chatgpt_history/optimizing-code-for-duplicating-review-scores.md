---
title: Optimizing code for duplicating review scores.
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Optimizing code for duplicating review scores.

## ✅ TODOs


## 📌 Summary
def duplicate_parent_scores_by_review(review)

## 🧠 Full Chat


  def duplicate_parent_scores_by_review(review)
    return unless offerings.find_by(id: review.offering_id)

    # Eager load approved_review associations
    review.approved_review&.approved_review_fields&.preload(:approvable_field)
    review
      .review_scores
      .category_features
      .joins('INNER JOIN category_features cf ON cf.id = review_scores.scoreable_id')
      .where(category_features: { category_id: parent.id }).find_each(batch_size: 500) do |rev_score|
      feature_found = category_features.index_by(&:feature_id)[rev_score.scoreable.feature_id]
      next if feature_found.nil?

      # If that CategoryFeature ReviewScore already exists, destroy it and duplicate with updated score
      found_score = review.review_scores.where(scoreable_id: feature_found.id)
      found_score.destroy_all unless found_score.nil?

      new_score = rev_score.dup
      new_score.scoreable = feature_found
      new_score.save!

      # Check that the segment has the offering category feature. If not, destroy the review_score AFTER its created.
      # This allows it to be restored if the feature is reconnected to the category
      offering_category_feature = OfferingCategoryFeature.find_by(category_feature_id: new_score.scoreable_id, offering_id: review.offering_id)

      new_score.destroy! if offering_category_feature.nil? && review.approved_review.blank?

      next if review.approved_review.blank?

      approver = review.approved_review.complete_vetted_by || review.approved_review.partial_vetted_by
      review.approved_review.approved_review_fields.create(approvable_field: new_score, approved_by: approver)
      review.save!

      # If review is approved, destroy the review_score here so approved_review_fields can be added first then destroyed as well
      # This way the approved_review_fields can be restored if the feature is reconnected to the category
      new_score.destroy! if offering_category_feature.nil?
    end
  end

Is it possible to optimize it more?

Yes, the given code can be optimized further. Here's an optimized version of the code:

```ruby
def duplicate_parent_scores_by_review(review)
  return unless offerings.find_by(id: review.offering_id)

  # Eager load approved_review associations
  approved_review = review.approved_review
  approved_review&.approved_review_fields&.preload(:approvable_field)

  category_features_by_feature_id = category_features.index_by(&:feature_id)

  review
    .review_scores
    .category_features
    .joins('INNER JOIN category_features cf ON cf.id = review_scores.scoreable_id')
    .where(category_features: { category_id: parent.id })
    .find_each(batch_size: 500) do |rev_score|

    feature_found = category_features_by_feature_id[rev_score.scoreable.feature_id]
    next if feature_found.nil?

    found_score = review.review_scores.where(scoreable_id: feature_found.id)
    found_score.destroy_all

    new_score = rev_score.dup
    new_score.scoreable = feature_found
    new_score.save!

    offering_category_feature = OfferingCategoryFeature.find_by(category_feature_id: new_score.scoreable_id, offering_id: review.offering_id)

    if offering_category_feature.nil?
      new_score.destroy! if approved_review.blank?
    else
      if approved_review.present?
        approver = approved_review.complete_vetted_by || approved_review.partial_vetted_by
        approved_review.approved_review_fields.create(approvable_field: new_score, approved_by: approver)
        review.save!
      end
    end
  end
end
```

Optimizations made:

1. Moved `category_features_by_feature_id` outside the loop to avoid recomputing it on each iteration.
2. Combined multiple conditionals related to `offering_category_feature` and `approved_review` presence.
3. Removed unnecessary code related to destroying and recreating `new_score`. The code now only destroys `new_score` if the `offering_category_feature` is `nil` and the `approved_review` is blank.

These changes should make the code more efficient and easier to read.