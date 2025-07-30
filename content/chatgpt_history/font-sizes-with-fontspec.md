---
title: Font Sizes with Fontspec
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  latex font sizes from fontspec"
draft: false
---

# Font Sizes with Fontspec

## 🧠 Full Chat

🙋 **You:**

latex font sizes from fontspec

---

🤖 **Assistant:**

In LaTeX, when using the `fontspec` package, you have more flexible control over font sizes compared to the standard LaTeX font size commands. The `fontspec` package is designed to work with XeLaTeX or LuaLaTeX, allowing you to use system fonts and specify font features more easily. Here’s a guide to managing font sizes with `fontspec`:

### Basic Font Size Commands
You can use standard LaTeX font size commands with `fontspec`, such as:
- `\tiny`
- `\scriptsize`
- `\footnotesize`
- `\small`
- `\normalsize`
- `\large`
- `\Large`
- `\LARGE`
- `\huge`
- `\Huge`

### Custom Font Sizes
With `fontspec`, you can also define custom font sizes more precisely using the `\fontsize` command, which takes two arguments: the font size and the line spacing.

**Example**:
```latex
\documentclass{article}
\usepackage{fontspec}

\setmainfont{Times New Roman}

\begin{document}

This is \tiny tiny text. \\
This is \scriptsize scriptsize text. \\
This is \footnotesize footnotesize text. \\
This is \small small text. \\
This is \normalsize normalsize text. \\
This is \large large text. \\
This is \Large Large text. \\
This is \LARGE LARGE text. \\
This is \huge huge text. \\
This is \Huge Huge text. \\

\fontsize{14}{18}\selectfont
This is custom font size 14pt with 18pt line spacing.

\end{document}
```

### Setting Custom Fonts and Sizes
You can also set a font and its size globally or locally within the document using `\setmainfont`, `\setsansfont`, `\setmonofont`, and `\newfontfamily`.

**Example**:
```latex
\documentclass{article}
\usepackage{fontspec}

\setmainfont{Times New Roman}[Scale=1.0]

\begin{document}

This is the default font size.

\fontsize{12}{15}\selectfont
This is a custom font size with Times New Roman at 12pt and line spacing of 15pt.

\end{document}
```

### Using Font Features
`fontspec` allows you to specify additional font features like `BoldFont`, `ItalicFont`, `BoldItalicFont`, and more.

**Example**:
```latex
\documentclass{article}
\usepackage{fontspec}

\setmainfont[
  ItalicFont = {Times New Roman Italic},
  BoldFont = {Times New Roman Bold},
  BoldItalicFont = {Times New Roman Bold Italic}
]{Times New Roman}

\begin{document}

This is \textit{italic}, this is \textbf{bold}, and this is \textbf{\textit{bold italic}}.

\end{document}
```

By combining these commands, you can have fine-grained control over the font sizes and styles in your LaTeX documents when using the `fontspec` package.