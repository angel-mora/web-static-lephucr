---
title: DNS Configuration Issues Solved
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  My OpenDNS settings for an ip only work for my Huawei
  router extension, not for the main ZTE one despite I configured it there. What could
  I be doing wrong? Do I have to specify how many ports in the last octet in OpenDNS
  config?"
draft: false
---

# DNS Configuration Issues Solved

## ✅ TODOs
- [ ] so.

## 🧠 Full Chat

🙋 **You:**

My OpenDNS settings for an ip only work for my Huawei router extension, not for the main ZTE one despite I configured it there. What could I be doing wrong? Do I have to specify how many ports in the last octet in OpenDNS config?

---

🤖 **Assistant:**

It sounds like you're encountering a configuration issue where OpenDNS settings are working correctly on a Huawei router extension but not on the main ZTE router. Here are a few things to consider and check:

1. **DNS Settings Verification**: Ensure that the DNS settings are correctly applied on the ZTE router. Sometimes settings might not be saved or applied correctly after changing them. Double-check the DNS addresses entered and make sure they match those provided by OpenDNS.

2. **Router Firmware**: Verify that the ZTE router is running on the latest firmware. Outdated firmware can sometimes cause issues with DNS functionality or with saving settings.

3. **Network Setup**: Consider how your network is structured. If your Huawei router is set up as a secondary router or in a bridge mode, devices connected to it might be bypassing the DNS settings specified on the main ZTE router. Ensure that all devices or subnets needing DNS filtering through OpenDNS are correctly routed through the ZTE router, or that the DNS settings are mirrored on both devices.

4. **Ports and IP Address Configuration**: In most typical home and small business network setups, you do not need to specify the number of ports or modify the last octet in the OpenDNS configuration. OpenDNS settings usually require only setting the DNS server addresses. Ensure that your IP address configuration on the ZTE router does not conflict with other network elements.

5. **DHCP Settings**: Check the DHCP (Dynamic Host Configuration Protocol) settings on your ZTE router. Make sure that it is distributing the correct DNS settings to the devices on your network. Sometimes, routers are set to provide their own address as the DNS server, which would then forward requests based on the DNS settings you've entered. If your DHCP settings are incorrect, devices may not use OpenDNS even if the router is configured to do so.

6. **Testing DNS**: After configuring, you can test if DNS settings are working correctly by visiting the OpenDNS test page or using command-line tools like `nslookup` or `dig` to query a domain and checking which DNS server responds.

7. **Reset and Reconfigure**: If all else fails, consider resetting the ZTE router to its factory settings and reconfiguring it from scratch. This can resolve hidden issues that might be affecting DNS settings.

If after checking these elements the problem persists, it may be helpful to look into specific forums or support resources for your ZTE router model, as there might be model-specific issues or quirks with DNS handling.

---

🙋 **You:**

I mean the config in opendns website that says ip and settings. That one has a range from 32 to 1 bits for the last octet. If I put it in 31 it will allow both routers to enforce the opendns checkup? Currently it only blocks my extension router, not the main one

---

🤖 **Assistant:**

Ah, I understand now—you're referring to the network settings within your OpenDNS account where you specify the IP address range for DNS filtering.

When you register your network with OpenDNS, you specify an IP address and a network mask, which defines how much of your network is covered by OpenDNS’s filtering settings. The network mask is presented in CIDR notation (Classless Inter-Domain Routing), where the number after the slash indicates the number of bits used for the network portion of your address. The lower the number after the slash, the larger the network covered.

### Explanation of CIDR Notation:
- **/32** – This is the most specific mask, applying the settings to one single IP address.
- **/31** – Covers 2 IP addresses.
- **/24** – Covers all 256 IP addresses in one octet (e.g., 192.168.1.0 to 192.168.1.255).
- **/23**, **/22**, etc., expand the range further, covering even more addresses across multiple octets.

### Your Situation:
If your main ZTE router and your Huawei extension have IP addresses that are within the same subnet but not covered under the CIDR range you have set in OpenDNS, then DNS settings will not apply to both. Setting the CIDR to **/31** will only cover two consecutive IP addresses in your network. This setting might be too restrictive depending on how your network is structured.

### Steps to Resolve:
1. **Determine IP Address Range**: First, determine the range of IP addresses used by devices in your network, including both the ZTE and Huawei routers.

2. **Adjust CIDR Accordingly**: If both routers (and consequently all devices connected to them) need to be covered, you may need to set the CIDR to a broader range. For instance, if both routers fall within the same final octet (e.g., 192.168.1.1 and 192.168.1.2), a mask of **/29** or **/28** might be more appropriate to encompass additional devices connected to either router.

3. **Update OpenDNS Settings**: Log in to your OpenDNS account and update the network settings to reflect the correct IP range and CIDR mask. Make sure you're regularly updating your public IP address in OpenDNS if you do not have a static IP from your ISP. This can be done via dynamic DNS tools or manually if your IP changes.

4. **Verify Configuration**: Use tools like `nslookup` to test that DNS queries from devices behind both routers are being routed through OpenDNS. This can confirm if your configuration changes have been successful.

Adjusting the CIDR to a broader range should help ensure that both your routers (and by extension, all connected devices) are covered by OpenDNS’s DNS filtering. This setup is crucial for consistent policy enforcement across your network.

---

🙋 **You:**

My ip is 187.189.87.35 and when I wan to set the CIDR to 28 it tells me 
Network IP given is not the base address, did you mean to to use 187.189.87.32/28?

---

🤖 **Assistant:**

The error message you're encountering is because when using CIDR notation, the network address must be the base address for that subnet range. For a /28 subnet, the base address must be a multiple of 16 within that specific octet.

### Understanding the Base Address for /28:
- A /28 network has 16 IP addresses. The base address is the first address in the subnet.
- The base addresses for /28 within the 87.x octet would be:
  - 187.189.87.0/28
  - 187.189.87.16/28
  - 187.189.87.32/28
  - 187.189.87.48/28
  - 187.189.87.64/28
  - And so on.

### Your Current IP Address:
- Your IP address is 187.189.87.35.
- For a /28 subnet, the closest base address is 187.189.87.32/28.

### Steps to Set Correctly:
1. **Set the Base Address to 187.189.87.32/28**: This will cover the IP range from 187.189.87.32 to 187.189.87.47.

2. **Update OpenDNS Settings**:
   - Log in to your OpenDNS account.
   - Set your network IP to 187.189.87.32 with a subnet mask of /28.

3. **Ensure IP Address Update**: If your public IP address changes often, consider using a dynamic DNS service that can update your OpenDNS settings automatically.

### Verification:
1. **Test DNS**: After setting this up, you can test if your devices are using OpenDNS by visiting [OpenDNS Test Page](https://welcome.opendns.com).
2. **Check IP Range**: Verify that devices within the IP range 187.189.87.32 to 187.189.87.47 are being filtered correctly.

By using 187.189.87.32/28, you are correctly specifying a base address that encompasses your current IP and potentially other devices within the same subnet.