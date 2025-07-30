---
title: Search External HDD Files.
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  How to cd to hdd external in mac through iterm and
  then search for all pdf and word files created after 2016 (starting january 1st
  2017)"
draft: false
---

# Search External HDD Files.

## ✅ TODOs
- [ ] both simultaneously.
- [ ] so in the ~/Downloads folder. The hdd is in /Volumes/WD_BLACK. I'm in mac
- [ ] wnloads: Use the following command to navigate to your `~/Downloads` folder:

## 🧠 Full Chat

🙋 **You:**

How to cd to hdd external in mac through iterm and then search for all pdf and word files created after 2016 (starting january 1st 2017)

---

🤖 **Assistant:**

To navigate to an external HDD in Mac through iTerm and search for all PDF and Word files created after January 1, 2017, you can follow these steps:

Step 1: Connect the External HDD
Ensure that your external HDD is connected to your Mac and mounted properly. The external HDD should appear on your desktop or in the Finder's sidebar.

Step 2: Open iTerm
Open iTerm on your Mac. You can find it in the "Applications" folder or use Spotlight (Command + Space) to search for "iTerm."

Step 3: Change Directory (cd) to the External HDD
In the iTerm window, you need to change the current working directory (cd) to the location of your external HDD. Assuming your external HDD is mounted at `/Volumes/ExternalHDD`, use the following command:

```bash
cd /Volumes/ExternalHDD
```

Step 4: Search for PDF and Word Files Created After January 1, 2017
To search for PDF and Word files created after January 1, 2017, you can use the `find` command with the `mtime` option. The `mtime` option allows you to search for files based on their modification time.

```bash
find . -type f \( -name "*.pdf" -o -name "*.docx" \) -newermt 2017-01-01
```

This command will find all files (`-type f`) with either the extension `.pdf` or `.docx` (`\( -name "*.pdf" -o -name "*.docx" \)`), which were modified after January 1, 2017 (`-newermt 2017-01-01`). The search will include all subdirectories of the current working directory (the external HDD) as well.

After running this command, you should see a list of PDF and Word files that match the specified criteria.

Please note that the `find` command will only work with the modification time, not the creation time, as it is not directly accessible in Unix-based systems like macOS. The modification time generally reflects when the file was last saved or modified.

---

🙋 **You:**

same find but only .docx or .doc

---

🤖 **Assistant:**

Sure, you can modify the `find` command to search specifically for `.docx` and `.doc` files. Here's the updated command:

```bash
find . -type f \( -name "*.docx" -o -name "*.doc" \) -newermt 2017-01-01
```

This command will find all files (`-type f`) with either the extension `.docx` or `.doc` (`\( -name "*.docx" -o -name "*.doc" \)`), which were modified after January 1, 2017 (`-newermt 2017-01-01`). The search will include all subdirectories of the current working directory (the external HDD) as well.

After running this command, you should see a list of `.docx` and `.doc` files that match the specified criteria.

---

🙋 **You:**

it'd rather do something like .doc*

---

🤖 **Assistant:**

Sure, you can use the wildcard `*` to match both `.doc` and `.docx` extensions. Here's the modified `find` command:

```bash
find . -type f -name "*.doc*"-newermt 2017-01-01
```

This command will find all files (`-type f`) with names that start with `.doc` and have any characters after that, such as `.docx`, `.docm`, etc. (`-name "*.doc*"`), which were modified after January 1, 2017 (`-newermt 2017-01-01`). The search will include all subdirectories of the current working directory (the external HDD) as well.

After running this command, you should see a list of files with both `.doc` and `.docx` extensions that match the specified criteria.

---

🙋 **You:**

to that find command add some data like how many files of each kind, your find should include the date

---

🤖 **Assistant:**

To add more details to the `find` command output, including the number of files of each kind and the file modification date, you can use the `wc` (word count) command along with `ls` and `awk` to achieve this. Here's the updated command:

```bash
find . -type f -name "*.doc*" -newermt 2017-01-01 -exec ls -l {} + | awk '{print $6, $7, $8, $9}' | tee result.txt | wc -l
```

