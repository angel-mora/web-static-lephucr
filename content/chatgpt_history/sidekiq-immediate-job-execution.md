---
title: Sidekiq Immediate Job Execution
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  How can I make a sidekiq class to perform now, I tried
  that way and it doesn't work"
draft: false
---

# Sidekiq Immediate Job Execution

## 🧠 Full Chat

🙋 **You:**

How can I make a sidekiq class to perform now, I tried that way and it doesn't work

---

🤖 **Assistant:**

To make a Sidekiq worker perform a job immediately, you typically use the `perform_async` or `perform_in` methods, depending on whether you want to run it immediately or after a certain delay. Here's an example of how to set it up:

### Example Sidekiq Worker:

```ruby
class MyWorker
  include Sidekiq::Worker

  def perform(arg1, arg2)
    # Your job code here
    puts "Doing a job with #{arg1} and #{arg2}"
  end
end
```

### To perform the job immediately:
You would call the `perform_async` method.

```ruby
MyWorker.perform_async('value1', 'value2')
```

This enqueues the job and starts running it as soon as a worker is available.

### If you want to perform the job **synchronously** (i.e., without enqueuing):
You can use `perform_now`, but this is not available by default in Sidekiq. Instead, you can directly call the `perform` method if you want to bypass Sidekiq and run it inline (which can be helpful for testing).

```ruby
MyWorker.new.perform('value1', 'value2')
```

### Common Issues
- **Sidekiq server not running**: Ensure your Sidekiq server is running with `bundle exec sidekiq`.
- **Redis not running**: Sidekiq depends on Redis, so make sure Redis is installed and running.
- **Queue configuration**: Make sure that the worker is assigned to a queue that Sidekiq is monitoring.

Check your logs if `perform_async` is called but doesn't seem to be working. It might provide clues about whether the job is being enqueued or if there are Redis issues.