---
title: Ethernet Connection Issue Troubleshooting
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Ethernet Connection Issue Troubleshooting

## ✅ TODOs


## 📌 Summary
lenovo with amd running ubuntu. Connected to ethernet over usb adapter. Shows a question mark under eth logo. it says connected in Settings > Network but won't access internet

## 🧠 Full Chat


lenovo with amd running ubuntu. Connected to ethernet over usb adapter. Shows a question mark under eth logo. it says connected in Settings > Network but won't access internet

When you're experiencing issues with Ethernet connectivity in Ubuntu, there are a few steps you can take to troubleshoot and potentially resolve the problem. Here’s a step-by-step guide to help you:

1. **Check Cable and Adapter**
   - Ensure that the Ethernet cable and USB adapter are working correctly. You might try them with another device to make sure.

2. **Restart Network Services**
   - Open a Terminal and run the following commands to restart the networking services:
     ```sh
     sudo systemctl restart NetworkManager
     ```

3. **Check IP Configuration**
   - Check if your system has obtained a valid IP address. You can do this by running:
     ```sh
     ip addr show
     ```
   - Look for the `inet` line under the appropriate interface.

4. **Renew DHCP Lease**
   - If the IP address isn’t valid or is missing, try renewing the DHCP lease with:
     ```sh
     sudo dhclient -r
     sudo dhclient
     ```

5. **Check DNS Settings**
   - Check the content of the `/etc/resolv.conf` file to ensure DNS servers are listed:
     ```sh
     cat /etc/resolv.conf
     ```
   - If no nameservers are listed, you might need to add them manually (e.g., Google's public DNS servers):
     ```sh
     echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf
     echo "nameserver 8.8.4.4" | sudo tee -a /etc/resolv.conf
     ```

6. **Ping Test**
   - Try to ping a public IP address, for example, Google’s public DNS server:
     ```sh
     ping 8.8.8.8
     ```
   - If this works, but pinging a domain (e.g., `ping www.google.com`) does not, it suggests a DNS resolution issue.

7. **Check Routing Table**
   - Check the routing table to ensure there is a default gateway:
     ```sh
     ip route show
     ```
   - Look for a line starting with `default` which would indicate the default gateway.

8. **Update System**
   - Ensure that your Ubuntu system is up-to-date with the latest packages and kernel:
     ```sh
     sudo apt update && sudo apt upgrade
     sudo apt dist-upgrade
     sudo reboot
     ```

9. **Check Firewall**
   - Check if a firewall is blocking your connection:
     ```sh
     sudo ufw status
     ```
   - If necessary, disable the firewall temporarily to diagnose the issue:
     ```sh
     sudo ufw disable
     ```

10. **Check for Driver Issues**
    - Ensure the driver for your USB Ethernet adapter is installed and functioning correctly. You can check the loaded network drivers with:
      ```sh
      lsmod | grep <driver_name>
      ```
    - You may also refer to the manufacturer’s documentation for any specific driver requirements.

11. **Check Logs**
    - Review the system logs for any network-related errors or warnings:
      ```sh
      dmesg | grep -i network
      journalctl | grep NetworkManager
      ```

12. **USB Adapter Power Management**
    - Some USB devices might have issues with power management. You can try disabling USB Autosuspend:
      - Edit the file `/etc/default/grub`:
        ```sh
        sudo nano /etc/default/grub
        ```
      - Modify the `GRUB_CMDLINE_LINUX_DEFAULT` line to add `usbcore.autosuspend=-1`, making sure to keep it within the quotes:
        ```
        GRUB_CMDLINE_LINUX_DEFAULT="quiet splash usbcore.autosuspend=-1"
        ```
      - Save and exit (Ctrl + X, Y, Enter).
      - Update GRUB and reboot:
        ```sh
        sudo update-grub
        sudo reboot
        ```

After trying these steps, if the issue persists, the problem might be related to a hardware malfunction, or there might be an issue with the networking configuration of your router or ISP.