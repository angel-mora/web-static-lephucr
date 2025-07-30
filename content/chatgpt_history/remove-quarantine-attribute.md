---
title: Remove quarantine attribute.
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Adjust this command for the latest version of iterm"
draft: false
---

# Remove quarantine attribute.

## 🧠 Full Chat

🙋 **You:**

Adjust this command for the latest version of iterm
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

---

🤖 **Assistant:**

It seems like the `-r` option is not recognized in the latest version of `xattr`. You can achieve the same result by using the following modified command:

```bash
sudo xattr -d com.apple.quarantine /Applications/Another\ Redis\ Desktop\ Manager.app
```

This command removes the quarantine attribute (`com.apple.quarantine`) from the specified application.

---

🙋 **You:**

How do I find redis port?

---

🤖 **Assistant:**

To find the Redis port, you can check the Redis configuration file or use the `redis-cli` command. Here are two common methods:

1. **Check Redis Configuration File:**
   The Redis configuration file is usually named `redis.conf`. You can find this file in the Redis installation directory. Open the configuration file using a text editor (e.g., `nano` or `vi`):

   ```bash
   nano /path/to/redis.conf
   ```

   Look for a line that starts with `port`:

   ```
   port 6379
   ```

   In this example, Redis is running on port 6379. Make sure to replace `/path/to/redis.conf` with the actual path to your Redis configuration file.

2. **Use redis-cli:**
   If you have the `redis-cli` command installed, you can use it to connect to the Redis server and retrieve information, including the port. Open a terminal and run:

   ```bash
   redis-cli
   ```

   Once inside the `redis-cli` interactive shell, you can use the `INFO` command to get information about the Redis server. Look for the line starting with `tcp_port`:

   ```
   # Server
   tcp_port:6379
   ```

   In this example, Redis is running on port 6379.

Choose the method that suits your system and configuration. If you encounter any issues or if your Redis instance is running in a non-default configuration, you may need to adjust accordingly.