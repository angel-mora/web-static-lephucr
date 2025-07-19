---
title: Rails Query Object Creation
tags:
- require
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Rails Query Object Creation

## ✅ TODOs


## 📌 Summary
Make a rails query object to abstract all the string values inputted in this query

## 🧠 Full Chat


Make a rails query object to abstract all the string values inputted in this query
SELECT
  p.title,
  p.slug,
  p.created_at,
  p.is_published_version,
  v.title,
  v.slug,
  v.created_at
FROM 
  contents c
  JOIN content_duration_types cdt ON cdt.content_id = c.id
  JOIN content_audience_types cat ON cat.content_id = c.id
  JOIN content_competency_types cct ON cct.content_id = c.id
  JOIN content_delivery_method_types cdmt ON cdmt.content_id = c.id
  JOIN duration_types dt ON cdt.duration_type_id = dt.id
  JOIN audience_types at ON cat.audience_type_id = at.id
  JOIN competency_types ct ON cct.competency_type_id = ct.id
  JOIN delivery_method_types dmt ON cdmt.delivery_method_type_id = dmt.id
  LEFT JOIN publications p ON p.id = c.contentable_id AND c.contentable_type = 'Publication'
  LEFT JOIN videos v ON v.id = c.contentable_id AND c.contentable_type = 'Video'
WHERE 
  p.is_published_version = 1
  AND
  (dt.slug = '10m'
  OR at.slug = 'hr-professional'
  OR ct.slug = 'accountable'
  OR dmt.slug = 'elearning-download')
GROUP BY p.id, v.id;

To translate your SQL query into a Rails query object, you'd likely use ActiveRecord's querying capabilities, leveraging `joins`, `where`, and possibly `select` to construct a query that mirrors the SQL you've provided. 

Given the complexity of your joins and conditions, your Rails query might be quite involved. Assuming you have models set up for each of the tables and proper associations between them, here is a possible implementation:

```ruby
# Assuming models: Content, Publication, Video, DurationType, AudienceType,
# CompetencyType, DeliveryMethodType

# Start with the base Content query
query = Content.joins(:duration_types, :audience_types, :competency_types, :delivery_method_types)
               .joins("LEFT JOIN publications p ON p.id = contents.contentable_id AND contents.contentable_type = 'Publication'")
               .joins("LEFT JOIN videos v ON v.id = contents.contentable_id AND contents.contentable_type = 'Video'")
               .select('p.title AS publication_title, p.slug AS publication_slug, p.created_at AS publication_created_at, p.is_published_version, v.title AS video_title, v.slug AS video_slug, v.created_at AS video_created_at')
               .where(p: {is_published_version: true})
               .where('duration_types.slug = ? OR audience_types.slug = ? OR competency_types.slug = ? OR delivery_method_types.slug = ?', '10m', 'hr-professional', 'accountable', 'elearning-download')
               .group('p.id', 'v.id')

# Note: This is a simplification. Depending on your actual model associations, 
# you might need to adjust the joins (e.g., `joins(:content_duration_types)` 
# if you have a `has_many :through` association).

# If you haven't defined direct associations in your Content model for the polymorphic
# relations (contentable pointing to either a Publication or a Video), you might need 
# to manually construct the LEFT JOIN clauses as shown.

# Executing the query will return an ActiveRecord::Relation object which you can then iterate over or further refine.
query.each do |result|
  # Access your selected fields like so:
  # result.publication_title, result.publication_slug, etc.
end
```

This example makes a few assumptions:
- You have defined associations in your Rails models that correspond to the table names and foreign key relationships in your SQL query.
- The `contentable` association in your `Content` model is polymorphic, relating either to a `Publication` or a `Video`.
- You want to select specific fields from the `publications` and `videos` tables when they are present, indicated by the `.select` method usage.

Remember, this is a starting point. You may need to adjust field names and associations based on your actual model definitions and what you aim to achieve with the query. Also, consider optimizing the query for performance depending on the size of your dataset and the indexes available in your database schema.

I want a ruby object and using arel and best practices whenever possible

To construct a complex query using Arel in Rails, focusing on best practices and ensuring maintainability, we'll first outline the associations and models involved. Arel allows for more flexibility and power in crafting SQL queries, but it also requires more verbose syntax compared to ActiveRecord's query interface. Let's assume you have models set up for `Content`, `Publication`, `Video`, and the various types involved (`DurationType`, `AudienceType`, `CompetencyType`, `DeliveryMethodType`), and your associations are properly defined.

