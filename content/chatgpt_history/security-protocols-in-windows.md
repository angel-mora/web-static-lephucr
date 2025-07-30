---
title: Security Protocols in Windows
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Paraphrase, be concise"
draft: false
---

# Security Protocols in Windows

## 🧠 Full Chat

🙋 **You:**

Paraphrase, be concise
 As a good practice MegaCorpOne hired Safe House Security to conduct a penetration test to identify exploitable vulnerabilities and provide actionable recommendations on how to remediate them to provide a greater level of security for the company.
● Despite the fact that MegaCorpOne’s network suffers from several vulnerabilities such as Traffic Management, Privilege Escalation, and VSTPD Backdoor which enabled us to gain access and led us to compromise both the system’s Linux machine and Windows 10 machine, it is obvious for us from the Nmap scan that we performed , the Window machine runs a Microsoft Windows Kerberos Security(Kerberos-sec) and Microsoft Active Directory LDAP protocols.
● According to Microsoft Documentation - Introduction to Kerberos Authentication:https://docs.microsoft.com/en-us/windows-server/security/kerb eros/kerberos-authentication-overview : Kerberos-sec is an authentication protocol that provides secure and efficient authentication for users and services in Windows domains, it facilitates secure authentication and access control within Windows network environments. The security features of of using Kerberos-sec are:
● Kerberos ensures verification, which requires identity authentication on both the client and the server sides, thus resulting in avoiding the impersonation and man-in-the-middle attacks.
10
MegaCorpOne
Penetration Test Report
●
●
When authenticating, actual passwords are not sent over the network, lowering the possibility of password interception and unauthorized access.
Access to resources is authorized based on the existence of valid Kerberos tickets, which are encrypted. Protected resources are difficult to access to unauthorized users.
According to Active Directory Lightweight Directory Services Overview available at:
https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server- 2012-R2-and-2012/hh831593(v=ws.11) Microsoft Active Directory LDAP (Lightweight Directory Access Protocol) is a protocol produced for managing directory services, which include user accounts, groups, computers, and other network resources. Microsoft developed Active Directory, a centralized directory service that is used to regulate and authenticate users, devices, and resources in Windows environments. Here are a few security features of using of using LDAP protocol:
● With the aid of LDAP protocols in Active Directory, administrators can define who has access to what resources based on user roles and permissions.
● Users can access resources using their directory credentials because the Active Directory LDAP protocols support secure authentication.
● Digital certificates for authentication, encryption, and digital signatures can be issued, managed, and terminated using Active Directory Certificate Services.

---

🤖 **Assistant:**

MegaCorpOne engaged Safe House Security for a penetration test to spot vulnerabilities and offer solutions. Findings include several weaknesses like Traffic Management and Privilege Escalation. From an Nmap scan, it's evident the Windows machine uses Microsoft Windows Kerberos Security (Kerberos-sec) and Microsoft Active Directory LDAP protocols.

Per Microsoft's documentation on Kerberos-sec:
- It's a secure authentication protocol in Windows networks.
- It ensures verification on both client and server sides, thwarting impersonation and man-in-the-middle attacks.
- Passwords aren't transmitted over the network, reducing unauthorized access risks.
- Access is based on encrypted Kerberos tickets, making unauthorized access to resources challenging.

Based on Microsoft's Active Directory Lightweight Directory Services Overview:
- LDAP manages directory services like user accounts.
- Microsoft's Active Directory, a centralized service, governs and verifies users and resources in Windows.
- LDAP in Active Directory lets admins set access based on roles.
- Users access resources using directory credentials as LDAP supports secure authentication.
- Active Directory Certificate Services manage digital certificates for authentication, encryption, and digital signatures.

---

🙋 **You:**

Change Safe House Security for AG

---

🤖 **Assistant:**

MegaCorpOne engaged AG for a penetration test to spot vulnerabilities and offer solutions. Findings include several weaknesses like Traffic Management and Privilege Escalation. From an Nmap scan, it's evident the Windows machine uses Microsoft Windows Kerberos Security (Kerberos-sec) and Microsoft Active Directory LDAP protocols.

