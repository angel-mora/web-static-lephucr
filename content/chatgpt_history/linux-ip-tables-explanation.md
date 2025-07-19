---
title: Linux IP Tables Explanation
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Linux IP Tables Explanation

## ✅ TODOs


## 📌 Summary
Explain IP tables in Linux

## 🧠 Full Chat


Explain IP tables in Linux 

iptables is a user-space utility program in Linux that allows system administrators to configure the IP packet filter rules of the Linux kernel firewall, implemented as different Netfilter modules. 

The filters are organized in different tables, each defined by its function. Here are the primary tables:

1. Filter Table: This is the default table and probably the one most commonly used. It's employed for filtering packets. It contains three built-in chains: INPUT (for packets destined to local sockets), FORWARD (for packets being routed through the machine), and OUTPUT (for locally-generated packets).

2. NAT Table: This table is used for Network Address Translation, including DNAT, SNAT or Masquerading. It contains three built-in chains: PREROUTING (for altering incoming packets before routing), POSTROUTING (for altering packets as they are about to go out), and OUTPUT (for locally-generated packets).

3. Mangle Table: This is used for specialized packet alteration. This table provides the following built-in chains: PREROUTING, OUTPUT, FORWARD, INPUT, and POSTROUTING.

4. Raw Table: This table is used to work with packets before they hit the connection tracking tools. It has two built-in chains: PREROUTING (for packets arriving via a network interface) and OUTPUT (for locally-generated packets).

Each rule in an IP table consists of a set of criteria and a target. If a packet matches the criteria, the specified target (action) is executed. The target can be a decision on how to process the packet (like ACCEPT or DROP), or it can be the name of a user-defined chain.

iptables rules are stateful, which means they can match packets based on the state of the connection, such as NEW, ESTABLISHED, RELATED, etc. This feature makes iptables a very powerful tool for managing network traffic on a Linux system.