Let's break down the command step by step:

1. `find . -type f -name "*.doc* -newermt 2017-01-01`: This part is the same as before, finding all files with names starting with `.doc` and modified after January 1, 2017.

2. `-exec ls -l {} +`: This part executes the `ls -l` command for each found file, which gives detailed file information, including the modification date.

3. `awk '{print $6, $7, $8, $9}'`: This `awk` command is used to extract the relevant information from the `ls -l` output, which includes the modification date (columns 6, 7, 8, and 9).

4. `tee result.txt`: This part saves the output to a file named "result.txt" so that you can review the details later.

5. `wc -l`: This part counts the number of lines in the output, which represents the total number of files found.

After running the command, you will see the list of files with their modification dates, and the number of files found will be displayed at the end of the output. Additionally, the output will be saved to a file named "result.txt" in the current directory for further reference.

---

🙋 **You:**

can you do it to stdout as well as to the file?

---

🤖 **Assistant:**

Certainly! To display the output to both stdout (terminal) and save it to a file, you can use the `tee` command as mentioned earlier. Here's the updated command:

```bash
find . -type f -name "*.doc*" -newermt 2017-01-01 -exec ls -l {} + | awk '{print $6, $7, $8, $9}' | tee result.txt
```

This command will display the list of files with their modification dates in the terminal, and it will also save the output to a file named "result.txt" in the current directory. The `tee` command allows you to do both simultaneously.

After running the command, you'll see the output on the screen, and the same output will be saved in the "result.txt" file for your reference.

---

🙋 **You:**

faster alternatives to find

---

🤖 **Assistant:**

If you are looking for faster alternatives to the `find` command, there are a few options available, depending on your specific use case and requirements. Here are some alternatives:

1. `fd` (The Fast and User-Friendly Find Command):
`fd` is a modern replacement for the `find` command that is designed to be faster and more user-friendly. It is written in Rust and uses parallelism to speed up the search process. You can install `fd` using package managers like Homebrew on macOS.

Install `fd` using Homebrew:
```bash
brew install fd
```

Usage:
```bash
fd -e doc --changed-after 2017-01-01
```

This command will find files with names matching "*.doc*" (case-insensitive) and modified after January 1, 2017.

2. `locate` (Uses a Pre-Built Database):
`locate` is a command that uses a pre-built database to quickly find files based on their names. The database is typically updated regularly, so the searching process can be very fast. However, note that the database might not be up-to-date with the latest changes.

Usage:
```bash
sudo /usr/libexec/locate.updatedb # Run this command first to update the locate database (requires sudo)
locate -i "*.doc" | grep -i -E "2017-01-0[1-9]|2017-01-1[0-9]|2017-01-2[0-9]|2017-01-30|2017-01-31"
```

This command will find files with names matching "*.doc" (case-insensitive) and then filter the results to include only those modified after January 1, 2017.

Keep in mind that `locate` might not be as accurate as `find` when it comes to real-time searching, as it relies on a pre-built database.

3. `mlocate` (Another Variant of Locate):
`mlocate` is an alternative version of `locate` that also uses a pre-built database. It is a more updated version of `locate` and might be available on your system without the need for installation.

Usage:
```bash
sudo updatedb # Run this command first to update the mlocate database (requires sudo)
locate -i "*.doc" | grep -i -E "2017-01-0[1-9]|2017-01-1[0-9]|2017-01-2[0-9]|2017-01-30|2017-01-31"
```

Similar to `locate`, this command will find files with names matching "*.doc" (case-insensitive) and then filter the results to include only those modified after January 1, 2017.

Keep in mind that for these database-based alternatives (`locate` and `mlocate`), you may need to run a periodic update of the database (`updatedb`) to ensure it includes the latest changes.

The performance improvement with these alternatives can vary depending on your specific filesystem and the number of files to search. For large searches, parallelism and database-based solutions can be faster than the traditional `find` command. However, for small searches, the difference might not be significant.

---

🙋 **You:**

Is there any UI to help me organize my external hard drive data?

---

🤖 **Assistant:**

