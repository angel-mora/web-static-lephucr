---
title: Configuring VM Network in Hyper-V
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  have 3 vms under hyper-v in windows. Need to put them
  all under the same network so those are discovered when zenmap 192.168.13.0/24,
  where can I check that in the hyper-v manager?"
draft: false
---

# Configuring VM Network in Hyper-V

## 🧠 Full Chat

🙋 **You:**

have 3 vms under hyper-v in windows. Need to put them all under the same network so those are discovered when zenmap 192.168.13.0/24, where can I check that in the hyper-v manager?

---

🤖 **Assistant:**

To put your VMs under the same network and have them discoverable by Zenmap (or any other network scanner), you'll need to ensure they're connected to the same virtual switch and that their assigned IP addresses fall within the same subnet.

Here's how you can do it with Hyper-V Manager:

1. **Creating/Checking the Virtual Switch**:
    1. Open `Hyper-V Manager`.
    2. In the right pane, select your host server and then click on `Virtual Switch Manager` in the right Actions pane.
    3. If you don't have a virtual switch created, click `Create Virtual Switch`. If you have one already and want to use it, note its name.
    4. Fill in the details for the virtual switch. Make sure it's set to `External` if you want the VMs to also have access to the physical network.
    5. Click `OK`.

2. **Assigning VMs to the Virtual Switch**:
    1. In `Hyper-V Manager`, for each VM:
        1. Right-click on the VM and select `Settings`.
        2. In the VM settings window, select the network adapter under the Hardware list.
        3. On the right pane, from the `Virtual switch` dropdown, select the virtual switch you noted/created earlier.
        4. Click `OK`.

3. **Ensure VMs are in the 192.168.13.0/24 Network**:
    1. Boot up each VM.
    2. Inside each VM, check and adjust the IP settings:
        - If using DHCP, ensure the DHCP server is assigning IPs in the 192.168.13.0/24 range.
        - If using static IPs, assign each VM an IP address in the 192.168.13.0/24 range. For example: 192.168.13.10, 192.168.13.11, etc.

4. **Scanning with Zenmap**:
    1. After confirming that all VMs are on the 192.168.13.0/24 subnet, run Zenmap.
    2. Use the target `192.168.13.0/24` to scan the entire subnet.
    3. Your VMs should be discoverable, provided they don't have firewalls blocking the scan.

Remember, if your VMs have firewall software installed, it might block incoming ICMP or other requests, making the machines appear 'silent' on the network during a scan. Ensure firewall rules permit the necessary traffic for your scanning/testing needs.