---
title: 'Rust Chrome to Pinboard

  '
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Rust Chrome to Pinboard


## ✅ TODOs


## 📌 Summary
Create code in Rust to migrate bookmarks from Chrome Bookmarks API https://developer.chrome.com/docs/extensions/reference/bookmarks/ to Pinboard API https://pinboard.in/api, making sure to include metadata tags for Pinboard.

## 🧠 Full Chat


Create code in Rust to migrate bookmarks from Chrome Bookmarks API https://developer.chrome.com/docs/extensions/reference/bookmarks/ to Pinboard API https://pinboard.in/api, making sure to include metadata tags for Pinboard.

Here is an example of code in Rust that migrates bookmarks from the Chrome Bookmarks API to the Pinboard API, including metadata tags for Pinboard:

```rust
use reqwest::Client;
use serde_json::Value;

// Replace YOUR_API_TOKEN with your Pinboard API token
const API_TOKEN: &str = "YOUR_API_TOKEN";

// Chrome Bookmarks API endpoint
const BOOKMARKS_API: &str = "chrome://bookmarks/";

// Pinboard API endpoint
const PINBOARD_API: &str = "https://api.pinboard.in/v1/posts/add";

fn main() {
    // Create a new reqwest client
    let client = Client::new();

    // Fetch bookmarks from the Chrome Bookmarks API
    let chrome_bookmarks = fetch_chrome_bookmarks(&client).unwrap();

    // Iterate over the bookmarks and add them to Pinboard
    for bookmark in chrome_bookmarks["children"].as_array().unwrap() {
        let url = bookmark["url"].as_str().unwrap();
        let title = bookmark["title"].as_str().unwrap();
        let tags = bookmark["tags"].as_str().unwrap();

        // Add the bookmark to Pinboard
        let response = add_to_pinboard(&client, url, title, tags);
        println!("{:?}", response);
    }
}

// Fetches bookmarks from the Chrome Bookmarks API
fn fetch_chrome_bookmarks(client: &Client) -> Result<Value, reqwest::Error> {
    let response = client.get(BOOKMARKS_API).send()?.json()?;
    Ok(response)
}

// Adds a bookmark to Pinboard
fn add_to_pinboard(client: &Client, url: &str, title: &str, tags: &str) -> Result<Value, reqwest::Error> {
    let response = client
        .post(PINBOARD_API)
        .form(&[
            ("auth_token", API_TOKEN),
            ("url", url),
            ("description", title),
            ("tags", tags),
        ])
        .send()?
        .json()?;
    Ok(response)
}
```

This code uses the reqwest library for making HTTP requests and serde_json for handling JSON data. It fetches bookmarks from the Chrome Bookmarks API and then iterates over them, adding them to Pinboard with the add_to_pinboard function. The metadata tags for Pinboard are passed as the "tags" parameter in the form data when making the POST request to the Pinboard API.

Note: This example is a skeleton code and might require additional modification in order to work and is not guaranteed to work as is.


Do the same but now with Ruby instead of Rust.

Here is an example of code in Ruby that migrates bookmarks from the Chrome Bookmarks API to the Pinboard API, including metadata tags for Pinboard:

```ruby
require 'net/http'
require 'json'

# Replace YOUR_API_TOKEN with your Pinboard API token
API_TOKEN = "YOUR_API_TOKEN"

# Chrome Bookmarks API endpoint
BOOKMARKS_API = "chrome://bookmarks/"

# Pinboard API endpoint
PINBOARD_API = "https://api.pinboard.in/v1/posts/add"

def main
  # Fetch bookmarks from the Chrome Bookmarks API
  chrome_bookmarks = fetch_chrome_bookmarks

  # Iterate over the bookmarks and add them to Pinboard
  chrome_bookmarks["children"].each do |bookmark|
    url = bookmark["url"]
    title = bookmark["title"]
    tags = bookmark["tags"]

    # Add the bookmark to Pinboard
    response = add_to_pinboard(url, title, tags)
    puts response
  end
end

# Fetches bookmarks from the Chrome Bookmarks API
def fetch_chrome_bookmarks
  uri = URI(BOOKMARKS_API)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

# Adds a bookmark to Pinboard
def add_to_pinboard(url, title, tags)
  uri = URI(PINBOARD_API)
  req = Net::HTTP::Post.new(uri)
  req.set_form_data(
    "auth_token" => API_TOKEN,
    "url" => url,
    "description" => title,
    "tags" => tags
  )
  res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
    http.request(req)
  end
  JSON.parse(res.body)
end
```

This code uses the Net::HTTP library for making HTTP requests and JSON for handling JSON data. It fetches bookmarks from the Chrome Bookmarks API and then iterates over them, adding them to Pinboard with the add_to_pinboard method. The metadata tags for Pinboard are passed as the "tags" parameter in the form data when making the POST request to the Pinboard API.

Note: This example is a skeleton code and might require additional modification in order to work and is not guaranteed to work as is.


Please do the same, adding benchmarking to both.

Here is an example of Rust code that migrates bookmarks from the Chrome Bookmarks API to the Pinboard API, including metadata tags for Pinboard, and adds benchmarking to measure the time taken for the migration process:

