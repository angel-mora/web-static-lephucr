---
title: Docker macOS Drive Mounting
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  docker run -it --rm \\"
draft: false
---

# Docker macOS Drive Mounting

## ✅ TODOs
- [ ] cker while they're mounted. Use the following command to unmount them:
- [ ] cker's Virtual Machine:**
- [ ] cker:**

## 🧠 Full Chat

🙋 **You:**

docker run -it --rm \
     --device disk5:/dev/sda \
     --device disk6:/dev/sdb \
     --privileged \
     -v ~/encrypted_drives:/mnt/encrypted \
     ubuntu:latest
docker: Error response from daemon: error gathering device information while adding custom device "disk5": no such file or directory.

got that  when trying to mount a couple of hdds in my mac over a ubuntu instance. 

diskutil list
/dev/disk0 (internal, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *500.3 GB   disk0
   1:             Apple_APFS_ISC Container disk2         524.3 MB   disk0s1
   2:                 Apple_APFS Container disk3         494.4 GB   disk0s2
   3:        Apple_APFS_Recovery Container disk1         5.4 GB     disk0s3

/dev/disk3 (synthesized):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      APFS Container Scheme -                      +494.4 GB   disk3
                                 Physical Store disk0s2
   1:                APFS Volume Macintosh HD            11.2 GB    disk3s1
   2:              APFS Snapshot com.apple.os.update-... 11.2 GB    disk3s1s1
   3:                APFS Volume Preboot                 6.8 GB     disk3s2
   4:                APFS Volume Recovery                1.0 GB     disk3s3
   5:                APFS Volume Data                    315.2 GB   disk3s5
   6:                APFS Volume VM                      7.5 GB     disk3s6

/dev/disk4 (disk image):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        +2.3 GB     disk4
   1:                        EFI EFI                     209.7 MB   disk4s1
   2:                  Apple_HFS Docker                  2.0 GB     disk4s2

/dev/disk5 (external, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *2.0 TB     disk5
   1:       Microsoft Basic Data                         2.0 TB     disk5s1

/dev/disk6 (external, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:     FDisk_partition_scheme                        *2.0 TB     disk6
   1:               Windows_NTFS                         2.0 TB     disk6s1

That is however how it looks

---

🤖 **Assistant:**

The error you're seeing is because Docker on macOS does not have direct access to block devices like `/dev/sda` or `/dev/sdb`. On macOS, Docker runs inside a virtualized Linux environment, so the device paths in your `docker run` command won't map directly to your host's devices.

Here’s how you can work around this issue to access your external drives in a Docker container:

### Steps to Fix

1. **Unmount the Drives on macOS:**
   Make sure the drives are not mounted on macOS, as you cannot attach them to Docker while they're mounted. Use the following command to unmount them:
   ```bash
   diskutil unmountDisk /dev/disk5
   diskutil unmountDisk /dev/disk6
   ```

2. **Attach Drives to Docker's Virtual Machine:**
   Docker Desktop for macOS uses a virtual machine to run containers. You need to ensure the drives are available to this VM. This is not natively supported via Docker Desktop but can be done using additional software like `colima` or through manual configurations.

   If you're sticking with Docker Desktop, a more practical solution is to bind-mount the macOS-mounted directories instead of the raw devices.

3. **Bind-Mount the macOS Paths to Docker:**
   Identify where macOS has mounted your drives. Typically, external drives are mounted under `/Volumes`. For example:
   - `/Volumes/YourDriveName1`
   - `/Volumes/YourDriveName2`

   Then, modify your `docker run` command to bind-mount these directories instead:
   ```bash
   docker run -it --rm \
     --privileged \
     -v /Volumes/YourDriveName1:/mnt/disk1 \
     -v /Volumes/YourDriveName2:/mnt/disk2 \
     ubuntu:latest
   ```

   This way, your drives will appear under `/mnt/disk1` and `/mnt/disk2` in the Docker container.

4. **Access Raw Block Devices (Advanced):**
   If you truly need access to the raw block devices (e.g., for encryption or filesystem operations), you’ll need to bypass Docker Desktop entirely and use a direct Linux VM (e.g., through VirtualBox, UTM, or VMware Fusion). In the VM settings, attach the raw block devices, and then run Docker inside the VM.

   Example using `qemu` (requires Homebrew and `qemu` installed):
   ```bash
   qemu-system-x86_64 -hda /dev/disk5 -hdb /dev/disk6 -cdrom ubuntu.iso -boot d
   ```

### Verify Inside Docker
To ensure the drives are available:
1. Run the container with the updated command.
2. Inside the container, list the directories under `/mnt` to confirm the drives are mounted:
   ```bash
   ls -l /mnt
   ```

Let me know if you encounter issues with these steps!