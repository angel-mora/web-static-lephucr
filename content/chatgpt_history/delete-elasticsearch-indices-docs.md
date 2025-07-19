---
title: Delete Elasticsearch Indices & Docs
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Delete Elasticsearch Indices & Docs

## ✅ TODOs


## 📌 Summary
How can I delete a record by company? Im trying to

## 🧠 Full Chat


How can I delete a record by company? Im trying to
ElasticIndexer.new.send(:client).get(index: 'mypolicies-production-documents-133-demo15_3ecd71257d97895d9946dbda4d3df5f6', id: 1)

This is the service:
# frozen_string_literal: true

require 'optparse'

class ElasticIndexer
  MAX_COMPANY_BATCH_SIZE = 10
  MAX_BATCH_SIZE = 50

  def initialize(klass = Document)
    @klass = klass
    @klass = @klass.constantize if @klass.is_a?(String)
    @klass_filtered_fields = @klass::ES_FIELDS
  end

  def self.schedule_reindex_all
    Company.without_system_company
           .select(:id)
           .find_in_batches(batch_size: MAX_COMPANY_BATCH_SIZE) do |companies|
              ReindexWorker.perform_async({
                company_ids: companies.collect(&:id)
              }.stringify_keys)
           end
  end

  def reindex
    Rails.logger.tagged('ElasticIndexer', 'Reindex') do
      Rails.logger.info(
        "\n\nStarting reindex for company #{ActsAsTenant.current_tenant.id}\nCreate and map all documents to: #{new_index}"
      )
      create_index!
      bulk_index_documents
      delete_old_indexes_and_aliases
      add_alias_to_new_index!
      report_errors if @errors.present?
      Rails.logger.info("\nFinished Reindex for company #{ActsAsTenant.current_tenant.id}")
    end
  end

  def index(record_id, operation = 'index')
    Rails.logger.tagged('ElasticIndexer', operation.titleize) do
      create_index_unless_exists!
      pipeline_args = { pipeline: :attachment } unless operation == 'delete'
      @klass.with_deleted.find_by(id: record_id)&.__elasticsearch__&.send("#{operation}_document", pipeline_args || {})
    end
  end

  def update(record_id)
    index(record_id, 'update')
  end

  def delete(record_id)
    index(record_id, 'delete')
  end

  private

  def document_index
    @klass.index_name
  end

  def client
    return @client if @client

    @client = @klass.__elasticsearch__.client
    @client.transport.logger.level = Rails.env.development? ? Logger::DEBUG : Logger::FATAL
    @client
  end

  def create_index_unless_exists!
    return if client.indices.exists? index: document_index

    Rails.logger.info("Creating #{new_index} with #{document_index} because it didn't exist.")
    create_index!
    add_alias_to_new_index!
  end

  def new_index
    @new_index ||= "#{document_index}_#{SecureRandom.hex}"
  end

  def create_index!
    @klass.__elasticsearch__.create_index!(index: new_index)
  end

  def bulk_index_data_slice(data_items, slice_size = nil)
    slice_size ||= data_items.count
    data_items.each_slice(slice_size) do |data_items_slice|
      Rails.logger.info("Indexing #{data_items_slice.count} of #{data_items.count} documents")
      begin
        collect_errors_if_any do
          client.bulk(index: new_index, body: data_items_slice, pipeline: :attachment)
        end
        Rails.logger.info('- [PASS]')
      rescue StandardError
        Rails.logger.info("- [FAIL] Document \##{data_items_slice.first.dig(:index, :_id)}") && break if slice_size <= 1
        Rails.logger.info('- [FAIL] Reducing count and attempting to reindex')
        bulk_index_data_slice(data_items_slice, (slice_size / 2.0).round)
      end
    end
  end

  def bulk_index_documents
    @klass.all
          .includes(@klass.included_relations.keys)
          .select([:id] + @klass::ES_FIELDS)
          .find_in_batches(batch_size: MAX_BATCH_SIZE) do |objects|
      Rails.logger.info("Fetching #{objects.count} items and their respective fields")
      bulk_index_data_slice(objects.map { |item| { index: { _id: item.id, data: item.as_indexed_json } } })
    end
  end

  def delete_old_index(name)
    Rails.logger.info("Deleting old index #{name}")
    client.indices.delete(index: name)
  rescue StandardError
    Rails.logger.warn("No index for: #{name}")
  end

  def delete_alias(index)
    Rails.logger.info("Deleting old aliases connected to #{index}")
    client.indices.delete_alias(index)
  rescue StandardError
    Rails.logger.warn("No alias found for: #{index[:name]}")
  end

  def old_indices
    client.indices.get_alias(name: document_index).map do |key, val|
      { index: key, name: val['aliases'].keys.first }
    end
  rescue StandardError
    Rails.logger.warn("No indexes found with alias: #{document_index}")
    {}
  end

  def delete_old_indexes_and_aliases
    old_indices.each do |index|
      delete_alias(index)
      delete_old_index(index[:index])
    end
  end

  def add_alias_to_new_index!
    Rails.logger.info("Aliasing #{new_index} with #{document_index}")
    client.indices.put_alias(index: new_index, name: document_index)
  end

  def collect_errors_if_any
    yield.tap do |response_hsh|
      if response_hsh&.[]('errors')
        @errors ||= []
        @errors +=
          response_hsh['items']
          .select { |values| values.key?('error') }
          .map { |values| { document_id: values['_id'], status: values['status'], error: values['error'] } }
      end
    end
  end

  def report_errors(method: 'reindex')
    Rails.logger.error(
      LogEntry.new(
        description: 'Failed to index document(s) for company.',
        category: self.class,
        extra_details: {
          company_id: ActsAsTenant.current_tenant.id,
          method: method,
          errors: @errors
        }
      )
    )
  end
