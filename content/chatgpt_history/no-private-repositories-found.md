---
title: No Private Repositories Found
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Make this query so that it shows repos that are not
  public archive"
draft: false
---

# No Private Repositories Found

## 🧠 Full Chat

🙋 **You:**

Make this query so that it shows repos that are not public archive
https://github.com/angel-mora?tab=repositories&q=&type=private&language=&sort=

---

🤖 **Assistant:**

It appears that the GitHub profile of "angel-mora" does not have any private repositories available for public viewing. The query you provided specifically filters for private repositories, and the result indicates that there are no repositories matching this criterion in angel-mora's GitHub profile. 

This is consistent with GitHub's privacy policy, as private repositories are not visible to the public and can only be accessed by the owner and collaborators who have been granted explicit access.

---

🙋 **You:**

yes, I mean how can I place the query params to that url to filter what I require in my own session in here

---

🤖 **Assistant:**

To modify the URL query parameters for filtering repositories on a GitHub profile, like "angel-mora," you can adjust the parameters in the URL to specify the type of repositories you're interested in. For example, if you want to filter repositories that are not publicly archived, you can use the following query parameters:

1. Open the profile URL: `https://github.com/angel-mora`
2. Add the following query parameters for the repositories tab: `?tab=repositories`
3. Specify the type of repositories you want to see. If you want non-archived repositories, you should not include `archived=true` in your query. 

For example, if you want to see all repositories (both public and private, excluding archived ones), your URL will look like this:

```
https://github.com/angel-mora?tab=repositories
```

However, keep in mind that private repositories will not be visible unless you are logged in and have access to them. GitHub does not allow you to filter out archived repositories directly through the URL parameters. The 'Archived' status is usually visible on the repository page or you can manually sort them out after loading all repositories.

---

🙋 **You:**

modify this url to make it more specific
https://github.com/angel-mora?tab=repositories&q=&type=private&language=&sort=

---

🤖 **Assistant:**

To modify the URL for filtering repositories more specifically on GitHub, you can adjust the query parameters according to your needs. The URL you provided is already quite specific, but let's break it down and see how it can be further tailored:

1. `https://github.com/angel-mora`: This is the base URL directing to the user profile of "angel-mora" on GitHub.
2. `?tab=repositories`: This parameter ensures that the repositories tab is selected.
3. `q=`: This is a search query parameter. You can add specific keywords after `q=` to search within the repositories.
4. `type=private`: This filters the repositories to show only private ones. Change to `type=public` for public repositories, or remove it entirely to show both.
5. `language=`: Here you can specify a programming language to filter repositories by language. For example, `language=Python` will show only Python repositories.
6. `sort=`: This parameter is used for sorting the repositories. You can sort by options like `created`, `updated`, `pushed`, `full_name`.

Considering your requirements, if you want to filter the private repositories of "angel-mora" by a specific language and sort them, for instance, by the date they were created, you would modify the URL like this:

```
https://github.com/angel-mora?tab=repositories&q=&type=private&language=Python&sort=created
```

This URL will show all private repositories of the user "angel-mora" that are written in Python, sorted by the creation date. Remember, private repositories will only be visible if you have the necessary access permissions.

---

🙋 **You:**

I want private but not private-archived

---

🤖 **Assistant:**

To filter for private but not private-archived repositories on a GitHub profile like "angel-mora," you would typically need to use GitHub's interface features, as the URL parameters do not directly support filtering out archived repositories. Unfortunately, GitHub's standard URL query parameters do not include an option to exclude archived repositories.

However, you can initially filter for private repositories using the URL parameters and then manually exclude the archived ones using GitHub's web interface. Here’s the URL for filtering private repositories:

```
https://github.com/angel-mora?tab=repositories&type=private
```

This URL will list all private repositories of the user "angel-mora." After navigating to this URL, you can manually look through the list to identify and exclude the archived ones. Archived repositories are usually marked with an "Archived" label or have a distinctive visual cue.

Remember, viewing private repositories requires appropriate access permissions, and without these permissions, you won't be able to see any private repositories on someone else's profile.

---

🙋 **You:**

isn't there something like Astral.app for gh stars but for filtering repos?

---

🤖 **Assistant:**

While there isn't a direct equivalent of Astral.app specifically for filtering GitHub repositories, GitHub itself offers various search and filtering options that can help you find repositories based on different criteria. Here are some of the ways you can use GitHub's search functionalities to find repositories more effectively:

1. **Search by Language**: You can filter repositories by programming languages using the `language:LANGUAGE` qualifier. For instance, `language:Python` would list all repositories written in Python【34†source】.

2. **Search by Visibility**: To filter repositories based on their visibility (public or private), you can use `is:public` or `is:private`. For example, `is:private` will list all private repositories【35†source】.

3. **Search by Date**: You can filter repositories based on specific dates using keywords like `created`, `updated`, `merged`, and `closed`. These keywords should be followed by a date in the format `YYYY-MM-DD`. For example, `created:>2022-01-01` would list repositories created after January 1, 2022【36†source】.

4. **Search by License**: If you're looking for projects with specific licenses, you can use the `license:LICENSE_KEYWORD` search qualifier. For example, `license:MIT` would list projects with the MIT license【37†source】.

For more advanced and specific filtering options, you can refer to the GitHub Docs or use GitHub's Advanced Search feature, which offers more filtering options【38†source】.

While these methods can help you find repositories based on certain criteria, they might not be able to filter out specific cases like non-archived private repositories directly. For such specific needs, you might have to combine multiple search parameters and manually sort through the results.

---

🙋 **You:**

instruct me on github advanced search feature for my request to show my private repos that are not archived

---

🤖 **Assistant:**

To use GitHub's Advanced Search feature to find your private repositories that are not archived, follow these steps:

1. Go to GitHub's Advanced Search page: [GitHub Advanced Search](https://github.com/search/advanced).

2. In the **Repositories** section of the advanced search form, set the following fields:
   - **Written in this language:** (Optional) Select a language if you want to filter by language.
   - **In this owner:** Enter your GitHub username.
   - **With this visibility:** Select "Private".
   - **Not this keyword:** Here, you can try adding "archived" as a keyword. However, this might not be entirely reliable for filtering out archived repositories since this field searches within the repository's name, description, and README.

3. After setting the fields, click on the **Search** button.

4. Once the search results are displayed, you'll need to manually identify and exclude any archived repositories. Look for an "Archived" label or a visual indicator that marks a repository as archived.

Note that GitHub's search capabilities, even in advanced search, may not provide a direct way to exclude archived repositories. The manual step of identifying and excluding archived repositories is necessary because GitHub's search parameters do not directly support filtering out archived repositories.