Per Microsoft's documentation on Kerberos-sec:
- It's a secure authentication protocol in Windows networks.
- It ensures verification on both client and server sides, thwarting impersonation and man-in-the-middle attacks.
- Passwords aren't transmitted over the network, reducing unauthorized access risks.
- Access is based on encrypted Kerberos tickets, making unauthorized access to resources challenging.

Based on Microsoft's Active Directory Lightweight Directory Services Overview:
- LDAP manages directory services like user accounts.
- Microsoft's Active Directory, a centralized service, governs and verifies users and resources in Windows.
- LDAP in Active Directory lets admins set access based on roles.
- Users access resources using directory credentials as LDAP supports secure authentication.
- Active Directory Certificate Services manage digital certificates for authentication, encryption, and digital signatures.

---

🙋 **You:**

Paraphrase and be concrete, replace S.H.S. or Safe House Security for AG
In the early stages of reconnaissance , when using tools like ‘’Shodan.io’’ or Nmap it was incredibly easy to find information which was available to the public. This suggests that the network lacks proper traffic control measures, such as firewalls, access controls, or network segmentation. Without these
11
MegaCorpOne Penetration Test Report
measures in place, network traffic might not be effectively monitored or
restricted
● We have noticed that throughout MegaCorpOne subdomains in ‘’Contact us’’ and and ‘’About’’ employees’ personal information such as their full names and their email addresses made available to the public.
● IP addresses for Megacorpone’s domain servers are publicly available thus adversaries would also be able to find this information, which may result in making Megacorpone vulnerable to DNS spoofing. Also, the attackers can direct MegaCorpOne’s users away from the website to their malicious site.
● Weak passwords are allowed: The password policy is weak in regards to the strength of passwords, which we were able to break in a few seconds using brute force and also the way of storing the passwords. MegaCorpone should implement a strong password policy that requires users to choose complex passwords with a mix of characters, numbers, and special symbols. Enforce password length and expiration policies.
● Passwords were exchanged between users with low privilege status which makes it easy for the attackers to access them.
● Privilege escalation is another problem associated directly with using weak passwords. It enables the attacker to obtain greater access or privileges than they were initially entitled to on the network. MegaCorpOne should implement proper user access controls and authentication mechanisms to restrict access to sensitive functions or data.
● Due to the poor practices, we were able to complete the password bruteforce throughout the manual input.
● Open ports that allow for backdoor access to be established, an exploit script is used towards the target machine, thus reverse shell as Daemon and then escalated our privilege to the highest level ‘’root’’
● Windows enables the Link Local Multicast Name Resolution (LLMNR) by default, This protocol may allow the adversaries to spoof an address and reply to a SMB request that has been broadcast from its host. It would make it possible to extort and escalate the hashes and reset them as well on the host.

---

🤖 **Assistant:**

During our initial reconnaissance using tools like Shodan.io and Nmap, we easily found publicly available information about MegaCorpOne, indicating a lack of robust traffic control such as firewalls and network segmentation. AG noted several vulnerabilities:

1. MegaCorpOne's "Contact us" and "About" subdomains publicly display employee details like names and email addresses.
2. MegaCorpOne’s domain server IP addresses are public, exposing the company to risks like DNS spoofing. Attackers might redirect users to malicious sites.
3. Weak password policies are in place, allowing us to quickly crack them using brute force. MegaCorpOne needs stricter policies emphasizing complex passwords, length requirements, and regular updates.
4. We observed passwords being shared among low-level users, making them easy prey for attackers.
5. The existence of weak passwords made privilege escalation achievable. This lets attackers gain unauthorized access. Tightened access controls and improved authentication are essential.
6. Due to lax security, we managed to brute force passwords manually.
7. We discovered open ports allowing backdoor access. By exploiting these, we gained reverse shell access and escalated our privileges to 'root' level.
8. The default setting of Windows' Link Local Multicast Name Resolution (LLMNR) can be exploited. Attackers can spoof addresses and potentially hijack SMB requests, compromising the security of the host.

