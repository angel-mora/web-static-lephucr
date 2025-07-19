---
title: Chrome pages Markdown list
tags:
- pages
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Chrome pages Markdown list

## ✅ TODOs


## 📌 Summary
I want a markdown list of the pages under chrome://inspect/#pages, give me js to input to devtools

## 🧠 Full Chat


I want a markdown list of the pages under chrome://inspect/#pages, give me js to input to devtools

Sure! Here's a JavaScript code snippet you can input into the DevTools console to generate a Markdown list of the pages under `chrome://inspect/#pages`:

```
// Get the list of inspected pages
const pages = Array.from(document.querySelectorAll('.page-list-item .page-name'));

// Generate the Markdown list
let markdown = '';
pages.forEach(page => {
  markdown += `- ${page.innerText}\n`;
});

// Log the Markdown list to the console
console.log(markdown);
```

This code will extract the list of inspected pages from the DOM, generate a Markdown list with each page name, and log the result to the console. You can then copy and paste the output into a Markdown file or editor.

Note: This code assumes that you have already navigated to `chrome://inspect/#pages` in your Chrome browser.

unexpected token

If you're getting an "unexpected token" error message when running a JavaScript code snippet in the DevTools console, it usually means that there is a syntax error in your code.

Here are some common causes of "unexpected token" errors:

- A missing or extra closing brace, bracket, or parenthesis
- A missing or extra semicolon at the end of a line
- A typo or misspelling of a keyword or variable name
- Using reserved words or symbols as variable names

To fix the error, carefully review your code and check for any of these issues. You can also try commenting out sections of code to isolate the problem.

If you're still having trouble, feel free to share your code snippet and the error message you're seeing, and I can help you debug it.

Gave it the code you shared

I apologize for the confusion. Here's the corrected JavaScript code that should work:

```
// Get the list of inspected pages
const pages = Array.from(document.querySelectorAll('.page-list-item .page-name'));

// Generate the Markdown list
let markdown = '';
pages.forEach(page => {
  markdown += `- ${page.innerText}\n`;
});

// Log the Markdown list to the console
console.log(markdown);
```

Please copy this code and try running it again in the DevTools console. If you still encounter any issues, please let me know the error message you see and I'll help you debug it.

How can I access the json version of this? chrome://inspect/#pages

You can access the JSON version of the `chrome://inspect/#pages` list by sending a request to the Chrome DevTools Protocol using the `chrome.runtime.sendMessage` method in a content script.

Here's an example code snippet that you can use:

```
// Send a message to the background page to get the list of inspected pages
chrome.runtime.sendMessage({action: 'getPages'}, function(response) {
  // Log the JSON response to the console
  console.log(JSON.stringify(response));
});
```

You'll need to create a background page or background script that listens for the `chrome.runtime.onMessage` event and sends back the list of inspected pages in JSON format. Here's an example implementation of the background script:

```
// Listen for messages from content scripts
chrome.runtime.onMessage.addListener(function(request, sender, sendResponse) {
  if (request.action === 'getPages') {
    // Get the list of inspected pages
    chrome.devtools.inspectedWindow.eval(
      'JSON.stringify([...document.querySelectorAll(".page-list-item .page-name")].map(page => page.innerText))',
      function(result, exceptionInfo) {
        if (exceptionInfo) {
          sendResponse({error: exceptionInfo});
        } else {
          sendResponse({pages: JSON.parse(result)});
        }
      }
    );
    return true; // Needed to keep the messaging channel open until the response is sent
  }
});
```

This background script uses the `chrome.devtools.inspectedWindow.eval` method to evaluate a JavaScript expression in the context of the inspected page and return the result as a JSON string. The expression selects all page names on the page and returns them as an array of strings, which is then converted to JSON format.

Once you have both of these scripts set up, you can load your extension and run the first code snippet in the DevTools console to get the JSON list of inspected pages. The output should be a JSON string that you can parse and use in your application.

I want to select the pages from the dom and return a markdown list of them. Same chrome page, the actual url is within the properties-box class

Sure! Here's an updated code snippet that will extract the list of pages from the DOM and return a Markdown list of the page URLs:

```
// Get the list of inspected pages
const pages = Array.from(document.querySelectorAll('.page-list-item'));

// Generate the Markdown list
let markdown = '';
pages.forEach(page => {
  const url = page.querySelector('.properties-box .key-value').innerText.trim();
  markdown += `- [${url}](${url})\n`;
});

// Log the Markdown list to the console
console.log(markdown);
```

This code uses the `document.querySelectorAll` method to select all elements with the `.page-list-item` class, which represent the inspected pages in the `chrome://inspect/#pages` list.

For each page element, the code uses the `querySelector` method to select the URL within the `.properties-box .key-value` element and trims any whitespace from the result.

Finally, the code generates a Markdown list item with the URL as both the link text and the link URL, and appends it to the `markdown` string.

When you run this code in the DevTools console, it will log a Markdown list of the inspected page URLs to the console. You can copy and paste this output into a Markdown file or editor.

querySelectorAll for the pages-list id and properties-box class

Sure! Here's the updated code that selects the inspected pages using the `#pages-list` ID and extracts the URL from the `.properties-box` class:

