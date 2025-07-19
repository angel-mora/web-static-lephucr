---
title: Handling Multiple Block Parameters
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Handling Multiple Block Parameters

## ✅ TODOs
- [ ] this is with the `each_with_index` method.

## 📌 Summary
How to know which enumerables Can handle multiple args under the pipes in the block. E.g. |key,value,else|

## 🧠 Full Chat


How to know which enumerables Can handle multiple args under the pipes in the block. E.g. |key,value,else|

In Ruby, some enumerables can handle multiple block parameters (i.e., multiple variables between pipes `| |`). Whether an enumerable can handle multiple arguments depends on the structure of the elements being enumerated.

For enumerables that iterate over arrays of arrays or hashes, multiple block parameters can be used:

1. **Hashes**:
   When you iterate over a hash with methods like `each`, each element is an array where the first element is the key and the second is the value. You can use two block parameters to capture these.

   ```ruby
   hash = {a: 1, b: 2}
   hash.each do |key, value|
     puts "#{key} => #{value}"
   end
   ```

2. **Arrays of arrays**:
   You can destructure arrays of arrays using multiple block parameters.

   ```ruby
   array = [[1, 'one'], [2, 'two']]
   array.each do |number, name|
     puts "#{number} is #{name}"
   end
   ```

To know if an enumerable can handle multiple block parameters:

1. **Inspect the element**:
   Check the structure of the elements being enumerated. If they're arrays with multiple items or hashes, you can likely use multiple block parameters.

2. **Experiment**:
   Try to use multiple block parameters and see if Ruby raises an error or if the behavior is as expected.

3. **Documentation**:
   Refer to the official Ruby documentation for the specific enumerable method. It'll typically provide information on the structure of the elements yielded to the block.

In the case of `|key, value, else|`, you're specifying three block parameters. There aren't any common Ruby enumerables that naturally yield three parameters. However, if you had an array of arrays where each inner array had three elements, this would work:

```ruby
array_of_triplets = [[1, 'a', '!'], [2, 'b', '@']]
array_of_triplets.each do |num, char, symbol|
  puts "#{num}, #{char}, #{symbol}"
end
```

In this example, `num` would capture the integer, `char` the character, and `symbol` the symbol.

Can I represent the index as an argument in the pipe?

Yes, many enumerable methods in Ruby provide the option to also access the index of the current element during iteration. The most direct way to do this is with the `each_with_index` method.

Here's how you can represent both the element and its index as arguments in the block:

```ruby
array = ["a", "b", "c"]
array.each_with_index do |element, index|
  puts "#{index}: #{element}"
end
```

Output:
```
0: a
1: b
2: c
```

For hashes, it works similarly:

```ruby
hash = {a: 1, b: 2, c: 3}
hash.each_with_index do |(key, value), index|
  puts "#{index}: #{key} => #{value}"
end
```

Output:
```
0: a => 1
1: b => 2
2: c => 3
```

Notice the use of parentheses around `(key, value)`. This is because each element of a hash is an array of two items: the key and the value. The parentheses are used to destructure this array into two separate variables.

By using `each_with_index`, you can easily represent both the element and its index (or key-value pair and its index in the case of a hash) in the block.