Given the complexity of your SQL query, utilizing Arel to its fullest will involve joining multiple tables and applying conditions on the joins, as well as handling the polymorphic association elegantly. Here's how you can start structuring your query:

### 1. Setup Basic Query Structure

First, you define the tables you're going to work with using Arel:

```ruby
content_table = Content.arel_table
publication_table = Publication.arel_table
video_table = Video.arel_table
duration_type_table = DurationType.arel_table
audience_type_table = AudienceType.arel_table
competency_type_table = CompetencyType.arel_table
delivery_method_type_table = DeliveryMethodType.arel_table
```

### 2. Define Joins

Next, construct the join part of the query. Arel makes this verbose, but it's powerful:

```ruby
joins_content_publication = content_table.join(publication_table, Arel::Nodes::OuterJoin)
                                         .on(publication_table[:id].eq(content_table[:contentable_id])
                                         .and(content_table[:contentable_type].eq('Publication')))

joins_content_video = content_table.join(video_table, Arel::Nodes::OuterJoin)
                                   .on(video_table[:id].eq(content_table[:contentable_id])
                                   .and(content_table[:contentable_type].eq('Video')))
```

You'd need to create similar joins for the other associations (`DurationType`, `AudienceType`, `CompetencyType`, `DeliveryMethodType`), ensuring to properly reference foreign keys and table names.

### 3. Add Conditions

With Arel, you can add conditions to your query like so:

```ruby
conditions = publication_table[:is_published_version].eq(true)
               .or(duration_type_table[:slug].eq('10m'))
               .or(audience_type_table[:slug].eq('hr-professional'))
               .or(competency_type_table[:slug].eq('accountable'))
               .or(delivery_method_type_table[:slug].eq('elearning-download'))
```

### 4. Select Fields

You'll specify which fields to select from the joined tables:

```ruby
selects = [
  publication_table[:title].as('publication_title'),
  publication_table[:slug].as('publication_slug'),
  # Add other fields you need to select similarly
]
```

### 5. Build the Complete Query

Now, compile all parts into a complete Arel query. This step combines joins, selects, and conditions:

```ruby
query = content_table
        .project(*selects)
        .join(joins_content_publication.join_sources)
        .join(joins_content_video.join_sources)
        # Include other joins
        .where(conditions)
        .group(publication_table[:id], video_table[:id])
```

### 6. Execute the Query

Finally, you'd execute the query:

```ruby
results = Content.find_by_sql(query.to_sql)
```

### Notes and Best Practices

1. **Maintainability**: While Arel is powerful, it can lead to complex and hard-to-read code. Ensure your code is well-commented, and use ActiveRecord methods where they can achieve the same result with clearer syntax.
2. **Performance**: Complex queries can be slow. Use `.explain` to check the query plan and optimize indexes in your database as needed.
3. **Security**: Arel will handle most SQL injection risks for you, but always be cautious with user input.
4. **Testing**: Complex queries should be thoroughly tested, both for correctness and performance.

This example provides a foundation. You'll need to adjust it to match your specific associations and requirements, and to include all the necessary joins and conditions for your query.

module LearningContent
  class ContentQuery < Patterns::Query
    queries Content

    def query(
        audience_types = nil,
        competency_types = nil,
        duration_types = nil,
        delivery_method_types = nil
      )
      relation
        .joins(
          :audience_types,
          :competency_types,
          :duration_type,
          :delivery_method_type
        )
        .left_joins(:publication, :video)
        .merge(Publication.published_version)
        .by_audience(audience_type_ids)
        .by_competency(competency_type_ids)
        .by_duration(duration_type_ids)
        .by_delivery_method(delivery_method_type_ids)
        .select(
          Publication[:title],
          Publication[:slug],
          LearningContent::AudienceType[:name],
          LearningContent::CompetencyType[:name],
          LearningContent::DeliveryMethodType[:name],
          LearningContent::DurationType[:name]
        )
    end

    def self.by_audience(types)
      where(LearningContent::AudienceType[:slug] = types) if types.present?
    end

    def self.by_competency(types)
      where(LearningContent::CompetencyType[:slug] = types) if types.present?
    end

    def self.by_duration(types)
      where(LearningContent::DurationType[:slug] = types) if types.present?
    end

    def self.by_delivery_method(types)
      where(LearningContent::DeliveryMethodType[:slug] = types) if types.present?
    end

    def audience_type_ids
      options.fetch(audience_type_ids)
    end

    def competency_type_ids
      options.fetch(competency_type_ids)
    end

    def delivery_method_type_ids
      options.fetch(delivery_method_type_ids)
    end

    def duration_type_ids
      options.fetch(duration_type_ids)
    end
  end