```rust
use reqwest::Client;
use serde_json::Value;
use std::time::Instant;

// Replace YOUR_API_TOKEN with your Pinboard API token
const API_TOKEN: &str = "YOUR_API_TOKEN";

// Chrome Bookmarks API endpoint
const BOOKMARKS_API: &str = "chrome://bookmarks/";

// Pinboard API endpoint
const PINBOARD_API: &str = "https://api.pinboard.in/v1/posts/add";

fn main() {
    // Create a new reqwest client
    let client = Client::new();

    // Start the timer
    let start_time = Instant::now();

    // Fetch bookmarks from the Chrome Bookmarks API
    let chrome_bookmarks = fetch_chrome_bookmarks(&client).unwrap();

    // Iterate over the bookmarks and add them to Pinboard
    for bookmark in chrome_bookmarks["children"].as_array().unwrap() {
        let url = bookmark["url"].as_str().unwrap();
        let title = bookmark["title"].as_str().unwrap();
        let tags = bookmark["tags"].as_str().unwrap();

        // Add the bookmark to Pinboard
        let _response = add_to_pinboard(&client, url, title, tags);
    }

    // End the timer and print the duration
    let duration = start_time.elapsed();
    println!("Duration: {:?}", duration);
}

// Fetches bookmarks from the Chrome Bookmarks API
fn fetch_chrome_bookmarks(client: &Client) -> Result<Value, reqwest::Error> {
    let response = client.get(BOOKMARKS_API).send()?.json()?;
    Ok(response)
}

// Adds a bookmark to Pinboard
fn add_to_pinboard(client: &Client, url: &str, title: &str, tags: &str) -> Result<Value, reqwest::Error> {
    let _response = client
        .post(PINBOARD_API)
        .form(&[
            ("auth_token", API_TOKEN),
            ("url", url),
            ("description", title),
            ("tags", tags),
        ])
        .send()?;
    Ok(())
}
```
And here is the equivalent in Ruby:
```ruby
require 'net/http'
require 'json'
require 'benchmark'

# Replace YOUR_API_TOKEN with your Pinboard API token
API_TOKEN = "YOUR_API_TOKEN"

# Chrome Bookmarks API endpoint
BOOKMARKS_API = "chrome://bookmarks/"

# Pinboard API endpoint
PINBOARD_API = "https://api.pinboard.in/v1/posts/add"

time = Benchmark.measure do 
  # Fetch bookmarks from the Chrome Bookmarks API
  chrome_bookmarks = fetch_chrome_bookmarks

  # Iterate over the bookmarks and add them to Pinboard
 

continue

chrome_bookmarks["children"].each do |bookmark|
    url = bookmark["url"]
    title = bookmark["title"]
    tags = bookmark["tags"]

    # Add the bookmark to Pinboard
    add_to_pinboard(url, title, tags)
  end
end

puts "Time elapsed: #{time}"

# Fetches bookmarks from the Chrome Bookmarks API
def fetch_chrome_bookmarks
  uri = URI(BOOKMARKS_API)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

# Adds a bookmark to Pinboard

chrome_bookmarks["children"].each do |bookmark|
    url = bookmark["url"]
    title = bookmark["title"]
    tags = bookmark["tags"]

    # Add the bookmark to Pinboard
    add_to_pinboard(url, title, tags)
  end
end
puts time

# Fetches bookmarks from the Chrome Bookmarks API
def fetch_chrome_bookmarks
  uri = URI(BOOKMARKS_API)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

# Adds a bookmark to Pinboard
def add_to_pinboard(url, title, tags)
  uri = URI(PINBOARD_API)
  req = Net::HTTP::Post.new(uri)
  req.set_form_data(
    "auth_token" => API_TOKEN,
    "url" => url,
    "description" => title,
    "tags" => tags
  )
  res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
    http.request(req)
  end
end
```

Both the Rust and Ruby code have been modified to include benchmarking. In the Rust code, I have used the `std::time::Instant` struct to measure the start and end time of the migration process, and in the Ruby code, I have used the `Benchmark` module to measure the time taken for the entire block of code within the brackets. The time taken is printed after the block of code is executed.

Please note that this code is using Chrome Bookmarks API which is not a public API and might not work as expected, also the migration process may take a long time depending on the amount of bookmarks you are migrating.


chrome_bookmarks["children"].each do |bookmark|
    url = bookmark["url"]
    title = bookmark["title"]
    tags = bookmark["tags"]

    # Add the bookmark to Pinboard
    add_to_pinboard(url, title, tags)
  end
end
puts "Duration: #{time.real}s"

# Fetches bookmarks from the Chrome Bookmarks API
def fetch_chrome_bookmarks
  uri = URI(BOOKMARKS_API)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

# Adds a bookmark to Pinboard
def add_to_pinboard(url, title, tags)
  uri = URI(PINBOARD_API)
  req = Net::HTTP::Post.new(uri)
  req.set_form_data(
    "auth_token" => API_TOKEN,
    "url" => url,
    "description" => title,
    "tags" => tags
  )
  Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
    http.request(req)
  end
