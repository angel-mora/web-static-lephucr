---
title: 'Debugging scope: created_at_lt'
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  how to debugg a scope like this scope :created_at_lt,
  ->(reference_time) { joins(:campaign).merge(Campaign.created_between(nil, reference_time))
  }"
draft: false
---

# Debugging scope: created_at_lt

## 🧠 Full Chat

🙋 **You:**

how to debugg a scope like this scope :created_at_lt, ->(reference_time) { joins(:campaign).merge(Campaign.created_between(nil, reference_time)) }