To protect its assets and data, MegaCorpOne must address these vulnerabilities urgently.

---

🙋 **You:**

Paraphrase and be concrete, replace S.H.S. or Safe House Security for AG
We (S.H.S) were successfully able to scan for open ports and crack weak passwords, after which we used to gain initial access to Megacorpone’s network and then successfully escalated our privileges to the highest level (root).
We were able to find ten vulnerabilities by our tests. The majority of these weaknesses are caused by the widespread use of weak passwords and weak password policy that is applied by MegaCorpOne. In our testing, we were successful in guessing a weak password manually that allowed us to log into both a Linux and a Windows 10 machine. From there, we were able to locate and obtain additional user names and passwords from those machines. After that, we were able to elevate our privileges on both Linux and Windows to the highest level’’root’’, enabling us backdoor access to the systems and allowing us to maintain exploiting them. For Windows, this meant being able to move laterally between machines and having access to the Domain Controller. This enabled us to enumerate the list of the users, hashed and cracked new user credentials that we haven’t had before.
Addressing the weak passwords vulnerability is essential to reduce a significant number of vulnerabilities. Later, in our report we will describe in more detail the other vulnerabilities and the mitigation techniques that can reduce the potential threats related to these vulnerabilities.
During our open source intelligence investigation we discover The IP addresses of Megacorpone's DNS servers, which makes them vulnerable to malicious attacks through those access points. Also, we identified that Megacorpone's apache servers may possibly be vulnerable after conducting a Shodan report. Although we did not precisely test them, the CVE alerts stated in the report are based on security weaknesses that have been made public on Shodan website.
In addition, in our testing we were able to reveal the open port vulnerabilities that allow for backdoor access to be established.
Moreover, we were able to demonstrate that Megacorpone is vulnerable to LLMNR poisoning.
13
MegaCorpOne Penetration Test Report
We will continue this section of ‘’ Executive Summary’’ by describing our test stages associated with the screenshots in order to reveal the vulnerabilities that MegaCorpOne may have.
In ‘’Vulnerability Findings’’ section of this report, we will describe each of these identified vulnerabilities and our recommended mitigations in depth in. While certain crucial issues must be addressed, most recommendations tend to be entirely easy and relatively cheap for implementation.

---

🤖 **Assistant:**

During our assessment, AG successfully scanned open ports and cracked fragile passwords, granting us initial entry into MegaCorpOne's network. We then escalated our privileges to the highest level: root.

Through our tests, we identified ten vulnerabilities. Predominantly, these are linked to MegaCorpOne's prevalent use of weak passwords and their lenient password policies. We manually guessed one such weak password, enabling us to access both a Linux and Windows 10 machine. Once in, we harvested more usernames and passwords. Consequently, we gained root privileges on both machines, securing backdoor access and persistently exploiting these systems. On the Windows side, we could navigate between machines and accessed the Domain Controller, extracting lists of users and additional credentials.

Addressing the password vulnerabilities is crucial to significantly curbing these threats. Our subsequent report segments will provide an in-depth analysis of other vulnerabilities and associated mitigation strategies.

During our open-source intelligence analysis, we identified MegaCorpOne's DNS server IP addresses, highlighting potential attack avenues. Our Shodan report also pointed towards potential vulnerabilities in MegaCorpOne's apache servers. Though we didn't delve into these, the CVE alerts in the report were based on publicized vulnerabilities on the Shodan website.

Furthermore, our tests revealed ports that were open for potential backdoor access. We also showcased MegaCorpOne's susceptibility to LLMNR poisoning.

In the subsequent "Executive Summary" section, we'll detail our testing phases, using screenshots to highlight MegaCorpOne's vulnerabilities. The "Vulnerability Findings" section will delve deeper into these vulnerabilities and recommend mitigation steps. While some issues are pressing, most of our suggestions are straightforward and cost-effective to implement.

