---
title: Fixing "Shim Lock" in Arcolinux
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  symbol grub is shim lock enabled not found in arcolinux,
  how to fix?"
draft: false
---

# Fixing "Shim Lock" in Arcolinux

## ✅ TODOs
- [ ] this on an Arch-based system like Arcolinux:
- [ ] that:
- [ ] this:
- [ ] this. You'll need to give a name for the decrypted device (you can use `luks` for simplicity):

## 🧠 Full Chat

🙋 **You:**

symbol grub is shim lock enabled not found in arcolinux, how to fix?

---

🤖 **Assistant:**

The error you are seeing might be related to the secure boot configuration and how GRUB (the bootloader) is interacting with it. The "shim lock" is a mechanism used in Secure Boot which ensures that only trusted code is run by the UEFI firmware. When the "shim" is correctly installed and Secure Boot is enabled, this allows Linux to boot.

Here are some general steps you could follow to resolve this issue:

1. **Check your Secure Boot Status:** 

   Reboot your computer and enter the BIOS or UEFI settings. The key you press to enter these settings varies depending on your motherboard, but it's often F2, F10, F12 or DEL. In the BIOS/UEFI menu, look for the Secure Boot option and check if it is enabled or disabled. You might want to try disabling Secure Boot temporarily to see if this resolves your issue.

2. **Reinstall GRUB and Shim packages:** 

   In some cases, reinstalling the `grub` and `shim` packages might help. You can do this from a live USB stick if your system is not booting. Here are general instructions on how to do this on an Arch-based system like Arcolinux:

   a. Boot your system using a live USB stick of Arcolinux.
   
   b. Open a terminal, and mount your root partition (replace `sdXY` with your root partition, like `sda1`):

        sudo mount /dev/sdXY /mnt

   c. If you have a separate boot partition, mount it as well (replace `sdXZ` with your boot partition, like `sda2`):

        sudo mount /dev/sdXZ /mnt/boot

   d. Chroot into your system:

        sudo arch-chroot /mnt

   e. Reinstall GRUB and Shim:

        sudo pacman -S grub efibootmgr shim

   f. Update GRUB configuration:

        sudo grub-mkconfig -o /boot/grub/grub.cfg

   g. Exit from chroot:

        exit

   h. Unmount the partitions:

        sudo umount -R /mnt

   i. Reboot:

        reboot

Remember that those steps can vary depending on your specific configuration, and they are provided assuming you have some experience working with Linux, bootloaders, and terminal commands. Always make sure to have a backup of your important data before proceeding.

---

🙋 **You:**

I only have the c option to open a bash-like terminal

---

🤖 **Assistant:**

If you're seeing the GRUB rescue prompt (something like `grub rescue> _`), it typically means that GRUB can't find the `grub.cfg` file from which to load its configuration. This might happen due to incorrect boot partition, disk errors, or a messed up GRUB installation.

Given that you only have access to the GRUB command line, you can try to manually find and boot into your Linux system. This can help you get your system up and running so you can make the necessary fixes.

Here are general instructions on how to do that:

1. **Find the partition with your system's /boot directory.** 

You can use the `ls` command for this. The command `ls` will list all your partitions:

```
ls
```

You'll see output like `(hd0) (hd0,msdos2) (hd0,msdos1)`. Here, `(hd0)` refers to the entire disk, `(hd0,msdos2)` refers to the second partition on that disk, and so on. 

To see the contents of a partition, use `ls` followed by the partition name. For example, to see the contents of `(hd0,msdos2)`, use:

```
ls (hd0,msdos2)/
```

You're looking for a partition with a `/boot` directory, and in that directory, a `grub` directory. If you don't see a `/boot/grub` on your first partition, try the second one, and so on, until you find it.

2. **Set the root partition.**

Once you've found the partition with `/boot/grub`, set it as the root partition for GRUB. If, for example, this is on `(hd0,msdos1)`, use:

```
set root=(hd0,msdos1)
```

3. **Set the path to the `grub.cfg` file.**

You can do this with the `configfile` command. Assuming the file is at `/boot/grub/grub.cfg` on the partition you found, use:

```
configfile /boot/grub/grub.cfg
```

4. **Boot into your system.**

After running these commands, GRUB should display its menu and you should be able to boot into your system.

Once you've booted into your system, you should reinstall and update GRUB, to fix the issue that landed you in the rescue console in the first place. 

Please note: if you cannot find the `grub.cfg` file, it's likely that there is an issue with the GRUB installation or the boot partition, and you might need to boot from a Live USB to repair it.

---

🙋 **You:**

