---
title: Vim GitHub Code Reviews
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  How to do code reviews in vim like with vscode github
  extension"
draft: false
---

# Vim GitHub Code Reviews

## ✅ TODOs
- [ ] code reviews in vim like with vscode github extension
- [ ] code reviews in Vim similar to the GitHub extension in VS Code, you'd need to make use of plugins and manual configurations. There isn't a one-size-fits-all solution in Vim for GitHub pull requests, but you can achieve similar functionality by combining various tools.

## 🧠 Full Chat

🙋 **You:**

How to do code reviews in vim like with vscode github extension

---

🤖 **Assistant:**

To do code reviews in Vim similar to the GitHub extension in VS Code, you'd need to make use of plugins and manual configurations. There isn't a one-size-fits-all solution in Vim for GitHub pull requests, but you can achieve similar functionality by combining various tools.

Here's a general approach:

1. **Setup fugitive.vim**:
   `fugitive.vim` is a Vim plugin for Git. It won't provide code review functionality, but it's a helpful starting point for any Git operations in Vim.

   - Install with [vim-plug](https://github.com/junegunn/vim-plug):
     ```vim
     Plug 'tpope/vim-fugitive'
     ```
   - Refer to its documentation for its usage: [fugitive.vim](https://github.com/tpope/vim-fugitive)

2. **GH CLI (Command-line Tool)**:
   GitHub's official command-line tool can be helpful to check out pull requests and to leave comments. 

   - Install `gh`: Follow the instructions at the [official repo](https://github.com/cli/cli).
   - With `gh`, you can checkout pull requests, view their status, create reviews, and more.

3. **Integration with Vim**:

   - **Checking out Pull Requests**: To check out a pull request in Vim, you can set up a command:
     ```vim
     command! -nargs=1 GHPullRequest !gh pr checkout <args>
     ```
     Now, in Vim, you can use `:GHPullRequest [PR_NUMBER]` to checkout a pull request.
   
   - **Viewing Pull Requests**: To view the list of pull requests, set up another command:
     ```vim
     command! GHViewPRs !gh pr list
     ```
     Use `:GHViewPRs` to get a list of pull requests in your terminal.

   - **Leaving Comments**: This would typically involve checking out the PR, reviewing it in Vim, and then using the `gh` command-line to leave any comments.

4. **Diff Viewing**:
   To view changes in the current branch compared to the main/master branch, you can use `fugitive.vim`'s diff capabilities:
   ```vim
   :Gdiff master
   ```

5. **Notifications**: There's no built-in way to get notifications about PRs in Vim, but you can use external tools or scripts to notify you and then use the above Vim integrations to review.

6. **Extensions**: Keep an eye on the Vim plugin ecosystem. New plugins are developed frequently, and there might be more specialized plugins for GitHub or other code review processes in the future.

Remember that while Vim can be made more powerful with plugins, it may not replicate the full VS Code GitHub extension experience. Still, for Vim enthusiasts, the above steps can streamline the code review process without leaving their favorite editor.