---

🙋 **You:**

Edit the paragraph like if you were grammarly (remove unrequired page jumps)

---

🤖 **Assistant:**

During our assessment, AG successfully scanned for open ports and cracked weak passwords, allowing us initial access to MegaCorpOne's network. We then escalated our privileges to the highest level: root.

We identified ten vulnerabilities through our tests, with the majority linked to MegaCorpOne's extensive use of weak passwords and lenient password policies. By manually guessing a weak password, we accessed both a Linux and Windows 10 machine. This granted us additional usernames and passwords. As a result, we achieved root privileges on both systems, secured backdoor access, and could exploit these continuously. For Windows, this permitted lateral movement between machines and access to the Domain Controller, from which we extracted user lists and further credentials.

Addressing the password vulnerabilities is vital for significantly reducing these threats. Our subsequent report sections will provide detailed insights into other vulnerabilities and their mitigation strategies.

---

🙋 **You:**

Edit the paragraph like if you were grammarly (remove unrequired page jumps)
From the results of the report that we ran using the tool Shodan.io we were able to identify the following potential vulnerabilities on Megacorpone’s apache servers: CVE-2019-0196, CVE-2020-1934, CVE-2021-34798, CVD- 2020-35452, CVE-2022-29404, CVE-2022-22721, CVE-2006-20001, CVE-2022-28330, CVE- 2020-11993, CVE-2019-10081, CVE-2019-0217, CVE-2019-0215, CVE-2021-33193,
CVE-2019-0211, CVE-2022-31813, CVE-2021-36160, CVE-2022-22719, CVE-2020-9490, CVE-2021-26691,CVE-2019-10092, CVE-2019-10098, CVE-2022-23943, CVE-2022-22720,CVE-2020-11984, CVE-2022-26377,CVE-2019-10097, CVE-2021-40438, CVE-2019-0220, CVE-2023-25690, CVE-2021-44790,CVE-2021-26690, CVE-2022-28614, CVE-2020-13938,CVE-2019-17567, CVE-2022-37436,CVE-2020-1927, CVE-2022-36760,CVE-2019-9517, CVE-2019-10082, CVE-2021-44224, CVE-2021-39275, CVE-2022-28615, CVE-2022-30556, CVE-2023-27522. Although we did not precisely test them, the CVE alerts stated in the report are based on security weaknesses that have been made public on Shodan website, see figure(8 & 9).

---

🤖 **Assistant:**

Using the tool Shodan.io, we identified potential vulnerabilities on MegaCorpOne's apache servers. These vulnerabilities include: CVE-2019-0196, CVE-2020-1934, CVE-2021-34798, CVE-2020-35452, CVE-2022-29404, CVE-2022-22721, CVE-2006-20001, CVE-2022-28330, CVE-2020-11993, CVE-2019-10081, CVE-2019-0217, CVE-2019-0215, CVE-2021-33193, CVE-2019-0211, CVE-2022-31813, CVE-2021-36160, CVE-2022-22719, CVE-2020-9490, CVE-2021-26691, CVE-2019-10092, CVE-2019-10098, CVE-2022-23943, CVE-2022-22720, CVE-2020-11984, CVE-2022-26377, CVE-2019-10097, CVE-2021-40438, CVE-2019-0220, CVE-2023-25690, CVE-2021-44790, CVE-2021-26690, CVE-2022-28614, CVE-2020-13938, CVE-2019-17567, CVE-2022-37436, CVE-2020-1927, CVE-2022-36760, CVE-2019-9517, CVE-2019-10082, CVE-2021-44224, CVE-2021-39275, CVE-2022-28615, CVE-2022-30556, and CVE-2023-27522. While we did not directly test these, the CVE alerts in the report are based on vulnerabilities publicly disclosed on the Shodan website, as illustrated in figures 8 and 9.

---

🙋 **You:**

Paraphrase concisely

---

🤖 **Assistant:**

Using Shodan.io, we detected multiple potential vulnerabilities on MegaCorpOne's apache servers. While we