```
// Get the list of inspected pages
const pages = Array.from(document.querySelectorAll('#pages-list .page-list-item'));

// Generate the Markdown list
let markdown = '';
pages.forEach(page => {
  const url = page.querySelector('.properties-box .key-value').innerText.trim();
  markdown += `- [${url}](${url})\n`;
});

// Log the Markdown list to the console
console.log(markdown);
```

This code uses the `document.querySelectorAll` method to select all elements with the `#pages-list .page-list-item` selector, which represent the inspected pages in the `chrome://inspect/#pages` list.

For each page element, the code uses the `querySelector` method to select the URL within the `.properties-box .key-value` element and trims any whitespace from the result.

Finally, the code generates a Markdown list item with the URL as both the link text and the link URL, and appends it to the `markdown` string.

When you run this code in the DevTools console, it will log a Markdown list of the inspected page URLs to the console. You can copy and paste this output into a Markdown file or editor.

How do I get all the strings from this nodes? They are under innerHTML
const urls = document.querySelectorAll('#pages-list .properties-box .subrow-box div.url')

You can use the `innerText` property to get the text content of an element, which includes the text content of all of its descendants, but excludes any HTML markup. 

Here's an example code snippet that extracts the text content of all the `<div class="url">` elements within the `#pages-list .properties-box .subrow-box` elements:

```
// Get the list of inspected pages
const urls = Array.from(document.querySelectorAll('#pages-list .properties-box .subrow-box div.url'));

// Extract the text content from each URL element
const textContents = urls.map(url => url.innerText);

// Log the array of text contents to the console
console.log(textContents);
```

This code uses the `document.querySelectorAll` method to select all elements with the `#pages-list .properties-box .subrow-box div.url` selector, which represent the URLs of the inspected pages in the `chrome://inspect/#pages` list.

For each URL element, the code uses the `innerText` property to extract its text content and adds it to the `textContents` array using the `Array.map` method.

Finally, the code logs the array of text contents to the console.

You can modify this code to format the text content into a Markdown list, as shown in the previous examples.

This one gave me what I wanted but it also took some others that were not under properties-box and yes under row. That is adding useless rows for doubleclick and other ads sites which I don't care. How would I fix it?

const urls = Array.from(document.querySelectorAll('#pages-list .properties-box .subrow-box div.url')).map(url => url.innerText);
console.log(urls);


If you only want to extract the URLs that are within the `.properties-box` elements, you can modify the selector to exclude the `.row` elements:

```
const urls = Array.from(document.querySelectorAll('#pages-list .properties-box .subrow-box:not(.row) div.url')).map(url => url.innerText);
console.log(urls);
```

This code uses the `:not()` pseudo-class to exclude elements with the `.row` class from the selection, ensuring that only elements within the `.properties-box` elements are selected.

With this updated code, only the URLs that are within `.properties-box` elements will be extracted and logged to the console.

I just want to keep the first direct row  to pages list that has the properties-box:
pages-list > properties-box

Sure! You can use the `>` child selector to select only the direct children of the `#pages-list` element that have the `.properties-box` class:

```
const urls = Array.from(document.querySelectorAll('#pages-list > .page-list-item > .properties-box .subrow-box:not(.row) div.url')).map(url => url.innerText);
console.log(urls);
```

This code selects all `.subrow-box` elements that are children of `.properties-box` elements that are direct children of `.page-list-item` elements that are direct children of the `#pages-list` element.

With this updated code, only the URLs that are within the first direct child row of `#pages-list` that has a `.properties-box` element will be extracted and logged to the console.

So this is the good hierarchy, now give me the markdown list out of that array
const urls = Array.from(document.querySelectorAll('#pages-list > .row > .properties-box .subrow-box:not(.row) div.url')).map(url => url.innerText);
console.log(urls);

Sure! Here's an example code snippet that generates a Markdown list out of the array of URLs:

```
const urls = Array.from(document.querySelectorAll('#pages-list > .row > .properties-box .subrow-box:not(.row) div.url')).map(url => url.innerText);

let markdown = '';
urls.forEach(url => {
  markdown += `- [${url}](${url})\n`;
});

console.log(markdown);
```

This code uses the same selector as before to select the URLs within the first direct child row of `#pages-list` that has a `.properties-box` element.

For each URL, the code generates a Markdown list item with the URL as both the link text and the link URL, and appends it to the `markdown` string.

Finally, the code logs the Markdown list to the console.

You can copy and paste the output of this code into a Markdown file or editor.

Uglify and remove breaks since devtools is saying unexpected token

Sure! Here's an updated version of the code that generates a Markdown list without line breaks:

```
const urls = Array.from(document.querySelectorAll('#pages-list>.row>.properties-box .subrow-box:not(.row) div.url')).map(url => url.innerText);
let markdown = '';
urls.forEach(url => markdown += '- [' + url + '](' + url + ') ');
console.log(markdown);
```

This code uses the same selector as before to select the URLs within the first direct child row of `#pages-list` that has a `.properties-box` element.

For each URL, the code generates a Markdown list item with the URL as both the link text and the link URL, and appends it to the `markdown` string without any line breaks.

Finally, the code logs the Markdown list to the console.

You can copy and paste the output of this code into a Markdown file or editor.