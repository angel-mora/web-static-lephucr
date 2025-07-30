---
title: Centralize PDFs in Obsidian.
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Can I use obsidian to centralize all my pdfs?"
draft: false
---

# Centralize PDFs in Obsidian.

## 🧠 Full Chat

🙋 **You:**

Can I use obsidian to centralize all my pdfs?

---

🤖 **Assistant:**

Yes, you can use Obsidian to centralize all your PDFs. Obsidian is a powerful note-taking and knowledge management tool that allows you to link and organize various types of files, including PDFs. Here's how you can use it for your PDFs:

1. **Import PDFs into Obsidian**: You can add PDF files to your Obsidian vault by simply dragging and dropping them into the vault's directory. Obsidian will treat these PDFs as part of your knowledge base.

2. **Linking PDFs in Notes**: You can create links to these PDFs in your notes. This allows for easy referencing and quick access.

3. **Annotating PDFs**: Some versions of Obsidian allow for PDF annotation directly within the app. This can be an efficient way to take notes on or highlight important parts of your PDFs.

4. **Searchability**: Obsidian can index the text in your PDFs (if they are text-based and not images), making them searchable within the app. This makes it easier to find specific information.

5. **Organizing with Tags and Folders**: You can organize your PDFs using folders and tags within Obsidian, helping you keep your files in a structured and easy-to-navigate system.

Remember to regularly back up your Obsidian vault, as it stores all your notes and files, including your centralized PDFs.

---

🙋 **You:**

If I am using git, would git-lfs work? How?

---

🤖 **Assistant:**

Yes, Git Large File Storage (Git LFS) can work effectively with Obsidian, especially if you're dealing with large PDFs. Git LFS is an extension for Git that allows

---

🤖 **Assistant:**

Yes, Git Large File Storage (Git LFS) is a great solution for handling large files, like PDFs, within a Git repository. Git LFS replaces large files in your repository with small, pointer files, while storing the actual file contents on a remote server. This way, your repository remains lightweight and fast. Here's how to use Git LFS, particularly if you are managing PDFs in an Obsidian vault:

1. **Install Git LFS**: First, you need to install Git LFS. It's a separate extension that integrates with Git. You can download it from [Git LFS website](https://git-lfs.github.com/).

2. **Initialize Git LFS**: Once installed, navigate to your Git repository (your Obsidian vault in this case) in the command line and run `git lfs install`. This sets up Git LFS in your repository.

3. **Track Large Files with Git LFS**: To track PDF files, use the command `git lfs track "*.pdf"`. This tells Git LFS to manage files that match the pattern (all `.pdf` files in this case). Remember to commit the `.gitattributes` file that this command creates or modifies; it's what tells Git which files to treat as large files.

4. **Commit and Push as Usual**: Add your PDFs to the repository and commit them as you would with any other file. When you push to a remote repository, Git LFS will upload the large files to the LFS storage, and the pointer files to your Git repository.

5. **Cloning and Pulling**: When others clone or pull from the repository, Git LFS will download the large files from LFS storage as needed. This keeps the clone and pull processes efficient.

6. **Storage and Bandwidth Quotas**: Be aware that Git LFS requires storage space on a server (like GitHub, GitLab, etc.), and these services often have quotas on LFS usage. You may need to consider these limits depending on the size and number of your PDFs.

Using Git LFS with your Obsidian vault can be a powerful way to manage large PDFs and other

---

🙋 **You:**

But if I also use Obsidian sync it will also store files in that side, right?

---

🤖 **Assistant:**

Yes, if you are using Obsidian Sync along with Git (and Git LFS) for your Obsidian vault, your files will be stored in both systems. Here's how this setup would work:

1. **Obsidian Sync**: Obsidian Sync is a service provided by the makers of Obsidian for syncing your vault between devices. If you use Obsidian Sync, it will automatically handle the synchronization of all files in your vault, including PDFs, across your devices.

2. **Git with Git LFS**: Separately, if you are using Git with Git LFS for version control or backup, your PDFs (and other files) will be tracked and stored as per your Git repository setup. Git LFS will handle large files like PDFs, storing the actual file content on a remote LFS server, while your Git repository will contain pointer files.

3. **Dual Storage**: In this scenario, your files are effectively stored in two places:
   - On the Obsidian Sync servers (as part of the regular sync service).
   - On your Git LFS storage and Git repository (for version control and collaboration).

4. **Considerations**:
   - **Storage Overhead**: This approach means you will have duplicate storage of your files, which can be an overhead in terms of space and cost, especially for large files.
   - **Version Control vs. Sync**: Obsidian Sync is focused on synchronization across devices, while Git (with Git LFS) provides version control and collaboration features. They serve different purposes.
   - **Conflict Management**: Be mindful of potential conflicts when using both systems simultaneously. Changes made in one system (like Git) need to be synced to the other (Obsidian Sync), and vice versa.
   - **Network Usage**: Uploading and downloading large files from both services can consume significant network bandwidth.

In summary, using both Obsidian Sync and Git with Git LFS is feasible, but it requires careful management to ensure efficient use of resources and to avoid conflicts.

---

🙋 **You:**

Can I update a obsidian json file to better manage tracked files?

---

🤖 **Assistant:**

Yes, you can manually update an Obsidian JSON configuration file to manage how files are tracked or handled within the Obsidian app. However, there are a few important considerations:

1. **Understanding JSON Structure**: JSON (JavaScript Object Notation) files are structured in a specific way. You need to understand the structure and syntax of JSON to make accurate changes. A JSON file uses a key-value pair system and is very sensitive to formatting. A small mistake, like a missing comma or brace, can cause errors.

2. **Locating the Right File**: Identify the correct JSON file within your Obsidian vault that contains the settings or configurations you want to change. Obsidian stores various settings in different JSON files.

3. **Backup Before Making Changes**: Always backup your original JSON file before making any changes. This way, if something goes wrong, you can restore the original settings.

4. **Editing the File**: You can edit a JSON file with any text editor. Make the necessary changes, keeping in mind the correct syntax. For example, if you want to change how certain files are tracked, you would locate the relevant keys and modify their values.

5. **Reflecting Changes**: After saving your changes, you may need to restart Obsidian for the changes to take effect. 

6. **Caution**: Be cautious when editing configuration files. Improper changes can lead to unexpected behavior in the app.

7. **Limitations**: Not all aspects of file management in Obsidian can be controlled through JSON configuration files. Some behaviors are hardcoded into the app and can't be changed by users.

8. **Automation and Scripts**: For more advanced file management, consider using scripts or plugins if they are available and meet your needs. This approach is often safer and more effective than manually editing configuration files.

Remember, while it's possible to manually edit configuration files like JSON, it's typically recommended only for advanced users who are comfortable with the potential risks and have a clear understanding of the changes they are making.