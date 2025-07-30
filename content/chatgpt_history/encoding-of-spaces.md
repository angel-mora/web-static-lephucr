---
title: Encoding of spaces.
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  why some urls have space and some others an encoding
  like %20% to represent the space? What's that encoding usually?"
draft: false
---

# Encoding of spaces.

## 🧠 Full Chat

🙋 **You:**

why some urls have space and some others an encoding like %20% to represent the space? What's that encoding usually?

---

🤖 **Assistant:**

URLs cannot directly include spaces due to the technical specifications of the web. When you see a space in a URL, it is often visually simplified for readability, but in the actual HTTP request, the space is encoded. The encoding of spaces (and other special characters) in URLs is part of URL encoding, or "percent encoding," where certain characters are replaced by a percent symbol (%) followed by two hexadecimal digits that represent the character's ASCII code.

For a space, the encoding is `%20`. This is because the ASCII code for a space is 32, which is 20 in hexadecimal. URL encoding is used to handle characters that have special meanings in URLs or are not allowed in URLs. It ensures that the web server can interpret the intended characters correctly without misinterpreting them as part of the URL structure.

The reasons some URLs might visually display spaces while others show the encoding can vary:
- Some user interfaces, such as web browsers, may display the space for readability while still encoding it as `%20` in the actual request.
- The encoding might be shown in environments that display the raw URL (like some text editors or terminal windows).
- Consistency with encoding practices might vary across different applications or services, leading to differences in how URLs are presented or stored.

In essence, whenever a URL is actually used in a web request, spaces are encoded as `%20`, even if what you see in your browser's address bar is a plain space for ease of reading.

---

🙋 **You:**

difference between or and || in ruby

---

🤖 **Assistant:**

In Ruby, both `or` and `||` are used to perform logical OR operations, but there are key differences in their behavior and precedence that affect how they're used in code.

### Precedence

The most significant difference between `or` and `||` is their precedence, which is how tightly they bind to the expressions around them.

- `||` has higher precedence than `or`.
- This means `||` binds more tightly to the expressions immediately around it than `or` does.

Because of this difference in precedence, `||` is usually used in conditional expressions, while `or` is often reserved for control flow.

### Example

Consider the following examples to see how precedence affects the evaluation:

```ruby
a = false || true
# a is true because || has higher precedence, so the assignment happens after the || operation

b = false or true
# b is false because or has lower precedence, so the assignment to b happens before the or operation
```

In the first example, `a` is set to `true` because the `||` operation is evaluated before the assignment. In the second example, `b` gets assigned `false` before the `or` operation is considered, due to the lower precedence of `or`.

### Usage

Due to these differences:

- `||` is preferred when you're working with boolean expressions and conditions.
- `or` is more suited for control flow purposes, such as in `raise 'Error' or return` where it reads more naturally and the lower precedence is beneficial.

### Best Practice

In practice, it's recommended to use `||` for logical operations within conditions and expressions because its higher precedence makes it more predictable in complex expressions. The `or` keyword is best reserved for simple, readability-focused control flow where its lower precedence and readability can be used to your advantage without causing unintended side effects.