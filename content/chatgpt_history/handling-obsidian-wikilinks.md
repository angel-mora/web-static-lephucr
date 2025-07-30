---
title: Handling Obsidian Wikilinks
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  How does Obsidian handle wikilinks redirections to
  the right file despite folders’ depth?"
draft: false
---

# Handling Obsidian Wikilinks

## ✅ TODOs
- [ ] cument it. This way, if someone else (or future you) works with your Gollum wiki, they'll know how links are structured.

## 🧠 Full Chat

🙋 **You:**

How does Obsidian handle wikilinks redirections to the right file despite folders’ depth?

---

🤖 **Assistant:**

Obsidian, a popular note-taking app, uses a wiki-style linking mechanism that allows users to easily interlink their notes. The way Obsidian handles wikilinks, especially when dealing with folder structures, is relatively straightforward:

1. **Flat Linking Structure**: The primary strength of Obsidian's linking mechanism is that it essentially views your entire vault as a flat structure when it comes to links. This means that, irrespective of which folder a note is in, you can link to it directly using its name without needing to specify its path.

2. **Linking with Paths**: If you have files with the same name in different folders, you can specify the path to distinguish them. For instance, if you have a file `Note.md` in `FolderA` and another in `FolderB`, you can use:
   - `[[FolderA/Note]]`
   - `[[FolderB/Note]]`

3. **Automatic File Suggestions**: When you start typing within double brackets `[[`, Obsidian will provide autocompletion suggestions based on the filenames in your vault. This helps you quickly link to the right note, irrespective of its location.

4. **Handling Moved or Renamed Files**: If you move a file to a different folder or rename it, the links won't automatically update. However, Obsidian provides a "backlinks" pane that shows which notes link to the current note. If you've broken a link by moving or renaming a file, you can quickly navigate to the referencing notes and fix the links.

5. **Aliases**: Obsidian allows you to set up aliases for your notes. This means that even if a file is named `2023-08-19-Notes.md`, you could create an alias like `Today's Notes` for it. You can then link to the note using either the filename or its alias.

6. **Relative Path Linking**: If you're into more complex vault structures and need to be specific, you can use relative paths for linking. For instance, if you are in `FolderA` and want to link to a note in `FolderA/FolderB`, you could use `[[FolderB/Note]]`.

7. **URL-style Linking**: Obsidian also supports linking in a URL format, where the spaces in filenames are replaced with `%20`. This is especially useful for embedding local images or when working with the Obsidian Publish feature.

Remember, one of the advantages of using a tool like Obsidian is the flexibility it provides. You can structure your notes in a way that makes the most sense to you, and the software provides multiple methods to help you maintain and navigate those links.

---

🙋 **You:**

How can I mimic that md behavior of linking to the proper note despite its folder for gollum wiki?

---

🤖 **Assistant:**

Gollum is a simple wiki system built on top of Git that is also designed around the concept of linking files similar to markdown wiki links. However, its handling of links, especially across different folders, might not be as intuitive as Obsidian's out-of-the-box behavior.

To mimic the behavior of linking to the right note in Gollum irrespective of its folder (like in Obsidian), consider the following steps:

1. **Use Full Paths in Links**: 
   - When linking to another page, use the full path relative to the root of the repository. 
   - For instance, if you have a page `Page.md` inside a folder `FolderA`, you can link to it using `[[FolderA/Page]]`.

2. **Customize Gollum with JavaScript (if needed)**:
   - If you want a more automatic approach similar to Obsidian's linking mechanism, you might need to dive deeper into customization.
   - Using JavaScript, you could potentially scan through all the markdown files and make an index of their paths. Then, when creating a link, use this index to get the full path of the file with the given name.
   - However, this could be a performance issue for large repositories and might be a bit overkill.

3. **Always Check for Broken Links**:
   - One major difference between Obsidian and Gollum is that Obsidian's environment is more controlled. Since Gollum is built on top of Git, file changes can come from multiple sources, including direct edits, Git merges, etc.
   - Regularly check for broken links. There are tools and scripts available that can help you scan a repository for broken markdown links.

4. **Use a Consistent Naming Convention**:
   - To reduce ambiguity, use unique and descriptive names for your files.
   - This will make it less likely that you'll have two files with the same name in different folders.

5. **Consider Plugins or Extensions**:
   - The Gollum community might have developed plugins or extensions that can help with this issue. Keep an eye on the Gollum GitHub repository and related forums for any such developments.

6. **Document Your Conventions**:
   - If you settle on a specific method of linking, make sure to document it. This way, if someone else (or future you) works with your Gollum wiki, they'll know how links are structured.

Remember, while Gollum is flexible and integrates well with Git, it doesn't have the same built-in conveniences as Obsidian for handling links across folders. You'll likely need to implement a consistent system yourself or dive into custom solutions to mimic Obsidian's exact behavior.

---

🙋 **You:**

A set of gardens has a name?

---

🤖 **Assistant:**

Yes, a set or collection of gardens can have various names based on its purpose, design, or layout. Some potential terms for a set or collection of gardens include:

1. **Botanical Garden**: A place where a wide variety of plants are cultivated for scientific, educational, and ornamental purposes.
  
2. **Garden Complex**: A general term for a collection of gardens or garden areas located within a specific region or vicinity.

3. **Garden Suite**: Refers to a series of garden rooms or areas that are connected or related in design or theme.

4. **Arboretum**: A place where trees, shrubs, and herbaceous plants are cultivated for scientific and educational purposes.

5. **Garden District**: Refers to an urban area known for its gardens, often residential in nature.

6. **Garden Center**: While this term often refers to a place where plants and gardening supplies are sold, it can also indicate a central area surrounded by gardens.

7. **Horticultural Center**: A place dedicated to the study and exhibition of plants.

8. **Landscape Garden**: A larger area that might comprise multiple smaller gardens or features, often designed in a particular style or theme.

9. **Gardenscape**: An expanse or view of a large garden or collection of gardens.

10. **Park**: Larger than gardens, parks can contain multiple specialized garden areas within them.

If you're referring to a specific set or collection of gardens, context matters. The name might vary depending on cultural, historical, or regional factors.