---
title: Explore Obsidian Vault Metadata
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Explore Obsidian Vault Metadata

## ✅ TODOs
- [ ] wnload rdfind to mac

## 📌 Summary
How can I explore obsidian vault metadata? Like number of files and folders. Also, want to ignore from sync some folders through json config and also understand how it's done in the ui.

## 🧠 Full Chat


How can I explore obsidian vault metadata? Like number of files and folders. Also, want to ignore from sync some folders through json config and also understand how it's done in the ui.

Exploring the metadata of an Obsidian vault and configuring sync settings can be broken down into a few steps:

### Exploring Vault Metadata

1. **Manual Counting**: The simplest method is to manually count the number of files and folders in your Obsidian vault folder. This can be done through your operating system's file explorer.

2. **Scripting**: If you're comfortable with scripting, you can write a small script in a language like Python to count the files and folders. This script would traverse your vault's directory structure and count the files and folders.

### Ignoring Folders from Sync

1. **JSON Configuration**:
   - Obsidian uses a `.obsidian` folder inside your vault for various configurations, including sync settings.
   - To ignore folders from syncing, you might have to modify a configuration file in JSON format within this directory. This usually involves adding the names of the folders you wish to ignore to an ignore list in the sync settings file.
   - The exact filename and structure can vary based on Obsidian's version and your specific setup.

2. **Obsidian UI**:
   - Obsidian may also provide a way to configure sync settings directly through its user interface.
   - Look for 'Sync' or 'Settings' options within the app. There should be a section dedicated to sync where you can choose which folders to ignore.
   - The UI might offer checkboxes or a similar mechanism to select folders you don't want to sync.

### Steps to Modify Sync Settings in Obsidian UI

1. Open Obsidian and go to `Settings`.
2. Navigate to the `Sync` section.
3. Look for options related to folder synchronization. This could be under a heading like 'Ignored Files and Folders' or similar.
4. Here, you should be able to specify which folders you want to ignore. This could be through a text input where you type the folder names or a graphical interface where you select them.

### Additional Tips

- **Backup**: Always make sure to backup your Obsidian vault before making any changes to the configuration files or settings.
- **Documentation**: Refer to Obsidian's official documentation or community forums for the latest and most accurate information regarding sync settings and metadata exploration.

Remember, the exact steps can vary depending on the version of Obsidian you are using and your operating system, so it's always good to refer to the most current resources available.

YYYY-MM-DD markdown files to folders YYYY/MM/DD.md in ruby

To organize your Markdown files named with the format `YYYY-MM-DD.md` into folders with the structure `YYYY/MM/DD.md` using Ruby, you will need to write a script that does the following:

1. **Scan for Files**: Identify all Markdown files in the current directory (or a specified directory) that match the `YYYY-MM-DD.md` pattern.
2. **Parse Dates**: Extract the year, month, and day from the filename.
3. **Create Directories**: Based on the extracted date, create the necessary year and month directories if they do not already exist.
4. **Move Files**: Move each Markdown file into the appropriate `YYYY/MM/DD.md` path.

Here's an example Ruby script to achieve this:

```ruby
require 'fileutils'

# Directory where your Markdown files are stored
source_directory = "./" # Change this to your directory path

# Find all Markdown files matching the YYYY-MM-DD.md pattern
Dir.glob("#{source_directory}/*.md").each do |file|
  filename = File.basename(file, ".md")
  
  # Skip files that don't match the pattern
  next unless filename.match?(/^\d{4}-\d{2}-\d{2}$/)

  # Extract year, month, and day from the filename
  year, month, day = filename.split('-')

  # Create the new directory path
  new_dir_path = File.join(source_directory, year, month)
  FileUtils.mkdir_p(new_dir_path) unless Dir.exist?(new_dir_path)

  # Move the file to the new directory
  new_file_path = File.join(new_dir_path, "#{day}.md")
  FileUtils.mv(file, new_file_path)
end
```

### How to Use the Script

1. **Install Ruby**: Ensure Ruby is installed on your system.
2. **Save the Script**: Save the above code to a file, e.g., `organize_markdown.rb`.
3. **Run the Script**: Navigate to the directory where your script is located and run it using `ruby organize_markdown.rb`.

### Notes

- Modify the `source_directory` variable in the script to point to the directory where your Markdown files are stored.
- The script assumes that the Markdown files strictly follow the `YYYY-MM-DD.md` naming convention.
- Always back up your files before running such a script to prevent data loss in case of any errors.
- The script does not handle cases where a file with the same name already exists in the destination directory. You might need to add additional checks or logic to handle such scenarios.

How can I explore obsidian vault metadata? Like number of files and folders. Ruby code. Look up for node_modules nested

To explore the metadata of an Obsidian vault using Ruby, you can write a script that counts the number of files and folders, excluding specific directories like `node_modules` which may be nested within your vault. The script will traverse the vault's directory structure and gather the required information.

Here's a basic Ruby script that can help you get started:

