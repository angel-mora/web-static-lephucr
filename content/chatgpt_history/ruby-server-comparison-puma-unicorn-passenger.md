---
title: 'Ruby Server Comparison: Puma, Unicorn, Passenger'
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  I want to understand differences between puma, unicorn
  and passenger. How can I test them? Provide an example of a basic server in ruby
  code and then explain what these existing servers do beyond the code provided."
draft: false
---

# Ruby Server Comparison: Puma, Unicorn, Passenger

## ✅ TODOs
- [ ] what it's best at: Nginx manages high numbers of connections and static assets, while Unicorn (or other app servers) focuses on running your Ruby code.

## 🧠 Full Chat

🙋 **You:**

I want to understand differences between puma, unicorn and passenger. How can I test them? Provide an example of a basic server in ruby code and then explain what these existing servers do beyond the code provided.

---

🤖 **Assistant:**

Certainly! Let's first understand what these are. Puma, Unicorn, and Phusion Passenger are all application servers for hosting Ruby applications, most commonly Ruby on Rails.

Here's a quick comparison of their characteristics:

1. **Puma**
   - Multithreaded: can handle multiple requests simultaneously without requiring a new process for each request.
   - Cluster mode: spawns multiple processes and can run multiple threads within each process.
   - Common for both MRI (Matz’s Ruby Interpreter) and JRuby.

2. **Unicorn**
   - Single-threaded.
   - Uses a worker model where each worker is a new process.
   - Primarily used with MRI Ruby.
   - Known for its simplicity.

3. **Phusion Passenger (or just Passenger)**
   - Both multi-process and multi-threaded models.
   - Integrates directly with Nginx or Apache.
   - Provides enterprise-level features like automatic process scaling and management.
   - Out-of-the-box support for multiple languages, not just Ruby.

Here's a basic Ruby server using Rack:

```ruby
# config.ru
require 'rack'

app = Proc.new do |env|
  ['200', {'Content-Type' => 'text/html'}, ['Hello, world!']]
end

run app
```

To run this app with each server:

1. **Puma**
    ```bash
    $ gem install puma
    $ puma config.ru
    ```

2. **Unicorn**
    ```bash
    $ gem install unicorn
    $ unicorn config.ru -p 8080
    ```

3. **Passenger**
   - With Passenger, you typically integrate it with a web server like Nginx or Apache, so the setup is a bit more involved.
   - After setting up Passenger with Nginx or Apache, you'd configure a virtual host for your application and point it to the `config.ru` file.
   - However, for simple local testing:
     ```bash
     $ gem install passenger
     $ passenger start
     ```

Now, what these servers do beyond your simple Ruby server:

1. **Puma**
   - Load balancing across multiple workers.
   - Binds to multiple TCP ports or UNIX sockets.
   - SSL support.
   - Configuration via a file.
   - Control of the number of worker processes and threads.

2. **Unicorn**
   - Spawns and manages multiple worker processes.
   - Configurable via a configuration file.
   - Automatic worker process management: if a worker dies, it is restarted.
   - Seamless zero-downtime deployment: old workers are killed off and replaced with new workers.

3. **Passenger**
   - Automatic management of resources (processes, threads).
   - Out-of-process architecture, which means if your app leaks memory or has a bug, it won't crash the web server.
   - Automatic user switching for better security.
   - Mass deployment features: you can host multiple apps under one server.
   - Enterprise support with advanced features.

For testing, you would primarily want to look into:

- **Concurrency**: Puma can handle concurrent requests in a single process because it's multithreaded, whereas Unicorn would need multiple processes.
- **Memory usage**: Multi-process servers like Unicorn could use more memory as each process might load a complete instance of your app.
- **Integration and deployment**: How easily it integrates with your infrastructure. Passenger shines here with direct Nginx and Apache integration.
- **Performance and Latency**: Depending on your app's needs, one might be faster or handle latency better than the others.

Do some benchmarking with tools like `wrk` or `ab` (Apache Bench) to see how they perform under your specific conditions.

