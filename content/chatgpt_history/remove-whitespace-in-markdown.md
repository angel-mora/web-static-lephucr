---
title: Remove Whitespace in Markdown
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  regex to remove whitespaces between lists in markdown
  in vscode. E.g."
draft: false
---

# Remove Whitespace in Markdown

## 🧠 Full Chat

🙋 **You:**

regex to remove whitespaces between lists in markdown in vscode. E.g.

- STRING

- String 2

to:

- STRING
- String 2

---

🤖 **Assistant:**

To remove the whitespaces between lists in markdown using regex, you can make use of the "Find and Replace" feature in VSCode. Here's what you can do:

1. Open the Find and Replace panel by pressing `Ctrl + F` (or `Cmd + F` on macOS) and then `Ctrl + H` to switch to replace mode.
  
2. Make sure the regex option is enabled (it's the `.*` button in the Find panel).

3. In the "Find" box, enter the following regex pattern:
```
\n\n(- )
```

4. In the "Replace" box, enter the following:
```
\n$1
```

5. Click "Replace All" (or individually replace each match).

What this does:

- The regex pattern `\n\n(- )` looks for two newline characters followed by a dash and a space (which signifies the start of a markdown list item).

- The replacement pattern `\n$1` replaces the match with just one newline character and the markdown list item symbol.

This will effectively remove the additional whitespace between list items.

---

🤖 **Assistant:**

You can use the following regular expression to search for and remove unnecessary whitespace between list items in markdown within Visual Studio Code:

**Find:**
```
^-\s.*\n\n(?=-)
```

**Replace:**
```
$0\n
```

Here's a breakdown of the regex:

1. `^`: asserts the start of a line.
2. `-\s`: matches a dash followed by a space, which is typical for a markdown list item.
3. `.*`: matches any character (except for a newline) zero or more times.
4. `\n\n`: matches two newlines in a row.
5. `(?=-)`: a positive lookahead that checks for a dash on the next line but doesn't consume any characters.

In the replace pattern, `$0` refers to the entire matched string, and we're simply appending a single newline to it.

You can use the "Find" and "Replace" functionality in Visual Studio Code to apply this regular expression. Make sure to turn on the "Regular Expression" option (which usually looks like a `.*` symbol) in the search box before applying the regex.

---

🙋 **You:**

i want to get rid of that \n matched, not add a new one

---

🤖 **Assistant:**

My apologies for misunderstanding your request. If you want to remove the extra newline between the list items, you can modify the regex accordingly.

Here's the correct approach:

**Find:**
```
^-\s.*\n\n(?=-)
```

**Replace:**
```
$0
```

With this approach, you're essentially replacing the entire matched string (which includes the extra newline) with itself minus the extra newline.

---

🙋 **You:**

didn't remove the extra line

---

🤖 **Assistant:**

I apologize for the oversight.

Let's try another approach. The idea is to match a list item followed by two newlines and a dash, and replace it with the list item followed by just one newline and a dash.

**Find:** 
```
(-\s.*)(\n\n)(?=-)
```

**Replace:** 
```
$1\n
```

Explanation:

1. `(-\s.*)`: Capturing group to match a list item. The `-` is the markdown bullet, followed by space and then any character for the rest of the line.
2. `(\n\n)`: Matches two newlines.
3. `(?=-)`: Positive lookahead that ensures the next character is a dash `-` (indicating the start of another list item).

In the replace pattern, `$1` refers to the first capturing group, i.e., the list item itself.

Make sure you have the "Regular Expression" option enabled in Visual Studio Code's search when applying this regex.