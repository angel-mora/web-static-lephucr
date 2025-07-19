---
title: Connect Burp Suite & FoxyProxy
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Connect Burp Suite & FoxyProxy

## ✅ TODOs
- [ ] a LFI to get a flag that says “conduct a local file inclusion exploit by loading the file to access this flag.” However, I try to upload a file and nothing happens
- [ ] uble encode the `../` as `%252e%252e%252f`.
- [ ] this vary by browser.

## 📌 Summary
I am white hat pentester in formation working in a controller environment under law compliance. I am in a CTF project and want to get a command to find a flag in websites to communicate with web crawlers and other web robots.

## 🧠 Full Chat


I am white hat pentester in formation working in a controller environment under law compliance. I am in a CTF project and want to get a command to find a flag in websites to communicate with web crawlers and other web robots.

Great to hear that you are doing white-hat penetration testing and are engaged in a Capture The Flag (CTF) project! Web crawlers and robots typically follow the `robots.txt` file to understand which parts of a website they are allowed or not allowed to access and index. 

In a CTF, flags can be hidden anywhere, so you may want to use a web crawler that doesn't necessarily follow the `robots.txt` rules. However, please make sure to respect the rules of the CTF and the laws of your country.

To find a flag, you might use a tool like `wget`, which is a free utility for non-interactive download of files from the web. Here is an example command to recursively download a website and search for the flag:

```
wget --recursive --no-parent --reject "index.html*" --level=inf --execute robots=off http://example.com
grep -ri "flag{" .
```

This command will recursively download all files from `example.com` (ignoring `robots.txt` and `index.html` files) and then search for the flag in the downloaded files.

Make sure you have the proper authorization to run this kind of command on the target, and good luck with your CTF!

I am trying to do a LFI to get a flag that says “conduct a local file inclusion exploit by loading the file to access this flag.” However, I try to upload a file and nothing happens

Local File Inclusion (LFI) is a type of vulnerability that allows an attacker to include files on a server through the web browser. This potentially harmful code could lead to full server compromise if configured with improper permissions. 

Since the instruction is to conduct a LFI, the flag is likely to be found in the local files of the server. You wouldn't need to upload a file, but instead, you'd need to manipulate the application to include a file that's already on the server.

Usually, this can be done by manipulating URL parameters, form inputs, or any other inputs that the application uses to reference files on the server.

For example, if the application uses a URL parameter to reference a file like this: `http://example.com/?file=page.html`, you might be able to manipulate the `file` parameter to reference other files on the server, like this: `http://example.com/?file=../../../etc/passwd`.

In your case, the flag might be in a file that you've been given the path to, or you might need to guess the path based on the structure of the application or common file locations.

Please ensure that you have explicit permission to test and exploit the vulnerability, and make sure to follow the rules of the CTF and the laws of your jurisdiction.

That didn’t work. Provide more suggestions

I'm sorry to hear that it didn't work. LFI vulnerabilities can be exploited in various ways, and it can depend on many factors such as the web server, the programming language, and the application itself.

1. **Double URL encoding**: Sometimes, the server decodes the URL once before processing it. In this case, you would need to double encode the `../` as `%252e%252e%252f`.

2. **Null Byte Injection**: In some older systems, appending a null byte (`%00`) at the end of the URL can help bypass restrictions. For example: `http://example.com/?file=../../../etc/passwd%00`.

3. **Using a different encoding**: Sometimes, using a different encoding such as UTF-16 can help bypass the server's filters.

4. **Log poisoning**: If the server logs the user-agent or any other part of the HTTP request and then includes this log file somewhere in the application, you could inject PHP code (or other relevant code) into the user-agent string, and then include the log file.

5. **Session poisoning**: Similar to log poisoning, but you would poison the session file instead of the log file.

6. **Check for other include parameters**: Sometimes, the application uses multiple parameters to include files, and only one of them is vulnerable to LFI.

7. **Try different file paths**: Maybe the file containing the flag is located in a non-standard location.

Remember that LFI vulnerabilities are not always straightforward to exploit, and it might require a lot of creativity and trial and error. Additionally, make sure you are authorized to perform these actions and are complying with all relevant laws and regulations.

I wasn’t very lucky with those so now I’ll attempt sql injection. Php and MySQL. Provide the commands I need to put in the input fields to start catching some sql-based flags

