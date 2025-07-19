---
title: Fix LaTeX errors faster.
tags:
- '1'
- '2'
- '3'
- '4'
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Fix LaTeX errors faster.

## ✅ TODOs
- [ ] cuments, especially for academic, technical, or creative projects. While LaTeX doesn't directly use Nerd Fonts, there are several packages available that provide access to a variety of icons suitable for different contexts, such as symbols for programming, social media icons, or general-purpose icons.
- [ ] s los flotantes pendientes antes de cambiar de página, en algunos contextos `\newpage` podría funcionar mejor para tus necesidades específicas.
- [ ] es directo y evita complicaciones que puedan surgir de la redefinición del comando `\tableofcontents` dentro de tu plantilla.
- [ ] s,textsize=scriptsize,spanish]{todonotes}
- [ ] [color=red!40]{#1}} % Indica que esta parte ya está concluida
- [ ] [color=red!95]{Homologar criterio de uso de las comillas.}}
- [ ] [color=red!90]{[Cita requerida, #1]}} % Indica que hace falta una cita
- [ ] [color=green!40]{#1}} % Nota para comentar que hay que reescribir algo
- [ ] [color=cyan!40]{#1}} % Indica que requiere un ajuste de estilo
- [ ] ` con `todonotes`)**: Facilitan la revisión y colaboración en el documento, permitiéndote añadir notas sobre trabajo pendiente o cambios necesarios.
- [ ] notes**: Permite añadir notas de "todo" (tareas pendientes) en el margen del documento, muy útil para la revisión y anotación de documentos durante la fase de redacción.
- [ ] nde quieras ver el esquema:
- [ ] te da control manual sobre dónde ocurren los saltos de página en la TOC, lo cual es útil para evitar que las partes se dividan entre dos páginas.
- [ ] , podrías omitir `\thesubsection` del último argumento:
- [ ] aplica los cambios a todas las subsecciones del documento. Si necesitas un comportamiento diferente en secciones específicas, deberás hacer ajustes adicionales o definir comandos personalizados para esas secciones.
- [ ] notes@disabled
- [ ] {#2}}
- [ ] pensamiento es estratégico}
- [ ] s los casos donde se lee plural
- [ ] s

## 📌 Summary
How to fix latex errors faster? Can use vscode or nvchad

## 🧠 Full Chat


How to fix latex errors faster? Can use vscode or nvchad

Fixing LaTeX errors efficiently often requires a blend of good practices, using the right tools, and familiarity with common errors and their solutions. Both Visual Studio Code (VS Code) and NvChad (a Neovim configuration) can significantly enhance your LaTeX editing experience by providing features like syntax highlighting, error diagnostics, and more. Here's how to leverage these tools to fix LaTeX errors faster:

### Using Visual Studio Code (VS Code)

1. **Install LaTeX Workshop Extension**: This extension provides comprehensive LaTeX support, including compiling, viewing PDFs, and error diagnostics. Once installed, it will highlight syntax errors and offer suggestions for fixes.

2. **Use the Problems Panel**: The Problems panel in VS Code lists all the current errors and warnings in your document. Clicking on an error will take you directly to the line causing the issue, making it easier to fix.

3. **Configure Linters**: Customize your linting settings in LaTeX Workshop to catch more types of errors or to ignore specific warnings that you find unhelpful.

4. **Read the Log**: The LaTeX Workshop extension allows easy access to the LaTeX log file. Often, the log provides detailed descriptions of errors and warnings, including suggestions for fixes.

5. **Use Snippets for Common Structures**: VS Code allows you to create snippets for commonly used LaTeX structures, helping you avoid syntax errors by automating the insertion of correct code patterns.

### Using NvChad (Neovim)

NvChad is an enhancement over Neovim, aimed at providing a modern, visually appealing, and efficient coding environment. For LaTeX:

1. **Install a LaTeX Plugin**: There are several Neovim plugins for LaTeX, such as `vimtex`, which provide features similar to those in VS Code, including error highlighting and document compilation. `vimtex` integrates with Neovim's quickfix list to show errors and warnings.

2. **Leverage the Quickfix Window**: The quickfix window in Neovim, when used with a LaTeX plugin like `vimtex`, will list your document's errors and warnings. You can navigate through them easily and jump to the problematic code lines.

3. **Customize Your Configuration**: NvChad allows for extensive customization. You can set up your Neovim to automatically run linting tools or scripts that check your LaTeX document for common errors and style issues.

4. **Utilize Neovim's Command-Line Features**: Neovim's command-line mode can be very powerful for fixing errors. You can use search and replace commands to quickly fix common mistakes across your document.

### General Tips for Both Environments

- **Learn the LaTeX Language**: Understanding common error messages and knowing the LaTeX syntax well can significantly speed up troubleshooting.
- **Regularly Compile**: Compile your document frequently to catch errors early before they pile up.
- **Use Version Control**: Tools like Git can help you track changes and revert to previous versions if you encounter complex errors.
- **Community and Documentation**: Both VS Code and NvChad have active communities. Utilize forums, documentation, and discussions to find solutions to common problems.

Both VS Code and NvChad are powerful tools that can streamline your LaTeX editing process. The choice between them may come down to personal preference, the specific features you need, and which editor's workflow you prefer.

> in markdown is equivalent to WHAT in latex

In Markdown, the `>` character is used for blockquotes, indicating a section of text that is quoted from another source. In LaTeX, the equivalent functionality—creating an indented section to represent quoted text or a block of text set apart from the main text—can be achieved using the `quote` or `quotation` environment. 

Here are the differences and how to use them:

- **`quote` environment**: This is used for short quotations, typically a single paragraph. It doesn't indent the first line of each paragraph.

```latex
\begin{quote}
This is a short quote.
\end{quote}
```

- **`quotation` environment**: This is similar to `quote` but is intended for longer quotations that span multiple paragraphs. This environment indents the first line of each paragraph.

```latex
\begin{quotation}
This is a longer quote that might span multiple paragraphs. 

Here is the second paragraph of the quote.
\end{quotation}
```

In both cases, LaTeX will automatically handle the indentation and formatting to visually set the quoted text apart from the rest of the document, akin to how blockquotes are used in Markdown.

I want to add indentation to that piece of tex. How can I do it?

To add indentation to a block of text in LaTeX, particularly within the `quote` or `quotation` environments where additional indentation might be desired, you have a couple of options. Here are the methods you can use:

### 1. Manually Adding Indentation

For a specific block of text, you can manually add indentation using `\hspace{}` at the beginning of the line. You can specify the amount of space you want to add. For example, `\hspace{1cm}` adds 1 centimeter of horizontal space.

```latex
\begin{quote}
\hspace{1cm}This is a short quote with added indentation.
\end{quote}
```

### 2. Adjusting Paragraph Indentation Globally

If you prefer to adjust the indentation for all paragraphs globally, you can redefine the `\parindent` length. This method will affect the entire document, not just the quoted sections.

```latex
\setlength{\parindent}{1cm} % Sets global paragraph indentation to 1cm
```

### 3. Using `addmargin` Environment from the `scrextend` Package

For more flexibility and control over indentation in specific sections, you can use the `addmargin` environment provided by the `scrextend` package. This allows you to add indentation to both the left and right margins for a block of text.

First, include the package at the beginning of your document:

```latex
\usepackage{scrextend}
```

Then, wrap the text you want to indent with the `addmargin` environment:

```latex
\begin{addmargin}[1cm]{0cm} % Adds 1cm indentation to the left margin
This is a block of text with added left indentation, using the addmargin environment.
\end{addmargin}
```

The first argument specifies the indentation for the left margin, and the second argument for the right margin. Adjust the values according to your needs.

### 4. Custom Environment for Indented Quotes

If you often need indented quotes with a specific styling, consider defining a custom environment in your preamble. This way, you can reuse it throughout your document without repeating the setup.

```latex
\newenvironment{indentedquote}
  {\begin{quote}\hspace{1cm}}
  {\end{quote}}

% Usage in document
\begin{indentedquote}
This quote is indented with a custom environment.
\end{indentedquote}
```

This method allows you to maintain consistency across your document and easily adjust the styling of all indented quotes by changing the definition in one place.

best font to load icons (like nerdfonts) but for latex

In LaTeX, incorporating icon fonts similar to the way Nerd Fonts are used in text editors and terminals can add a modern touch to documents, especially for academic, technical, or creative projects. While LaTeX doesn't directly use Nerd Fonts, there are several packages available that provide access to a variety of icons suitable for different contexts, such as symbols for programming, social media icons, or general-purpose icons.

Here are some of the best options for loading icon fonts in LaTeX:

### 1. **FontAwesome**

FontAwesome is one of the most popular icon sets and can be easily used in LaTeX documents. It offers a wide range of icons, including social media logos, web-related icons, and many others. To use FontAwesome in LaTeX, you can include the `fontawesome` package:

```latex
\usepackage{fontawesome}
```

And then use icons in your document like so:

```latex
\faTwitter{} This is a Twitter icon.
\faGithub{} This is a GitHub icon.
```

### 2. **Academicons**

For academic icons, such as logos of research organizations, publication platforms, and academic interests, the `academicons` package is a great choice. It's specifically designed for academic documents and presentations:

```latex
\usepackage{academicons}
```

Example usage:

```latex
\xaiGoogleScholar{} My Google Scholar Profile.
```

### 3. **Material Icons**

Although there isn't a direct package for Google's Material Icons in LaTeX as of my last update, you can use the `fontawesome` package for a similar range of icons that are simple and clean, akin to Material Design icons.

### Using with XeLaTeX or LuaLaTeX

For broader access to various fonts and easier custom font usage (including custom icon fonts), consider using XeLaTeX or LuaLaTeX as your LaTeX compiler. These engines support direct font loading from your system, which means you could technically use any icon font available on your computer, including parts of Nerd Fonts if you have them installed.

To load a custom font in XeLaTeX or LuaLaTeX, you can use the `fontspec` package. For example:

```latex
\usepackage{fontspec}
\newfontfamily{\myiconfont}{[Path/To/Your/Font.ttf]} % Use the actual path and font name
```

Then, you can insert icons directly by copying and pasting the icon glyphs into your LaTeX document or by defining commands for specific icons using their Unicode code points.

### Conclusion

FontAwesome and Academicons are two of the best choices for loading icon fonts in LaTeX, covering a wide range of needs. For more specific or custom icons, using XeLaTeX or LuaLaTeX with the `fontspec` package offers the flexibility to load almost any icon font, including customizing your LaTeX documents with Nerd Fonts or similar, provided you handle the font licensing appropriately.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tiqqunazo
%
% Una clase de LaTeX personalizada basada en la clase extarticle,
%
% Fuertemente inspirada en el blog en español de Tiqqun y por la clase
% The Martian Report de Marina Rose "Mars" Geldard, con adaptaciones
% para fines editoriales.
%
% Autor: Aradenatorix
% 
% Disponible para uso de terceros bajo:
%
% La licencia MIT (https://opensource.org/licenses/MIT)
%
% Última actualización: 22/05/2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Tiqqunazo}[2023 Project Documentation LaTeX class]

% ESTABLECE LAS DIMENSIONES DE LA PÁGINA
\LoadClass[9pt,twoside]{extarticle}
\RequirePackage[%
  papersize={4.25in,5.5in}, % tamaño de papel media carta
  headheight=17pt,          % ajuste del amaño de la cabecera
  top=0.7in,                % mrgen superior
  bottom=0.6255in,          % margen inferior
  left=0.4375in,            % margen izquierdo
  right=0.4375in            % margen derecho
  ]{geometry}

% CARGA DE LOS PAQUETES NECESARIOS
  \RequirePackage{wrapfig2}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
  \RequirePackage[english,spanish,mexico]{babel}
  \RequirePackage[spanish=mexican]{csquotes}
  \RequirePackage{xparse}
  \RequirePackage{markdown}
  \RequirePackage{graphicx}
  \RequirePackage[table]{xcolor}
  \RequirePackage{tocloft}
  \let\oldtableofcontents\tableofcontents
  \renewcommand{\tableofcontents}{
    \clearpage
    \oldtableofcontents
  }
  \RequirePackage{parskip}
  \RequirePackage{fancyhdr}
  \RequirePackage{titlesec}
  \RequirePackage[hidelinks]{hyperref}
  \RequirePackage{xurl}

% CAMBIO DE TIPOGRAFÍAS
\RequirePackage{ebgaramond}
\RequirePackage{inconsolata}

% In the preamble
%\RequirePackage{fontspec}
%\usepackage{fontspec}
%\newfontfamily\titlefont{Inconsolata} % Define a command to switch to Inconsolata

% Use titlesec to apply the font
%\titleformat*{\section}{\large\titlefont}
%\titleformat*{\subsection}{\normalsize\titlefont}
%\titleformat*{\subsubsection}{\small\titlefont}

% INFORMACIÓN DE USUARIO
  \newcommand{\imagefolder}[1]{\def\@imagefolder{#1}}
  \newcommand{\version}[1]{\def\@revision{#1}}
  \newcommand{\project}[1]{\def\@project{#1}}
  \newcommand{\logo}[1]{\def\@logo{#1}}
  \newcommand{\footertext}[2]{\def\@lfooter{#1} \def\@rfooter{#2}}
  \newcommand{\shorttitle}[1]{\def\@shorttitle{#1}} % Comando para definir un título corto
  \newcommand{\nofootertext}{\def\@lfooter{} \def\@rfooter{}}
  \newcommand{\imageref}[1]{\def\@imageref{#1}}

% ESTABLECE VALORES POR DEFECTO EN CASO CONTRARIO
  \title{Documento de prueba}
  \author{~}
  \project{~}
  \imagefolder{.}
  \version{Versi\'on 2.0}
  \def\@lfooter{Plantar Cara}
  \def\@rfooter{\@author}
  \imageref{~}

  % PERSONALIZACIÓN DEL ÍNDICE DE CONTENIDOS
  \renewcommand{\cftdot}{}
  \cftpagenumbersoff{subsection}
  \setcounter{tocdepth}{2}
    \renewcommand{\cftsecpresnum}{\begin{lrbox}{\@tempboxa}}
    \renewcommand{\cftsecaftersnum}{\end{lrbox}}
  \setlength{\cftsecnumwidth}{0pt}
    \renewcommand{\cftsubsecpresnum}{\begin{lrbox}{\@tempboxa}}
    \renewcommand{\cftsubsecaftersnum}{\end{lrbox}}
  \setlength{\cftsubsecnumwidth}{0pt}
  \cftsetindents{subsection}{0em}{0em}

  % CREACIÓN DE LA CARÁTULA
  \AtBeginDocument{\pagestyle{fancyplain}\titlepage%
    \ifsectionnumbers 
      \renewcommand{\thesection}{\arabic{section}}
      \renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
      \renewcommand{\thesubsubsection}{
        \arabic{section}.\arabic{subsection}.\arabic{subsubsection}
      } 
    \else 
      \ifsubsectionnumbers 
        \renewcommand{\thesection}{\kern-1em}
        \renewcommand{\thesubsection}{\arabic{subsection}}
        \renewcommand{\thesubsubsection}{
          \arabic{subsection}.\arabic{subsubsection}
        }
      \else 
        \setcounter{secnumdepth}{0} 
      \fi 
    \fi 
  }
  \renewcommand{\titlepage}{%
    \thispagestyle{title}
    \begin{flushleft}
      {\fontsize{24}{21}\selectfont\textbf{\MakeUppercase{\@title}}\par}
      \Large\@author 
      \vspace{12pt}\linebreak 
      \textbf{\Huge\@project}
      \vspace{9pt}\linebreak 
      \ifdefined\@logo
        \edef\tmp{%
          \noexpand%
          \includegraphics[width=0.3\textwidth]{\@imagefolder/\@logo}%
          }\tmp%
      \fi 
      \linebreak\vfill
    \end{flushleft}
  
    \begin{centering}
      \parbox{0.98\linewidth}{\@starttoc{toc}} 
      \vspace{10pt}\linebreak
    \end{centering}
    \rule{\textwidth}{1pt} 
    \pagebreak 
  }

  % ESTILO DE CABECERA/PIE DE PÁGINA
  \fancypagestyle{title}{%
    \renewcommand{\headrulewidth}{1pt} 
    \fancyhf{}
    \lhead{\rule[-2ex]{0pt}{2ex}\textbf{\@revision}}
    \rhead{\rule[-2ex]{0pt}{2ex}\textbf{\@date}} 
  }

  \renewcommand{\headrulewidth}{0pt}
  \fancyhead[RE,RO]{}
  \fancyhead[LE,LO]{}
  \lfoot{\footnotesize\MakeUppercase\@lfooter}
  \cfoot{\footnotesize\thepage}
  \rfoot{\footnotesize\MakeUppercase\@rfooter}

  % CONFIGURACIÓN DE ESTILO DE CABECERA/PIE DE PÁGINA
  \renewcommand\section{%
    \@startsection{section}{1}{\z@}{0.1ex}{3ex}{\Huge\textbf}%
  }
  \let\oldsection\section
  \RenewDocumentCommand{\section}{s m g o}{%
    \clearpage
    \IfNoValueF{#3}
    {
      \includegraphics[width=\textwidth]{\@imagefolder/#3}
      \linebreak    
    }
    \rule{\textwidth}{1pt}
    \IfBooleanTF{#1}{\oldsection*{#2}}{\oldsection{#2}}%
    \IfNoValueF{#4}{\label{sec:#4}\ifdrafting
                                    \textit{\color{magenta}~Anchor sec:#4}
                                  \fi
                    }
  }

% CONFIGURACIÓN DE ESTILOS DE ENCABEZAMIENTO DE SUBSECCIÓN
\renewcommand\subsection{%
  \@startsection{subsection}{2}{\z@}{2ex}{2ex}{%
    \Large\bfseries\MakeUppercase}%
} 
  \let\oldsubsection\subsection 
  \RenewDocumentCommand{\subsection}{s m o}{%
    \IfBooleanTF{#1}{\oldsubsection*{#2}}{\oldsubsection{#2}}%
    \IfNoValueF{#3}{\label{sub:#3}\ifdrafting
                                    \textit{\color{magenta}~Anchor sub:#3}
                                  \fi
                    }
  }

\renewcommand\subsubsection{%
  \@startsection{subsubsection}{3}{\z@}{2ex}{2ex}{\large\textbf}%
  }
  \let\oldsubsubsection\subsubsection
  \RenewDocumentCommand{\subsubsection}{s m o}{%
    \IfBooleanTF{#1}{\oldsubsubsection*{#2}}{\oldsubsubsection{#2}}%
    \IfNoValueF{#3}{\label{sss:#3}\ifdrafting
                                    \textit{\color{magenta}~Anchor sss:#3}
                                  \fi
                    } 
  }

\newcommand{\subsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \textbf{-- #1}
  \end{flushleft}
}

\newcommand{\subsubsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \textbf{---- #1}
  \end{flushleft}
}

\newcommand{\subsubsubsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \MakeUppercase{#1}
  \end{flushleft}
}

\newcommand{\subsubsubsubsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \MakeUppercase{-- #1}
  \end{flushleft}
}

\newcommand{\subsubsubsubsubsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \MakeUppercase{---- #1}
  \end{flushleft}
}

% OPCIONES DE BOSQUEJO
\newif\ifdrafting 
  \newcommand{\drafting}{%
    \draftingtrue 
  } 
  \newcommand{\temp}[1]{%
    \ifdrafting 
      \textit{\color{blue}#1} 
    \fi 
  }

  \newcommand{\crit}[1]{%
    \ifdrafting 
      \textit{\color{red}#1} 
    \fi 
  }

% CONFIGURACIÓN DEL TEXTO DE HIPERVÍNCULO
\definecolor{linkblue}{RGB}{0,69,217} 
\NewDocumentCommand{\link}{m g}{%
  \IfNoValueTF{#2}{% 
    \href{#1}{\color{linkblue}#1}%
  }
  {%
    \href{#1}{\color{linkblue}#2}%
  }%
}

% CONFIGURACIÓN DE IMÁGENES DE CABECERA DE SECCIÓN
\AtEndDocument{\vfill\textit{\@imageref}}
  \NewDocumentCommand{\image}{m m g}{%
    \begin{figure}[h!]
      \centering
      \includegraphics[width=#1\textwidth]{\@imagefolder/#2}
      \IfNoValueF{#3}{
        \caption{\label{img:#2} #3}
      }
  \end{figure}
}

% APOSTILLAS
\renewcommand{\arraystretch}{1.5} 
\NewDocumentCommand{\tipbox}{s m m}{%
  \IfBooleanTF{#1}{%
    \begin{wrapfigure}{r}{0.33\textwidth}
      \begin{tabular}{|p{0.3\textwidth}|}
        \cellcolor{black}
        \textbf{\textcolor{white}{#2}}\\
        \textit{#3}\\
        \hline
      \end{tabular}
    \end{wrapfigure}
  }{%
    \begin{figure}[h]
      \centering
      \begin{tabular}{|p{0.3\textwidth}|}
        \cellcolor{black}
        \textbf{\textcolor{white}{#2}}\\
        \textit{#3}\\
        \hline
      \end{tabular}
    \end{figure}
  } 
}

% LISTAS BONITAS
\newenvironment{nicelist}[1]{%
  \parnt1em 
  \textbf{#1}
    \begin{itemize}
}
{%
  \end{itemize}%
}
    
% ENUMERACIONES BONITAS
\newenvironment{niceenum}[1]{%
  \parindent1em 
  \textbf{#1}
    \begin{enumerate}
}
{%
  \end{enumerate}%
}

% DESCRIPCIONES BONITAS
\newenvironment{nicedesc}[1]{%
  \parindent1em
  \textbf{#1}
    \begin{description}
}
{%
  \end{description}%
}
    
% OPCIONES DE NUMERACIÓN
\newif\ifsectionnumbers 
\newcommand{\sectionnumbers}{%
  \sectionnumberstrue 
}

\newif\ifsubsectionnumbers 
\newcommand{\subsectionnumbers}{%
  \subsectionnumberstrue 
}

\newif\ifresetnumbering 
\NewDocumentCommand{\resetnumbering}{g g}{%
  \def\@nextsectionnumber{1} 
  \def\@nextpagenumber{1}
  \IfNoValueF{#1}{%
    \if\relax\detokenize{#1}\relax
    % parámetro vacío, no cambiar
    \else 
      \def\@nextsectionnumber{#1} 
    \fi 
  }   
  \IfNoValueF{#2}{%
    \if\relax\detokenize{#2}\relax
    % parámetro vacío, no cambiar
    \else 
      \def\@nextpagenumber{#2} 
    \fi 
  } 
  \resetnumberingtrue 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AYUDA
\newcommand{\printhelp}{%
  \clearpage
  \textbf{\Huge ¡Bienvenido al Tiqqunazo!}\\
  
  \underline{Comandos para antes del \textbackslash begin\{document\}}\\

  \textsc{Sobrescribir o ignorar y obtener estos valores predeterminados:}
  
    \textbf{\textbackslash title\{Documento de prueba\}}
    
    \textbf{\textbackslash author\{\}}
    
    \textbf{\textbackslash project\{\}}
    
    \textbf{\textbackslash imagefolder\{.\}}
    
    \textbf{\textbackslash version\{Version 2.0\}}
    
    \textbf{\textbackslash footertext\{\textbackslash
      @title\}\{\textbackslash @author\}}
    
    \textbf{\textbackslash imageref\{\}}
    
  \textsc{Opcional para definir y cambiar los aspectos visuales:}
  
    \textbf{\textbackslash logo\{logo.png\}} \texttt{\% Pone el logotipo en la
    caratula si se proporciona}
    
    \textbf{\textbackslash nofootertext} \texttt{\% Hace que en el pie de página
    aparezca sólo el número}
    
    \textbf{\textbackslash footertext\{\}\{\}} \texttt{\% Cambia el texto del
    pie de página al texto dado}
  
  \underline{Comandos para el interior del documento}\\
  
  \textsc{Sobreescriben los comandos normales:}
  
    \textbf{\textbackslash section\{Título de la sección\}} \texttt{\%
    Compotamiento predeterminado}
    
    \textbf{\textbackslash section\{Título de la sección\}
    \{nombredeimagen.png\}} \texttt{\% Encuentra la imagen en \textbackslash 
    imagefolder y pone la imagen en la cabecera\\}
  
  \textsc{Mejoras y variantes:}
  
    \textbf{\textbackslash temp\{Texto en azul y cursiva para
    borradores\}} \texttt{\% Sólo se muestra si \textbackslash drafting está en el 
    preámbulo}
    
    \textbf{\textbackslash crit\{Texto en rojo y cursiva para
    borradores\}} \texttt{\% Sólo se muestra si \textbackslash drafting está en el 
    preámbulo}
    
    \textbf{\textbackslash link \{direccióndeenlace.com\}\{Texto a
    mostrar\}} \texttt{\% Igual que href, pero con estilo personalizado. si no se 
    ofrece, el 2º parámetro sustituye al primero (muestra la url como texto 
    clicable)}
    
    \textbf{\textbackslash image\{0.5\}\{nombre\_de\_imagen.png\}%
    \{Parámetro adicional opcional para la leyenda de la figura\}}%
    \texttt{\% El primer parámetro es la anchura de la imagen en formato decimal de % 
    \textbackslash textwidth \& si se proporciona, el 3º parámetro incluirá % 
    el comando \textbackslash label {img:nombre\_de\_imagen.png} para que % 
    pueda remitirse con \textbackslash ref}

    \textbf{\textbackslash begin\{nicelist\}\{Título de la lista\}...
    \textbackslash end\{nicelist\}} \texttt{\% Lo mismo que itemize pero con un 
    título}

    \textbf{\textbackslash begin\{niceenum\}\{Título de Enumeración\}... 
    \textbackslash end\{niceenum\}} \texttt{\% Lo mismo que enumerate pero con un 
    título}

    \textbf{\textbackslash tipbox\{Título del recuadro\}\{El texto que va 
    en el recuadro puede ser tan largo como quieras.\}} \texttt{\% Usa la opción 
    con asterisco para rodear el texto si sabes que después viene un 
    párrafo\\}
  
  ¡A disfrutar!\pagebreak
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

como hago un salto de pagina dentro de este templete que usa el paquete de latex tocloft? Intente lineas 45 a 48 pero no funcionó

En tu plantilla LaTeX, específicamente en el contexto de la redefinición del comando `\tableofcontents` (líneas 45 a 48), intentas hacer un salto de página después de generar el índice de contenidos utilizando `\clearpage`. Sin embargo, al parecer este enfoque no está funcionando como esperas. 

La razón por la que `\clearpage` no está logrando el salto de página deseado podría deberse a cómo se está manejando el entorno de la carátula o cómo LaTeX gestiona los flotantes y otros elementos que podrían estar en espera de ser procesados.

Para asegurarse de que LaTeX efectivamente realice un salto de página después del índice de contenidos, puedes intentar lo siguiente:

1. **Usar `\newpage` en lugar de `\clearpage`**: Aunque `\clearpage` es más fuerte y fuerza a LaTeX a procesar todos los flotantes pendientes antes de cambiar de página, en algunos contextos `\newpage` podría funcionar mejor para tus necesidades específicas. 

2. **Colocar el salto de página fuera de la redefinición de comandos**: En vez de intentar forzar el salto de página dentro de la redefinición del comando `\tableofcontents`, podrías simplemente llamar a `\clearpage` o `\newpage` inmediatamente después de `\tableofcontents` en el cuerpo de tu documento. Esto te da un control más directo y evita posibles conflictos con la redefinición de comandos.

3. **Revisar la secuencia de comandos**: Asegúrate de que no haya ningún otro comando o entorno que esté interfiriendo con el flujo normal de la página. Por ejemplo, entornos de figuras flotantes (`figure`) o tablas (`table`) que no han sido procesados podrían causar comportamientos inesperados.

Si después de ajustar tu plantilla sigues teniendo problemas para conseguir el salto de página deseado después del índice de contenidos, considera revisar la secuencia de tus comandos y la lógica de tu plantilla. Asegúrate de que el comando para generar el índice de contenidos y el comando de salto de página no estén siendo inadvertidamente afectados por otros comandos o entornos definidos en tu plantilla.

Por último, aquí tienes un ejemplo simplificado de cómo forzar un salto de página después del índice de contenidos, aplicable en el cuerpo del documento:

```latex
\tableofcontents
\clearpage % o \newpage si prefieres
```

Este método es directo y evita complicaciones que puedan surgir de la redefinición del comando `\tableofcontents` dentro de tu plantilla.

con base en este archivo, como puedo hacer un salto de pagina si rebasa el tamaño del footer? Explica explicitamente y añade referencias de como funcionan todas estas secciones de latex
https://mirrors.mit.edu/CTAN/macros/latex/contrib/tocloft/tocloft.pdf

Hacer un salto de página automático en LaTeX cuando el contenido rebasa el tamaño del pie de página (footer) implica comprender cómo LaTeX maneja la salida de la página y cómo se pueden ajustar los márgenes y espaciado para evitar la sobreimpresión del contenido en el footer. Sin embargo, LaTeX generalmente no proporciona una manera directa de "detectar" cuándo el contenido va a sobrepasar el espacio antes del footer para luego insertar un salto de página. En su lugar, debes configurar adecuadamente los márgenes de la página y la altura del footer para evitar estos problemas.

### Entendiendo las Secciones Relacionadas

1. **Geometría de la Página**: El paquete `geometry` es crucial para definir los márgenes de la página, incluido el espacio para el header y el footer. Configurarlo correctamente puede prevenir que el contenido se extienda hasta el footer.

   ```latex
   \usepackage[
     top=3cm,
     bottom=3cm,
     left=3cm,
     right=3cm,
     headheight=17pt, % Ajuste para el encabezado
     includeheadfoot % Incluye el header y footer en los cálculos de la geometría de la página
   ]{geometry}
   ```

2. **Control del Espacio del Footer**: La distancia entre el texto y el footer se controla mediante `\footskip`. Ajustar este valor puede ayudar a asegurar un espacio adecuado para el footer:

   ```latex
   \setlength{\footskip}{1.5cm}
   ```

3. **El Paquete `fancyhdr`**: Se utiliza para definir y personalizar los encabezados y pies de página. Asegúrate de definir correctamente la altura del encabezado (`\headheight`) y el espacio para el pie de página (`\footskip`).

   ```latex
   \usepackage{fancyhdr}
   \pagestyle{fancy}
   \fancyhf{}
   \lhead{Encabezado Izquierdo}
   \rfoot{Página \thepage}
   ```

4. **Manejo de Contenido Flotante**: Asegúrate de que las figuras, tablas y otros elementos flotantes se coloquen correctamente para evitar que empujen el contenido hacia el footer. Usar `[h!]`, `[t!]`, `[b!]`, etc., ayuda a controlar la posición de estos elementos.

5. **Uso de `\clearpage` o `\newpage`**: Estos comandos fuerzan un salto de página. Aunque no detectan automáticamente cuando el contenido rebasa el tamaño del footer, pueden ser útiles al final de secciones o capítulos para empezar una nueva página.

### Referencias y Documentación

- **CTAN - tocloft**: El paquete `tocloft` se utiliza para personalizar la Tabla de Contenidos, Lista de Figuras y Lista de Tablas. La documentación oficial en [CTAN tocloft](https://mirrors.mit.edu/CTAN/macros/latex/contrib/tocloft/tocloft.pdf) ofrece una guía completa sobre cómo modificar estos elementos, pero no sobre el control automático de saltos de página relacionados con el tamaño del footer.

- **CTAN - fancyhdr**: Para detalles específicos sobre cómo personalizar encabezados y pies de página, revisa la documentación de `fancyhdr` en [CTAN fancyhdr](https://ctan.org/pkg/fancyhdr). Este paquete ofrece flexibilidad en la definición del estilo de las páginas.

- **CTAN - geometry**: El paquete `geometry` permite una configuración detallada de los márgenes y el layout de la página. La documentación en [CTAN geometry](https://ctan.org/pkg/geometry) provee una guía sobre cómo ajustar estos aspectos.

### Conclusión

La clave para evitar que el contenido se extienda en el espacio del footer es una configuración adecuada de los márgenes, el uso correcto del espacio del footer, y la gestión cuidadosa de los elementos flotantes. LaTeX no proporciona un mecanismo automático para insertar saltos de página basados en la proximidad al footer, pero una planificación cuidadosa del diseño de la página y la estructuración del documento puede prevenir la mayoría de los problemas relacionados.

No funciono. Revisa tambien esto
\documentclass{Tiqqunazo}
\usepackage{lipsum}
\graphicspath{{images/}}
\usepackage[backend=biber,style=numeric,autocite=footnote]{biblatex}
\addbibresource{plantar.bib}
\usepackage[colorinlistoftodos,textsize=scriptsize,spanish]{todonotes}
\newcommand{\didit}[1]{\todo[color=red!40]{#1}} % Indica que esta parte ya está concluida
\newcommand{\revquotes}[1]{\todo[color=red!95]{Homologar criterio de uso de las comillas.}}
\newcommand{\addref}[1]{\todo[color=red!90]{[Cita requerida, #1]}} % Indica que hace falta una cita
\newcommand{\rewrite}[1]{\todo[color=green!40]{#1}} % Nota para comentar que hay que reescribir algo
\newcommand{\revstyle}[1]{\todo[color=cyan!40]{#1}} % Indica que requiere un ajuste de estilo

%%%%%%%%%%%%%%%%%%%%%% VALORES DE LA CARÁTULA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\title{Lee Esto para Hacer un Cambio Real} % Cambia el título del documento
\author{La Partida} % Cambia el nombre del autor
%\project{Plantar cara al pasado para imaginar el futuro} % Cambia (u omite) el nombre del proyecto
%\date{} % Cambia el valor de la fecha mostrada por defecto
%\imagefolder{./imagenes} % Cambia de carpeta para buscar imágenes
%\logo{} % Añade la imagen del logotipo a la portada
\version{Versión 1.0} % Cambia el número de versión

%%%%%%%%%%%%%%%%%%%%%%% AJUSTES GENERALES %%%%%%%%%%%%%%%%%%%%%%%
%\footertext{}{} % Cambia los valores del texto del pie de página
%\nofootertext % Oculta el texto del pie de página.
%\imageref{} % Referencia de dónde proceden las imágenes de cabecera si
             % las hay (aparecen en la última página como nota a pie de
             % página).
%\drafting % Comentario para ocultar las secciones \temp y \crit
%\sectionnumbers % Las secciones son números mayores, las subsecciones
                 % menores, etc.
%\subsectionnumbers % Secciones no numeradas, sólo comienzan en las
                    % subsecciones e inferiores.
\setcounter{tocdepth}{1} % Establece la profundidad del índice en portada.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\begin{document}

\part{Plantar cara al pasado para imaginar el porvenir}

\begin{verse}
    Por dentro, la alarma

    suena para nosotras.
    
    La ecocatástrofe nos consume
    
    se manifiesta
    
    en los ojos.
    

    La alarma afuera

    la sombra que nos cubre

    posibilita.


    Reconocer

    que me habita

    en ti también.

    
    Ser nosotras
    \end{verse}
    
    \bigskip
    \begin{quote}
        \hspace{1cm}
        cultivar
        \hspace{1cm}
        la palabra
        \hspace{1cm}
        revolución.
    \end{quote}

\include{1-plantar-cara/00-prologue}
\include{1-plantar-cara/01-manifest}
\include{1-plantar-cara/02-about-the-party}
\include{1-plantar-cara/03-institutional-struggle}
\include{1-plantar-cara/04-our-intuitions}
\include{1-plantar-cara/05-know-to-do}
\include{1-plantar-cara/06-lefts-right}
\include{1-plantar-cara/07-some-warnings}

\part{Lee esto para hacer un cambio real}
\include{2-lephucr/01b-intro}
\include{2-lephucr/02-cap1}
\include{2-lephucr/03-cap2}
\include{2-lephucr/04-cap3}
\include{2-lephucr/05-cap4}
\include{2-lephucr/06-cap5}

\cite{*}
\printbibliography
%\printhelp % Úsalo para ver/imprimir las páginas de ayuda
\end{document}

Entiendo que quieres solucionar el problema de realizar un salto de página automático cuando el contenido se acerca demasiado al footer en tu documento LaTeX, especialmente utilizando la clase `Tiqqunazo` que has definido. Además, quieres una explicación sobre cómo funcionan algunas secciones clave en LaTeX. Vamos a abordar estos puntos:

### Salto de Página Automático Antes del Footer

LaTeX gestiona el flujo del contenido y la colocación de los elementos en la página de manera automática, incluyendo la distribución de texto, figuras, tablas, y otros elementos. El espacio entre el contenido principal y el footer se define a través de los parámetros de geometría de la página (`\geometry`), y el salto de página se maneja automáticamente cuando el contenido llena una página.

Sin embargo, no hay un mecanismo directo en LaTeX para "detectar" cuándo el contenido está a punto de sobrepasar un límite específico como el inicio del footer y luego insertar un salto de página basado en esa condición. En cambio, los autores deben utilizar comandos como `\newpage` o `\clearpage` para forzar saltos de página cuando sea necesario, o ajustar los márgenes y espaciados adecuadamente para asegurar que el contenido no invada el espacio del footer.

Si te encuentras en una situación en la que el contenido regularmente se extiende en el espacio del footer, considera revisar y ajustar los siguientes aspectos:

- **Márgenes y Espaciado**: Usa el paquete `geometry` para definir adecuadamente los márgenes de la página, y considera ajustar `\footskip` para aumentar el espacio entre el contenido y el footer.

- **Gestión de Elementos Flotantes**: Asegúrate de que figuras y tablas se colocan de manera que no empujen contenido no deseado al footer. Los modificadores de posición `[htbp]` pueden ser útiles aquí.

### Explicación de Secciones Clave en LaTeX

- **Document Class (`\documentclass`)**: Define el tipo de documento y establece la base para el formato del documento. La clase `Tiqqunazo` que has creado personaliza aspectos específicos del formato basándose en tus necesidades.

- **Paquetes (`\usepackage{}`)**: Los paquetes expanden la funcionalidad de LaTeX, permitiéndote añadir características como gráficos, colores, y mejor manejo de referencias bibliográficas.

- **Macros Personalizadas (`\newcommand{\comando}[params]{definición}`)**: Te permiten definir nuevos comandos para simplificar tareas repetitivas o para introducir nuevos elementos formativos en tu documento.

- **Ambientes (`\begin{ambiente} ... \end{ambiente}`)**: Los ambientes en LaTeX son bloques que aplican un comportamiento o formato específico al contenido que encierran. Por ejemplo, `quote` para citas o `figure` para figuras.

- **Compilación y Bibliografía**: Utilizar `biblatex` y `biber` para la gestión de bibliografías te permite añadir referencias y citarlas dentro de tu documento de manera eficiente.

- **Comentarios y Notas (`\todo` con `todonotes`)**: Facilitan la revisión y colaboración en el documento, permitiéndote añadir notas sobre trabajo pendiente o cambios necesarios.

En general, para manejar el problema de contenido que sobrepasa el espacio antes del footer, te recomendaría revisar la configuración de los márgenes y el espaciado, y ser proactivo(a) en el uso de saltos de página donde sea necesario. La automatización de este proceso sería limitada y requeriría un conocimiento profundo de TeX a bajo nivel, lo cual generalmente no es práctico para la mayoría de los documentos.

confirm you read this

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tiqqunazo
%
% Una clase de LaTeX personalizada basada en la clase extarticle,
%
% Fuertemente inspirada en el blog en español de Tiqqun y por la clase
% The Martian Report de Marina Rose "Mars" Geldard, con adaptaciones
% para fines editoriales.
%
% Autor: Aradenatorix
% 
% Disponible para uso de terceros bajo:
%
% La licencia MIT (https://opensource.org/licenses/MIT)
%
% Última actualización: 22/05/2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Tiqqunazo}[2023 Project Documentation LaTeX class]

% ESTABLECE LAS DIMENSIONES DE LA PÁGINA
\LoadClass[9pt,twoside]{extarticle}
\RequirePackage[%
  papersize={4.25in,5.5in}, % tamaño de papel media carta
  % headheight=14pt,          % ajuste del tamaño de la cabecera
  top=0.7in,                % mrgen superior
  bottom=0.6255in,          % margen inferior
  left=0.4375in,            % margen izquierdo
  right=0.4375in,            % margen derecho
  includeheadfoot % Incluye el header y footer en los cálculos de la geometría de la página
  ]{geometry}

% CARGA DE LOS PAQUETES NECESARIOS
  \RequirePackage{wrapfig2}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
  \RequirePackage[english,spanish,mexico]{babel}
  \RequirePackage[spanish=mexican]{csquotes}
  \RequirePackage{xparse}
  \RequirePackage{markdown}
  \RequirePackage{graphicx}
  \RequirePackage[table]{xcolor}
  \RequirePackage{tocloft}
  \let\oldtableofcontents\tableofcontents
  \renewcommand{\tableofcontents}{
    \newpage
    \oldtableofcontents
  }
  \RequirePackage{parskip}
  \RequirePackage{fancyhdr}
  \RequirePackage{titlesec}
  \RequirePackage[hidelinks]{hyperref}
  \RequirePackage{xurl}

% CAMBIO DE TIPOGRAFÍAS
\RequirePackage{ebgaramond}
\RequirePackage{inconsolata}

% In the preamble
%\RequirePackage{fontspec}
%\usepackage{fontspec}
%\newfontfamily\titlefont{Inconsolata} % Define a command to switch to Inconsolata

% Use titlesec to apply the font
%\titleformat*{\section}{\large\titlefont}
%\titleformat*{\subsection}{\normalsize\titlefont}
%\titleformat*{\subsubsection}{\small\titlefont}

% INFORMACIÓN DE USUARIO
  \newcommand{\imagefolder}[1]{\def\@imagefolder{#1}}
  \newcommand{\version}[1]{\def\@revision{#1}}
  \newcommand{\project}[1]{\def\@project{#1}}
  \newcommand{\logo}[1]{\def\@logo{#1}}
  \newcommand{\footertext}[2]{\def\@lfooter{#1} \def\@rfooter{#2}}
  \newcommand{\shorttitle}[1]{\def\@shorttitle{#1}} % Comando para definir un título corto
  \newcommand{\nofootertext}{\def\@lfooter{} \def\@rfooter{}}
  \newcommand{\imageref}[1]{\def\@imageref{#1}}

% ESTABLECE VALORES POR DEFECTO EN CASO CONTRARIO
  \title{Documento de prueba}
  \author{~}
  \project{~}
  \imagefolder{.}
  \version{Versi\'on 2.0}
  \def\@lfooter{Plantar Cara}
  \def\@rfooter{\@author}
  \imageref{~}

  % PERSONALIZACIÓN DEL ÍNDICE DE CONTENIDOS
  \renewcommand{\cftdot}{}
  \cftpagenumbersoff{subsection}
  \setcounter{tocdepth}{2}
    \renewcommand{\cftsecpresnum}{\begin{lrbox}{\@tempboxa}}
    \renewcommand{\cftsecaftersnum}{\end{lrbox}}
  \setlength{\cftsecnumwidth}{0pt}
    \renewcommand{\cftsubsecpresnum}{\begin{lrbox}{\@tempboxa}}
    \renewcommand{\cftsubsecaftersnum}{\end{lrbox}}
  \setlength{\cftsubsecnumwidth}{0pt}
  \cftsetindents{subsection}{0em}{0em}

  % CREACIÓN DE LA CARÁTULA
  \AtBeginDocument{\pagestyle{fancyplain}\titlepage%
    \ifsectionnumbers 
      \renewcommand{\thesection}{\arabic{section}}
      \renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
      \renewcommand{\thesubsubsection}{
        \arabic{section}.\arabic{subsection}.\arabic{subsubsection}
      } 
    \else 
      \ifsubsectionnumbers 
        \renewcommand{\thesection}{\kern-1em}
        \renewcommand{\thesubsection}{\arabic{subsection}}
        \renewcommand{\thesubsubsection}{
          \arabic{subsection}.\arabic{subsubsection}
        }
      \else 
        \setcounter{secnumdepth}{0} 
      \fi 
    \fi 
  }
  \renewcommand{\titlepage}{%
    \thispagestyle{title}
    \begin{flushleft}
      {\fontsize{24}{21}\selectfont\textbf{\MakeUppercase{\@title}}\par}
      \Large\@author 
      \vspace{12pt}\linebreak 
      \textbf{\Huge\@project}
      \vspace{9pt}\linebreak 
      \ifdefined\@logo
        \edef\tmp{%
          \noexpand%
          \includegraphics[width=0.3\textwidth]{\@imagefolder/\@logo}%
          }\tmp%
      \fi 
      \linebreak\vfill
    \end{flushleft}
  
    \begin{centering}
      \parbox{0.98\linewidth}{\@starttoc{toc}} 
      \vspace{10pt}\linebreak
    \end{centering}
    \rule{\textwidth}{1pt} 
    \pagebreak 
  }

  % ESTILO DE CABECERA/PIE DE PÁGINA
  \fancypagestyle{title}{%
    \renewcommand{\headrulewidth}{1pt} 
    \fancyhf{}
    \lhead{\rule[-2ex]{0pt}{2ex}\textbf{\@revision}}
    \rhead{\rule[-2ex]{0pt}{2ex}\textbf{\@date}} 
  }

  \renewcommand{\headrulewidth}{0pt}
  \fancyhead[RE,RO]{}
  \fancyhead[LE,LO]{}
  \lfoot{\footnotesize\MakeUppercase\@lfooter}
  \cfoot{\footnotesize\thepage}
  \rfoot{\footnotesize\MakeUppercase\@rfooter}

  % CONFIGURACIÓN DE ESTILO DE CABECERA/PIE DE PÁGINA
  \renewcommand\section{%
    \@startsection{section}{1}{\z@}{0.1ex}{3ex}{\Huge\textbf}%
  }
  \let\oldsection\section
  \RenewDocumentCommand{\section}{s m g o}{%
    \clearpage
    \IfNoValueF{#3}
    {
      \includegraphics[width=\textwidth]{\@imagefolder/#3}
      \linebreak    
    }
    \rule{\textwidth}{1pt}
    \IfBooleanTF{#1}{\oldsection*{#2}}{\oldsection{#2}}%
    \IfNoValueF{#4}{\label{sec:#4}\ifdrafting
                                    \textit{\color{magenta}~Anchor sec:#4}
                                  \fi
                    }
  }

% CONFIGURACIÓN DE ESTILOS DE ENCABEZAMIENTO DE SUBSECCIÓN
\renewcommand\subsection{%
  \@startsection{subsection}{2}{\z@}{2ex}{2ex}{%
    \Large\bfseries\MakeUppercase}%
} 
  \let\oldsubsection\subsection 
  \RenewDocumentCommand{\subsection}{s m o}{%
    \IfBooleanTF{#1}{\oldsubsection*{#2}}{\oldsubsection{#2}}%
    \IfNoValueF{#3}{\label{sub:#3}\ifdrafting
                                    \textit{\color{magenta}~Anchor sub:#3}
                                  \fi
                    }
  }

\renewcommand\subsubsection{%
  \@startsection{subsubsection}{3}{\z@}{2ex}{2ex}{\large\textbf}%
  }
  \let\oldsubsubsection\subsubsection
  \RenewDocumentCommand{\subsubsection}{s m o}{%
    \IfBooleanTF{#1}{\oldsubsubsection*{#2}}{\oldsubsubsection{#2}}%
    \IfNoValueF{#3}{\label{sss:#3}\ifdrafting
                                    \textit{\color{magenta}~Anchor sss:#3}
                                  \fi
                    } 
  }

\newcommand{\subsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \textbf{-- #1}
  \end{flushleft}
}

\newcommand{\subsubsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \textbf{---- #1}
  \end{flushleft}
}

\newcommand{\subsubsubsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \MakeUppercase{#1}
  \end{flushleft}
}

\newcommand{\subsubsubsubsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \MakeUppercase{-- #1}
  \end{flushleft}
}

\newcommand{\subsubsubsubsubsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \MakeUppercase{---- #1}
  \end{flushleft}
}

% OPCIONES DE BOSQUEJO
\newif\ifdrafting 
  \newcommand{\drafting}{%
    \draftingtrue 
  } 
  \newcommand{\temp}[1]{%
    \ifdrafting 
      \textit{\color{blue}#1} 
    \fi 
  }

  \newcommand{\crit}[1]{%
    \ifdrafting 
      \textit{\color{red}#1} 
    \fi 
  }

% CONFIGURACIÓN DEL TEXTO DE HIPERVÍNCULO
\definecolor{linkblue}{RGB}{0,69,217} 
\NewDocumentCommand{\link}{m g}{%
  \IfNoValueTF{#2}{% 
    \href{#1}{\color{linkblue}#1}%
  }
  {%
    \href{#1}{\color{linkblue}#2}%
  }%
}

% CONFIGURACIÓN DE IMÁGENES DE CABECERA DE SECCIÓN
\AtEndDocument{\vfill\textit{\@imageref}}
  \NewDocumentCommand{\image}{m m g}{%
    \begin{figure}[h!]
      \centering
      \includegraphics[width=#1\textwidth]{\@imagefolder/#2}
      \IfNoValueF{#3}{
        \caption{\label{img:#2} #3}
      }
  \end{figure}
}

% APOSTILLAS
\renewcommand{\arraystretch}{1.5} 
\NewDocumentCommand{\tipbox}{s m m}{%
  \IfBooleanTF{#1}{%
    \begin{wrapfigure}{r}{0.33\textwidth}
      \begin{tabular}{|p{0.3\textwidth}|}
        \cellcolor{black}
        \textbf{\textcolor{white}{#2}}\\
        \textit{#3}\\
        \hline
      \end{tabular}
    \end{wrapfigure}
  }{%
    \begin{figure}[h]
      \centering
      \begin{tabular}{|p{0.3\textwidth}|}
        \cellcolor{black}
        \textbf{\textcolor{white}{#2}}\\
        \textit{#3}\\
        \hline
      \end{tabular}
    \end{figure}
  } 
}

% LISTAS BONITAS
\newenvironment{nicelist}[1]{%
  \parnt1em 
  \textbf{#1}
    \begin{itemize}
}
{%
  \end{itemize}%
}
    
% ENUMERACIONES BONITAS
\newenvironment{niceenum}[1]{%
  \parindent1em 
  \textbf{#1}
    \begin{enumerate}
}
{%
  \end{enumerate}%
}

% DESCRIPCIONES BONITAS
\newenvironment{nicedesc}[1]{%
  \parindent1em
  \textbf{#1}
    \begin{description}
}
{%
  \end{description}%
}
    
% OPCIONES DE NUMERACIÓN
\newif\ifsectionnumbers 
\newcommand{\sectionnumbers}{%
  \sectionnumberstrue 
}

\newif\ifsubsectionnumbers 
\newcommand{\subsectionnumbers}{%
  \subsectionnumberstrue 
}

\newif\ifresetnumbering 
\NewDocumentCommand{\resetnumbering}{g g}{%
  \def\@nextsectionnumber{1} 
  \def\@nextpagenumber{1}
  \IfNoValueF{#1}{%
    \if\relax\detokenize{#1}\relax
    % parámetro vacío, no cambiar
    \else 
      \def\@nextsectionnumber{#1} 
    \fi 
  }   
  \IfNoValueF{#2}{%
    \if\relax\detokenize{#2}\relax
    % parámetro vacío, no cambiar
    \else 
      \def\@nextpagenumber{#2} 
    \fi 
  } 
  \resetnumberingtrue 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AYUDA
\newcommand{\printhelp}{%
  \clearpage
  \textbf{\Huge ¡Bienvenido al Tiqqunazo!}\\
  
  \underline{Comandos para antes del \textbackslash begin\{document\}}\\

  \textsc{Sobrescribir o ignorar y obtener estos valores predeterminados:}
  
    \textbf{\textbackslash title\{Documento de prueba\}}
    
    \textbf{\textbackslash author\{\}}
    
    \textbf{\textbackslash project\{\}}
    
    \textbf{\textbackslash imagefolder\{.\}}
    
    \textbf{\textbackslash version\{Version 2.0\}}
    
    \textbf{\textbackslash footertext\{\textbackslash
      @title\}\{\textbackslash @author\}}
    
    \textbf{\textbackslash imageref\{\}}
    
  \textsc{Opcional para definir y cambiar los aspectos visuales:}
  
    \textbf{\textbackslash logo\{logo.png\}} \texttt{\% Pone el logotipo en la
    caratula si se proporciona}
    
    \textbf{\textbackslash nofootertext} \texttt{\% Hace que en el pie de página
    aparezca sólo el número}
    
    \textbf{\textbackslash footertext\{\}\{\}} \texttt{\% Cambia el texto del
    pie de página al texto dado}
  
  \underline{Comandos para el interior del documento}\\
  
  \textsc{Sobreescriben los comandos normales:}
  
    \textbf{\textbackslash section\{Título de la sección\}} \texttt{\%
    Compotamiento predeterminado}
    
    \textbf{\textbackslash section\{Título de la sección\}
    \{nombredeimagen.png\}} \texttt{\% Encuentra la imagen en \textbackslash 
    imagefolder y pone la imagen en la cabecera\\}
  
  \textsc{Mejoras y variantes:}
  
    \textbf{\textbackslash temp\{Texto en azul y cursiva para
    borradores\}} \texttt{\% Sólo se muestra si \textbackslash drafting está en el 
    preámbulo}
    
    \textbf{\textbackslash crit\{Texto en rojo y cursiva para
    borradores\}} \texttt{\% Sólo se muestra si \textbackslash drafting está en el 
    preámbulo}
    
    \textbf{\textbackslash link \{direccióndeenlace.com\}\{Texto a
    mostrar\}} \texttt{\% Igual que href, pero con estilo personalizado. si no se 
    ofrece, el 2º parámetro sustituye al primero (muestra la url como texto 
    clicable)}
    
    \textbf{\textbackslash image\{0.5\}\{nombre\_de\_imagen.png\}%
    \{Parámetro adicional opcional para la leyenda de la figura\}}%
    \texttt{\% El primer parámetro es la anchura de la imagen en formato decimal de % 
    \textbackslash textwidth \& si se proporciona, el 3º parámetro incluirá % 
    el comando \textbackslash label {img:nombre\_de\_imagen.png} para que % 
    pueda remitirse con \textbackslash ref}

    \textbf{\textbackslash begin\{nicelist\}\{Título de la lista\}...
    \textbackslash end\{nicelist\}} \texttt{\% Lo mismo que itemize pero con un 
    título}

    \textbf{\textbackslash begin\{niceenum\}\{Título de Enumeración\}... 
    \textbackslash end\{niceenum\}} \texttt{\% Lo mismo que enumerate pero con un 
    título}

    \textbf{\textbackslash tipbox\{Título del recuadro\}\{El texto que va 
    en el recuadro puede ser tan largo como quieras.\}} \texttt{\% Usa la opción 
    con asterisco para rodear el texto si sabes que después viene un 
    párrafo\\}
  
  ¡A disfrutar!\pagebreak
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Gracias por proporcionar el detalle completo de la clase `Tiqqunazo`. He revisado la información que me has proporcionado. Basado en esto, puedo ofrecerte una guía más específica sobre cómo lidiar con el problema de los saltos de página en relación al contenido y el footer en tus documentos LaTeX que utilizan esta clase personalizada.

### Sobre los Saltos de Página Automáticos

En la clase `Tiqqunazo`, el manejo del layout y los elementos del documento, incluyendo márgenes, cabeceras, pies de página, y saltos de página, se define mediante el uso de varios paquetes como `geometry`, `fancyhdr`, y `titlesec`. Estos paquetes proporcionan una gran flexibilidad para personalizar el aspecto del documento, pero también requieren que configures correctamente los parámetros para asegurar que el contenido no invada el espacio reservado para el footer.

Para controlar mejor el espacio entre el contenido y el footer, puedes asegurarte de que la opción `includeheadfoot` en la configuración del paquete `geometry` está activada (lo cual ya está hecho en tu clase), y ajustar el valor de `\footskip` si es necesario, aunque esto no se hace explícitamente en tu clase como está. El valor de `\footskip` controla el espacio entre el final del texto y la línea base del footer, lo cual puede ayudar a prevenir que el contenido se extienda demasiado cerca o dentro del espacio del footer.

Si encuentras que el contenido específico constantemente amenaza con invadir el espacio del footer, considera introducir saltos de página manualmente usando `\clearpage` o `\newpage` en puntos estratégicos de tu documento. Este enfoque requiere que tú, como autor, tomes decisiones sobre dónde es más apropiado insertar estos saltos de página, basado en el flujo y la estructura de tu contenido.

### Ajustes a Considerar

- **Ajuste de `\footskip`**: Si decides que necesitas más espacio entre el contenido y el footer, podrías añadir un comando para ajustar `\footskip` en tu clase `Tiqqunazo`. Esto se haría con algo como:

  ```latex
  \setlength{\footskip}{2cm} % Ajusta este valor según necesites
  ```

- **Uso Estratégico de `\clearpage` o `\newpage`**: Al organizar tu documento, usa `\clearpage` o `\newpage` para asegurarte de que el contenido que se aproxima al final de una página no invada el espacio del footer. Por ejemplo, si una sección es particularmente larga, podrías querer comenzar una nueva sección en una nueva página.

### Conclusión

La clase `Tiqqunazo` ya establece un marco sólido para la creación de documentos con estilo personalizado en LaTeX. Controlar el espacio alrededor del footer implica un balance entre la configuración automática proporcionada por paquetes como `geometry` y decisiones editoriales manuales sobre el flujo del contenido. El ajuste fino de parámetros como `\footskip` y el uso juicioso de `\clearpage` o `\newpage` pueden ayudarte a manejar el espacio del documento de manera efectiva, evitando que el contenido y el footer entren en conflicto.

Lee esto y solo responde confirmo si ya leiste este otro file Main.tex

\documentclass{Tiqqunazo}
\usepackage{lipsum}
\usepackage{layout}

\graphicspath{{images/}}
\usepackage[backend=biber,style=numeric,autocite=footnote]{biblatex}
\addbibresource{plantar.bib}
\usepackage[colorinlistoftodos,textsize=scriptsize,spanish]{todonotes}
\newcommand{\didit}[1]{\todo[color=red!40]{#1}} % Indica que esta parte ya está concluida
\newcommand{\revquotes}[1]{\todo[color=red!95]{Homologar criterio de uso de las comillas.}}
\newcommand{\addref}[1]{\todo[color=red!90]{[Cita requerida, #1]}} % Indica que hace falta una cita
\newcommand{\rewrite}[1]{\todo[color=green!40]{#1}} % Nota para comentar que hay que reescribir algo
\newcommand{\revstyle}[1]{\todo[color=cyan!40]{#1}} % Indica que requiere un ajuste de estilo

%%%%%%%%%%%%%%%%%%%%%% VALORES DE LA CARÁTULA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\title{Lee Esto para Hacer un Cambio Real} % Cambia el título del documento
\author{La Partida} % Cambia el nombre del autor
%\project{Plantar cara al pasado para imaginar el futuro} % Cambia (u omite) el nombre del proyecto
%\date{} % Cambia el valor de la fecha mostrada por defecto
%\imagefolder{./imagenes} % Cambia de carpeta para buscar imágenes
%\logo{} % Añade la imagen del logotipo a la portada
\version{Versión 1.0} % Cambia el número de versión

%%%%%%%%%%%%%%%%%%%%%%% AJUSTES GENERALES %%%%%%%%%%%%%%%%%%%%%%%
%\footertext{}{} % Cambia los valores del texto del pie de página
%\nofootertext % Oculta el texto del pie de página.
%\imageref{} % Referencia de dónde proceden las imágenes de cabecera si
             % las hay (aparecen en la última página como nota a pie de
             % página).
%\drafting % Comentario para ocultar las secciones \temp y \crit
%\sectionnumbers % Las secciones son números mayores, las subsecciones
                 % menores, etc.
%\subsectionnumbers % Secciones no numeradas, sólo comienzan en las
                    % subsecciones e inferiores.
\setcounter{tocdepth}{1} % Establece la profundidad del índice en portada.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\begin{document}
\layout
\part{Plantar cara al pasado para imaginar el porvenir}

\begin{verse}
    Por dentro, la alarma

    suena para nosotras.
    
    La ecocatástrofe nos consume
    
    se manifiesta
    
    en los ojos.
    

    La alarma afuera

    la sombra que nos cubre

    posibilita.


    Reconocer

    que me habita

    en ti también.

    
    Ser nosotras
    \end{verse}
    
    \bigskip
    \begin{quote}
        \hspace{1cm}
        cultivar
        \hspace{1cm}
        la palabra
        \hspace{1cm}
        revolución.
    \end{quote}

\include{1-plantar-cara/00-prologue}
\include{1-plantar-cara/01-manifest}
\include{1-plantar-cara/02-about-the-party}
\include{1-plantar-cara/03-institutional-struggle}
\include{1-plantar-cara/04-our-intuitions}
\include{1-plantar-cara/05-know-to-do}
\include{1-plantar-cara/06-lefts-right}
\include{1-plantar-cara/07-some-warnings}

\part{Lee esto para hacer un cambio real}
\include{2-lephucr/01b-intro}
\include{2-lephucr/02-cap1}
\include{2-lephucr/03-cap2}
\include{2-lephucr/04-cap3}
\include{2-lephucr/05-cap4}
\include{2-lephucr/06-cap5}

\cite{*}
\printbibliography
%\printhelp % Úsalo para ver/imprimir las páginas de ayuda
\layout*
\end{document}

Confirmo.

con base en esos dos files explica los paquetes usados y dime donde especificamente implemento \footskip para probar eso. Tambien me di cuenta que al dar lualatex no esta quitando los 14 pts de headheight

Con base en los dos archivos proporcionados, a continuación, te detallo los paquetes usados en tu documento LaTeX y dónde podrías implementar `\footskip`. Además, abordaré la cuestión del `headheight` que no se está ajustando como esperabas al compilar con LuaLaTeX.

### Paquetes Usados

1. **lipsum**: Utilizado para generar texto de relleno en documentos. Es útil para pruebas de formato y diseño.

2. **layout**: Muestra un diagrama de la página actual que muestra los valores de los parámetros de diseño de la página. Útil para depurar problemas de layout.

3. **biblatex**: Un paquete avanzado para la gestión bibliográfica en LaTeX. Permite la flexibilidad en la forma de citar y listar referencias.

4. **todonotes**: Permite añadir notas de "todo" (tareas pendientes) en el margen del documento, muy útil para la revisión y anotación de documentos durante la fase de redacción.

5. **Tiqqunazo**: Una clase personalizada basada en la clase `extarticle`, adaptada con características específicas para propósitos editoriales, inspirada en el blog de Tiqqun y la clase "The Martian Report".

### Implementación de `\footskip`

Para ajustar el espacio de `\footskip`, que controla la distancia entre el final del contenido del texto y el inicio del pie de página, puedes agregar o modificar este parámetro en la configuración del paquete `geometry` en tu archivo de clase `Tiqqunazo`. Basado en el fragmento que compartiste, la implementación de `geometry` ya incluye varias opciones, pero puedes añadir `\footskip` directamente ahí para ajustar el espacio según sea necesario.

Por ejemplo, si quieres establecer `\footskip` a 20pt, modificarías la sección correspondiente en tu archivo de clase `Tiqqunazo` de la siguiente manera:

```latex
\RequirePackage[%
  papersize={4.25in,5.5in}, % tamaño de papel media carta
  top=0.7in,                % margen superior
  bottom=0.6255in,          % margen inferior
  left=0.4375in,            % margen izquierdo
  right=0.4375in,           % margen derecho
  includeheadfoot,          % Incluye el header y footer en los cálculos de la geometría de la página
  headheight=17pt,          % ajuste del tamaño de la cabecera (ajustable según necesidad)
  footskip=20pt             % AJUSTE DE FOOTSKIP AQUÍ
]{geometry}
```

### Ajuste de `headheight` con LuaLaTeX

Si al compilar con LuaLaTeX el `headheight` no se está ajustando a 14pt como esperabas, y quieres asegurarte de que se aplique este valor, verifica primero en tu clase personalizada `Tiqqunazo` si el valor de `headheight` se establece explícitamente como se muestra en el ejemplo anterior. Si la compilación no refleja este cambio, puede ser útil asegurarse de que no haya ningún conflicto o sobreescritura de esta configuración más adelante en el preámbulo de tu documento `.tex` o en otro lugar dentro de la clase `Tiqqunazo`.

Si el problema persiste incluso después de asegurarte de que la configuración es correcta, considera crear un pequeño ejemplo mínimo que reproduzca el problema y compilarlo nuevamente para verificar si el problema es específico de tu configuración actual o si podría estar relacionado con una cuestión más amplia de compatibilidad o configuración de paquetes.

Donde puedo encontrar los mejores tutoriales de latex? 



Para aprender LaTeX y mejorar tus habilidades, hay una gran cantidad de recursos disponibles en línea, desde tutoriales para principiantes hasta documentación avanzada para usuarios más experimentados. Aquí te dejo algunas recomendaciones sobre dónde encontrar buenos tutoriales de LaTeX:

1. **Overleaf**: Overleaf ofrece una vasta cantidad de tutoriales y guías, desde los básicos hasta los más avanzados. Es

Make a tutorial to configure geometry not to allow overflow of the toc for my current configs

Para asegurar que la Tabla de Contenidos (TOC) de tu documento LaTeX no se desborde y respete los márgenes configurados, especialmente considerando la clase `Tiqqunazo` y el uso del paquete `geometry`, te guiaré a través de un tutorial para configurar adecuadamente el paquete `geometry` y otros ajustes relacionados. Esto incluirá cómo manejar dinámicamente el espacio del documento para prevenir el desbordamiento de contenidos, como la TOC, en tus configuraciones actuales.

### Paso 1: Configuración Inicial de `geometry`

El paquete `geometry` te permite definir y personalizar los márgenes de tu documento de manera muy precisa. Para comenzar, asegúrate de que `geometry` está configurado con parámetros que reflejen tus necesidades específicas, incluyendo el espacio suficiente para el pie de página (`footskip`) y el encabezado (`headheight`), como se muestra en el archivo de clase `Tiqqunazo`. Por ejemplo:

```latex
\RequirePackage{geometry}
\geometry{
  papersize={4.25in,5.5in},
  top=0.7in,
  bottom=0.6255in,
  left=0.4375in,
  right=0.4375in,
  headheight=17pt,
  footskip=20pt,
  includeheadfoot
}
```

### Paso 2: Ajuste Dinámico de `footskip`

Si te preocupan los contenidos que se desbordan, como la TOC, una estrategia es ajustar dinámicamente el `footskip` para dar más espacio al pie de página si es necesario. Aunque `geometry` no ajusta automáticamente estos valores en respuesta al contenido, puedes establecer un valor de `footskip` que sea suficiente para la mayoría de tus necesidades.

### Paso 3: Revisión del Espaciado de la TOC

Para la TOC, puedes controlar el espacio antes y después de la misma usando comandos dentro de tu documento o incluso en la definición de la clase si deseas que sea un cambio global. Por ejemplo, para asegurar que haya un salto de página después de la TOC:

```latex
\usepackage{etoolbox}
\pretocmd{\tableofcontents}{\clearpage}{}{}
\apptocmd{\tableofcontents}{\clearpage}{}{}
```

Este código asegura que la TOC comience en una nueva página y también que cualquier contenido posterior inicie después de un salto de página.

### Paso 4: Control de la Longitud de la TOC

Si tu TOC es extensa y esto contribuye al problema del desbordamiento, considera limitar la profundidad de la TOC con el comando `\setcounter{tocdepth}{}`. Por ejemplo, para incluir solo secciones y subsecciones:

```latex
\setcounter{tocdepth}{2}
```

Esto limitará la TOC a secciones y subsecciones, excluyendo subsubsecciones y niveles más bajos, lo que puede ayudar a reducir su longitud total.

### Paso 5: Compilación y Verificación

Después de realizar los ajustes deseados, compila tu documento con LuaLaTeX (o el compilador de tu elección) y verifica que la TOC y otros elementos respeten los márgenes definidos sin desbordarse. Es posible que necesites ajustar los valores específicos de `geometry` según los resultados obtenidos.

### Conclusión

Configurar adecuadamente el paquete `geometry` y hacer ajustes considerados a la estructura de tu documento, como la profundidad de la TOC y el espaciado antes y después de la misma, te ayudará a prevenir problemas de desbordamiento en tus documentos LaTeX. Recuerda que la clave está en encontrar un equilibrio entre los requisitos de diseño de tu documento y la funcionalidad proporcionada por LaTeX y sus paquetes.

how can i see the outline of the document to visualize what's going wrong

Para visualizar el esquema y el diseño general de tu documento LaTeX, especialmente para identificar problemas de desbordamiento o cualquier otro problema de formato, puedes utilizar varias herramientas y técnicas. Estas te permitirán ver cómo se distribuyen los elementos en las páginas, incluidos los márgenes, el espacio del encabezado y pie de página, y la ubicación de los elementos flotantes. Aquí te explico cómo hacerlo:

### 1. Uso del Paquete `layout`

El paquete `layout` te permite visualizar el diseño actual de la página de tu documento, mostrando los márgenes, el tamaño del texto, el espacio del encabezado y pie de página, entre otros. Para usarlo, simplemente incluye el paquete en tu preámbulo y llama al comando `\layout{}` donde quieras que se muestre el esquema.

```latex
\usepackage{layout}
% Luego, en el cuerpo del documento donde quieras ver el esquema:
\layout{}
```

Esto generará una página en tu documento con el esquema del layout actual.

### 2. Visualización de los Márgenes con el Paquete `showframe`

El paquete `geometry` tiene una opción llamada `showframe` que te permite ver los marcos de los márgenes del documento, lo cual es útil para entender cómo se está utilizando el espacio en cada página.

Para activarlo, añade la opción `showframe` a las opciones del paquete `geometry`:

```latex
\usepackage{geometry}
\geometry{
  showframe, % Muestra los marcos de los márgenes
  % otras opciones de geometría aquí
}
```

### 3. Revisión de la Tabla de Contenidos (TOC)

Si el problema está relacionado específicamente con la TOC desbordándose o extendiéndose de manera inesperada, considera revisar cómo estás incluyendo y estructurando tu contenido. Asegúrate de que la profundidad de la TOC (`tocdepth`) esté configurada adecuadamente para no incluir más niveles de los necesarios. También, revisa que no haya comandos erróneos que puedan estar alterando su comportamiento.

### 4. Herramientas Externas y Visualización de PDF

Herramientas externas como visores de PDF con funcionalidades avanzadas pueden ofrecerte una visión más clara de cómo se distribuye el contenido a lo largo de tu documento. Algunas de estas herramientas permiten visualizar las cajas de margen, texto y otros elementos estructurales del documento PDF.

### 5. Depuración Paso a Paso

En casos complejos, puede ser útil comentar secciones de tu documento o introducir cambios incrementales para ver cómo afectan el layout. Esto puede ayudarte a identificar específicamente qué cambios o secciones están causando problemas.

### 6. Utilización del Modo Draft

Algunos paquetes ofrecen una opción `draft` que, cuando se activa, puede ayudar a identificar problemas como imágenes que se desbordan de los márgenes, mostrando un marco en lugar de la imagen completa.

Implementando estas técnicas, podrás obtener una mejor visualización del esquema y layout de tu documento, facilitando la identificación y corrección de problemas.

quiero que el toc haga un page brake cuando ya no quepa. Olvide mencionarte que esta en partes, quiero que cada parte se separe una linea si no caben

Para garantizar que la Tabla de Contenidos (TOC) en tu documento LaTeX realice un salto de página automáticamente cuando una parte no quepa completamente en una página, y además, para separar cada "parte" con una línea adicional si no caben en la misma página, necesitarás un enfoque un poco más manual y estratégico, ya que LaTeX no ofrece una solución directa para "detectar" automáticamente este tipo de necesidad de salto de página en la TOC.

Sin embargo, aquí te propongo una estrategia que puedes adaptar:

### 1. Uso de Hooks en la TOC para Insertar Saltos de Página

Puedes utilizar el paquete `etoolbox` para insertar comandos que verifiquen el espacio disponible antes de insertar una nueva entrada de "parte" en la TOC. Aunque no es una solución completamente automática, te permite controlar mejor los saltos de página para las partes.

La idea básica es insertar un comando personalizado antes de cada entrada de "parte" que inserte un salto de página si se detecta que el espacio restante en la página no es suficiente. Este tipo de control fino puede ser complejo de implementar directamente, ya que LaTeX no calcula dinámicamente el espacio restante de esta manera.

### 2. Inserción Manual de Saltos de Página

Dado que la automatización completa puede ser desafiante y propensa a errores debido a la complejidad del cálculo del espacio disponible en una página, un enfoque más práctico y confiable es insertar manualmente los saltos de página en la TOC donde los necesites. Esto se puede hacer usando el paquete `tocloft` para personalizar la TOC.

Puedes definir un nuevo comando que inserte un espacio adicional y un salto de página antes de las entradas de las partes en la TOC:

```latex
\usepackage{tocloft}
\newcommand{\partbreak}{\addtocontents{toc}{\protect\newpage\protect\mbox{}\protect\hspace*{0pt}\protect\par}}
```

Luego, antes de cada `\part{}` en tu documento, usarías `\partbreak` para asegurarte de que comience en una nueva página de la TOC si es necesario:

```latex
\partbreak
\part{Nueva Parte}
```

Este método te da control manual sobre dónde ocurren los saltos de página en la TOC, lo cual es útil para evitar que las partes se dividan entre dos páginas.

### 3. Separar Partes en la TOC

Si lo que deseas es asegurarte de que haya una línea extra (espacio adicional) entre las partes en la TOC, puedes modificar el comando `\part` para que automáticamente añada este espacio en la TOC. Sin embargo, esto usualmente requiere una intervención manual o el uso de comandos adicionales para añadir el espacio deseado.

Una alternativa es definir un nuevo comando en el preámbulo para ajustar cómo se añaden las entradas de las partes a la TOC, pero esto dependerá de cómo esté estructurado tu documento y puede requerir un ajuste fino para obtener el resultado deseado.

### Conclusión

La naturaleza estática de la TOC en LaTeX hace que los ajustes automáticos basados en el espacio restante en la página sean complicados y, a menudo, poco fiables. El control manual, mediante la inserción de saltos de página específicos y el ajuste del espacio entre las entradas, suele ofrecer un equilibrio entre la personalización y la fiabilidad.

how to add centered ... to separate subsections in latex (tell me what is the appropriate editing concept and latex syntax)

Para añadir puntos suspensivos (…) centrados como separadores entre subsecciones en LaTeX, el concepto apropiado que debemos utilizar es la edición de comandos de sección y subsección, específicamente mediante el paquete `titlesec`. Este paquete permite una personalización detallada de los títulos de secciones, subsecciones y otros niveles de estructura dentro de un documento LaTeX. 

Vamos a utilizar `titlesec` para modificar el formato de las subsecciones añadiendo puntos suspensivos centrados antes de cada subsección. Aquí te muestro cómo hacerlo:

### Paso 1: Cargar el Paquete `titlesec`

Primero, asegúrate de incluir el paquete `titlesec` en el preámbulo de tu documento LaTeX:

```latex
\usepackage{titlesec}
```

### Paso 2: Modificar el Formato de las Subsecciones

Luego, puedes usar el comando `\titleformat` para personalizar el formato de las subsecciones. Para añadir puntos suspensivos centrados, podrías hacer algo como esto:

```latex
\titleformat{\subsection}[block]
  {\normalfont\large\bfseries\centering}
  {}
  {0pt}
  {…\quad\thesubsection\quad}
```

Este comando establece el formato de las subsecciones de la siguiente manera:

- `[block]`: Define el estilo del título como un bloque de texto (lo que permite el centrado).
- `{}`: No especifica un prefijo para el número de la subsección, porque los puntos suspensivos ocuparán esta función.
- `{0pt}`: Indica que no hay espacio entre el prefijo y el título de la subsección.
- `{…\quad\thesubsection\quad}`: Añade puntos suspensivos antes del número de la subsección y luego un espacio cuádruple (`\quad`) para separar el número del texto de la subsección.

### Paso 3: Ajuste Fino

Dependiendo de tus necesidades exactas (por ejemplo, si solo quieres los puntos suspensivos sin los números de las subsecciones o si quieres los puntos suspensivos después del título), puedes ajustar la última parte del comando `\titleformat`. Por ejemplo, para tener puntos suspensivos solamente antes del título y centrarlo todo, podrías omitir `\thesubsection` del último argumento:

```latex
\titleformat{\subsection}[block]
  {\normalfont\large\bfseries\centering}
  {}
  {0pt}
  {…\quad}
```

Este enfoque te da una gran flexibilidad para personalizar cómo aparecen las subsecciones en tu documento. Recuerda, sin embargo, que este método aplica los cambios a todas las subsecciones del documento. Si necesitas un comportamiento diferente en secciones específicas, deberás hacer ajustes adicionales o definir comandos personalizados para esas secciones.

Ceck this scriptbook.tex that has proper index and tell me what you think is the main reason for it to handle jumpspace properly

Como no tengo acceso directo a archivos externos o la capacidad de leer contenido fuera de lo que me proporcion

Check this scriptbook.tex that has proper index and tell me what you think is the main reason for it to handle jumpspace properly

% Old changes from thesis (main.tex)
% % arara: pdflatex
% % arara: biber
% % arara: pdflatex

% \documentclass[fontsize=11pt,chapterprefix=false,headings=big,headsepline=on,paper=5.500in:8.50in,DIV=11,BCOR=5mm,parskip=half+]{scrbook}
% % From the thesis (main.tex) file, which has the script directly and not those params under square brackets.
% % \KOMAoptions{%
% %     fontsize=12pt,%
% %     chapterprefix=true,%
% %     headings=standardclasses,%
% %     headings=big,%
% %     headsepline=on,%
% %     paper=letter,%
% %     %paper=7in:8.5in,% pueds especificar un tamaño propio
% %     DIV=calc,%
% %     BCOR=5mm,%
% %     parskip=full+,%
% %     bibliography=totoc,%
% %     %toc=sectionentrywithoutdots%
% % }
% \usepackage{soul}
\documentclass{scrbook}
\KOMAoptions{%
    fontsize=8pt,%
    chapterprefix=false,%
    headings=big,%
    headsepline=on,%
    paper=4.25in:5.50in,%
    DIV=11,%
    BCOR=5mm,%
    parskip=half+%
}
\usepackage{markdown}
\usepackage{soulutf8}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[english,spanish,mexico]{babel}
%\usepackage{lmodern}
%%%%%%% Conjunto DejaVu
%\usepackage{DejaVuSerifCondensed}
%\usepackage{DejaVuSansCondensed}
%\usepackage{DejaVuSansMono}
\usepackage{fontspec}
\setmainfont{Noto Color Emoji}
%\setmainfont{Segoe UI Emoji}
%\setsansfont{Spectral-Medium}
%\setmonofont{inconsolata}
%%%%%%% Source Pro
% \usepackage{sourceserifpro}
% \usepackage{sourcesanspro}
% \usepackage{sourcecodepro}
%%%%%%% Alegreya y Pandora
\usepackage{Alegreya}
\usepackage{AlegreyaSans}
\usepackage{inconsolata}
\usepackage{textcomp}
\usepackage{enumitem}
\usepackage{hologo}
% \usepackage[outer=3in,inner=1.5in,top=1.5in,bottom=2.5in]{geometry}
\usepackage[spanish=mexican]{csquotes}
\usepackage{graphicx}
\graphicspath{{images/}}
\usepackage{xurl}
\def\UrlBreaks{\do\/\do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z\do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z\do\%\do0\do1\do2\do3\do4\do5\do6\do7\do8\do9\do=\do/\do.\do:}
\usepackage{xcolor}
\usepackage{booktabs}
\usepackage{layout}
%\usepackage[draft]{typogrid}
%\typogridsetup{columns=1}
\usepackage{epigraph}
\setlength{\epigraphwidth }{0.50\linewidth}
%\usepackage{layout} % page config
%\usepackage[draft]{typogrid} % show page borders
%\typogridsetup{columns=1} % show 1 column

%%%% From main.tex
\usepackage[%
backend=biber,%
style=authoryear-icomp,%
autocite=inline,%
autolang=other,
sortlocale=auto,%
isbn=false,%
url=false,%
doi=false,%
]{biblatex}
\addbibresource{bibliography/tesis-revision-ortografia.bib}

\usepackage{hyperref}
\hypersetup{
    pdftoolbar=true,        % show Acrobat’s toolbar?
    pdfmenubar=true,        % show Acrobat’s menu?
    pdffitwindow=false,     % window fit to page when opened
    pdfstartview={FitH},    % fits the width of the page to the window
    pdftitle={Lee esto 	para hacer un cambio real}, % title
    pdfauthor={La Partida},     % author
    pdfsubject={Lee Esto para Hacer Algo Real},   % subject of the document
    pdfcreator={La Partida},   % creator of the document
    pdfproducer={Disonancias}, % producer of the document
    pdfkeywords={} {} {} {}, % list of keywords
    pdfnewwindow=true,      % links in new window
    colorlinks=true,       % false: boxed links; true: colored links
    linkcolor=darkgray,          % color of internal links (change box color with linkbordercolor)
    citecolor=darkgray,        % color of links to bibliography
    filecolor=darkgray,      % color of file links
    urlcolor=darkgray           % color of external links
}

\usepackage[colorinlistoftodos,textsize=scriptsize,spanish]{todonotes}

\newcommand{\didit}[1]{\todo[color=red!40]{#1}} % Indica que esta parte ya está concluida
\newcommand{\revquotes}[1]{\todo[color=red!95]{Homologar criterio de uso de las comillas.}}
\newcommand{\addref}[1]{\todo[color=red!90]{[Cita requerida, #1]}} % Indica que hace falta una cita
\newcommand{\rewrite}[1]{\todo[color=green!40]{#1}} % Nota para comentar que hay que reescribir algo
\newcommand{\revstyle}[1]{\todo[color=cyan!40]{#1}} % Indica que requiere un ajuste de estilo

\makeatletter
\if@todonotes@disabled
\newcommand{\hlfix}[2]{#1}
\else
\newcommand{\hlfix}[2]{\texthl{#1}\todo{#2}}
\fi
\makeatother% Resalta texto a corregir y agrega una nota alusiva al margen

\makeatletter
\newcommand{\setconcept}[2]{%
    \phantomsection
    #1\def\@currentlabel{\unexpanded{#1}}\label{#2}%
}
\makeatother

\renewcommand*{\dictumwidth}{0.46\textwidth} % Commented in main.tex

\setcounter{secnumdepth}{0}
\setcounter{tocdepth}{2}
\usepackage{setspace}
\onehalfspacing
\raggedbottom
\clubpenalty=10000 % Ajuste de tolerancia de líneas huerfanas
\widowpenalty=1000 % Ajuste de tolerancia de líneas viudas

%\titlehead{Disonancias}
%\extratitle{y otros ensayos\\ \rule[0.5ex]{\textwidth}{0.5pt} \hfill Lee esto para hacer un cambio real}
%\subject{Teoría Crítica}
\title{Lee Esto Para Hacer un Cambio Real}
\subtitle{Plantar Cara al Pasado para Imaginar el Porvenir}
\subtitle{Ensayo sobre la tecnocrítica}
%\title{Plantar cara al pasado para imaginar el futuro}
\subtitle{y otros textos}
\author{La Partida}
\date{\today}
\publishers{La Partida}
\uppertitleback{\footnotesize
Primera edición, 2023. \\

\textcopyright{} \oldstylenums{2022} Versión 0.1 Disonancias\\ % This version should be updated from the script params
}

\lowertitleback{\footnotesize\raggedright
Diseño, edición y composición: \emph{Disonancias} \\

La composición tipográfica se realizó con Pandoc y \hologo{LuaLaTeX}, mediante el uso de la colección \hologo{KOMAScript} sobre \hologo{LaTeXe}.\\

Los tipos usados en la presente edición son Alegreya y \textsf{Alegreya Sans}, diseñados por Juan Pablo del Peral, para \href{https://www.huertatipografica.com/es}{Huerta Tipográfica}, que se encuentran disponibles en \url{https://github.com/huertatipografica/Alegreya} y \url{https://github.com/huertatipografica/Alegreya-Sans}; complementadas con \texttt{Inconsolata} de Raph Levien para el texto monoespaciado, que se encuentra disponible en \url{https://levien.com/type/myfonts/inconsolata.html}.\\

Edición: La Partida .\\

Impreso y hecho en México $\bullet$ \emph{Printed in Mexico}
}
% \dedication{}

\begin{document}
\frontmatter
\maketitle

\cleardoubleemptypage%pagina 3 epigrafe
\textcolor{white}{.}\\
%\vspace{40mm}
%\thispagestyle{empty}

\dictum[C. I.]{Todo pensamiento es estratégico}
\clearpage

\minisec{Convenciones de estilo}

\begin{itemize}
\item
  Para un uso preciso del lenguaje y frente a la convención de hablar
  del ``hombre'' para referirse al \emph{sujeto} universal, usamos
  siempre ``personas'' y ``gente'' para evitar el plural masculino como
  plural para cualquier multitud. En todos los casos donde se lee plural
  en femenino es para referirse a las personas como multitud a menos que
  se especifique o indique lo contrario.
\item
  Se dice que los autores de Tiqqun son un grupo de intelectuales que se
  conoce como ``los nueve de Tarnac'' y es muy probable que hayan
  escrito la colección de libros firmada por el Comité invisible,
  comenzando con ``La insurrección que viene''. Sin embargo, en realidad
  este hecho es incierto y quizá fueron más bien alumnas del primer
  círculo quienes continuaron la producción escritural. He decidido
  señalar al Comité invisible como autor de Tiqqun porque en diversas
  publicaciones se dice que el Comité invisible es el órgano
  revolucionario del Partido imaginario, que es la figura política que
  desarrollan a lo largo de toda su obra. Además, la dificultad de
  nombrar a Tiqqun como autor de la revista es que llevan el mismo
  nombre, además de que Tiqqun es también un concepto del judaísmo que
  puede traducirse como redención.
\end{itemize}

\clearpage
\minisec{Resumen}

\begin{quotation}
\markdownInput{prologue.md}
\end{quotation}

\tableofcontents
\listoffigures
\listoftables
\listoftodos

\mainmatter

\part{Plantar cara al pasado para imaginar el porvenir}
\markdownInput{1-plantar-cara/00-prologue.md}
\markdownInput{1-plantar-cara/01-manifesto.md}
\markdownInput{1-plantar-cara/02-about-the-party.md}
\markdownInput{1-plantar-cara/03-institutional-struggle.md}
\markdownInput{1-plantar-cara/04-our-intuitions.md}
\markdownInput{1-plantar-cara/05-know-to-do.md}
\markdownInput{1-plantar-cara/06-lefts-right.md}
\markdownInput{1-plantar-cara/07-some-warnings.md}

\part{Lee esto para hacer un cambio real}
\include{2-lephucr/01b-intro}
\include{2-lephucr/02-cap1}
\include{2-lephucr/03-cap2}
\include{2-lephucr/04-cap3}
\include{2-lephucr/05-cap4}
\include{2-lephucr/06-cap5}

\part{Sobre la Acción Crítica}
\dictum[C. I.]{Todo pensamiento es estratégico}

\include{3-accion-critica/00-cite}
\include{3-accion-critica/01-intro}
\include{3-accion-critica/02-chapter1}
\include{3-accion-critica/03-chapter2}
\include{3-accion-critica/04-chapter3}
\include{3-accion-critica/05-chapter4}

\appendix
\backmatter

\include{chapters/07-anexos}
\cleardoublepage

% The following are from thesis config
% \layout

% %\nocite{*}
% \printbibheading[title={Bibliografía catalogada}]

% \printbibliography[type=article, title={Artículos}]

% \printbibliography[type=book, title={Libros}]

% \printbibliography[type=inbook, title={Partes de libros}]

% \printbibliography[type=online, title={Referencias en línea}]

% \printbibliography[type=misc, title={Otras referencias varias}]

% \printbibliography[type=incollection, title={Suplementos}]

% \printbibliography[type=collection, title={Recopilaciones}]
% \end{document}
%\layout
\end{document}



El manejo adecuado del espacio y la organización del documento en el script `scriptbook.tex`, en particular la forma en que se gestiona la Tabla de Contenidos (TOC) y los saltos de página, parece derivarse principalmente del uso efectivo de la clase `scrbook` del conjunto KOMA-Script junto con opciones de configuración bien pensadas dentro de `\KOMAoptions{}` y el uso estratégico de `\part{}` para segmentar el contenido. Vamos a desglosar los aspectos clave:

### Uso de la Clase `scrbook`

- **KOMA-Script (`scrbook`)**: Esta clase está diseñada específicamente para la creación de libros y proporciona una gran flexibilidad y opciones para personalizar el diseño y la estructura del documento. La clase `scrbook` incluye funcionalidades avanzadas para manejar elementos como cabezales, pies de página, y la TOC de manera más sofisticada que las clases estándar de LaTeX, lo que contribuye a un control más fino sobre los saltos de página y la presentación general.

### Configuración de `\KOMAoptions{}`

- **Tamaño de Papel y Márgenes**: Las opciones `paper=4.25in:5.50in`, `DIV=11`, y `BCOR=5mm` definen el tamaño del papel y cómo se calculan los márgenes y el área de texto. Esto es crucial para determinar cuánto contenido cabe en una página y cómo se distribuye, lo cual influye directamente en cuándo se necesitan saltos de página.

- **Espaciado entre Párrafos (`parskip=half+`)**: Esta opción afecta el espaciado entre párrafos, lo que indirectamente puede influir en la necesidad de saltos de página al afectar la cantidad de texto que cabe en una página.

- **Control del Encabezado (`headsepline=on`)**: Al activar una línea separadora para el encabezado, se mejora visualmente la distinción entre el cuerpo del texto y el encabezado, lo cual, aunque no afecta directamente los saltos de página en la TOC, contribuye a la claridad general del documento.

### Uso de `\part{}`

- La segmentación del documento en partes utilizando `\part{}` organiza el contenido a un alto nivel, lo cual puede influir en cómo LaTeX decide manejar los saltos de página. Cada parte comienza en una nueva página, lo que naturalmente introduce un espacio de separación en la TOC y asegura que el inicio de cada parte esté claramente delimitado.

### Factores Adicionales

- **Personalización de la TOC**: Aunque el script proporcionado no muestra modificaciones directas a la TOC respecto a los saltos de página, la clase `scrbook` junto con las opciones configuradas ofrecen un buen punto de partida para un control detallado. Cualquier ajuste adicional para manejar específicamente los saltos de página en la TOC probablemente se beneficiaría del sólido fundamento que estas configuraciones proporcionan.

### Conclusión

La combinación de la clase `scrbook`, las opciones de configuración detalladas y el uso estratégico de partes parece ser la clave para el manejo efectivo del espacio y la organización del documento en `scriptbook.tex`. Estos elementos, al ser utilizados de manera conjunta, proporcionan un control robusto sobre la estructura y presentación del documento, lo que puede incluir un manejo adecuado de los saltos de página para la TOC y otras secciones. Sin embargo, para casos específicos como forzar un salto de página en la TOC justo antes de que una entrada no quepa completamente, se puede necesitar una intervención manual o el uso de paquetes adicionales que permitan un control más granular.

Rewrite tiqqunazo or main to incorporate koma script

Para reescribir la clase `Tiqqunazo` o el archivo `main.tex` para incorporar KOMA-Script, es importante enfocarse en las capacidades y opciones que KOMA-Script ofrece, especialmente a través de la clase `scrbook` para la creación de libros o documentos extensos. KOMA-Script proporciona una gran flexibilidad en la configuración del diseño de página, cabeceras, pies de página, tipografías y manejo de secciones, lo que lo hace ideal para un documento complejo y bien estructurado como el que estás creando.

### Migración a `scrbook` de KOMA-Script

Voy a sugerir cambios para incorporar KOMA-Script en tu documento, basándome en el contenido y configuraciones que has proporcionado anteriormente.

#### Paso 1: Definir la Clase del Documento

Cambia la declaración de la clase del documento a `scrbook` con las opciones iniciales basadas en tu configuración actual. Ajusta el tamaño del papel, los márgenes (usando `DIV` y `BCOR` para el cálculo de KOMA), el espaciado entre párrafos, y otras opciones relevantes.

```latex
\documentclass[
  fontsize=11pt,       % Tamaño de fuente
  headings=big,        % Tamaño de los títulos
  headsepline=true,    % Línea bajo la cabecera
  paper=5.500in:8.50in, % Tamaño del papel
  DIV=11,              % Cálculo de diseño para márgenes
  BCOR=5mm,            % Corrección de encuadernación
  parskip=half+        % Espaciado entre párrafos
]{scrbook}
```

#### Paso 2: Ajustar las Opciones de KOMA-Script

Utiliza `\KOMAoptions{}` o `\setkomafont{}` y `\addtokomafont{}` para ajustar opciones adicionales y configurar las fuentes para títulos, cabeceras, etc.

```latex
\KOMAoptions{
  % Añade o ajusta opciones según sea necesario
}

\setkomafont{disposition}{\normalcolor\bfseries} % Fuentes para títulos
```

#### Paso 3: Configurar Cabeceras y Pies de Página

KOMA-Script utiliza el paquete `scrlayer-scrpage` para configurar las cabeceras y los pies de página, reemplazando la necesidad de paquetes como `fancyhdr`.

```latex
\usepackage[automark]{scrlayer-scrpage}
\clearpairofpagestyles
\ohead{\headmark} % Cabecera exterior: nombre de la sección
\ofoot[\pagemark]{\pagemark} % Número de página en el pie
```

#### Paso 4: Ajustes Adicionales

Continúa con la incorporación de los paquetes y configuraciones específicas que ya estás utilizando, como `fontspec` para XeLaTeX o LuaLaTeX, ajustes de tipografías, y opciones de personalización detalladas.

```latex
\usepackage{fontspec}
\setmainfont{Noto Color Emoji}
% Configuraciones adicionales...
```

#### Paso 5: Estructura del Documento y Personalización

Mantén la estructura de tu documento y las personalizaciones que ya has definido, asegurándote de adaptar cualquier comando específico de la clase `article` o `book` estándar al entorno de KOMA-Script cuando sea necesario.

### Conclusión

La migración a `scrbook` de KOMA-Script te permite aprovechar una gran cantidad de opciones de personalización y configuración avanzadas, ideales para proyectos editoriales complejos. Asegúrate de revisar la documentación de KOMA-Script para comprender todas las opciones disponibles y cómo pueden enriquecer la presentación y funcionalidad de tu documento. Adapta los pasos mencionados según las necesidades específicas de tu proyecto para una transición suave.