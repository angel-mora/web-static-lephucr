---
title: 'WSL: Filter log file'
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# WSL: Filter log file

## ✅ TODOs


## 📌 Summary
How to filter lines around a string coincidence in a log file? Using WSL

## 🧠 Full Chat


How to filter lines around a string coincidence in a log file? Using WSL



To filter lines around a string coincidence in a log file using WSL, you can use the `grep` command with the `-C` option. Here's an example:

Suppose you have a log file called `example.log` and you want to filter all lines around the string "error". You want to see 2 lines before and after each occurrence of "error". Here's the command you can use:

```
grep -C 2 "error" example.log
```

The `-C` option specifies the number of lines to show before and after the matched string. In this case, `-C 2` means to show 2 lines before and after each occurrence of "error".

This will output all the lines that contain "error" as well as the 2 lines before and after each occurrence of "error" in the log file.

do it only for the last 2000 lines

To filter lines around a string coincidence in the last 2000 lines of a log file using WSL, you can combine the `tail` command with the `grep` command. Here's an example:

Suppose you have a log file called `example.log` and you want to filter all lines around the string "error" in the last 2000 lines of the file. Here's the command you can use:

```
tail -n 2000 example.log | grep -C 2 "error"
```

The `tail` command with the `-n` option specifies the number of lines to show from the end of the file. In this case, `-n 2000` means to show only the last 2000 lines of the log file.

The output of the `tail` command is then piped to the `grep` command, which filters all lines containing the string "error" and shows 2 lines before and after each occurrence of "error".

This will output all the lines that contain "error" as well as the 2 lines before and after each occurrence of "error" in the last 2000 lines of the log file.

Want to find the last mention of the word "LargeCategory" in that log file

To find the last mention of the word "LargeCategory" in a log file using WSL, you can use the `grep` command with the `-i` and `-m` options, along with the `tail` command. Here's an example:

Suppose you have a log file called `example.log` and you want to find the last mention of the word "LargeCategory" in the file. Here's the command you can use:

```
tail -n 2000 example.log | grep -im 1 "LargeCategory"
```

The `tail` command with the `-n` option specifies the number of lines to show from the end of the file. In this case, `-n 2000` means to show only the last 2000 lines of the log file.

The output of the `tail` command is then piped to the `grep` command, which searches for the string "LargeCategory" in a case-insensitive manner (`-i`) and stops after the first match (`-m 1`).

This will output the last mention of the word "LargeCategory" in the log file, along with the line number where the match occurs.