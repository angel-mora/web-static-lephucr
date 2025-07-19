---
title: Create BreadcrumbsComponent Previews
tags:
- renders_many
- def
- super
- end
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Create BreadcrumbsComponent Previews

## ✅ TODOs
- [ ] so. Please provide some advice

## 📌 Summary
how can I create view components preview file where I have two options one, has 2 depth and the second has only one in header menu

## 🧠 Full Chat


how can I create view components preview file where I have two options one, has 2 depth and the second has only one in header menu
Here is my file 


module SoftwareReviewsShared
  module Breadcrumbs
    class BreadcrumbsComponentPreview < ViewComponent::Preview
    #renders_many :links, 'Breadcrumbs::BreadcrumbsItemComponent'

      #def initialize(classes: nil)
        #super
        #@classes = classes
      #end
      #def default_product

      
      def product
        offering_category = FactoryBot.create(:offering_category)

        render_component = BreadcrumbsComponentPreview.new(
          category: offering_category.category,
          offering: offering_category.offering
        )
        # breadcrumb depth = 2
        # Home > Digital Workplace > Microsoft Teams
      end

      def category
        category = FactoryBot.create(:category)

        render_component = BreadcrumbsComponentPreview.new(
          category: offering_category.category,
        )
        # breadcrumb depth = 1
        # Home > Digital Workplace
      end
    end
  end
end


It looks like you're trying to set up previews for a `BreadcrumbsComponent` using the `ViewComponent::Preview` class. The provided code has a few issues:

1. You're trying to instantiate `BreadcrumbsComponentPreview` inside its own methods, which is not the correct approach. Instead, you should be instantiating the actual `BreadcrumbsComponent` that you want to preview.
2. The `category` method references `offering_category` which is not defined in that method.
3. The commented-out code and methods are a bit confusing, and it's unclear what their purpose is.

Here's a refactored version of your code:

```ruby
module SoftwareReviewsShared
  module Breadcrumbs
    class BreadcrumbsComponentPreview < ViewComponent::Preview
      # Assuming you have a BreadcrumbsComponent that takes category and offering as arguments
      # If not, adjust the instantiation accordingly

      # Preview for breadcrumb with depth = 2
      # Home > Digital Workplace > Microsoft Teams
      def product
        offering_category = FactoryBot.create(:offering_category)

        render(BreadcrumbsComponent.new(
          category: offering_category.category,
          offering: offering_category.offering
        ))
      end

      # Preview for breadcrumb with depth = 1
      # Home > Digital Workplace
      def category
        category = FactoryBot.create(:category)

        render(BreadcrumbsComponent.new(
          category: category
        ))
      end
    end
  end
end
```

A few things to note:

- I've assumed that you have a `BreadcrumbsComponent` that takes `category` and `offering` as arguments. If this is not the case, adjust the instantiation accordingly.
- The `render` method is used to render the component in the preview.
- Make sure that the `BreadcrumbsComponent` is correctly set up to handle the arguments and render the breadcrumbs as expected.

Lastly, ensure that your FactoryBot factories (`:offering_category` and `:category`) are correctly set up and can create the necessary records for the preview.

 method should be called 'default'

Alright, if you want one of the preview methods to be the default, you can rename it to `default`. Here's the refactored code with the `product` method renamed to `default`:

```ruby
module SoftwareReviewsShared
  module Breadcrumbs
    class BreadcrumbsComponentPreview < ViewComponent::Preview
      # Assuming you have a BreadcrumbsComponent that takes category and offering as arguments
      # If not, adjust the instantiation accordingly

      # Default preview for breadcrumb with depth = 2
      # Home > Digital Workplace > Microsoft Teams
      def default
        offering_category = FactoryBot.create(:offering_category)

        render(BreadcrumbsComponent.new(
          category: offering_category.category,
          offering: offering_category.offering
        ))
      end

      # Preview for breadcrumb with depth = 1
      # Home > Digital Workplace
      def category
        category = FactoryBot.create(:category)

        render(BreadcrumbsComponent.new(
          category: category
        ))
      end
    end
  end
end
```

