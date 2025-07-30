---
title: Execute .sh file from Windows download folder in Ubuntu WSL
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  How to execute a sh file in a Windows download folder
  from Ubuntu WSL? If I `ls` it, only see a different directory but not the Windows
  users'."
draft: false
---

# Execute .sh file from Windows download folder in Ubuntu WSL

## ✅ TODOs
- [ ] this, you can type `chmod +x <filename>.sh` in the Downloads folder in the Ubuntu terminal. This will give the file executable permissions.

## 🧠 Full Chat

🙋 **You:**

How to execute a sh file in a Windows download folder from Ubuntu WSL? If I `ls` it, only see a different directory but not the Windows users'.

---

🤖 **Assistant:**

When you are using the Windows Subsystem for Linux (WSL) on Windows, you can access Windows files and folders from the Ubuntu terminal. However, you need to know the path to the folder in Windows where the file is located. Here are the steps to execute a shell script (.sh file) in a Windows download folder from Ubuntu WSL:

1. Open the Ubuntu terminal on WSL.

2. Type `cd /mnt/c/Users/<Windows username>/Downloads` to change the directory to the Downloads folder in your Windows user account. Replace `<Windows username>` with your actual Windows username.

3. Type `ls` to list the contents of the Downloads folder. You should be able to see the shell script file if it is in this folder.

4. Type `./<filename>.sh` to execute the shell script file, replacing `<filename>` with the actual name of your shell script file.

Note that you may need to make the shell script file executable first. To do this, you can type `chmod +x <filename>.sh` in the Downloads folder in the Ubuntu terminal. This will give the file executable permissions.