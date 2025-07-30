---
title: Check & Revoke Repo Access
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  I fired an employee who had access to multiple personal
  repos. How can I see which of my repos he still has access to?"
draft: false
---

# Check & Revoke Repo Access

## ✅ TODOs
- [ ] the same.

## 🧠 Full Chat

🙋 **You:**

I fired an employee who had access to multiple personal repos. How can I see which of my repos he still has access to?

---

🤖 **Assistant:**

If the employee had access to your repositories on a platform like GitHub, GitLab, or Bitbucket, you'll need to review the permissions on each platform to ensure that they no longer have access. I'll provide a general guide using GitHub as an example, but the general steps are similar for other platforms:

### Checking Repositories Access on GitHub

1. **Login to GitHub**:
   Start by logging into your GitHub account.

2. **Navigate to Settings**:
   On the top-right corner, click on your profile picture and choose 'Settings'.

3. **Access the 'Repositories' Section**:
   On the left sidebar, you should see a 'Repositories' option. Click on it.

4. **View Repository Access**:
   You will be presented with a list of all the repositories. For each repo, you can see who has access to it. 

5. **Review & Remove Access**:
   Go through the list and check for any repositories where the former employee still has access. If they do, click on the repository and then go to the 'Settings' tab. Navigate to the 'Manage access' section and remove the employee's access from there.

6. **Consider Using Teams/Organizations**:
   If you have multiple collaborators, consider using GitHub Organizations and Teams. This allows you to manage permissions for groups of users, which can simplify the process of adding or removing access.

7. **Audit Other Services**:
   Ensure that you also review any other platforms or services where the employee might have had access, such as deployment services, CI/CD platforms, and third-party tools integrated with your repositories.

8. **Best Practice**:
   In the future, when providing access to any service or repository, always document which employees or collaborators have access to what. This will help in quickly identifying and revoking access when needed.

### Additional Security Precautions:

1. **Rotate API keys and Secrets**: If the employee had access to any API keys, secrets, or environment variables, it's a good idea to regenerate and rotate those to prevent any unauthorized access.

2. **Check Commit History**: Ensure that there haven’t been any unauthorized commits or changes to your repositories.

3. **Enable 2FA**: If it's not already enabled, consider enabling Two-Factor Authentication for your account and encourage all collaborators to do the same.

4. **Monitor for Suspicious Activity**: Keep an eye on your repositories and related services for any unusual or unauthorized activity.

Lastly, always remember that communication is key. If you're unsure about access or any changes, reach out to your team and collaborators to verify.

---

🙋 **You:**

How can I see watchers of my repo?

---

🤖 **Assistant:**

On GitHub, "watchers" are users who have chosen to "Watch" your repository, which means they receive notifications for new issues, pull requests, and comments. If you want to see the list of watchers for your repo, you can do so through the GitHub interface or the GitHub API.

### Through the GitHub Interface:

1. **Go to Your Repository**: Navigate to your GitHub repository using your web browser.

2. **Navigate to the Watchers Page**: Near the top-right corner of the page, you'll see several icons representing watchers, stars, and forks.
   
   - Click on the number next to the eye icon (which represents watchers).

3. **View the List**: This will redirect you to a page showing a list of all users who are watching your repository.

### Through the GitHub API:

If you prefer a more programmatic approach or want to integrate this functionality into a tool or script, you can use the GitHub API.

Here's a simple curl command to fetch watchers of a repository:

```bash
curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/USERNAME/REPO_NAME/subscribers
```

Replace `USERNAME` with the owner of the repository and `REPO_NAME` with the name of the repository.

This will return a JSON list of users who are watching the repository. Note that you might be rate-limited if you're making a lot of requests in a short period, especially if you're not authenticated. If you have authentication (like a personal access token), you can increase your request limit.

Remember, the list of watchers is public information for public repositories. If the repository is private, only collaborators with the necessary permissions can view the list of watchers.

---

🙋 **You:**

What a VC would like to see in my personal github?

---

🤖 **Assistant:**

When venture capitalists (VCs) or investors look at your personal GitHub profile, they're typically not diving deep into the code but rather are looking for signs of your technical skill, commitment, and broader engagement with the tech community. Here are some aspects they might consider:

1. **Activity & Commit History**: Regular commits and activity show dedication and consistency. A green contribution graph can indicate that you're actively coding, collaborating, or contributing to projects.

2. **Quality of Repositories**: 
    - **Well-documented code**: Good READMEs, comments, and clear commit messages demonstrate clarity of thought and professionalism.
    - **Tests**: Presence of tests can indicate a concern for quality and stability.
    - **Structure**: How well-organized is your code? Do you follow best practices?

3. **Number & Type of Projects**: 
    - **Original Projects**: These can give insights into your creativity, interests, and the kind of products or solutions you can build.
    - **Forks & Contributions**: Contributing to other projects demonstrates collaboration and engagement with the wider open-source community.

4. **Languages & Technologies**: The languages and tools you use can give insights into your technical proficiency and areas of expertise.

5. **Starred Repositories**: While not a major indicator, the repositories you've starred can sometimes give a hint about the technologies, tools, or areas you're interested in.

6. **Followers & Collaboration**: 
    - **Number of Followers**: A large number of followers might indicate influence or recognition in the tech community.
    - **Collaborators**: Working with others on projects indicates teamwork and collaboration skills.

7. **Open Source Contributions**: If you’ve contributed to prominent open-source projects, it's a sign of both technical skill (as these projects often have rigorous review processes) and a willingness to give back to the community.

8. **Issues & Discussions**: Engaging in meaningful discussions, raising issues, and helping others in the community can showcase your depth of understanding and commitment to the ecosystem.

9. **Professionalism**: 
    - **Code of Conduct**: Do you have one in your projects? It can show that you care about creating a respectful and inclusive environment.
    - **How you handle issues and pull requests**: Respectful, constructive communication is essential.

10. **Learning & Growth**: If your profile shows a progression in the complexity of projects or a trend of picking up new languages or frameworks, it can demonstrate a drive to learn and adapt.

It's important to note that while a robust GitHub profile can be a strong positive signal, the absence of one doesn't necessarily mean an entrepreneur or developer lacks skill or commitment. Many developers work on private projects, contribute to private repositories, or might be more active in other forums and communities.

Lastly, while VCs might glance at your GitHub profile, other aspects like your product, market fit, business model, team dynamics, and traction often hold much more weight in their decision-making process.