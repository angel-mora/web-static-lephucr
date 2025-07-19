---
title: Count Hash Values Ruby
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Count Hash Values Ruby

## ✅ TODOs


## 📌 Summary
Count values of all keys across a hash in ruby

## 🧠 Full Chat


Count values of all keys across a hash in ruby 

To count the values of all keys across a hash in Ruby, you have multiple approaches depending on what exactly you need to achieve. Here are two common scenarios and solutions:

### 1. Counting Total Values in a Hash

If you have a hash where each key points to an array of values, and you want to count all the values across all keys, you can use the following approach:

```ruby
# Sample hash
hash = { a: [1, 2, 3], b: [4, 5], c: [6, 7, 8, 9] }

# Counting all the values across all keys
total_values_count = hash.values.flatten.size

puts total_values_count  # Output: 9
```

This code snippet takes the values of the hash, flattens them into a single array (if they are in arrays), and counts the total number of elements.

### 2. Counting Occurrences of Each Value Across All Keys

If you want to count how many times each value appears across all keys in a hash (especially useful if values can repeat across keys), you can do this:

```ruby
# Sample hash
hash = { a: [1, 2, 3], b: [3, 4, 1], c: [1, 5, 3] }

# Count occurrences of each value across all keys
value_counts = hash.values.flatten.each_with_object(Hash.new(0)) { |value, counts| counts[value] += 1 }

puts value_counts
# Output might look like: {1=>3, 2=>1, 3=>3, 4=>1, 5=>1}
```

Here, the code uses `flatten` to merge all array values into one array, and `each_with_object` with `Hash.new(0)` to create a new hash where it counts each occurrence of the values.

Choose the method based on what "count" you need to perform: counting total values or counting occurrences of specific values.