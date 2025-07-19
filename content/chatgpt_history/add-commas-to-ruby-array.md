---
title: Add Commas to Ruby Array
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Add Commas to Ruby Array

## ✅ TODOs


## 📌 Summary
[

## 🧠 Full Chat


[
   32   ┆ ┆ ┆ 'No.'
>> 33   ┆ ┆ ┆ 'Offering'
-- 34   ┆ ┆ ┆ 'Account'
-- 35   ┆ ┆ ┆ 'Account Owner'
-- 36   ┆ ┆ ┆ 'Last Award Type'
-- 37   ┆ ┆ ┆ 'Last Award Launch Date'
-- 38   ┆ ┆ ┆ 'Last Award Data Lockdown Date'
-- 39   ┆ ┆ ┆ 'Next Award Type'
-- 40   ┆ ┆ ┆ 'Next Award Launch Date'
-- 41   ┆ ┆ ┆ 'Next Award Data Lockdown Date'
-- 42   ┆ ┆ ┆ 'Next Award SR Index Health Indicator'
-- 43   ┆ ┆ ┆ 'Next Award # of Approved Reviews Within Recency Period'
   44   ┆ ┆ ┆ 'Total Number of Approved Reviews'
>> 45   ┆ ┆ ].freeze

How can I add commas to all the lines except the last one with vim? It's a ruby array

You can add commas to all lines except for the last one in Vim by using the following steps:

1. Start by pressing `Esc` to make sure you are in Normal mode.
2. Position the cursor at the beginning of the line where you want to start adding commas. In this case, it is line 32. You can navigate there by typing `32G`.
3. Then, enter the following command:

```
.,$-1norm A,
```

Here's a breakdown of the command:

- `.,$-1` selects all lines from the current position to the penultimate line.
- `norm A,` appends a comma at the end of each selected line.

This command will add a comma at the end of each line from the current position to the second last line in the file. The last line will remain without a comma.