---
title: Creating notes with templates
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Creating notes with templates

## ✅ TODOs


## 📌 Summary
Creating a note via a template link

## 🧠 Full Chat


Creating a note via a template link
https://www.reddit.com/r/ObsidianMD/comments/14h317c/creating_a_note_via_a_template_link/
https://forum.obsidian.md/t/automatic-wikilink-template/85131
How can I achieve this today? Dig into Obsidian current features and famous plugins



To automatically create notes from templates when clicking on non-existent links in Obsidian, you can utilize the **Templater** plugin's folder templates feature. This allows you to specify that any new note created within a particular folder will have a designated template applied automatically.

**Steps to Achieve This:**

1. **Install and Enable Templater Plugin:**
   - Go to Obsidian's **Settings**.
   - Navigate to **Community plugins** and ensure **Templater** is installed and enabled.

2. **Configure Folder Templates:**
   - In Templater's settings, locate the **Folder Templates** section.
   - Assign specific templates to desired folders. For example, you might set a "Tasks" template for a `Tasks` folder and a "Journal" template for a `Journal` folder.

3. **Create Links with Folder Paths:**
   - When creating a link to a non-existent note, include the folder path in the link. For instance:
     - `[[Tasks/Meeting Notes]]`
     - `[[Journal/2025-02-11]]`
   - Upon clicking these links, Obsidian will create the new note in the specified folder, and Templater will automatically apply the corresponding template.

This method ensures that new notes are generated with the appropriate structure and content based on their intended purpose. For a detailed discussion on this approach, you can refer to this Reddit thread:

citeturn0fetch0

By implementing this setup, you can streamline your note-taking process, ensuring consistency and efficiency across your Obsidian vault. 

Put the proper path in templater config and created a new file called 3_resources/templates/recovery/emotions log, being that an arbitrary note title to hypothetically get the template injected

Now that you've set up the **Templater** plugin and created your template file (`3_resources/templates/recovery/emotions log`), follow these steps to ensure that new notes in the correct folder automatically use this template:

### **1. Set Up Folder Templates in Templater**
- Open **Obsidian Settings** → **Templater**.
- Scroll down to **Folder Templates**.
- Click **Add a new folder template**.
- Set:
  - **Folder**: The folder where the new notes will be created (e.g., `Recovery Logs/`).
  - **Template**: `3_resources/templates/recovery/emotions log`.

### **2. Create a New Note Using a Link**
- In any note, create a new internal link like:
  ```
  [[Recovery Logs/2025-02-11 Emotions Log]]
  ```
- When you click this link, a new file will be created under `Recovery Logs/`.
- The **Emotions Log** template should be automatically applied.

### **3. Alternative: Manual Templater Command**
If the template isn’t automatically applied, try:
- Open the new note.
- Run the Templater command:  
  **Command Palette (Ctrl/Cmd + P) → "Templater: Insert Template" → Select your emotions log template**.

### **4. Verify and Debug**
- Ensure the `Recovery Logs/` folder exists.
- Double-check that the template file path is correct.
- If the template isn't applied on note creation, try restarting Obsidian.

This setup should allow automatic note creation with the **Emotions Log** template whenever you create a new linked note in `Recovery Logs/`. 🚀