Yes, there are several UI-based applications that can help you organize and manage your data on an external hard drive. These applications provide graphical interfaces to make the process of organizing and accessing your files more user-friendly. Here are some popular options:

1. **Finder (Mac)**:
Finder is the default file management application on macOS. It provides a graphical interface to navigate through your files and folders on both internal and external storage devices. You can easily organize, move, copy, and delete files using Finder. It also supports features like tags and metadata to help you categorize and find files more efficiently.

2. **File Explorer (Windows)**:
File Explorer is the default file management tool on Windows. Like Finder, it offers a graphical interface to browse and manage files on both internal and external drives. You can perform tasks such as copying, moving, renaming, and searching for files using File Explorer.

3. **Nautilus (Linux)**:
Nautilus, also known as Files, is the default file manager for many Linux distributions. It provides a user-friendly interface for managing files and folders on internal and external storage devices. Nautilus offers features like bookmarks, search, and batch renaming to help you organize your data effectively.

4. **Disk Cataloging Software**:
Disk cataloging software allows you to create catalogs or databases of the contents of your external hard drive. These applications scan your drive and create an index of file names, sizes, and locations. This helps you quickly find files without having to search through the drive physically.

   Some popular disk cataloging software options include:
   - **DiskCatalogMaker (Mac)**
   - **Virtual Volumes View (VVV) (Windows, Mac, Linux)**
   - **Where Is It? (Windows)**

5. **Third-Party File Managers**:
There are various third-party file manager applications available that offer additional features and functionalities beyond the default ones provided by the operating system. Some of these file managers offer advanced file organization options, dual-pane views, file synchronization, and more.

   Examples of third-party file managers include:
   - **Total Commander (Windows)**
   - **Commander One (Mac)**
   - **Double Commander (Windows, Mac, Linux)**

Each of these options provides a different set of features and functionalities, so you can choose the one that best suits your needs and preferences. Whether you want a simple interface to organize files or a more advanced tool for file cataloging and synchronization, there's likely a solution available to help you manage your external hard drive data efficiently.

---

🙋 **You:**

How about crusader?

---

🤖 **Assistant:**

As of my last update in September 2021, there was no widely-known file management application called "Crusader" related to organizing external hard drive data. However, please note that the software landscape is continually evolving, and new applications may have been developed since then.

If "Crusader" is a relatively new file management tool or if it's a lesser-known application, I might not have information about it in my training data. As a language model, I don't have access to real-time information, and my knowledge is limited to what was available up to September 2021.

If "Crusader" is a new application or a specific tool developed by a particular company, I recommend checking the latest software directories, user reviews, or technology news platforms to gather more information about its features and capabilities. You can also visit the official website or support forums for "Crusader," if available, to get insights into how it can help you organize your external hard drive data.

---

🙋 **You:**

Krusader

---

🤖 **Assistant:**

Apologies for the confusion in my previous response. "Krusader" is indeed a well-known file management application, and it's a powerful twin-panel file manager for Linux. It provides a graphical interface with dual-pane views, allowing you to manage files and folders on your system, including external hard drives.

Krusader is designed to be similar to the popular file manager "Total Commander" on Windows and offers features like file operations (copy, move, delete), file synchronization, search, split views, bookmarks, and more. It is built using the Qt framework and is highly customizable.

As a dual-panel file manager, Krusader allows you to navigate through different directories in each panel simultaneously, making file organization and movement much more efficient. It also has extensive support for customizing keyboard shortcuts and mouse actions to suit your workflow.

Please note that Krusader is specifically designed for Linux systems. If you're using macOS or Windows, you can explore other file management applications mentioned in the previous response. However, if you are running Linux and looking for a powerful twin-panel file manager, Krusader could be an excellent choice for organizing data on both internal and external drives.

---

🙋 **You:**

How long it would take a tar backup for around 500 GB? Tell me the instructions to do so in the ~/Downloads folder. The hdd is in /Volumes/WD_BLACK. I'm in mac

---

🤖 **Assistant:**