end

# LearningContent::ContentQuery.call(audience_type_ids: [16])
 #.or(LearningContent::CompetencyType.where(slug: 'accountable'))
 #.or(LearningContent::DurationType.where(slug: '10m'))
 #.or(LearningContent::DeliveryMethodType.where(slug: 'elearning-download' ))

irb(main):012:0> LearningContent::ContentQuery.call(audience_types: [16,19])
app/queries/learning_content/content_query.rb:51:in `audience_type_ids': stack level too deep (SystemStackError)
irb(main):013:0> 

It looks like you're trying to create a query object in Rails using a pattern that abstracts away the query logic into a separate, reusable class. This is a great approach for maintaining clean code and reusability, especially for complex queries. However, there are some issues and improvements that can be addressed in your code:

1. **Stack Level Too Deep Error**: This error is likely due to the recursive calling of methods like `audience_type_ids` without a base case to stop the recursion. It seems like there's an attempt to fetch options that are not defined or incorrectly referenced.

2. **Assignment vs. Equality in `where` Clauses**: In your `by_audience`, `by_competency`, `by_duration`, and `by_delivery_method` methods, you're using a single equals sign (`=`), which is for assignment, instead of double equals (`==`) for comparison, or using the correct ActiveRecord syntax for `where` clauses.

3. **Usage of Symbols vs. Strings in Select**: When specifying columns in the `.select` method, you should ensure that the column names are strings if you're specifying them directly or using the table name as a symbol followed by the column name.

4. **Parameter Names Mismatch**: Your method parameters in the `query` method do not match when you're trying to fetch them later in the method. This will lead to `NameError` or unexpected behavior.

5. **Improvement on Filtering Logic**: Your current implementation does not dynamically apply filters based on input. Instead, it tries to fetch them directly which might not work as expected.

Here's a revised version addressing these issues:

```ruby
module LearningContent
  class ContentQuery < Patterns::Query
    queries Content

    def initialize(options = {})
      @options = options
    end

    def query
      relation
        .joins(:audience_types, :competency_types, :duration_types, :delivery_method_types)
        .left_joins(:publication, :video)
        .merge(Publication.published_version)
        .where(audience_types: { id: audience_type_ids })
        .where(competency_types: { id: competency_type_ids })
        .where(duration_types: { id: duration_type_ids })
        .where(delivery_method_types: { id: delivery_method_type_ids })
        .select('publications.title, publications.slug, audience_types.name AS audience_name, competency_types.name AS competency_name, delivery_method_types.name AS delivery_method_name, duration_types.name AS duration_name')
    end

    private

    attr_reader :options

    def audience_type_ids
      options[:audience_types] || []
    end

    def competency_type_ids
      options[:competency_types] || []
    end

    def duration_type_ids
      options[:duration_types] || []
    end

    def delivery_method_type_ids
      options[:delivery_method_types] || []
    end
  end