---

🙋 **You:**

Paraphrase concisely
From the reconnaisance stage using Recon-ng, we were able to expose the IP addresses for three of MegaCorpOne’s named servers. Recon-ng simplifies and automates the process of collecting information from various sources and consolidates the results for analysis (see figures 10,11,12,13), thus adversaries would also be able to find this information, which may result in making Megacorpone vulnerable to DNS spoofing. Also, the attackers can direct MegaCorpOne’s users away from the website to their malicious site.

---

🤖 **Assistant:**

Using Recon-ng, we uncovered IP addresses for three of MegaCorpOne's named servers. Recon-ng efficiently gathers and consolidates data from different sources for review (see figures 10-13). This information, if accessed by adversaries, could make MegaCorpOne susceptible to DNS spoofing, potentially redirecting users to malicious sites.

---

🙋 **You:**

Paraphrase and remove figures references
With MegaCorpOne’s weak password attackers can utilize precomputed tables to rapidly determine the original passwords linked to hashed passwords when passwords are hashed without salting. As a result, it is much easier and takes much less time to crack passwords and access user accounts without authorization. In essence, methods like rainbow table attacks and dictionary attacks may exploit unsalted hashes. Salting involves adding a random or unique value (salt) to each password before hashing, making it much more difficult for attackers to use precomputed tables (rainbow tables) to crack passwords. It is crucial to understand that salts do not offer protection against password cracking, but rather make it slower and more difficult for an attacker to continue their attack. To understand more refer to Linux Enumeration section figure (see figures 29 & 30) and Windows Credentials Dumping section see figure(55 & 56).

---

🤖 **Assistant:**

MegaCorpOne's weak passwords allow attackers to quickly deduce the original passwords from hashed versions using precomputed tables when the passwords are not salted. This speeds up unauthorized access. Techniques like rainbow table attacks and dictionary attacks can exploit unsalted hashes. Salting, the addition of a random value to each password before hashing, complicates the attackers' task. While salts don't prevent password cracking, they slow down and challenge the attacker's efforts. This topic is elaborated upon in the Linux Enumeration and Windows Credentials Dumping sections.

---

🙋 **You:**

Same
MegaCorpOne’s network lacks proper traffic control measures, such as firewalls, network traffic might not be effectively monitored or restricted. The Nmap scanning results that we have performed earlier on the Linux and Windows, provided us with the map of all the network connected machines. Attackers can easily perform network scans to identify all the machines connected to the network, thus gaining valuable information that helps them understand the network's potential targets. This vulnerability could lead to unauthorized access, data breaches, and potential compromise of the affected hosts. To understand more refer to Linux Exploitation & Escalation Privilege section see figure(21 & 22), and Windows Port Scanning section see figure(36).

---

🤖 **Assistant:**

MegaCorpOne's network doesn't have adequate traffic control measures like firewalls, leading to potentially unmonitored and unrestricted network traffic. Our Nmap scans on Linux and Windows illustrated the layout of all network-connected devices. Without proper safeguards, attackers can scan and identify all devices on the network, gaining insights into potential targets. Such vulnerabilities can result in unauthorized access, data breaches, and compromised hosts. More details are provided in the Linux Exploitation & Escalation Privilege and Windows Port Scanning sections.

---

🙋 **You:**

Paraphrase and remove figures references

When we shelled we found a readable file *adminpassword.txt* inside the /var/tmp. There was a plaintext message in the directory that contained critical login information that might be used to escalate an administration-level SSH intrusion of the network. Easy access credentials is a crucial part of an attack as it exposes user accounts to unauthorized access and potentially allows attackers to compromise the security of the entire system. To understand more refer above to the Linux Enumeration section, (see figure 29 & 30).

---

🤖 **Assistant:**

Upon accessing the system, we discovered a readable file named *adminpassword.txt* in the /var/tmp directory. This directory contained plaintext login details, potentially facilitating an administrative-level SSH breach of the network. Easily accessible credentials significantly increase the risk, as they expose user accounts to unauthorized access and can jeopardize the security of the entire system. More details can be found in the Linux Enumeration section.