I have the os under an encrypted hdd, does it change things?

---

🤖 **Assistant:**

Yes, that does change things. If you're using an encrypted hard drive, you won't be able to see the contents of your partitions from the GRUB command line. You'll need to unlock the encrypted partition first before you can access your system.

If you're using LUKS for disk encryption (the most common method on Linux), the GRUB bootloader should usually prompt you for the encryption password during boot. If this isn't happening, it suggests there's an issue with the GRUB configuration.

Unfortunately, you can't unlock the LUKS partition from the GRUB rescue shell, because it doesn't have the necessary commands to handle LUKS encryption. You'll need to boot from a Live USB stick, unlock the LUKS volume there, then chroot into your system and fix GRUB.

Here's a general guide to how to do this:

1. **Boot from a Live USB stick**:

You can use an Arcolinux Live USB stick, or any other live Linux distribution that supports LUKS. Once you've booted into the Live USB stick, open a terminal.

2. **Identify your encrypted partition**:

You can do this with the `lsblk` or `fdisk -l` command, which lists all your partitions. Let's say your encrypted partition is `/dev/sdaX`.

3. **Unlock the encrypted partition**:

Use the `cryptsetup` command to do this. You'll need to give a name for the decrypted device (you can use `luks` for simplicity):

```
sudo cryptsetup luksOpen /dev/sdaX luks
```

Enter your LUKS password when prompted.

4. **Mount the decrypted partition**:

Now you can mount the decrypted device to access your system. The device will be under `/dev/mapper/`, with the name you chose in the previous step. So, if you chose `luks`, it would be `/dev/mapper/luks`.

First, mount the root partition (replace `sdXY` with your root partition, like `sda1`):

```
sudo mount /dev/mapper/luks /mnt
```

If you have a separate boot partition, mount it as well:

```
sudo mount /dev/sdXZ /mnt/boot
```

5. **Chroot into your system**:

Now you can use the `arch-chroot` command to "enter" your system:

```
sudo arch-chroot /mnt
```

6. **Reinstall GRUB and update its configuration**:

Finally, reinstall GRUB and update its configuration:

```
sudo grub-install /dev/sda
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

Replace `/dev/sda` with the name of your entire hard drive, not the individual partition. You can use `lsblk` or `fdisk -l` to check this.

7. **Exit from chroot and reboot**:

```
exit
sudo umount -R /mnt
reboot
```

After following these steps, your system should boot normally, and GRUB should prompt you for the LUKS password during boot.

Please note that these steps assume some familiarity with the Linux command line and system administration. Be careful, and make sure you have a backup of your important data before proceeding.

---

🙋 **You:**

So I did unlock my hdd and had access to ArcoLinux grub screen, it's just not allowing me to boot the os. My (crypto0) does have /boot/grub

---

🤖 **Assistant:**

Given your situation, it seems like your boot process cannot find or access the necessary files to continue booting up. There are a few things you could try to solve this issue.

You've mentioned that you have access to the GRUB screen and that `/boot/grub` exists on your encrypted partition `(crypto0)`. You should try manually booting up your Linux system from the GRUB command line.

Here are the steps to manually boot your Linux system:

1. At the GRUB command line, set the root partition to your encrypted partition `(crypto0)`:

    ```
    set root=(crypto0)
    ```

2. Then, load the Linux kernel and initramfs from the `/boot` directory:

    ```
    linux /boot/vmlinuz-linux root=/dev/mapper/cryptroot cryptdevice=/dev/sdaX:cryptroot
    initrd /boot/initramfs-linux.img
    ```
    
    Replace `vmlinuz-linux` and `initramfs-linux.img` with the actual names of your kernel and initramfs files. You can use the `ls` command to list the contents of the `/boot` directory and find out the exact names. Also, replace `/dev/sdaX` with your actual encrypted partition.

    The `cryptdevice` parameter tells the initramfs where to find the encrypted root partition, and `cryptroot` is the name you've given your decrypted root.

3. Then boot up:

    ```
    boot
    ```

If this doesn't work or if you get errors, please provide the exact error messages you get. This will help to better diagnose the issue.

If this method successfully boots your system, it's likely that your GRUB configuration file is not correctly set up. Once you've booted into your system, you should try updating your GRUB configuration:

1. Open a terminal and update the GRUB configuration:

    ```
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    ```

2. Reinstall GRUB:

    ```
    sudo grub-install /dev/sda
    ```

Again, replace `/dev/sda` with the name of your hard drive.

These steps are a bit advanced and require some knowledge about how the Linux boot process works. Proceed with caution and make sure you have a backup of your data.