end
```

Key Changes:

- Added an `initialize` method to store the options hash.
- Fixed the methods for fetching the IDs from options, ensuring they default to an empty array if not present.
- Corrected the `where` clauses to use proper ActiveRecord querying syntax.
- Simplified `select` syntax and ensured the column names are correctly referenced.

To call your query object, you can now use:

```ruby
LearningContent::ContentQuery.new(audience_types: [16, 19]).query
```

This refactoring ensures that your query object is more robust, easier to read, and correctly applies the filtering based on the passed options.

pass scope to selleo::patterns query relation in rails causes an error for where not functional with the relation

When integrating custom scopes or conditions within a query object structure, especially when using a pattern like Selleo's `Patterns::Query`, it's important to ensure that scopes and query methods are correctly applied to ActiveRecord relations. If you're encountering an error where the `where` method is not functioning as expected with a relation, it might be due to how the relation and scopes are being passed or invoked within your query object.

The `Patterns::Query` pattern is designed to encapsulate complex queries within a service object, promoting reuse and keeping controllers and models cleaner. However, details on integrating custom scopes directly within this pattern can vary depending on the implementation of `Patterns::Query`. Assuming a generic implementation, here are some adjustments and considerations:

### Ensuring Compatibility with ActiveRecord Relations

1. **Initialization with Scope**: Make sure your query object initializes with a scope or relation that is compatible with ActiveRecord's querying methods. This typically means starting with a base model class or an existing scope from that model.

   ```ruby
   def initialize(relation = Content.all)
     @relation = relation.extending(Scopes)
   end
   ```

   Here, `Scopes` would be a module containing your custom scopes, ensuring they're applied to the relation.

2. **Applying Scopes within Query Methods**: When defining your query methods, apply conditions and scopes directly to `@relation`. Ensure these methods return `self` or the modified relation to maintain chainability.

   ```ruby
   module Scopes
     def self.by_audience(audience_ids)
       where(audience_types: { id: audience_ids })
     end
   end

   def by_audience(audience_ids)
     @relation = @relation.by_audience(audience_ids) if audience_ids.present?
     self
   end
   ```

3. **Handling Errors with `where`**: If you encounter issues with `where` not being recognized, it's likely due to one of the following reasons:

   - The relation you're starting with does not correctly reference an ActiveRecord model or scope.
   - There's a mismatch in the expected arguments or structure of the scopes you're trying to apply.
   - The initialization of `@relation` is not done correctly, or the relation has been overwritten or corrupted by subsequent operations.

4. **Debugging and Testing**: To troubleshoot, start by isolating the issue:
   
   - Test the scopes independently in a Rails console to ensure they work as expected.
   - Add debug output to inspect the state of `@relation` before and after applying scopes or conditions.
   - Ensure that any modules or methods you're extending or including in your relation are correctly defined and accessible.

5. **Example Adjustment**:

   If your `Patterns::Query` implementation supports it, ensure your query methods are correctly chaining conditions and returning the modified relation or the query object itself for further chaining.

   ```ruby
   def query
     scope = relation
     scope = scope.by_audience(audience_type_ids) if audience_type_ids.present?
     scope = scope.by_competency(competency_type_ids) if competency_type_ids.present?
     # Apply other conditions
     scope
   end
   ```

   This ensures that each step modifies the `scope` in a way that's compatible with ActiveRecord's expectations.

### Conclusion

Without specific details on the error message or the exact implementation of `Patterns::Query` you're using, the above suggestions are based on general best practices for structuring query objects in Rails. Ensure your custom scopes and query methods are defined in a way that's compatible with ActiveRecord relations, and pay close attention to how you're initializing and modifying those relations within your query object.

This is how it looks like

module LearningContent
  class ContentQuery < Patterns::Query
    queries Content

    def query(
        audience_types = nil,
        competency_types = nil,
        duration_types = nil,
        delivery_method_types = nil
      )
      relation
        .joins(
          :audience_types,
          :competency_types,
          :duration_type,
          :delivery_method_type
        )
        .left_joins(:publication, :video)
        #.merge(Publication.published_version)
        require 'pry'; binding.pry
        .by_audience(audience_type_ids)
        .by_competency(competency_type_ids)
        .by_duration(duration_type_ids)
        .by_delivery_method(delivery_method_type_ids)
        .select(
          Publication[:title],
          Publication[:slug],
          LearningContent::AudienceType[:name],
          LearningContent::CompetencyType[:name],
          LearningContent::DeliveryMethodType[:name],
          LearningContent::DurationType[:name]
        )
    end

    def by_audience(types)
      require 'pry'; binding.pry
      where(LearningContent::AudienceType[:slug] = types) if types.present?
    end

    def self.by_competency(types)
      where(LearningContent::CompetencyType[:slug] = types) if types.present?
    end

    def self.by_duration(types)
      where(LearningContent::DurationType[:slug] = types) if types.present?
    end

    def self.by_delivery_method(types)
      where(LearningContent::DeliveryMethodType[:slug] = types) if types.present?
    end

    def audience_type_ids
      #require 'pry'; binding.pry
      options[:audience_type_ids]
    end

    def competency_type_ids
      options.fetch(competency_type_ids)
    end

    def delivery_method_type_ids
      options.fetch(delivery_method_type_ids)
    end

    def duration_type_ids
      options.fetch(duration_type_ids)
    end
  end
end

# LearningContent::ContentQuery.call(audience_type_ids: [16])
 #.or(LearningContent::CompetencyType.where(slug: 'accountable'))
 #.or(LearningContent::DurationType.where(slug: '10m'))
 #.or(LearningContent::DeliveryMethodType.where(slug: 'elearning-download' ))


Based on the provided module definition, there are several issues and areas for improvement that need to be addressed to make the `ContentQuery` class functional. Here's a breakdown of the key points and how to resolve them:

### 1. Scope Method Definitions

The scope methods (`by_audience`, `by_competency`, `by_duration`, `by_delivery_method`) are defined inconsistently between instance and class methods. All these methods should be consistently defined, preferably as instance methods if they're intended to modify the instance's `relation`. Moreover, the use of assignment (`=`) instead of comparison (`==`) in the `where` clauses is incorrect.

### 2. Method Calls Within Query

In the `query` method, you're attempting to call scope methods like `by_audience`. For this to work as intended, these methods need to be instance methods because they operate on the instance's `relation`. Additionally, they need to return the modified relation to chain further.

### 3. Incorrect Use of ActiveRecord::Relation Methods

The use of square brackets with model names (e.g., `Publication[:title]`) is incorrect for specifying fields in the `select` method. You should use strings or symbols to refer to column names.

### 4. Fetching Options

The way options are fetched in methods like `competency_type_ids`, `delivery_method_type_ids`, and `duration_type_ids` is incorrect. The `fetch` method is used improperly, leading to potential errors. You should directly access the options using the hash syntax.

### Revised Code:

Below is a revised version of your module with corrections:

```ruby
module LearningContent
  class ContentQuery < Patterns::Query
    queries Content

    def initialize(options = {})
      super
      @options = options
    end

    def query
      relation
        .joins(:audience_types, :competency_types, :duration_types, :delivery_method_types)
        .left_joins(:publication, :video)
        .then { |rel| by_audience(rel) }
        .then { |rel| by_competency(rel) }
        .then { |rel| by_duration(rel) }
        .then { |rel| by_delivery_method(rel) }
        .select(
          'publications.title, publications.slug, audience_types.name, competency_types.name, delivery_method_types.name, duration_types.name'
        )
    end

    private

    def by_audience(relation)
      types = options[:audience_types]
      types.present? ? relation.where(audience_types: { id: types }) : relation
    end

    def by_competency(relation)
      types = options[:competency_types]
      types.present? ? relation.where(competency_types: { id: types }) : relation
    end

    def by_duration(relation)
      types = options[:duration_types]
      types.present? ? relation.where(duration_types: { id: types }) : relation
    end

    def by_delivery_method(relation)
      types = options[:delivery_method_types]
      types.present? ? relation.where(delivery_method_types: { id: types }) : relation
    end
  end