end

I want to delete all the records that match the pattern 'mypolicies-production-documents-133-* to delete the indices, how can I do it? Provide answer and then explain

To delete all records that match the pattern `mypolicies-production-documents-133-*` in Elasticsearch, you need to perform a few steps:

1. **Delete by Query**: Use the "delete by query" API to delete documents that match a certain condition. This is useful when you want to delete documents based on document content rather than deleting an entire index.

2. **Delete Indices Matching Pattern**: If you want to delete entire indices that match a certain pattern, use the indices delete API with a pattern.

Here's how you can implement these steps in your `ElasticIndexer` service:

### Delete by Query (for documents)

If you wish to delete specific documents across all indices that match the pattern `mypolicies-production-documents-133-*`, you can use the `delete_by_query` method. However, this requires you to specify the condition for deletion based on the document content, not just the index name.

```ruby
def delete_by_query
  pattern = 'mypolicies-production-documents-133-*'
  query = {
    # Define your query here. Example: match all documents
    match_all: {}
  }
  client.delete_by_query(index: pattern, body: { query: query })
end
```

### Delete Indices Matching Pattern

To delete entire indices that match a specific pattern, use the following method:

```ruby
def delete_indices_by_pattern
  pattern = 'mypolicies-production-documents-133-*'
  client.indices.delete(index: pattern)
rescue Elasticsearch::Transport::Transport::Errors::NotFound => e
  Rails.logger.warn("No indices found matching pattern: #{pattern}")
end
```

### Explanation

- **Delete by Query**: This method allows you to selectively delete documents from indices that match a certain pattern. It's useful when you don't want to delete the whole index but just some documents based on their content.

- **Delete Indices**: This method is more straightforward and deletes entire indices that match the given pattern. It's a bulk operation and should be used with caution, as it will remove all data in these indices.

You can integrate these methods into your `ElasticIndexer` service and call them as needed. Remember to handle exceptions and logging appropriately, as these operations can have significant impacts on your Elasticsearch data.

Is it possible to put the and inside the slug conditions?
 @company.settings.exists?(slug: 'search') && @company.settings.exists?(slug: 'disabled')

Yes, it's possible to consolidate your conditions into a single query, but it requires a slightly different approach. In the code snippet you provided:

```ruby
@company.settings.exists?(slug: 'search') && @company.settings.exists?(slug: 'disabled')
```

This checks if there exist settings with slugs 'search' and 'disabled' for a given company, but it does two separate database queries. To check for the existence of both conditions in a single query, you would typically use a query that can handle multiple conditions. However, with ActiveRecord and the way SQL works, checking for the existence of two different rows with a single query isn't straightforward because SQL queries operate on a row-by-row basis.

One approach is to use two separate queries and then compare the results in Ruby, which is what your current code does. This is simple and works well, especially if you don't expect a large number of settings per company.

However, if you're looking for a more efficient way and you have only a small set of possible slugs to check, you might use a query that fetches all relevant settings and then checks their presence in Ruby. For example:

```ruby
relevant_slugs = ['search', 'disabled']
settings = @company.settings.where(slug: relevant_slugs).pluck(:slug)
required_conditions_met = relevant_slugs.all? { |slug| settings.include?(slug) }
```

In this example, you fetch all settings with the relevant slugs in one query and then check if all required slugs are present in the resulting array. This reduces the database load to a single query, which is more efficient, but moves some of the computational work to Ruby. This approach is typically more efficient when the number of `relevant_slugs` is small and manageable. 

Remember, the best approach can vary based on the specifics of your application, such as the size of the data, the database load, and the frequency of these queries.