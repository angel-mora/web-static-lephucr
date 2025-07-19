---
title: Enable Redis Manager
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Enable Redis Manager

## ✅ TODOs


## 📌 Summary
sudo xattr -rd com.apple.quarantine /Applications/Another\ Redis\ Desktop\ Manager.app

## 🧠 Full Chat


sudo xattr -rd com.apple.quarantine /Applications/Another\ Redis\ Desktop\ Manager.app

option -r not recognized

usage: xattr [-slz] file [file ...]
       xattr -p [-slz] attr_name file [file ...]
       xattr -w [-sz] attr_name attr_value file [file ...]
       xattr -d [-s] attr_name file [file ...]
       xattr -c [-s] file [file ...]

The first form lists the names of all xattrs on the given file(s).
The second form (-p) prints the value of the xattr attr_name.
The third form (-w) sets the value of the xattr attr_name to attr_value.
The fourth form (-d) deletes the xattr attr_name.
The fifth form (-c) deletes (clears) all xattrs.

options:
  -h: print this help
  -s: act on symbolic links themselves rather than their targets
  -l: print long format (attr_name: attr_value)
  -z: compress or decompress (if compressed) attribute value in zip format

Option -r used to be here but not anymore. I want to enable redis manager

It seems like the `xattr` command no longer supports the `-r` option for recursive operations. Instead, you can use the `find` command along with `xargs` to achieve the recursive behavior. Here's an example:

```bash
find /Applications/Another\ Redis\ Desktop\ Manager.app -type f -print0 | xargs -0 xattr -d com.apple.quarantine
```

This command uses `find` to locate all files under the specified directory (`/Applications/Another Redis Desktop Manager.app`) and then uses `xargs` to apply the `xattr -d com.apple.quarantine` command to each file.

Make sure to replace `/Applications/Another\ Redis\ Desktop\ Manager.app` with the actual path to your Redis Desktop Manager application.

This should remove the quarantine attribute from all files within the specified directory and its subdirectories. After running this command, you should be able to launch Redis Desktop Manager without any issues.