---

🙋 **You:**

less wordy

---

🤖 **Assistant:**

We found a readable *adminpassword.txt* file in /var/tmp with plaintext login details. These credentials pose a risk, potentially enabling unauthorized SSH access at an administrative level. This is elaborated upon in the Linux Enumeration section.

---

🙋 **You:**

The vulnerability of files containing administrative credentials in plain text refers to the practice of storing sensitive credentials, such as usernames and passwords with administrative privileges, in clear, readable text within files. This vulnerability poses a significant security risk because unauthorized individuals who gain access to these files can easily obtain the credentials and use them to escalate privileges, gain unauthorized access, and potentially compromise MegaCorpOne’s systems and data.
We were able to obtain access to a Linux machine by using a detected weak password and a malicious script in Metasploit. We were able to find a file containing administrative level credentials while inside the machine. Using this information, we were able to increase our level of access to the system and spot more user files. Through the Linux machine's port 22 (ssh), we were able to access the password information from those files and utilize it to create a backdoor. This will enable us to continue accessing the machine. For more details refer to Brute Force Access( see figures 18,19, and 20).
Same, short, concise, no figures references.

---

🤖 **Assistant:**

Storing administrative credentials in plain text is a major security flaw. Unauthorized users can easily access and exploit these credentials, compromising systems and data. We accessed a Linux machine using a weak password and a Metasploit script. Inside, we found a file with admin credentials. This allowed us to escalate our privileges, access more user files, and set up a backdoor for persistent access. More details are in the Brute Force Access section.

---

🙋 **You:**

same:
Privilege escalation is another problem associated directly with using weak passwords. It enables the attacker to obtain greater access or privileges than they were initially entitled to on the network. While fixing weak passwords should lower the danger, it's equally crucial to take steps to expressly prevent privilege escalation in the event that access is granted to prevent hackers from gaining access to sensitive information, command over vital systems, and carry out tasks that are usually only available to privileged users. For more details refer to the Persistence for Linux section(see figures 31-35) and Windows Persistence section(see figures 53 & 54).

---

🤖 **Assistant:**

Privilege escalation, often linked to weak passwords, allows attackers to gain more access than initially permitted on a network. Addressing weak passwords is essential, but it's also vital to prevent privilege escalation directly. If unauthorized access occurs, this will stop intruders from accessing sensitive data or taking control of critical systems. Details are in the Persistence for Linux and Windows Persistence sections.

---

🙋 **You:**

same:
A vulnerability in a network called LLMNR (Link-Local Multicast Name Resolution) poisoning or spoofing allows attackers to modify or intercept network traffic and send it to malicious sources. On Windows networks, the LLMNR protocol is used to resolve the names of nearby computers without the presence of a DNS server.
LLMNR can be used by attackers by faking their IP address, with the use of Responder to authenticate through SMB in order to divert network requests to their own systems, and trick the users to provide them with the credentials they need to potentially obtain unauthorized access to the system and steal sensitive data.
We were able to retrieve a set of credentials for another domain user, we used a Responder tool to listen for LLMNR requests and spoof responses to unsuspecting victims on the network. The responder received the request and automatically replied with an NTLM challenge asking for the password hash of the requesting user. Windows10 responds with NTLMv2 hash of the user. We were able to get the hash password and cracked the user credential for a new user (pparker/Spring2021) that we haven’t before( see figure 41).

---

🤖 **Assistant:**

LLMNR poisoning, a vulnerability in networks, lets attackers redirect network traffic to malicious sources. In Windows networks, the LLMNR protocol helps resolve nearby computer names without a DNS server. Attackers can exploit this by impersonating IP addresses and using tools like Responder to divert network requests. This deception can lead users to provide the very credentials the attacker seeks, granting unauthorized system access. We utilized Responder to intercept LLMNR requests and spoof responses. In the process, we obtained and cracked the NTLMv2 hash of a new user credential.