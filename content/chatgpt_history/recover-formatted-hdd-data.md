---
title: Recover Formatted HDD Data
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  I accidentaly formatted my internal hdd with the windows
  11 installer tool, how can I recover it?"
draft: false
---

# Recover Formatted HDD Data

## ✅ TODOs
- [ ] much.

## 🧠 Full Chat

🙋 **You:**

I accidentaly formatted my internal hdd with the windows 11 installer tool, how can I recover it?

---

🤖 **Assistant:**

I'm sorry to hear about your situation. Accidentally formatting your HDD can be distressing, but there are steps you can take to attempt recovery:

1. **Do Not Use the Drive**: Avoid writing new data to the drive. This minimizes the chance of overwriting any recoverable data.

2. **Use a Data Recovery Software**:
   - Some popular and effective data recovery software includes:
     - EaseUS Data Recovery Wizard
     - Recuva (from the makers of CCleaner)
     - Disk Drill
     - Stellar Data Recovery
   - Install the software on a separate drive (like a USB flash drive or another HDD).
   - Run the software and select the formatted drive as the target for recovery.
   - Follow the on-screen instructions. The software will scan the drive for recoverable files and allow you to restore them.

3. **Professional Assistance**: If the software solutions don't work or if the data is extremely important, consider hiring a professional data recovery service. They use specialized tools and techniques to maximize the chances of recovery, but they can be expensive.

4. **Backups**: If you have a recent backup, consider restoring from it. If you don't, once you're past this situation, seriously consider implementing a regular backup strategy to prevent future data loss.

5. **Learning for the Future**: Always double-check before performing any format or deletion actions, especially on drives containing important data. Keeping regular backups is a crucial habit for safeguarding your data.

Lastly, while data recovery software can be effective, it's never guaranteed that you'll get all your data back. The more you use the drive after formatting, the lesser the chances of recovery. So, act quickly and cautiously.

---

🙋 **You:**

My hdd was Luks encrypted

---

🤖 **Assistant:**

If your HDD was LUKS (Linux Unified Key Setup) encrypted, the recovery becomes more complicated. LUKS encrypts the whole block device and the actual data starts after the LUKS header. If the LUKS header is damaged or overwritten, it becomes nearly impossible to decrypt the data, even if you have the passphrase. 

Here's what you can try:

1. **LUKS Header Backup**: If you have a backup of the LUKS header, you can restore it. LUKS always recommends making a backup of the header when you first set up encryption. If you have one, you can use it to restore the header and then access the drive with your passphrase.

2. **Data Recovery Software**: You can still use data recovery software to recover raw data from the drive, but it will be encrypted. Unless you can decrypt it, it won't be of any use. 

3. **Professional Data Recovery Services**: A professional might be able to help, especially if only a portion of the drive was formatted or overwritten. However, if the LUKS header is gone and you don't have a backup of it, even professionals might not be able to do much.

4. **Future Precautions**:
   - Always backup the LUKS header when setting up a LUKS encrypted drive. 
   - Regularly backup important data to a separate location.
   - Double-check before performing sensitive operations like formatting.

It's crucial to understand that when dealing with encrypted data, especially with a system as secure as LUKS, recovery chances are slim once the encryption header is damaged. But it's always worth trying the above steps, especially if the data is important.

---

🙋 **You:**

How can I make a backup of the header?

---

🤖 **Assistant:**

Backing up the LUKS header is a wise precautionary measure, as it contains crucial information for decrypting your data. If you lose the header, the data is practically unrecoverable even if you have the password. Here's how you can back up and restore the LUKS header:

### Backup the LUKS header:

1. First, identify the device you want to back up. Let's assume the device is `/dev/sdX`.

2. Use the following command to back up the LUKS header:

   ```bash
   sudo cryptsetup luksHeaderBackup /dev/sdX --header-backup-file /path/to/backupfile.img
   ```

   Replace `/dev/sdX` with your device's actual path and `/path/to/backupfile.img` with the location where you want to store the backup.

3. Securely store the header backup file. If anyone gets access to both the header and the encrypted device, they could potentially brute-force the password. Thus, it's crucial to keep the backup safe.

### Restore the LUKS header:

1. If you ever need to restore the header because it became corrupted or was deleted, use the following command:

   ```bash
   sudo cryptsetup luksHeaderRestore /dev/sdX --header-backup-file /path/to/backupfile.img
   ```

   As before, replace `/dev/sdX` with your device's actual path and `/path/to/backupfile.img` with the location of your header backup file.

**Caution**: Restoring the header will overwrite the existing header on the device. Ensure you are using the correct backup file for the specific device to avoid making the data inaccessible.

Remember, while the LUKS header backup allows recovery of a damaged header, it does not replace the need for regular backups of the actual data. Always keep regular and separate backups of your essential data.