---
title: Module 12
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Module 12

## ✅ TODOs


## 📌 Summary
Conversation Title: Module 12

## 🧠 Full Chat


Conversation Title: Module 12
# Module 12 Challenge Submission File

## Web Development

Make a copy of this document to work in, and then respond to each question below the prompt. Save and submit this completed file as your Challenge deliverable.

### HTTP Requests and Responses

1. What type of architecture does the HTTP request and response process occur in?

```
[Enter answer here]
```


2. What are the parts of an HTTP request?

```
[Enter answer here]
```


3. Which part of an HTTP request is optional?

```
[Enter answer here]
```


4. What are the three parts of an HTTP response?

```
[Enter answer here]
```


5. Which number class of status codes represents errors?

```
[Enter answer here]
```


6. What are the two most common request methods a security professional encounters?

```
[Enter answer here]
```


7. Which type of HTTP request method is used to send data?

```
[Enter answer here]
```


8. Which part of an HTTP request contains the data being sent to the server?

```
[Enter answer here]
```


9. In which part of an HTTP response does the browser receive the web code to generate and style a webpage?

```
[Enter answer here]
```

### Using curl

10.  What are the advantages of using `curl` over the browser?

```
[Enter answer here]
```


11. Which `curl` option changes the request method?

```
[Enter answer here]
```


12.  Which `curl` option sets request headers?

```
[Enter answer here]
```


13.  Which `curl` option is used to view the response header?

```
[Enter answer here]
```


14. Which request method might an attacker use to figure out what HTTP requests an HTTP server will accept?

```
[Enter answer here]
```

### Sessions and Cookies

15.  Which response header sends a cookie to the client?

```
HTTP/1.1 200 OK
Content-type: text/html
Set-Cookie: cart=Bob
```

16.  Which request header will continue the client's session?

```
GET /cart HTTP/1.1
Host: www.example.org
Cookie: cart=Bob
```

### Example HTTP Requests and Responses

Use the following sample HTTP request and response to answer the questions in this section:

**HTTP Request**

```
POST /login.php HTTP/1.1
Host: example.com
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
Content-Type: application/x-www-form-urlencoded
Content-Length: 34
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Mobile Safari/537.36

username=Barbara&password=password
```

17.  What is the request method?

```
[Enter answer here]
```

18.  Which header expresses the client's preference for an encrypted response?

```
[Enter answer here]
```

19.  Does the request have a user session associated with it?

```
[Enter answer here]
```

20.  What kind of data is being sent from this request body?

```
[Enter answer here]
```

**HTTP Response**

```
HTTP/1.1 200 OK
Date: Mon, 16 Mar 2020 17:05:43 GMT
Last-Modified: Sat, 01 Feb 2020 00:00:00 GMT
Content-Encoding: gzip
Expires: Fri, 01 May 2020 00:00:00 GMT
Server: Apache
Set-Cookie: SessionID=5
Content-Type: text/html; charset=UTF-8
Strict-Transport-Security: max-age=31536000; includeSubDomains
X-Content-Type: NoSniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block

[page content]
```

21.  What is the response status code?

```
[Enter answer here]
```

22.  What web server is handling this HTTP response?

```
[Enter answer here]
```

23.  Does this response have a user session associated with it?

```
[Enter answer here]
```

24.  What kind of content is likely to be in the [page content] response body?

```
[Enter answer here]
```

25.  If your class covered security headers, what security request headers have been included?

```
[Enter answer here]
```

### Monoliths and Microservices

26. What are the individual components of microservices called?

```
[Enter answer here]
```

27. What is a service that writes to a database and communicates to other services?

```
[Enter answer here]
```

28. What type of underlying technology allows for microservices to become scalable and have redundancy?

```
[Enter answer here]
```

### Deploy and Test a Container Set

29. What tool can you use to deploy multiple containers at once?

```
[Enter answer here]
```

30. What kind of file format is required to deploy a container set?

```
[Enter answer here]
```

### Databases

31. Which type of SQL query would you use to view all the information in a table called `customers`?

```
[Enter answer here]
```