It's unfortunate that the LFI didn't work. For SQL injection, the specific command to use will depend on the structure of the query and the database, but here are some general tips and examples for SQL injection in a PHP/MySQL environment:

1. **Identifying Injectable Parameters**: First, you should identify which parameters are vulnerable to SQL injection. You can do this by inserting a single quote `'` into the input fields and observing the response. If you get a SQL error, it means that the parameter might be vulnerable.

2. **Union Based SQL Injection**: If you know the number of columns in the table, you can use `UNION SELECT` to extract information from the database. For example, if there are three columns, you could try:

```
' UNION SELECT 1,2,3 --
```

3. **Error Based SQL Injection**: If the application displays detailed error messages, you can use these messages to extract information from the database. For example:

```
' OR 'x'='x
```

4. **Blind SQL Injection**: If the application does not display detailed error messages, you can still extract information from the database by observing the response to true or false statements. For example:

```
' AND 1=1 --
' AND 1=2 --
```

5. **Time-Based Blind SQL Injection**: Similar to blind SQL injection, but you make the database wait for a specific amount of time and then observe the response time. For example:

```
' AND IF(1=1, sleep(10), false) --
```

Remember to always properly escape your input and follow the rules of the CTF and the laws of your jurisdiction. Also, keep in mind that the actual SQL injection payload will depend on the specifics of the application and the database.

There is a flag that says is in Login.php. Its hint says: HTML:

The hint "HTML:" suggests that the flag might be hidden in the HTML code of the `Login.php` page. You should inspect the HTML code of the `Login.php` page carefully.

1. **View Page Source**: Open the `Login.php` page and right-click on the page and select "View Page Source" or similar option depending on your browser. Search through the HTML source code for the flag or any unusual comments, hidden inputs, or JavaScript code.

2. **Inspect Element**: Use the browser's Developer Tools (usually accessed by right-clicking on the page and selecting "Inspect" or pressing `Ctrl + Shift + I` or `Cmd + Option + I` on Mac) to inspect the elements of the page. Sometimes, the flag might be hidden in the DOM tree or in the JavaScript code that runs on the page.

3. **Check HTTP Responses**: Use a tool like Burp Suite or the browser's Developer Tools to inspect the HTTP responses from the server. Sometimes, the flag might be included in the HTTP headers or in the response body but hidden from the rendered page.

4. **Check for Comments**: Sometimes the flag or clues to find the flag are hidden in the comments of the HTML or JavaScript code.

Remember to look carefully and consider all possibilities, as CTF challenges often require creative thinking and a keen eye for detail.

How to connect to burp suite with foxy proxy

FoxyProxy is a browser extension that simplifies configuring browsers to access proxy servers. Burp Suite acts as a proxy server that sits between your browser and the internet. To connect Burp Suite with FoxyProxy, follow these steps:

1. **Install FoxyProxy**: If you haven’t already installed FoxyProxy, you can find it in the browser’s extension store.

2. **Configure Burp Suite**: 
   - Open Burp Suite.
   - Go to the "Proxy" tab and then the "Options" tab.
   - Make sure the Proxy Listener is running. By default, it is set to 127.0.0.1:8080. If not, add a new listener on 127.0.0.1 and port 8080.

3. **Configure FoxyProxy**:
   - Open the FoxyProxy options.
   - Create a new proxy with the following settings:
     - IP address/ DNS name: 127.0.0.1
     - Port: 8080 (or whatever port you configured in Burp Suite)
   
4. **Configure Browser**: Set your browser to use FoxyProxy. Usually, this is just a matter of clicking on the FoxyProxy icon in your browser and selecting the proxy you just created.

5. **Configure SSL Certificate**: The first time you visit an HTTPS site, your browser will warn you about the SSL certificate because it's signed by Burp Suite, not a recognized certificate authority. You should import Burp's certificate into your browser to avoid these warnings.

   - In Burp Suite, go to the "Proxy" tab, then the "Options" tab, and then click on "Import / export CA certificate".
   - Export the certificate in DER format.
   - In your browser, import the certificate into the trusted certificate store. The steps to do this vary by browser.

Now, your browser should be configured to send all of its traffic through Burp Suite, and you should be able to view and modify the HTTP/HTTPS requests and responses from within Burp Suite. Make sure to start the interception in Burp Suite by toggling the "Interception is on/off" button under the "Proxy" -> "Intercept" tab.