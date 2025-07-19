---
title: Implementing Changes in VSCode
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Implementing Changes in VSCode

## ✅ TODOs


## 📌 Summary
how to implement changes pr comments extension vscode. When I open the comment I can only see the comparison version and it's not possible to edit that view. Is it possible to open the file with the comments instead of the non-modifiable diff?

## 🧠 Full Chat


how to implement changes pr comments extension vscode. When I open the comment I can only see the comparison version and it's not possible to edit that view. Is it possible to open the file with the comments instead of the non-modifiable diff?

In Visual Studio Code, you can use the "Changes" view to see and make changes to comments in a more interactive way. Here's how you can access it:

1. Open the source control sidebar by clicking on the icon on the left-hand side (looks like a set of branch lines).
2. In the source control sidebar, click on the "Comments" tab. Here you should see a list of comments and discussions.
3. Click on the comment or discussion that you want to work on. It will open the comment in the editor area.
4. In the comment view, you'll see the "Changes" button at the top right corner of the comment. Click on it.

By clicking the "Changes" button, Visual Studio Code will open a diff view of the file that includes the comment. You can now modify the code directly in the editor, and any changes you make will be reflected in the diff view. This allows you to make changes and resolve comments without needing to switch between the comment view and the actual code.

Remember to save your changes when you're done, and don't forget to commit them if you're using version control.

How can I set the Open Changes with Working File by default? Or what is a shortcut? My problem is when I click a modified and commented file from the pull requests and issues vscode extension and it redirects to a read-only diff

To set the "Open Changes with Working File" as the default behavior in Visual Studio Code, you can modify the settings of the Git extension. Here's how you can do it:

1. Open the settings in Visual Studio Code by pressing `Ctrl+,` (comma) or by navigating to File > Preferences > Settings.
2. In the settings, search for "git.openDiffOnClick" or navigate to the "Git" section.
3. Locate the "Git: Open Diff on Click" option and change its value to "openWorkingFile" (without quotes). This option sets the default behavior to open the working file instead of the read-only diff.

Alternatively, you can also use a shortcut to quickly switch between the read-only diff and the working file. By default, the shortcut is set to `Ctrl+K D` (Windows/Linux) or `Cmd+K D` (Mac). You can press this shortcut while viewing a diff to toggle between the read-only diff and the working file.

Changing the default behavior or using the shortcut should allow you to open the file with comments and make modifications directly instead of being limited to the read-only diff view.