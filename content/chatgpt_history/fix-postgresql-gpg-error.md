---
title: Fix PostgreSQL GPG Error
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Fix PostgreSQL GPG Error

## ✅ TODOs
- [ ] wnload and add the key.

## 📌 Summary
Fix this ubuntu error:

## 🧠 Full Chat


Fix this ubuntu error:
W: GPG error: http://apt.postgresql.org/pub/repos/apt jammy-pgdg InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 7FCC7D46ACCC4CF8
E: The repository 'http://apt.postgresql.org/pub/repos/apt jammy-pgdg InRelease' is not signed.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.

The error message you're encountering indicates that APT (the package management system used by Ubuntu and other Debian-based Linux distributions) cannot authenticate the PostgreSQL repository because the public key used for signing the repository is not available on your system. This makes it impossible for APT to verify that the packages downloaded from the repository are safe to install, leading to the update process being halted for security reasons.

To fix this issue, you need to import the missing GPG key (`7FCC7D46ACCC4CF8`) used by the PostgreSQL repository into your system's APT keyring. You can do this by using the `apt-key` command or `gpg` with `apt-key add`, but it's worth noting that `apt-key` is deprecated in newer versions of Ubuntu. A more future-proof method involves using `gpg` and `apt-key` in combination with `signed-by` option in your APT sources list. However, the simplest and most direct method, which should still work for Ubuntu versions including Jammy Jellyfish (22.04), is to use the `gpg` command directly to download and add the key.

Here's how you can fix the error:

1. **Add the PostgreSQL Repository GPG Key to Your Keyring:**

   You can add the key using the following command:

   ```sh
   wget -qO - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
   ```

   This command downloads the GPG key from the PostgreSQL website and adds it to the APT keyring.

2. **Update Your Package Lists:**

   After adding the key, you should update your package lists to ensure your package manager is aware of the latest available packages:

   ```sh
   sudo apt-get update
   ```

If you're using a version of Ubuntu that has deprecated `apt-key`, you might need to use a different method to add the GPG key, such as adding it directly to a trusted keyring directory (`/etc/apt/trusted.gpg.d/`). However, for Ubuntu Jammy, the above method should still be valid.

Keep in mind that managing repository keys securely is important to maintain the security of your system. Always ensure that you're adding keys from trusted sources.

> sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7FCC7D46ACCC4CF8

Warning: apt-key is deprecated. Manage keyring files in trusted.gpg.d instead (see apt-key(8)).

Given the deprecation warning for `apt-key`, the recommended approach to resolve your issue now involves manually adding the key to the `trusted.gpg.d` directory, which is the newer method preferred by Ubuntu for managing repository keys securely. This involves downloading the key with `gpg` and then adding it to the `trusted.gpg.d` directory.

Here's how you can do it step-by-step:

1. **Download the GPG Key:**

   First, download the PostgreSQL repository GPG key using `gpg`. This command retrieves the key and saves it to a file:

   ```sh
   gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/postgresql.gpg --keyserver keyserver.ubuntu.com --recv-keys 7FCC7D46ACCC4CF8
   ```

   Ensure you have `gpg` installed; if not, you might need to install it using `sudo apt-get install gnupg`.

2. **Change the Permissions:**

   After downloading the key, you need to change the permission of the key file to be readable by `apt`:

   ```sh
   sudo chmod 644 /etc/apt/trusted.gpg.d/postgresql.gpg
   ```

   This sets the permissions so that the file is world-readable, which is necessary for `apt` to access it.

3. **Update Your Package Lists:**

   With the GPG key in place, update your package lists to apply the changes:

   ```sh
   sudo apt-get update
   ```

This method bypasses the deprecated `apt-key` command by directly managing the keyring files in `trusted.gpg.d`, aligning with the recommended practices for newer versions of Ubuntu. It ensures that the package manager can authenticate packages from the PostgreSQL repository securely.