The time it takes to create a tar backup for around 500 GB can vary depending on several factors, including the speed of your hard drive, the processing power of your computer, and the overall system load. Generally, creating a tar backup is I/O intensive, so the speed of your hard drive and the connection interface (USB, Thunderbolt, etc.) will play a significant role.

As a rough estimate, creating a tar backup for 500 GB might take several hours, possibly ranging from 1 to 6 hours or more. Keep in mind that this is just a general estimate and the actual time could be shorter or longer.

To create a tar backup in the `~/Downloads` folder from an external HDD located at `/Volumes/WD_BLACK`, follow these steps:

1. Open Terminal: You can find Terminal in the "Applications" folder, or you can use Spotlight (Command + Space) to search for "Terminal."

2. Change Directory to Downloads: Use the following command to navigate to your `~/Downloads` folder:
   
   ```bash
   cd ~/Downloads
   ```

3. Create a Tar Backup: Use the `tar` command to create the backup. The basic syntax is:

   ```bash
   tar -czvf backup_filename.tar.gz /path/to/source
   ```

   In your case, you want to create a backup of the external HDD located at `/Volumes/WD_BLACK`. Assuming you want to create a compressed tar backup (gzip), the command could look like this:

   ```bash
   tar -czvf backup_wd_black.tar.gz /Volumes/WD_BLACK
   ```

   This command will create a compressed tar backup named `backup_wd_black.tar.gz` in your `~/Downloads` folder from the contents of the `/Volumes/WD_BLACK` external HDD.

4. Wait for Completion: The tar process will take some time to complete. You'll see progress as files are being archived. Once the process finishes, you'll have the backup archive in your `~/Downloads` folder.

Remember to consider that this is a general estimate and the actual time could vary. Also, ensure you have enough space in your `~/Downloads` folder for the backup archive.

Additionally, you might want to consider other backup solutions that offer incremental backups or tools designed for backups, as they can provide benefits like resumable backups and more flexible restore options.

---

🙋 **You:**

Explain the tar flags and then tell me about those other backup solutions.

---

🤖 **Assistant:**

Certainly! The `tar` command has several flags that control its behavior. Here's an explanation of the flags used in the command I provided earlier:

- `-c`: This flag stands for "create." It indicates that you're creating a new archive.

- `-z`: This flag tells `tar` to use gzip compression when creating the archive. This can significantly reduce the size of the resulting archive.

- `-v`: This flag stands for "verbose." When used, `tar` will display the names of files as they are added to the archive, providing progress information.

- `-f`: This flag is used to specify the name of the archive file that will be created. It should be followed by the filename you want to give to the archive.

Now, let's talk about some other backup solutions that offer additional features and benefits compared to a simple `tar` backup:

1. **rsync**: Rsync is a powerful utility that can synchronize files and directories between two locations. It can be used for backups by copying only the changed parts of files, which makes it efficient for regular incremental backups. It also supports remote backups and has various options for preserving permissions, ownership, and timestamps.

2. **Time Machine (macOS)**: Time Machine is a built-in backup solution for macOS. It automatically backs up your entire system, including files, applications, settings, and more. Time Machine creates hourly, daily, and weekly snapshots, allowing you to restore your system to different points in time.

3. **Carbon Copy Cloner**: Carbon Copy Cloner is a macOS application that provides comprehensive backup and cloning features. It can create bootable backups, schedule backups, and even clone your entire hard drive for disaster recovery.

4. **SuperDuper!**: SuperDuper! is another macOS backup application that specializes in creating bootable clones of your system. It allows you to create a complete copy of your hard drive, which can be used to start up your computer in case of a failure.

5. **Backblaze**: Backblaze is a cloud backup service that automatically backs up your files to the cloud. It continuously backs up changes to your files and offers unlimited storage for a fixed monthly fee.

6. **Arq**: Arq is a backup software that supports both local and cloud backups. It offers deduplication, encryption, and support for various cloud storage providers.

These backup solutions provide various features such as incremental backups, automation, encryption, and user-friendly interfaces. Depending on your needs and preferences, you can choose the solution that best fits your backup strategy. Keep in mind that using a dedicated backup solution often provides more flexibility and reliability compared to manual methods like using `tar`.