```ruby
require 'find'

def count_files_and_folders(path, exclude_dir)
  file_count = 0
  folder_count = 0

  Find.find(path) do |file|
    if FileTest.directory?(file)
      if file.include?(exclude_dir)
        Find.prune # Skip the directory and its sub tree
      else
        folder_count += 1
      end
    else
      file_count += 1
    end
  end

  return file_count, folder_count
end

vault_path = 'path/to/your/obsidian/vault' # Replace with your Obsidian vault path
exclude_directory = 'node_modules' # Directory to exclude

file_count, folder_count = count_files_and_folders(vault_path, exclude_directory)
puts "Number of files: #{file_count}"
puts "Number of folders: #{folder_count}"
```

### How to Use the Script

1. **Install Ruby**: Make sure Ruby is installed on your system.
2. **Save the Script**: Save the above code into a file, for example, `vault_metadata.rb`.
3. **Edit the Vault Path**: Modify the `vault_path` variable in the script to point to the directory of your Obsidian vault.
4. **Run the Script**: In your terminal or command prompt, navigate to the directory containing your script and run it with `ruby vault_metadata.rb`.

### What the Script Does

- It counts the number of files and folders in the specified Obsidian vault.
- The script excludes any directories (and their contents) that match the `exclude_directory`, which in this case is set to `node_modules`.
- The `Find` module is used to traverse the directory structure recursively.
- It will provide the count of files and folders, excluding the specified directory.

### Notes

- Be sure to back up your files before running scripts that interact with file systems to avoid accidental data loss.
- You can modify the `exclude_directory` variable to add or change the directory you want to exclude.
- This script provides a basic count of files and folders. If you need more detailed metadata, you might need to expand the script accordingly.

Provide a bash script instead


Certainly! Below is a Bash script to explore the metadata of an Obsidian vault. This script will count the number of files and folders in the vault, excluding directories like `node_modules` which might be nested within your vault.

Here's the script:

```bash
#!/bin/bash

# Path to your Obsidian vault
VAULT_PATH="/path/to/your/obsidian/vault" # Replace with your vault path

# Directory to exclude from count
EXCLUDE_DIR="node_modules"

# Function to count files and folders
count_files_and_folders() {
    local path=$1
    local exclude=$2

    # Counting files and folders, excluding the specified directory
    file_count=$(find "$path" -type f ! -path "*/$exclude/*" | wc -l)
    folder_count=$(find "$path" -type d ! -path "*/$exclude/*" | wc -l)

    # Printing results
    echo "Number of files: $file_count"
    echo "Number of folders: $folder_count"
}

# Running the function with provided parameters
count_files_and_folders "$VAULT_PATH" "$EXCLUDE_DIR"
```

### How to Use This Script

1. **Edit the Script**: Replace `"/path/to/your/obsidian/vault"` with the actual path to your Obsidian vault. Adjust the `EXCLUDE_DIR` if you want to exclude a different directory.
2. **Save the Script**: Save the code to a file, for instance `vault_metadata.sh`.
3. **Make it Executable**: Run `chmod +x vault_metadata.sh` to make the script executable.
4. **Execute the Script**: Run the script using `./vault_metadata.sh`.

### What This Script Does

- It sets the path to your Obsidian vault and specifies a directory to exclude (`node_modules` by default).
- The `count_files_and_folders` function uses `find` to count files and folders, excluding the specified directory.
- The script then prints out the total number of files and folders, excluding those within the `node_modules` directory or any other specified exclusion.

### Important Notes

- Make sure the path to your Obsidian vault is correctly set in the script.
- If you want to exclude multiple directories, you'll need to modify the script to handle each exclusion.
- Always back up your data before running scripts that interact with your file system.

how to download rdfind to mac

`rdfind` is a tool used to find redundant files across a file system and can be useful for organizing and managing data. To install `rdfind` on a Mac, you typically have a few options, including using package managers like Homebrew or MacPorts. Here's how you can do it:

### Using Homebrew

If you have Homebrew installed, you can easily install `rdfind`:

1. **Open Terminal**: Launch the Terminal application on your Mac.

2. **Install Homebrew** (if not already installed):
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
   Follow the on-screen instructions to complete the installation.

3. **Install rdfind**:
   ```bash
   brew install rdfind
   ```

4. **Verify Installation**:
   ```bash
   rdfind --version
   ```
   This command should return the version of `rdfind` installed, indicating a successful installation.

### Using MacPorts

If you prefer using MacPorts, the process is similar:

1. **Install MacPorts** (if not already installed): You can download and install MacPorts from [macports.org](https://www.macports.org/install.php). Follow the instructions on their website.

2. **Open Terminal** and run:
   ```bash
   sudo port install rdfind
   ```

3. **Verify Installation**:
   ```bash
   rdfind --version
   ```

### Post-Installation

Once `rdfind` is installed, you can use it to find redundant files on your system. Be sure to read the `rdfind` documentation or use `rdfind --help` to understand its options and usage to ensure you're using the tool effectively and safely.

### Troubleshooting

- If you encounter any issues during installation, ensure your package manager (Homebrew or MacPorts) is up to date.
- Check for any error messages during the installation process, as they can often provide insights into what might be going wrong.

### Note

The installation methods mentioned are the most common and straightforward for Mac users. However, if you prefer not to use a package manager, you might need to build `rdfind` from source, which is a more advanced process and generally not recommended unless you have specific needs or preferences.