With this setup, when you navigate to the previews index for the `BreadcrumbsComponent`, the `default` method will be the first one shown.

category method too, how can I solve ti?

If you want both methods to be named `default`, you can't do that directly since method names must be unique. However, you can use a naming convention that indicates the difference between the two defaults. 

For instance, you can name them `default_two_depth` and `default_one_depth` to indicate the depth of the breadcrumbs. Here's how you can refactor the code:

```ruby
module SoftwareReviewsShared
  module Breadcrumbs
    class BreadcrumbsComponentPreview < ViewComponent::Preview
      # Assuming you have a BreadcrumbsComponent that takes category and offering as arguments
      # If not, adjust the instantiation accordingly

      # Default preview for breadcrumb with depth = 2
      # Home > Digital Workplace > Microsoft Teams
      def default_two_depth
        offering_category = FactoryBot.create(:offering_category)

        render(BreadcrumbsComponent.new(
          category: offering_category.category,
          offering: offering_category.offering
        ))
      end

      # Default preview for breadcrumb with depth = 1
      # Home > Digital Workplace
      def default_one_depth
        category = FactoryBot.create(:category)

        render(BreadcrumbsComponent.new(
          category: category
        ))
      end
    end
  end
end
```

This way, you clearly indicate the difference between the two default previews while adhering to the naming constraints.

this component has a renders_many association with another one called breadcrumbsItem. I tried to preview the component but haven't been able to do so. Please provide some advice

If your `BreadcrumbsComponent` has a `renders_many` association with another component called `BreadcrumbsItemComponent`, it means that the `BreadcrumbsComponent` can render multiple instances of `BreadcrumbsItemComponent`.

To preview this setup, you'll need to ensure a few things:

1. **Setup of `BreadcrumbsComponent`**: Ensure that your `BreadcrumbsComponent` is set up to accept and render multiple `BreadcrumbsItemComponent` instances. This might look something like:

```ruby
class BreadcrumbsComponent < ViewComponent::Base
  renders_many :items, 'BreadcrumbsItemComponent'

  # ... other code ...
end
```

2. **Setup of `BreadcrumbsItemComponent`**: Ensure that your `BreadcrumbsItemComponent` is set up correctly to render individual breadcrumb items.

3. **Preview Setup**: When setting up the preview, you'll need to create instances of `BreadcrumbsItemComponent` and pass them to `BreadcrumbsComponent`.

Here's how you can set up the preview:

```ruby
module SoftwareReviewsShared
  module Breadcrumbs
    class BreadcrumbsComponentPreview < ViewComponent::Preview
      def default_two_depth
        offering_category = FactoryBot.create(:offering_category)

        # Create the breadcrumbs component
        breadcrumbs = BreadcrumbsComponent.new

        # Add items to the breadcrumbs component
        breadcrumbs.items << BreadcrumbsItemComponent.new(text: "Home")
        breadcrumbs.items << BreadcrumbsItemComponent.new(text: offering_category.category.name)
        breadcrumbs.items << BreadcrumbsItemComponent.new(text: offering_category.offering.name)

        render(breadcrumbs)
      end

      def default_one_depth
        category = FactoryBot.create(:category)

        # Create the breadcrumbs component
        breadcrumbs = BreadcrumbsComponent.new

        # Add items to the breadcrumbs component
        breadcrumbs.items << BreadcrumbsItemComponent.new(text: "Home")
        breadcrumbs.items << BreadcrumbsItemComponent.new(text: category.name)

        render(breadcrumbs)
      end
    end
  end
end
```

A few things to note:

- I'm assuming that the `BreadcrumbsItemComponent` takes a `text` argument to display the breadcrumb text. Adjust this as per your actual component's setup.
- The `<<` operator is used to add items to the `renders_many` association in the `BreadcrumbsComponent`.
- Ensure that your factories (`:offering_category` and `:category`) are correctly set up and can create the necessary records for the preview.

With this setup, you should be able to preview the `BreadcrumbsComponent` with multiple `BreadcrumbsItemComponent` instances.