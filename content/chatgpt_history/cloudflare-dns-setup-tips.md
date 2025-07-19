---
title: Cloudflare DNS Setup Tips
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Cloudflare DNS Setup Tips

## ✅ TODOs


## 📌 Summary
I have a vercel application that points to a cloudflare dns. It works under www but not through the dns. 1) What is that proxy option in cloudlfare dns? 2)  How can I set the domain without www to work properly?

## 🧠 Full Chat


I have a vercel application that points to a cloudflare dns. It works under www but not through the dns. 1) What is that proxy option in cloudlfare dns? 2)  How can I set the domain without www to work properly?

Alright, let's break this down step by step:

1. **Cloudflare's Proxy Option**:

   The orange cloud icon in Cloudflare's DNS settings represents the "Proxy" feature. When you enable this feature (i.e., when the cloud icon is orange), it means that the traffic for the corresponding DNS record is passing through Cloudflare's network. This allows you to take advantage of several of Cloudflare's performance, security, and reliability features like:

   - DDoS protection.
   - Web Application Firewall (WAF).
   - CDN & caching.
   - SSL/TLS encryption.
   - Etc.

   If you disable this feature (i.e., when the cloud icon is grey), the traffic goes directly to the IP address you've specified without passing through Cloudflare's infrastructure. This is called "DNS Only" mode.

2. **Setting the domain without www to work properly with Vercel and Cloudflare**:

   If your `www` version of the domain is working, but the root domain (i.e., without the `www`) is not, follow these steps:

   a. **DNS Settings**:

   - Go to your Cloudflare dashboard and navigate to the DNS section.
   - Check if you have an `A` or `CNAME` record for the root of your domain (e.g., `example.com`). If not, you need to add one.
   - For Vercel, you'll typically use a `CNAME` record pointing to the domain provided by Vercel, or an `ALIAS`/`ANAME` record if your DNS provider supports it (Cloudflare does not support `ALIAS` or `ANAME` by default).
   
   b. **Vercel Settings**:
   
   - Make sure you have added both the `www` and root versions of your domain in your Vercel project's settings.
   - Vercel should provide you with verification records to add to your DNS in Cloudflare. Make sure these are correctly set up.

   c. **Redirection (if necessary)**:
   
   - If you prefer to use either the `www` version or the root domain as the primary, you can set up a page rule in Cloudflare to redirect traffic from one to the other.
   - For example, if you want `example.com` to always redirect to `www.example.com`, you can set that up using Cloudflare's Page Rules.

   d. **SSL/TLS**:
   
   - Ensure that you have SSL/TLS set up correctly. If you're using Cloudflare's proxy, you'll have a few options for SSL/TLS. "Flexible" is the easiest, but it's not the most secure since the connection between Cloudflare and your origin server isn't encrypted. It's generally better to choose "Full" or "Full (strict)" if your origin server (Vercel in this case) has a valid SSL certificate.

Ensure that all DNS changes have fully propagated. Remember, DNS changes can take time to propagate across the internet, sometimes up to 48 hours (although it's often much quicker with popular DNS providers like Cloudflare).

If you've done all the above and are still facing issues, it might be helpful to check for any conflicting settings or rules within Cloudflare or Vercel, or consider reaching out to their support for specific guidance related to your setup.