---
title: Cofounder Departure Steps
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  I completed post-incorporation in clerky but one of
  my cofounders left. Can I handle that over Clerky or what should I do? Just create
  another company?"
draft: false
---

# Cofounder Departure Steps

## ✅ TODOs
- [ ] legal paperwork with my LLC to associate it with my GitHub open source license? I chose Affero GPL (AGPL) but is that the most suitable for my TinaCMS based (jamstack) publishing platform?

## 🧠 Full Chat

🙋 **You:**

I completed post-incorporation in clerky but one of my cofounders left. Can I handle that over Clerky or what should I do? Just create another company?

---

🤖 **Assistant:**

If one of your cofounders left after completing post-incorporation on Clerky, you don’t necessarily need to create a new company. You can handle this situation by modifying the company’s structure accordingly. Here’s what you should do:  

### **1. Check Your Incorporation Documents**  
- Review your **Stock Purchase Agreement, Bylaws, and Founders’ Agreement** (if applicable).  
- If the departing cofounder had **vesting** on their shares, unvested shares typically return to the company.  
- If they had **fully vested** shares, you may need to buy them back or handle it differently.  

### **2. Remove the Cofounder from the Cap Table**  
- If the cofounder has **unvested shares**, you’ll need to **exercise the company’s repurchase rights** (likely defined in their Stock Purchase Agreement).  
- If they have **vested shares**, you may negotiate a **buyback** or **transfer of shares** to other founders or the company.  

### **3. Update Board and Officer Appointments (if needed)**  
- If the cofounder was a **board member or officer**, you may need a **board resolution** and/or **resignation letter** to formalize their departure.  

### **4. File Necessary Updates (if applicable)**  
- If they were listed as an **officer or director** in state filings, you might need to update records with the Secretary of State.  
- If you have an **IRS EIN or bank account**, no changes are typically needed unless they had authority over those.  

### **Can Clerky Handle This?**  
Clerky doesn’t have a built-in workflow for removing a cofounder, but you can still use it to generate:  
- **Stock Repurchase Agreements** (if applicable)  
- **Board Consents & Stock Transfers** (if you’re redistributing shares)  

If the situation is complex (e.g., disputes, significant equity involved), it may be worth consulting a lawyer.  

### **Should You Just Create a New Company?**  
Probably not—unless:  
- The cofounder’s departure **fundamentally changes the business direction**, or  
- There’s a **dispute over IP or equity** that makes it easier to start fresh.  

Otherwise, updating your current company is usually more efficient. Let me know if you need help with specific documents!

---

🙋 **You:**

Can I buy a copyright with my LLC?

---

🤖 **Assistant:**

Yes, your **LLC can purchase a copyright** just like it can own other intellectual property (IP). Here’s how:  

### **1. Buying an Existing Copyright**  
If you're acquiring a copyright from someone else, you'll need a **Copyright Assignment Agreement**. This contract should:  
- Identify the work being transferred (title, description, registration number if applicable).  
- State that the seller is transferring all rights, including reproduction, distribution, and modification.  
- Include payment terms and warranties that the seller is the rightful owner.  
- Be signed by both parties.  

Once signed, you can optionally **record the transfer** with the **U.S. Copyright Office** (recommended for legal protection).  

### **2. Creating and Owning a Copyright**  
If your LLC creates original works (e.g., software, articles, videos), it automatically **owns the copyright** unless an individual employee or contractor retains rights. To ensure your LLC owns the copyright:  
- Use **Work-for-Hire Agreements** when hiring employees or contractors.  
- Register the copyright with the **U.S. Copyright Office** for stronger legal protection.  

### **3. Tax & Liability Benefits**  
Owning copyrights through your LLC can:  
- Provide liability protection (e.g., if the work is subject to lawsuits).  
- Allow tax deductions for copyright-related expenses.  
- Facilitate licensing or selling rights under your business entity.  

Would you like a **template for a Copyright Assignment Agreement** or **guidance on registration**?

---

🙋 **You:**

is that something that Clerky will handle for me?

---

🤖 **Assistant:**

No, **Clerky does not handle copyright transfers or intellectual property (IP) assignments**. Clerky is primarily designed for startup legal paperwork like incorporation, equity, and fundraising—**not IP transactions**.  

### **How to Handle a Copyright Purchase for Your LLC**
Since Clerky doesn’t cover this, you have a few options:  