end
```

### Key Changes:

- Scope methods are now instance methods and correctly modify and return the relation.
- Fixed how options are accessed within instance methods.
- Corrected the syntax for specifying fields in the `select` method.
- Used the `.then` method (Ruby 2.6+) for chaining modifications to the relation in a more readable way. Alternatively, you could chain the methods directly if they're guaranteed to always return a relation.
- Added an `initialize` method to properly set up `@options` from passed arguments, ensuring it works well with `Patterns::Query`'s structure.

This revised version should address the functional issues and improve the readability and maintainability of your query object.

How can I see the outputs of an active record relation



Viewing the outputs of an ActiveRecord relation in Ruby on Rails can be crucial for debugging and understanding what your database queries are actually doing. Here are some methods you can use to inspect the outputs of an ActiveRecord relation:

### 1. Using `to_sql`
The `to_sql` method on an ActiveRecord relation returns the SQL statement that will be executed but does not execute the query. It's very useful for debugging or when you want to see what SQL is generated by complex ActiveRecord queries.

```ruby
puts User.where(name: 'Alice').to_sql
# Output: SELECT "users".* FROM "users" WHERE "users"."name" = 'Alice'
```

### 2. Executing the Query
To actually see the results of the query, you can execute it by using methods like `all`, `first`, `last`, or simply iterating over it.

```ruby
users = User.where(name: 'Alice').all
users.each do |user|
  puts user.name
