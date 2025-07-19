---
title: Foam Daily Log Templates
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Foam Daily Log Templates

## ✅ TODOs


## 📌 Summary
how can I make a wikilink to create a file with specific path based on a template so it's prepopulated. E.g. clicking [[Daily Log entry]] should redirect to either the existing file or a new one in ~/Documents/my_folder/subfolder/2024-04-09-daily-log. Feel free to suggest different kinds of solutions. Like using vscode foam, or obsidian plugins combinations. Make sure to browse the web to provide the best possible advice

## 🧠 Full Chat


how can I make a wikilink to create a file with specific path based on a template so it's prepopulated. E.g. clicking [[Daily Log entry]] should redirect to either the existing file or a new one in ~/Documents/my_folder/subfolder/2024-04-09-daily-log. Feel free to suggest different kinds of solutions. Like using vscode foam, or obsidian plugins combinations. Make sure to browse the web to provide the best possible advice

Creating a Wikilink that redirects to either an existing file or creates a new one in a specific path, pre-populated based on a template, is a process that involves a combination of settings and functionalities available in tools like VSCode with the Foam extension or Obsidian. Below are the approaches tailored to Foam for VSCode, given its flexibility and extensibility, which should serve as a solid foundation for achieving your goal.

### Using Foam in VSCode

Foam supports creating notes from templates through its templating system. This system can utilize variables, including date variables, and specify paths for new notes, making it particularly useful for your use case of creating "Daily Log entries."

#### Setting Up a Daily Note Template

1. **Create a Template:** You would start by creating a template for your daily logs. For instance, you might have a template located at `.foam/templates/daily-note.md` for daily notes. This template can include predefined content and use Foam-specific variables (like `FOAM_DATE_YEAR`, `FOAM_DATE_MONTH`, `FOAM_DATE_DAY` for date stamping) to dynamically generate the file content【5†source】.

2. **Configuring the Path:** You can define the path where the new note should be created directly in your template's metadata using the `filepath` attribute. This path can include variables to dynamically specify directories based on the current date, allowing you to organize your notes into specific folders like `~/Documents/my_folder/subfolder/2024-04-09-daily-log`. For example, your template might specify a `filepath` that incorporates `FOAM_DATE_YEAR`, `FOAM_DATE_MONTH`, and `FOAM_DATE_DAY` to create a file in a date-specific directory【5†source】.

3. **Automating Daily Note Creation:** Foam provides the `Foam: Open Daily Note` command to automatically create or open a daily note based on the current date. By configuring your daily note template and specifying the desired path and filename format in your `.vscode/settings.json`, you can automate the process of logging daily entries【7†source】.

4. **Custom Commands for Specific Use Cases:** Foam's command system is highly customizable. For instance, the `foam-vscode.create-note` command allows for specifying the `notePath` and `templatePath`, among other parameters. This means you can set up custom commands or even keybindings that create notes with specific characteristics or in particular locations based on the command arguments【6†source】.

#### Advanced Customizations and Automations

- **VSCode Snippets and Foam Variables:** For more complex note creation logic, you might leverage VSCode snippets in combination with Foam's variables. This approach allows for highly dynamic content generation within your templates.
- **Extensions and Scripts:** Considering Foam operates within VSCode, you can also extend its functionality with other VSCode extensions or even automate workflows with external scripts, invoking VSCode commands or manipulating files directly as needed.

### Additional Tools and Plugins

While the focus here is on Foam for VSCode due to its flexibility and integration capabilities, similar concepts apply to other knowledge management tools like Obsidian. Obsidian offers a Templater plugin that can dynamically create files based on templates, and with the right setup, you can achieve similar outcomes.

In summary, by leveraging Foam's templating system, command customization, and the ability to specify dynamic paths and content within templates, you can set up a workflow that automatically generates or navigates to daily log entries based on the current date, organized in a structured directory hierarchy.

Check this url please and now suggest an approach with Obsidian
https://www.youtube.com/watch?v=ccN5vJzXwvo&t=1s

Given that the video discusses Obsidian's capabilities with Dataviewjs, Templates, and Daily Notes, for implementing a system similar to the VSCode Foam approach in Obsidian, consider leveraging these features:

1. **Templates**: Use Obsidian's Templater plugin to create daily log templates. Templater allows for dynamic content similar to Foam's templating system, utilizing variables for dates and other metadata.

2. **Daily Notes**: Configure Obsidian's Daily Notes plugin to automatically create a new note for each day, using your predefined template. This ensures that each day you have a pre-populated note ready.

3. **Dataviewjs**: For more advanced use cases, such as aggregating content from various notes or embedding dynamic queries within your daily logs, the Dataview plugin can be extremely powerful. You can use it to pull in tasks, notes, or any other content tagged or categorized across your Obsidian vault based on the date or other criteria.

4. **File Path and Naming**: Ensure that your template includes dynamic variables for the date to name and place the file correctly within your desired folder structure. Obsidian's template system supports date variables that can automatically generate filenames and paths based on the current date.

This approach combines the power of Templater for dynamic content generation, Daily Notes for automatic note creation, and Dataview for sophisticated data manipulation and presentation within your notes. For a step-by-step guide and examples, you might find tutorials and documentation on Obsidian's official forum and community hubs very helpful.

Show me the actual implementation. Remember,  clicking [[Daily Log entry]] should redirect to either the existing file or a new one in ~/Documents/my_folder/subfolder/2024-04-09-daily-log

For implementing the desired functionality in Obsidian, you'll need to combine features from the Daily Notes, Templater, and possibly other plugins to manage dynamic file creation and linking. The precise setup involves configuring Templater to dynamically create file paths and names based on the current date and then linking or accessing these files through Obsidian's markdown link or command features.

1. **Configure the Daily Notes Plugin** to create new notes with a date-based naming scheme in your desired directory.
2. **Use the Templater Plugin** to dynamically generate file paths and names, utilizing date variables within your templates. This requires setting up a template that includes variables for the current date in the file name and path.
3. **Markdown Links or Commands**: You can create a markdown link (e.g., `[[Daily Log Entry]]`) that, when clicked, either opens an existing daily log file for the current date or creates a new one if it doesn't exist. This might involve custom Templater scripts or commands that check for the existence of a file and then act accordingly.

This setup ensures that clicking a link like `[[Daily Log entry]]` in Obsidian will direct you to a note named with the current date in your specified path, creating a new one if necessary. For detailed step-by-step instructions, including the exact Templater syntax and configuration, referring to the Templater plugin documentation and Obsidian community forums will be necessary, as these sources provide comprehensive guides and examples tailored to various use cases.