32. Which type of SQL query would you use to enter new data into a table? (You don't need a full query, just the first part of the statement.)

```
[Enter answer here]
```

33.  Why would you never run `DELETE FROM &lt;table-name>;` by itself?

```
[Enter answer here]
```

### Optional Additional Challenge Activity: The Cookie Jar

**Question 1:** Did you see any obvious confirmation of a login? (Y/N)

```
[Enter answer here]
```

**Question 2:** How many items exist in this file?

```
[Enter answer here]
```

**Question 3:** Is it obvious that you can access the dashboard? (Y/N)

```
[Enter answer here]
```

**Question 4:** Look through the output where `Dashboard` is highlighted. Does any of the wording on this page seem familiar? (Y/N) If so, you should be successfully logged in to your Editor's dashboard.

```
[Enter answer here]
```

**Question 5:** What happens this time?

```
[Enter answer here]
```

### HTTP Requests and Responses

1. What type of architecture does the HTTP request and response process occur in?

```
The HTTP request and response process occur in a client-server architecture.
```

2. What are the parts of an HTTP request?

```
The parts of an HTTP request are:
1. Request Line (includes the HTTP method, URL, and HTTP version)
2. Headers
3. Body (optional, depending on the HTTP method used)
```

3. Which part of an HTTP request is optional?

```
The body of an HTTP request is optional.
```

4. What are the three parts of an HTTP response?

```
The three parts of an HTTP response are:
1. Status Line (includes the HTTP version, status code, and status message)
2. Headers
3. Body
```

5. Which number class of status codes represents errors?

```
The 4xx and 5xx classes of status codes represent client-side and server-side errors respectively.
```

6. What are the two most common request methods a security professional encounters?

```
The two most common request methods a security professional encounters are GET and POST.
```

7. Which type of HTTP request method is used to send data?

```
The HTTP POST request method is used to send data.
```

8. Which part of an HTTP request contains the data being sent to the server?

```
The body of an HTTP request contains the data being sent to the server.
```

9. In which part of an HTTP response does the browser receive the web code to generate and style a webpage?

```
The body of an HTTP response contains the web code to generate and style a webpage.
```

### Using curl

10.  What are the advantages of using `curl` over the browser?

```
The advantages of using `curl` over the browser include:
1. Ability to automate and script HTTP interactions.
2. Ability to test APIs without a graphical user interface.
3. Can be used for testing server connectivity, response headers, etc.
4. Supports a wide variety of protocols beyond HTTP.
```

11. Which `curl` option changes the request method?

```
The `-X` or `--request` option in `curl` is used to change the request method.
```

12.  Which `curl` option sets request headers?

```
The `-H` or `--header` option in `curl` is used to set request headers.
```

13.  Which `curl` option is used to view the response header?

```
The `-I` or `--head` option in `curl` is used to view the response header.
```

14. Which request method might an attacker use to figure out what HTTP requests an HTTP server will accept?

```
An attacker might use the OPTIONS request method to figure out what HTTP requests an HTTP server will accept.
```

### Sessions and Cookies

15.  Which response header sends a cookie to the client?

```
The "Set-Cookie" response header sends a cookie to the client.
```

16.  Which request header will continue the client's session?

```
The "Cookie" request header will continue the client's session.
```

### Example HTTP Requests and Responses

17.  What is the request method?

```
The request method is POST.
```

18.  Which header expresses the client's preference for an encrypted response?

```
The "Upgrade-Insecure-Requests: 1" header expresses the client's preference for an encrypted response.
```

19.  Does the request have a user session associated with it?

```
No, the request does not have a user session associated with it as there is no Cookie header in the request.
```

20.  What kind of data is being sent from this request body?

```
Form data (username and password) is being sent from this request body.
```

21.  What is the response status code?

```
The response status code is 200.
```

22.  What web server is handling this HTTP response?

```
The Apache web server is handling this HTTP response.
```

23.  Does this response have a user session associated with it?

```
Yes, the response has a user session associated with it, indicated by the "Set-Cookie: SessionID=5" header.
```

24.  What kind of content is likely to be in the [page content] response body?

```
The content is likely to be HTML, as indicated by the "Content-Type: text/html; charset=UTF-8" response header.
```

25.  If your class covered security headers, what security request headers have been included?

```
The following security headers have been included:
1. Strict-Transport-Security
2. X-Content-Type: NoSniff
3. X-Frame-Options: DENY
4. X-XSS-Protection: 1; mode=block
```

### Monoliths and Microservices

26. What are the individual components of microservices called?

```
The individual components of microservices are called services.
```

27. What is a service that writes to a database and communicates to other services?

```
A service that writes to a database and communicates to other services is often called a back-end service or a database service.
```

28. What type of underlying technology allows for microservices to become scalable and have redundancy?

```
Containerization and orchestration technologies like Docker and Kubernetes allow for microservices to become scalable and have redundancy.
```

### Deploy and Test a Container Set

29. What tool can you use to deploy multiple containers at once?

```
You can use Docker Compose or Kubernetes to deploy multiple containers at once.
```

30. What kind of file format is required to deploy a container set?

```
A YAML or JSON file format is typically used to define and deploy a container set.
```

### Databases

31. Which type of SQL query would you use to view all the information in a table called `customers`?

```
You would use the following SQL query: SELECT * FROM customers;
```

32. Which type of SQL query would you use to enter new data into a table? (You don't need a full query, just the first part of the statement.)

```
You would use the INSERT INTO statement to enter new data into a table.
```

33.  Why would you never run `DELETE FROM <table-name>;` by itself?

```
Running `DELETE FROM <table-name>;` without a WHERE clause deletes all records from the specified table, which can result in data loss.
```

### Optional Additional Challenge Activity: The Cookie Jar

**Question 1:** Did you see any obvious confirmation of a login? (Y/N)

```
[Answer based on specific activity or observation]
```

**Question 2:** How many items exist in this file?

```
[Answer based on specific activity or observation]
```

**Question 3:** Is it obvious that you can access the dashboard? (Y/N)

```
[Answer based on specific activity or observation]
```

**Question 4:** Look through the output where `Dashboard` is highlighted. Does any of the wording on this page seem familiar? (Y/N) If so, you should be successfully logged in to your Editor's dashboard.

```
[Answer based on specific activity or observation]
```

**Question 5:** What happens