end
```

### 3. Logging
Rails automatically logs all SQL queries to the development log (typically `log/development.log`). You can tail this log in a terminal to see queries executed by Rails:

```sh
tail -f log/development.log
```

### 4. Using `inspect`
You can use `inspect` to output the contents of the entire ActiveRecord relation object:

```ruby
puts User.where(name: 'Alice').inspect
```

This will execute the query and print a human-readable representation of the result set.

### 5. Using `pluck`
If you are only interested in specific columns, you can use `pluck` to retrieve just those columns. This can be more efficient than loading full model instances.

```ruby
names = User.where(active: true).pluck(:name)
puts names.inspect
```

### 6. Using Rails Console
Running the Rails console (`rails console` or `rails c` for short) is a great way to experiment with ActiveRecord queries interactively:

```ruby
User.where(name: 'Alice').each do |user|
  puts user.name
end
```

### 7. Debugging with `pry`
If you have `pry` installed and included in your Gemfile, you can insert `binding.pry` within your code to open up a debugging session at that point:

```ruby
def some_method
  relation = User.where(name: 'Alice')
  binding.pry  # Execution will pause here, allowing you to inspect `relation`
end
```

When execution hits the `binding.pry` line, you can manually type `relation.to_sql` to see the SQL, or just `relation` to execute the query and display the results interactively.

### 8. Using Rails' Logger
You can log any output directly to Rails' logger to check it without using `puts`:

```ruby
Rails.logger.debug User.where(name: 'Alice').to_sql
```

This will output the SQL to your Rails log, which is especially useful in production environments where standard output may not be visible.

Each of these methods can help you better understand how ActiveRecord is constructing and executing database queries, assisting in debugging and optimizing your application.

So when I call this I get only a relation containing multiple records from a model but no actual data. How can I see the results of the query?

When you execute an ActiveRecord query in Rails and get a relation object, it means the query has not yet been executed due to ActiveRecord's lazy loading feature. The query itself is only sent to the database when you specifically request data from the database, such as by iterating over the results, calling a method that fetches data (like `all`, `first`, `to_a`), or using data access methods that require actual data retrieval (like `each`, `map`, or `pluck`).

Here are several ways to see the results of the query and thus force ActiveRecord to execute the SQL and fetch the data:

### 1. Fetching All Records
Using `.all` will fetch all records matching the query and return them in an array-like object:

```ruby
users = User.where(name: 'Alice').all
puts users.inspect
```

### 2. Using Data-Loading Methods
Methods like `each`, `map`, `find_each` (for batch processing), `first`, `last`, etc., will execute the query and allow you to work with the data:

```ruby
User.where(name: 'Alice').each do |user|
  puts user.name
end
```

### 3. Using `to_a`
Converts the relation to an array, thus executing the query:

```ruby
users = User.where(name: 'Alice').to_a
puts users.inspect
```

### 4. Single Record Fetching
Methods like `first` and `last` retrieve only the first or last record:

```ruby
user = User.where(name: 'Alice').first
puts user.name if user.present?
```

### 5. Using `find_by`
This method retrieves the first record that meets the condition. It immediately executes the query:

```ruby
user = User.find_by(name: 'Alice')
puts user.name if user.present?
```

### 6. Using `pluck` for Specific Columns
If you only need specific fields, `pluck` can be used to fetch them directly without loading entire model instances:

```ruby
names = User.where(active: true).pluck(:name)
puts names.inspect
```

### 7. Debugging with Inspect
You can use `inspect` to print the loaded records in the console. It forces query execution when you inspect the relation:

```ruby
puts User.where(name: 'Alice').inspect
```

### 8. Using Aggregates
Aggregation functions like `count`, `sum`, `average`, etc., will also execute the query:

```ruby
count = User.where(active: true).count
puts count
```

### Practical Usage in Rails Console
One practical approach to test and see data during development is using the Rails console (`rails console`). It allows you to execute these commands interactively and see the results immediately. For example:

```ruby
# In your Rails console
users = User.where(name: 'Alice')
users.each { |user| puts user.name }
```

### Remember
The reason ActiveRecord waits to execute the query is to optimize the number of requests to the database, allowing you to chain multiple conditions or selections before making a database call. This feature, known as lazy loading, is useful for building efficient, dynamic queries based on conditional logic. However, when you're ready to use the data, you'll need to use one of the methods above to force ActiveRecord to hit the database and retrieve it.