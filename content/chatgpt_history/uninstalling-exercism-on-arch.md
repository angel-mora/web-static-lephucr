---
title: Uninstalling Exercism on Arch
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  I want to delete exercism in my arch machine. Its in
  /usr/bin/exercism. Uninstall it. Got installed with yay"
draft: false
---

# Uninstalling Exercism on Arch

## 🧠 Full Chat

🙋 **You:**

I want to delete exercism in my arch machine. Its in /usr/bin/exercism. Uninstall it. Got installed with yay

---

🤖 **Assistant:**

You can remove a package that was installed with `yay` in much the same way you would with `pacman`. Here's how you can uninstall `exercism`:

1. Open a terminal.

2. Run the following command to uninstall `exercism`:

```bash
yay -R exercism
```

3. If you want to remove the package and its unused dependencies, you can use the following command:

```bash
yay -Rns exercism
```

This command will remove the package along with all its unneeded dependencies.

4. To verify that the package has been removed, you can run:

```bash
which exercism
```

This command should return nothing if `exercism` has been successfully uninstalled.

Please remember to replace `exercism` with the exact name of the package if it is different.