---

🙋 **You:**

ffCan you explain the differences between processes (are those regular unix processes?), threads and workers. I want to understand concurrency in this context. So why you need nginx and apache? Aren't those servers too? I want to understand what a server is in the context of real world applications. I'd like an explanation like: When you start your server in port 8080 in production, it becomes available through multiple dynamic ports by ngix load balancer... or however it suppose to work. I want you to explain me what actually happens in the context of the concepts I still don't get very well. If you can append ruby/unix chunks to complement your explanations, that would be even better

---

🤖 **Assistant:**

Absolutely, let's break it down step by step.

### Processes, Threads, and Workers:

1. **Processes**: In UNIX-like operating systems, a process is an independent program running in its own memory space. Each process has its own stack, heap, and data sections. It cannot directly access the memory space of another process. If you run the `ps` command on a UNIX system, you can see a list of currently running processes.

   ```bash
   ps aux
   ```

2. **Threads**: A thread is the smallest sequence of programmed instructions that can be managed independently by a scheduler (a component of the OS). Multiple threads can run within a single process, sharing the same memory space, which allows for more efficient use of resources than using multiple processes. However, because they share the same memory, multi-threaded applications need careful management to avoid issues like race conditions.

3. **Workers**: In the context of application servers (like Unicorn or Puma), a worker typically refers to a separate instance of the application. Depending on the server, a "worker" might be a process (Unicorn) or a thread (Puma in threaded mode).

### Concurrency:

Concurrency means that an application or system can handle multiple tasks at the same time. This doesn't necessarily mean these tasks are processed simultaneously. For example, in a single-core CPU, a multi-threaded application might achieve concurrency by quickly switching between threads.

- **Multi-process model (e.g., Unicorn)**: Each worker (process) handles one request at a time. It can genuinely run tasks simultaneously if multiple CPU cores are available.
  
- **Multithreaded model (e.g., Puma)**: Within a single process, multiple threads can handle multiple requests. This can be more memory-efficient, but requires careful management to avoid thread-related issues.

### Web Servers and Application Servers:

- **Web Servers (e.g., Nginx, Apache)**: These handle HTTP requests and serve static files, such as HTML, CSS, JavaScript, and images. They can also act as reverse proxies, directing incoming requests to another server (like an application server). They are optimized to handle thousands of simultaneous connections with low latency.

- **Application Servers (e.g., Puma, Unicorn)**: These run your actual application code. They take a request passed on by the web server, process it (query a database, compute something), and return the result.

### Real-World Scenario:

Let's paint a picture using Nginx, Unicorn, and a Ruby on Rails application:

1. **You start your application with Unicorn on port 8080**:

   ```bash
   unicorn -p 8080
   ```

   Let's say you've configured it with 4 workers. This means there are 4 separate processes running, each capable of handling a request.

2. **You set up Nginx as a reverse proxy**. This means when users make a request to your website, they're actually talking to Nginx. Nginx then forwards these requests to Unicorn (on port 8080). 

   Why add this extra step?

   - Nginx can handle static assets more efficiently than Ruby application servers.
   - It can manage a massive number of connections and then distribute the actual processing work to several Unicorn processes.
   - It provides load balancing, SSL termination, gzip compression, and more.

3. **A user accesses your site**:

   - The user's browser connects to Nginx.
   - Nginx checks the request. If it's for a static asset, it serves it directly.
   - If the request is for dynamic content, Nginx passes it to one of the Unicorn processes on port 8080.
   - Unicorn processes the request, talks to the database, etc., and then returns the response to Nginx.
   - Nginx sends the response back to the user's browser.

This separation allows each component to do what it's best at: Nginx manages high numbers of connections and static assets, while Unicorn (or other app servers) focuses on running your Ruby code.

The above is a simplified depiction, but it illustrates the division of labor in a typical production web setup. By understanding the roles and capabilities of each component, developers can build efficient, scalable, and maintainable web infrastructures.