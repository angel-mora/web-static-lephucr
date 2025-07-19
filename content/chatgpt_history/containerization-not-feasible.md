---
title: Containerization Not Feasible.
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Containerization Not Feasible.

## ✅ TODOs


## 📌 Summary
In my job they use Mac and invoker to handle multiple repositories. They say containerization is not an option for them, why?

## 🧠 Full Chat


In my job they use Mac and invoker to handle multiple repositories. They say containerization is not an option for them, why?

It's hard to say exactly why your job is not considering containerization without more context, but here are some possible reasons:

1. Compatibility issues: If the software you use is not compatible with containers or if it requires specific dependencies that are not readily available in a container environment, then containerization may not be a feasible option.

2. Security concerns: Depending on the type of work your company does, there may be concerns about the security implications of containerization. If your company deals with sensitive data or works in a highly regulated industry, they may be hesitant to move to a container-based approach.

3. Complexity: Depending on the number of repositories and their interdependencies, containerizing the entire environment could be a complex and time-consuming process. Your company may not have the resources or expertise to manage this transition effectively.

4. Cost: Containerization can require additional resources and infrastructure, which may be prohibitively expensive for your company.

5. Lack of perceived benefits: Your company may not see the benefits of containerization as outweighing the costs and effort involved in making the switch.

It's worth noting that containerization can offer a number of benefits, including easier deployment and scaling, better resource utilization, and improved developer productivity. However, every company is different and may have its own unique set of constraints and priorities that influence technology decisions.

We work with Ruby on Rails. What else would you need to know to provide a more technical answer?

Thanks for the additional context! Here are a few technical considerations related to Ruby on Rails and containerization:

1. Dependency management: Ruby on Rails applications typically rely on a variety of dependencies, such as Ruby gems and system libraries. Containerization can help ensure that all necessary dependencies are available in a consistent and reproducible manner, which can be especially helpful for complex applications.

2. Development and testing environments: With containerization, developers can more easily create isolated development and testing environments that mimic the production environment. This can reduce the likelihood of bugs and other issues arising when code is deployed to production.

3. Deployment and scaling: Containerization can make it easier to deploy and scale Ruby on Rails applications. For example, you could use a container orchestration tool like Kubernetes to manage multiple instances of your application, automatically scaling up or down based on traffic.

4. Performance: Containerization can have a small overhead compared to running an application directly on the host system. However, this overhead is generally minimal and can often be offset by the benefits of containerization.

Overall, while there may be some challenges involved in containerizing Ruby on Rails applications (such as ensuring compatibility with specific gems or system libraries), the benefits can often outweigh the costs. Containerization can help ensure consistent and reproducible environments, simplify deployment and scaling, and improve overall application performance.

Does invoker https://invoker.codemancers.com/ conflict with docker containerization then?

Invoker and Docker containerization are not necessarily mutually exclusive, but they serve different purposes and can be used together in different ways.

Invoker is a tool that helps manage multiple processes or services within a single development environment. It allows you to specify a set of processes and their dependencies in a configuration file and start them all at once. This can be useful for local development or testing, as it allows you to quickly spin up all the necessary services for your application without needing to manually start each one.

On the other hand, Docker containerization provides a way to package an application and its dependencies into a lightweight, portable container that can be run on any system that supports Docker. Containers provide an isolated and reproducible environment for your application, which can be helpful for testing, deployment, and scaling.

While Invoker and Docker can both be used to manage multiple processes, they do so in different ways. Invoker runs processes directly on the host system, while Docker containers provide an isolated environment that is more portable and can be run on different systems.

It is possible to use Invoker to manage processes within a Docker container, but this would require running Invoker within the container itself. This approach could be useful for local development or testing, but may not be as well-suited for deployment or scaling.

Ultimately, whether Invoker conflicts with Docker containerization depends on the specific use case and requirements of your application. Both tools have their own strengths and weaknesses, and the best approach will depend on your specific needs.