---
title: Flaky Test Detection CircleCI
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Flaky Test Detection CircleCI

## ✅ TODOs


## 📌 Summary
How to see all flaky specs in a pipeline? I'm using CircleCI and Rails. Please provide just most up-to-date information

## 🧠 Full Chat


How to see all flaky specs in a pipeline? I'm using CircleCI and Rails. Please provide just most up-to-date information



To identify all flaky tests in your CircleCI pipeline for a Rails project, you can utilize CircleCI's Test Insights feature, which offers detailed analysis of your test performance, including flaky test detection. Here's how you can access and use this feature:

1. **Accessing Test Insights**:
   - Navigate to your project's **Workflow Insights** page on the CircleCI dashboard.
   - Select the **Tests** tab to view test-specific insights.

2. **Identifying Flaky Tests**:
   - Within the Test Insights, locate the **Flaky Tests** section.
   - This section lists tests that have failed and passed on the same commit within a 14-day window, indicating non-deterministic behavior.
   - Flaky tests are labeled as `FLAKY` throughout the CircleCI app for easy identification.

For more detailed information, refer to CircleCI's official documentation on [Test Insights](https://circleci.com/docs/insights-tests/).

Additionally, if you prefer a command-line approach or need to analyze test data programmatically, you can use the CircleCI API to fetch test metadata. Here's how:

1. **Fetching Test Data via API**:
   - Make a GET request to the following endpoint:
     ```
     https://circleci.com/api/v2/project/{project-slug}/{job-number}/tests
     ```
   - Replace `{project-slug}` and `{job-number}` with your specific project details.
   - Include your CircleCI personal API token in the request header for authentication.

2. **Analyzing Test Metadata**:
   - The API response provides test metadata in JSON format, including details like test names, run times, and results.
   - By compiling and analyzing this data, you can identify tests that exhibit flaky behavior.

For more information on using the CircleCI API for test data, refer to the [CircleCI Support Center](https://support.circleci.com/hc/en-us/articles/360057708991-How-to-get-information-about-flaky-and-slowest-tests-via-the-insights-API).

By leveraging these tools, you can effectively identify and manage flaky tests in your CircleCI pipeline, ensuring a more stable and reliable test suite for your Rails application. 

How can I see the store_test_results output for our last week's run?
https://circleci.com/docs/collect-test-data/ 

To see the `store_test_results` output for your last week's run on CircleCI, follow these steps:  

### **1. Access Test Insights (UI Method)**
1. **Go to CircleCI Dashboard**: [https://app.circleci.com/](https://app.circleci.com/)  
2. **Select Your Project**: Find your repository in the list.  
3. **Navigate to "Insights"**:  
   - Click on **"Insights"** in the left sidebar.  
   - Select the **"Tests"** tab.  
4. **Filter by Date Range**:  
   - Set the date range to include last week.  
   - Locate the specific workflow/job run you want to inspect.  
5. **View Test Results**: If you used `store_test_results`, you should see test artifacts and flaky test insights.

---

### **2. Download Test Results (Artifacts)**
If your tests generated JUnit, RSpec, or another compatible format and used `store_test_results`, you can download them:

1. **Go to Your Pipeline**: Navigate to the **"Jobs"** page.  
2. **Select a Workflow Run**: Click on the specific run from last week.  
3. **Find the "Artifacts" Tab**:  
   - Look for test results (e.g., `test-results.xml`).  
   - Download and inspect them.

---

### **3. Use CircleCI API (For Automation)**
You can fetch past test results programmatically using CircleCI's API:

#### **Fetch Workflow Runs from Last Week**
```sh
curl -X GET "https://circleci.com/api/v2/project/gh/{org}/{repo}/pipeline?branch=main&limit=100" \
  -H "Circle-Token: YOUR_PERSONAL_API_TOKEN"
```
> Replace `{org}` and `{repo}` with your GitHub org and repo name.  

#### **Get Test Results from a Specific Job**
```sh
curl -X GET "https://circleci.com/api/v2/project/gh/{org}/{repo}/job/{job_number}/artifacts" \
  -H "Circle-Token: YOUR_PERSONAL_API_TOKEN"
```
> Find `{job_number}` from the previous API response.  

---

Would you like help automating the retrieval of test reports for regular analysis? 🚀