#### **1. Use a Legal Template (Low-Cost Option)**
You can draft a **Copyright Assignment Agreement** using templates from reputable sources like:  
- [Docracy](https://www.docracy.com/)  
- [LawDepot](https://www.lawdepot.com/)  
- [Rocket Lawyer](https://www.rocketlawyer.com/)  

#### **2. Work with a Lawyer (Safer Option)**
If the copyright is valuable or the transaction is complex (e.g., multiple parties, licensing clauses), a lawyer can draft a **custom agreement**. Websites like [UpCounsel](https://www.upcounsel.com/) or [LegalZoom](https://www.legalzoom.com/) can help with affordable legal services.  

#### **3. Record the Transfer with the U.S. Copyright Office (Optional but Recommended)**
- If the copyright is registered, file **Form CA** with the **U.S. Copyright Office** to update ownership.  
- This provides public notice that your LLC now owns the rights.  

Would you like help reviewing a **Copyright Assignment Agreement** before using it?

---

🙋 **You:**

Do I need to do legal paperwork with my LLC to associate it with my GitHub open source license? I chose Affero GPL (AGPL) but is that the most suitable for my TinaCMS based (jamstack) publishing platform?

---

🤖 **Assistant:**

### **1. Associating Your LLC with Your Open Source Project**  
If you want your **LLC to officially own** the open-source project, you should take legal steps to formalize that ownership. GitHub itself doesn’t require this, but for clarity and protection, consider:  

#### **A. Assigning the Copyright to Your LLC**  
Since **copyright defaults to the individual author**, you may need to transfer ownership to your LLC via a **Copyright Assignment Agreement** or a **Corporate IP Assignment Agreement**. This ensures:  
- Your LLC is the official copyright holder of the code.  
- The LLC can enforce the open-source license (AGPL in this case).  
- It avoids personal liability issues.  

**Options:**  
- Draft a simple **Copyright Assignment Agreement** (I can help with this).  
- If you work with contributors, use a **Contributor License Agreement (CLA)** to clarify that your LLC owns all contributions. GitHub supports CLA bots to manage this automatically.  

---

### **2. Is AGPL the Best License for a TinaCMS-Based JAMstack Publishing Platform?**  
AGPL (**Affero GPL v3**) is a **strong copyleft** license, meaning:  
- Anyone who **modifies and runs** your software (even as a cloud service) must **release their changes under AGPL**.  
- It prevents companies from **modifying your software and keeping it private** while offering it as a SaaS.  

#### **Pros of AGPL for Your Project**  
✅ **Ensures modifications remain open-source**, even if used in a SaaS context.  
✅ **Ideal if you want a community-driven project** and discourage proprietary forks.  
✅ **Protects against companies "exploiting" your work** without contributing back.  

#### **Cons of AGPL for a JAMstack CMS**  
❌ **May deter commercial adoption** – Some companies avoid AGPL due to its strict copyleft requirements.  
❌ **Can complicate integrations** – If your CMS interacts with other proprietary services, AGPL might create legal ambiguities.  
❌ **Less permissive for plugins/extensions** – If you want a **vibrant plugin ecosystem**, some developers may hesitate to contribute due to AGPL’s restrictions.  

#### **Alternative Licenses to Consider**  
- **GPLv3** – If you want strong copyleft but don’t mind companies using your CMS in SaaS without sharing backend changes.  
- **Mozilla Public License (MPL 2.0)** – A **weaker copyleft** license that only requires modified files (not the entire project) to be open-source.  
- **MIT or Apache 2.0** – If you want **maximum adoption** and don’t mind companies using your code commercially.  
- **Elastic License v2** (or similar custom licenses) – If you want open-source for individuals but restrict SaaS providers from profiting without contributing.  

---

### **3. What Should You Do Next?**  
✅ **If you want your LLC to officially own the project**, draft a **Copyright Assignment Agreement** to transfer ownership from you to your LLC.  
✅ **If AGPL is too restrictive for adoption**, consider MPL 2.0 or GPLv3 instead.  
✅ **If you expect external contributors**, set up a **Contributor License Agreement (CLA)** to manage ownership.  
✅ **Update the GitHub repository** to reflect LLC ownership in the license and README.  

Would you like help drafting any of these agreements? 🚀