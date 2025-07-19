---
title: CIDR Notation Explanation
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# CIDR Notation Explanation

## ✅ TODOs


## 📌 Summary
Explain CIDR notation

## 🧠 Full Chat


Explain CIDR notation

CIDR (Classless Inter-Domain Routing) notation is a method used to specify IP addresses and subnet masks. It’s a compact way of representing both the IP address and the network mask together. In CIDR notation, an IP address is followed by a slash ('/') and a number. The number after the slash represents the number of consecutive 1s in the subnet mask, starting from the left. 

For example, in the CIDR notation `192.168.1.1/24`, `192.168.1.1` is the IP address, and `/24` means the first 24 bits of the address are used for the network part, leaving the remaining bits (32-24=8 bits) for host addresses within that network. This subnet mask would be `255.255.255.0` in dotted decimal form, as the first 24 bits are all 1s. 

The number of available host addresses in a subnet is `2^(32-n)` minus 2 (one for the network address and one for the broadcast address), where `n` is the number after the slash. In the example above, the subnet has `2^(32-24) - 2 = 256 - 2 = 254` available host addresses.