end
```
In both cases, the `Benchmark` or `Instant` library is used to measure the time taken for the migration process. The `time` variable or the `duration` variable will print the time taken for the migration process in seconds.

Note: This example is a skeleton code and might require additional modification in order to work and is not guaranteed to work as is.


chrome_bookmarks["children"].each do |bookmark|
    url = bookmark["url"]
    title = bookmark["title"]
    tags = bookmark["tags"]

    # Add the bookmark to Pinboard
    response = add_to_pinboard(url, title, tags)
  end
end
puts time

# Fetches bookmarks from the Chrome Bookmarks API
def fetch

chrome_bookmarks["children"].each do |bookmark|
    url = bookmark["url"]
    title = bookmark["title"]
    tags = bookmark["tags"]

    # Add

Ruby code that migrates bookmarks from the Chrome Bookmarks API to the Pinboard API, including metadata tags and benchmarking for Pinboard.

Sure, here is the Ruby code that migrates bookmarks from the Chrome Bookmarks API to the Pinboard API, including metadata tags for Pinboard and adds benchmarking to measure the time taken for the migration process:
```ruby
require 'net/http'
require 'json'
require 'benchmark'

# Replace YOUR_API_TOKEN with your Pinboard API token
API_TOKEN = "YOUR_API_TOKEN"

# Chrome Bookmarks API endpoint
BOOKMARKS_API = "chrome://bookmarks/"

# Pinboard API endpoint
PINBOARD_API = "https://api.pinboard.in/v1/posts/add"

time = Benchmark.measure do 
  # Fetch bookmarks from the Chrome Bookmarks API
  chrome_bookmarks = fetch_chrome_bookmarks

  # Iterate over the bookmarks and add them to Pinboard
  chrome_bookmarks["children"].each do |bookmark|
    url = bookmark["url"]
    title = bookmark["title"]
    tags = bookmark["tags"]

    # Add the bookmark to Pinboard
    add_to_pinboard(url, title, tags)
  end
end

puts time

# Fetches bookmarks from the Chrome Bookmarks API
def fetch_chrome_bookmarks
  uri = URI(BOOKMARKS_API)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

# Adds a bookmark to Pinboard
def add_to_pinboard(url, title, tags)
  uri = URI(PINBOARD_API)
  req = Net::HTTP::Post.new(uri)
  req.set_form_data(
    "auth_token" => API_TOKEN,
    "url" => url,
    "description" => title,
    "tags" => tags
  )
  res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
    http.request(req)
  end
  JSON.parse(res.body)
end
```
This code uses the Benchmark module to measure the time taken for the migration process, the time is printed at the end. 

Note: This example is a skeleton code and might require additional modification in order to work and is not guaranteed to work as is.


Rust code that migrates bookmarks from the Chrome Bookmarks API to the Pinboard API, including metadata tags and benchmarking for Pinboard.

Sure, here is the Rust code that migrates bookmarks from the Chrome Bookmarks API to the Pinboard API, including metadata tags for Pinboard and adds benchmarking to measure the time taken for the migration process:
```rust
use reqwest::Client;
use serde_json::Value;
use std::time::Instant;

// Replace YOUR_API_TOKEN with your Pinboard API token
const API_TOKEN: &str = "YOUR_API_TOKEN";

// Chrome Bookmarks API endpoint
const BOOKMARKS_API: &str = "chrome://bookmarks/";

// Pinboard API endpoint
const PINBOARD_API: &str = "https://api.pinboard.in/v1/posts/add";

fn main() {
    // Create a new reqwest client
    let client = Client::new();

    // Start the timer
    let start_time = Instant::now();

    // Fetch bookmarks from the Chrome Bookmarks API
    let chrome_bookmarks = fetch_chrome_bookmarks(&client).unwrap();

    // Iterate over the bookmarks and add them to Pinboard
    for bookmark in chrome_bookmarks["children"].as_array().unwrap() {
        let url = bookmark["url"].as_str().unwrap();
        let title = bookmark["title"].as_str().unwrap();
        let tags = bookmark["tags"].as_str().unwrap();

        // Add the bookmark to Pinboard
        let _response = add_to_pinboard(&client, url, title, tags);
    }

    // End the timer and print the duration
    let duration = start_time.elapsed();
    println!("Duration: {:?}", duration);
}

// Fetches bookmarks from the Chrome Bookmarks API
fn fetch_chrome_bookmarks(client: &Client) -> Result<Value, reqwest::Error> {
    let response = client.get(BOOKMARKS_API).send()?.json()?;
    Ok(response)
}

// Adds a bookmark to Pinboard
fn add_to_pinboard(client: &Client, url: &str, title: &str, tags: &str) -> Result<Value, reqwest::Error> {
    let _response = client
        .post(PINBOARD_API)
        .form(&[
            ("auth_token", API_TOKEN),
            ("url", url),
            ("description", title),
            ("tags", tags),
        ])
        .send()?;
    Ok(())
}
```
This code uses the std::time::Instant struct to measure the time taken for the migration process, the time is printed at the end.

Note: This example is a skeleton code and might require additional modification in order to work and is not guaranteed to work as is.