---
title: Concurrency vs Parallelism
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Concurrency vs Parallelism

## ✅ TODOs


## 📌 Summary
Explain concurrency vs paralelism. I know js and ruby

## 🧠 Full Chat


Explain concurrency vs paralelism. I know js and ruby

Concurrency and parallelism are two concepts often used in programming, including in languages like JavaScript and Ruby. Understanding the distinction between them is crucial for writing efficient and effective code.

1. **Concurrency**:
   - **Definition**: Concurrency is about dealing with multiple tasks at the same time. It does not necessarily mean that these tasks are executed simultaneously. Instead, it involves starting, executing, and completing tasks in overlapping time periods, not necessarily in parallel.
   - **Example in JavaScript**: JavaScript is a single-threaded language that uses an event loop to handle concurrency. Operations like I/O operations, fetching data from a server, or timers are handled asynchronously. The event loop allows JavaScript to perform non-blocking operations, which means it can start a task and then move on to another one before the first one finishes.
   - **Example in Ruby**: Ruby uses threads to achieve concurrency. Traditional Ruby (MRI) has a Global Interpreter Lock (GIL) which means even when multiple threads are used, only one thread is executed at a time by the CPU. However, Ruby's concurrency model allows for I/O-bound tasks to be handled more efficiently, as the GIL can switch between threads while one is waiting for I/O.

2. **Parallelism**:
   - **Definition**: Parallelism, on the other hand, is about doing multiple tasks at the same time. In parallelism, tasks are literally executed simultaneously, usually on multiple cores or processors.
   - **Example in JavaScript**: Pure JavaScript doesn’t support true parallelism (because of its single-threaded nature), but it can be achieved through technologies like Web Workers. Web Workers allow scripts to run in background threads, enabling some form of parallel execution.
   - **Example in Ruby**: In Ruby, true parallelism can be achieved using multiple processes (for example, using the `fork` method). Since each process has its own GIL, they can execute in parallel on a multi-core system. This is particularly useful for CPU-bound tasks.

In summary, concurrency is about managing multiple tasks which may or may not run simultaneously, while parallelism involves executing multiple tasks simultaneously. Concurrency is about structure (how you design a program), and parallelism is about execution (how the computations are carried out). In languages like JavaScript and Ruby, these concepts are handled differently due to their underlying architecture and design philosophy.