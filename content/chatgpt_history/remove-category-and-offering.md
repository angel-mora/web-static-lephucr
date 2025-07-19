---
title: Remove @category and @offering
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Remove @category and @offering

## ✅ TODOs


## 📌 Summary
could you please create this @category outside of this render without the instance variable. same with @offering

## 🧠 Full Chat


could you please create this @category outside of this render without the instance variable. same with @offering 

   def default_two_depth
        render(Component.new) do |component|
          @offering = FactoryBot.build(:software_reviews_shared_offering)
          @category = FactoryBot.build(:software_reviews_shared_category)
          component.with_links(
            [
              { name: 'Home', href: '/', current: 'false', title: 'Home' },
              { name: @category.name, href: SoftwareReviewsShared::UrlMapper.category_url(@category),
                current: 'false', title: @category.name },
              { name: @offering.name,
                href: SoftwareReviewsShared::UrlMapper.offering_url@offering, c_id: @category.id),
                current: 'page', title: @offering.name }
            ]
          )
        end
      end

To remove the instance variables `@category` and `@offering` and use local variables instead, you can define the local variables within the method and use them directly without the `@` prefix. Here's how you can rewrite the `default_two_depth` method:

```ruby
def default_two_depth
  category = FactoryBot.build(:software_reviews_shared_category)
  offering = FactoryBot.build(:software_reviews_shared_offering)

  render(Component.new) do |component|
    component.with_links(
      [
        { name: 'Home', href: '/', current: 'false', title: 'Home' },
        { name: category.name, 
          href: SoftwareReviewsShared::UrlMapper.category_url(category),
          current: 'false', title: category.name },
        { name: offering.name,
          href: SoftwareReviewsShared::UrlMapper.offering_url(offering, c_id: category.id),
          current: 'page', title: offering.name }
      ]
    )
  end
end
```

In the above code:

1. I've defined the `category` and `offering` as local variables.
2. I've replaced all instances of `@category` and `@offering` with `category` and `offering`, respectively.
3. I've adjusted the call to `SoftwareReviewsShared::UrlMapper.offering_url` to use the local variable and fixed the method call syntax.