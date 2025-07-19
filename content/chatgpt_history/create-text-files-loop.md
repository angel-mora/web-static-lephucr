---
title: Create Text Files Loop
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Create Text Files Loop

## ✅ TODOs
- [ ] this:

## 📌 Summary
create a bash for loop to create txt file with the name of the folder linux here (.), like for folder Folder it will create a file called "Notes_Folder.txt"

## 🧠 Full Chat


create a bash for loop to create txt file with the name of the folder linux here (.), like for folder Folder it will create a file called "Notes_Folder.txt"

You can accomplish this using a Bash for loop to iterate over the directories in the current location and then create a text file with the corresponding name. Here’s a simple Bash script to do this:

```bash
#!/bin/bash

# Loop through all the items in the current directory
for item in *; do
  # Check if the item is a directory
  if [ -d "$item" ]; then
    # Construct the file name
    filename="Notes_${item}.txt"
    # Create the text file with the constructed name
    touch "$filename"
  fi
done
```

Here is a breakdown of the script:

1. `for item in *; do`: This line starts a for loop that iterates over all items in the current directory.
2. `if [ -d "$item" ]; then`: This line checks if the current item is a directory.
3. `filename="Notes_${item}.txt"`: This line constructs the filename by appending "Notes_" to the directory name and adding ".txt" at the end.
4. `touch "$filename"`: This line creates a new empty file with the constructed name.
5. `done`: This line ends the for loop.

You can save this script to a file, for example, `create_note_files.sh`, and then execute it by running:

```bash
bash create_note_files.sh
```

This script will create a text file for each folder in the current directory with the name in the format "Notes_FolderName.txt".

oneliner

For a one-liner, you can use the following command:

```bash
for item in *; do [ -d "$item" ] && touch "Notes_${item}.txt"; done
```

This command uses a for loop to iterate over all items in the current directory, checks if the item is a directory, and if so, creates a text file with the name in the format "Notes_FolderName.txt".

can you explain the *;  [- d "$item"]  please?

Certainly! Let's break down the components:

- `*`: This is a wildcard character in Bash and many other command-line shells. When used in this context, it represents all files and directories in the current working directory. So, `for item in *; do` will iterate over each file and directory in the current working directory, assigning the name of each file/directory to the variable `item` in each iteration of the loop.

- `-d "$item"`: This is a condition that checks whether the current `item` is a directory. `-d` is a unary operator that returns true if the following argument (in this case, the value of `$item`) is a directory. So, `[ -d "$item" ]` will be true only if `$item` is a directory.

Putting it together:

```bash
for item in *; do [ -d "$item" ] && touch "Notes_${item}.txt"; done
```

This command says: "For each item in the current working directory, check if it is a directory. If it is, then create a new file with a name derived from the name of this directory." The `&&` operator is used to execute `touch "Notes_${item}.txt"` only if the preceding condition `[ -d "$item" ]` is true, i.e., only if `$item` is a directory.

cant you say for item in folder do

Certainly, you can specify a particular folder or a directory path instead of using `*`. For example, if you have a folder named `Folder`, you can write:

```bash
for item in Folder/*; do [ -d "$item" ] && touch "Notes_${item##*/}.txt"; done
```

Here `Folder/*` means every item inside the `Folder` directory. The `${item##*/}` extracts the basename (the actual folder name without the path) from the `$item`, so you don't get a filename like `Notes_Folder_SubFolder.txt`, but rather `Notes_SubFolder.txt`.