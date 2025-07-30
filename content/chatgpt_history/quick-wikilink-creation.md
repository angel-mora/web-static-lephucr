---
title: Quick Wikilink Creation
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  is it doable?"
draft: false
---

# Quick Wikilink Creation

## 🧠 Full Chat

🙋 **You:**

is it doable?
https://forum.obsidian.md/t/is-there-a-plugin-or-way-to-quickly-create-wikilinks-internal-links-where-i-can-select-text-convert-it-to-wikilink-format-and-immediately-type-in-the-linked-page/56987

---

🤖 **Assistant:**

Yes, it's doable! The Obsidian forum thread you linked to suggests using community plugins like **QuickAdd** or **Templater** to quickly convert selected text into a `[[wikilink]]` and immediately start typing in the linked note. Here are a few approaches:

### 1. **Using QuickAdd**
- You can set up a **capture** macro in QuickAdd that:
  1. Selects text.
  2. Wraps it in `[[ ]]`.
  3. Opens the newly created link.

### 2. **Using Templater**
- You can create a Templater script that:
  1. Detects selected text.
  2. Converts it into a `[[wikilink]]`.
  3. Opens the new note immediately.

### 3. **Using a Simple Hotkey**
- Obsidian’s built-in **“Insert wikilink”** feature (default: `[[ ]]`) allows you to type `[[` and autocomplete existing notes.
- Some users suggest using **Text Expander tools** like Espanso or AutoHotkey (Windows) to quickly format selected text.

Would you like help setting up a specific method, or do you have a preferred workflow in mind?

---

🙋 **You:**

Is that the same as https://forum.obsidian.md/t/automatic-wikilink-template/85131/2?

---

🤖 **Assistant:**

The method in the second link (**Automatic Wikilink Template**) is similar but focuses more on using **Templater** to automatically insert a structured template into newly created wikilinked notes. It differs slightly from the QuickAdd method in that it pre-fills the new note with predefined content.

### **Comparison of Both Approaches**
| Feature | QuickAdd Method | Templater Method |
|---------|---------------|------------------|
| **Goal** | Quickly convert selected text into a wikilink and open it | Automatically insert a template into new wikilinked notes |
| **How it works** | Uses a capture macro or script to wrap selected text in `[[ ]]` and open it | Uses Templater to pre-fill the new page with a structure when a wikilinked note is created |
| **Customization** | Flexible, can open the linked note instantly | More structured, ensures all new notes follow a format |
| **Best for** | Speed and inline note creation | Standardizing note content automatically |

If you just want to **quickly turn text into a wikilink and open it**, QuickAdd is better. If you want **every wikilinked note to start with a specific template**, the Templater method is better.

Would you like a step-by-step guide for setting up either method?

---

🙋 **You:**

https://github.com/mo-seph/obsidian-note-from-template
Does that help?

---

🤖 **Assistant:**

Yes! The **Obsidian Note From Template** plugin by [mo-seph](https://github.com/mo-seph/obsidian-note-from-template) is a great tool for automating note creation from templates when you create a new wikilinked note. It works similarly to **Templater**, but with a simpler setup focused on applying templates automatically.

### **How This Plugin Helps:**
1. **Auto-apply templates**  
   - When you create a new wikilink (`[[New Note]]`), the plugin can automatically apply a predefined template to that note.
   
2. **Customizable templates**  
   - You can set different templates based on folders or note types.
   
3. **Works well with wikilinks**  
   - It ensures that whenever you create a new note by clicking a wikilink, it starts with structured content.

### **How It Differs from QuickAdd & Templater**
| Feature | Note From Template | QuickAdd | Templater |
|---------|-------------------|----------|-----------|
| **Auto-apply templates to new notes** | ✅ Yes | ❌ No | ✅ Yes |
| **Manually trigger a template** | ❌ No | ✅ Yes | ✅ Yes |
| **Wrap selected text in `[[ ]]` and open note** | ❌ No | ✅ Yes | ⚠️ Possible with script |
| **Advanced scripting/customization** | ❌ Limited | ⚠️ Some | ✅ Yes (JS-based) |

### **When to Use This Plugin**
- If you **want every new wikilinked note to have a structured template** automatically, this is a great choice.
- If you **need more manual control** over which templates get applied, QuickAdd or Templater might be better.

#### **Would you like help setting it up, or do you want a different approach?**