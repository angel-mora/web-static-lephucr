---
title: Margin Adjustment Solutions
tags:
- '1'
- '2'
- '3'
- '4'
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  based on that pdf and the following latex class:"
draft: false
---

# Margin Adjustment Solutions

## ✅ TODOs
- [ ] notes@disabled
- [ ] {#2}}
- [ ] Remove

## 🧠 Full Chat

🙋 **You:**

based on that pdf and the following latex class:
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
\LoadClass[8pt,twoside]{extarticle}
\RequirePackage[%
  papersize={4.25in,5.5in}, % tamaño de papel media carta
  headheight=17pt,          % ajuste del tamaño de la cabecera
  top=0.7in,                % mrgen superior
  bottom=0.6255in,          % margen inferior
  left=0.4375in,            % margen izquierdo
  right=0.4375in            % margen derecho
  ]{geometry}

% CARGA DE LOS PAQUETES NECESARIOS
  %\RequirePackage[utf8]{inputenc}
  %\RequirePackage[T1]{fontenc}
  \RequirePackage[english,spanish,mexico]{babel}
  \RequirePackage[spanish=mexican]{csquotes}
  \RequirePackage{xparse}
  \RequirePackage{markdown}
  \RequirePackage{graphicx}
  \RequirePackage[table]{xcolor}
  \RequirePackage{tocloft}
  \RequirePackage{parskip}
  \RequirePackage{fancyhdr}
  \RequirePackage{wrapfig2}
  \RequirePackage{titlesec}
  \RequirePackage{fontspec}
  \RequirePackage[hidelinks]{hyperref}
  \RequirePackage{xurl}

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
  
    % \begin{centering}
    %   \parbox{0.98\linewidth}{\@starttoc{toc}} 
    %   \vspace{10pt}\linebreak
    % \end{centering}
    % \rule{\textwidth}{1pt} 
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
  \parindent1em 
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

Tell me how to fix the margin in the right side. The logs say something like this:
Overfull \hbox (4.87898pt too wide) in paragraph at lines 86--86
\TU/DejaVuSansMNerdFontMono-Regular(0)/m/sc/8 isbn: 978-987-20591-2-5. url: []$
\TU/lmtt/m/n/8 http : / / geocities .
 []

---

**Tool:**

Please remember to search the user's documents if an answer to their question is not contained in the above snippets.

---

🤖 **Assistant:**

To fix the right margin issue in your LaTeX document, you should first verify that no extra space is being added by any settings or commands that affect the line width or margins. Since the log mentions an "Overfull \hbox" error, which indicates that content on the line is wider than the specified text width, it's likely that something is pushing the margin over its set limit.

Here are a couple of approaches to address this:

1. **Check for Wide Content**: Ensure that any content which might extend beyond the normal text width, such as URLs, long words, or unbreakable strings, is properly handled. In LaTeX, you can use the `sloppypar` environment to make LaTeX more lenient with line breaking rules:
   ```latex
   \begin{sloppypar}
   This is a long line that LaTeX will try to line-break more aggressively.
   \end{sloppypar}
   ```

2. **Use Hyphenation or Break Links**: If the issue is caused by long URLs (as the log suggests with "http://geocities"), consider using the `xurl` package, which allows URL line breaks at any character:
   ```latex
   \usepackage{xurl}
   ```
   Alternatively, manually insert hyphens or allow LaTeX to hyphenate within the URL.

3. **Adjust Text Width Locally**: If certain parts of your document require a wider margin, you can adjust the text width locally using the `adjustwidth` environment provided by the `changepage` package:
   ```latex
   \usepackage{changepage}
   \begin{adjustwidth}{-2cm}{-2cm}  % Extend the left and right margins
   This is a particularly wide block of text that needs more space.
   \end{adjustwidth}
   ```

4. **Global Margin Settings**: Review the global settings in your geometry package declaration. You may need to adjust the right margin slightly if elements like page numbers or headers are consistently too wide. You can do this by increasing the `right` margin:
   ```latex
   \RequirePackage[papersize={4.25in,5.5in}, headheight=17pt, top=0.7in, bottom=0.6255in, left=0.4375in, right=0.5in]{geometry}
   ```

5. **Revisit Content that Causes Overfull Boxes**: Look at the content specifically mentioned in the log errors and consider manually adjusting it, whether it's changing font sizes, rephrasing, or manually adding line breaks.

Adjust these settings and recompile your document to see if the margin issue is resolved.

---

🙋 **You:**

could it be because it's half letter?

---

🤖 **Assistant:**

Yes, using a half-letter paper size can definitely contribute to margin issues, especially if the content is too wide for the available text area. In a half-letter format (typically 4.25 inches by 5.5 inches), you have less horizontal space compared to standard letter or A4 sizes. This reduced width can make it more challenging to fit content without exceeding the margins, particularly with non-breaking text such as URLs, long words, or wide tables.

Given the dimensions specified in your LaTeX class (papersize={4.25in,5.5in}), the margins are set quite narrow (left=0.4375in, right=0.4375in), which doesn't leave much room for text. This can easily lead to overfull `\hbox` warnings if any content slightly exceeds the available text width.

Here are a few suggestions to better manage the layout in a half-letter format:

1. **Adjust Margins**: If possible, adjust the margins slightly to provide more text space. Even a small increase can help prevent overfull boxes:
   ```latex
   \RequirePackage[papersize={4.25in,5.5in}, top=0.7in, bottom=0.6255in, left=0.5in, right=0.5in]{geometry}
   ```

2. **Review and Break Up Long Words/URLs**: Ensure that long words or URLs break properly or are shortened. Using the `xurl` package can help URLs break at any character, reducing the likelihood of overfull lines.

3. **Utilize Scaling or Smaller Fonts for Wide Content**: For tables or images that are too wide, consider scaling them down to fit within the margins or use a smaller font size for specific parts of the document that are prone to overflow.

4. **Use `sloppypar` Environment**: This can make LaTeX less strict about line breaking:
   ```latex
   \begin{sloppypar}
   Your text here might break more easily.
   \end{sloppypar}
   ```

5. **Manual Hyphenation**: In some cases, adding manual hyphenation or allowing more hyphenation points in words can prevent them from stretching beyond the right margin.

By adjusting the margins and being mindful of how content fits within those margins, you can better manage the layout of your document in a half-letter format. Adjusting the document setup based on the content's needs and the limitations of the smaller page size will help mitigate the overfull `\hbox` issues.

---

🙋 **You:**

where in my Main.tex file should I use sloppypar?
\documentclass{Tiqqunazo}
\usepackage{lipsum}
\usepackage{epigraph}
\usepackage{booktabs}
\usepackage{enumitem}
\usepackage{emoji}
\usepackage{fontspec}
\usepackage{titlesec}

\setmainfont{DejaVuSansMNerdFontMono-Regular}
\newfontfamily\DejaVuSans{DejaVuSansMNerdFontMono-Regular}[Extension=.ttf]
\newfontfamily\FiraRegular{FiraCodeNerdFont-Regular}[Extension=.ttf]
\newfontfamily\HackRegular{HackNerdFont-Regular}[Extension=.ttf]
\titleformat*{\section}{\large\HackRegular}
\titleformat*{\subsection}{\normalsize\HackRegular}
\titleformat*{\subsubsection}{\small\HackRegular}
% \makeatletter
% \if@todonotes@disabled
% \newcommand{\hlfix}[2]{#1}
% \else
% \newcommand{\hlfix}[2]{\texthl{#1}\todo{#2}}
% \fi
% \makeatother

\graphicspath{{images/}}
\usepackage[backend=biber,style=numeric,autocite=footnote]{biblatex}
\addbibresource{plantar.bib}

%%%%%%%%%%%%%%%%%%%%%% VALORES DE LA CARÁTULA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\title{LEE ESTO PARA HACER UN CAMBIO REAL} % Cambia el título del documento
\author{La Partida} % Cambia el nombre del autor
%\project{Plantar cara al pasado para imaginar el futuro} % Cambia (u omite) el nombre del proyecto
%\date{} % Cambia el valor de la fecha mostrada por defecto
%\imagefolder{./imagenes} % Cambia de carpeta para buscar imágenes
%\logo{} % Añade la imagen del logotipo a la portada
\version{Versión 1.1} % Cambia el número de versión

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
\clearpage

\include{prologue}
\tableofcontents
\clearpage

\part{Plantar cara al pasado para imaginar el porvenir}
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

\part{Sobre la Acción Crítica}
\include{3-accion-critica/00-cite}
\include{3-accion-critica/01-intro}
\include{3-accion-critica/02-chapter1}
\include{3-accion-critica/03-chapter2}
\include{3-accion-critica/04-chapter3}
\include{3-accion-critica/05-chapter4}

\printbibliography
%\printhelp % Úsalo para ver/imprimir las páginas de ayuda
\end{document}

---

🤖 **Assistant:**

To effectively manage potential overfull `\hbox` issues throughout your `Main.tex` file, you should consider using the `sloppypar` environment in specific sections where text overflows are more likely. This includes areas with long URLs, unbreakable text, or where complex formatting is used that could disrupt typical word wrapping or margin settings.

Here’s how you can apply the `sloppypar` environment to specific parts of your document:

1. **Targeted Use in Problematic Sections**: If you know which parts of your document are causing overfull `\hbox` warnings (such as sections with URLs or wide tables), wrap those parts in the `sloppypar` environment:
   ```latex
   \begin{sloppypar}
       Text or content that typically causes overfull hbox issues goes here.
   \end{sloppypar}
   ```

2. **General Use for Susceptible Text Blocks**: For broader application, particularly in dynamic content sections like bibliographies or where multiple includes are used, you might wrap larger sections or entire included files:
   ```latex
   \begin{sloppypar}
       \include{filename}  % Include files that may have problematic text.
   \end{sloppypar}
   ```

3. **Applying to the Whole Document**: If overfull boxes are a frequent issue throughout your document and adjusting the layout or content is not feasible, consider applying `sloppypar` more globally. However, this should be used sparingly as it can lead to less than ideal typesetting:
   ```latex
   \begin{document}
   \begin{sloppypar}
   % Your entire document content goes here
   \end{sloppypar}
   \end{document}
   ```

For your `Main.tex` file, you might strategically place `sloppypar` around sections where you've noticed issues in your logs or where dynamic content is heavily included. For instance, after `\tableofcontents` and around your `\include` commands where external content is pulled in, which might contain problematic text. Here’s an example of placing it around includes:
```latex
\begin{document}
\clearpage

\include{prologue}

\begin{sloppypar} % Start of general sloppy environment
\tableofcontents
\clearpage

\part{Plantar cara al pasado para imaginar el porvenir}
\include{1-plantar-cara/00-prologue}
\include{1-plantar-cara/01-manifest}
% More includes here
\end{sloppypar} % End of general sloppy environment

\part{Lee esto para hacer un cambio real}
\begin{sloppypar} % Another sloppy block for a different section
\include{2-lephucr/01b-intro}
% More includes here
\end{sloppypar}

\printbibliography
\end{document}
```
This way, you can control the application of `sloppypar` to ensure it’s used only where necessary, maintaining the quality of typesetting across sections that do not suffer from margin overflow issues.

---

🙋 **You:**

what is hbox and why is overfulling? Is that something I am setting explicitly in the tiqqunazo class?

---

🤖 **Assistant:**

In LaTeX, an "hbox" (horizontal box) is a fundamental concept that refers to a container holding elements in a horizontal row. Text, images, and other items laid out on a page are grouped into hboxes. LaTeX tries to fill each hbox optimally based on the content and the width available.

**Overfull \hbox**: This occurs when the content of an hbox extends beyond the pre-set text width or right margin, causing it to overflow. This can lead to text sticking out into the margins, which is visually unappealing and can disrupt the layout. Overfull hboxes often result in a warning in the LaTeX log file, and depending on the document class settings, a black box (|\rule|) might appear at the end of the line to highlight the overflow visually.

The issue isn't something you set explicitly but is typically a result of:
- **Non-breaking content**: Long words, URLs, or strings that LaTeX can't hyphenate or break across lines.
- **Wide elements**: Images or tables that are wider than the text width.
- **Inflexible justification settings**: Default settings that don’t allow enough flexibility in word spacing or line breaking.

Regarding your LaTeX class, `Tiqqunazo`, here are aspects that could contribute to overfull hboxes:
- **Fixed Margins**: Your class defines specific margin sizes with the `geometry` package. If these margins are narrow, and the content is slightly too wide, it will result in an overfull hbox.
- **Font and Layout Settings**: Custom font settings or adjustments to text formatting could also impact how text fits within the margins. For example, using a wider font or increasing the font size without adjusting the margins correspondingly can lead to overfull hboxes.
- **No Automatic Wrapping for URLs**: If the class or preamble doesn’t include packages like `xurl` or settings that ensure URL wrapping, long URLs might cause overfull hboxes.

To address these issues, consider:
1. **Adjusting Margin Widths**: If frequent overfull hboxes occur, slightly increasing the right margin could provide more breathing room.
2. **Enabling More Flexible Text Wrapping**: Using packages like `xurl` for URLs or `microtype` for better typographic spacing can reduce the risk of overfull hboxes.
3. **Custom Line Breaking**: For problematic sections, manual line breaks or hyphenation can help fit content within the margins.
4. **Reviewing Content Layout**: For elements like images or tables, ensuring they do not exceed the `\textwidth` and using scaling options to fit them within the page layout can prevent overfull hboxes.

By tweaking these settings, you can often mitigate or eliminate issues with overfull hboxes in your LaTeX documents.

---

🙋 **You:**

I removed the forced margins and it all went better. How can I justify the paragraphs?

---

🤖 **Assistant:**

Great to hear that adjusting the margins improved your document layout! In LaTeX, justifying paragraphs is typically the default behavior, where both the left and right edges of the paragraph are flush with their respective margins. If your paragraphs are not appearing justified, it could be due to specific settings or environments altering this behavior.

If you need to ensure that your paragraphs are justified, or if you're encountering issues with paragraph alignment, here are a few things you can check and adjust:

1. **Ensure Justification is Set Globally**: The default paragraph alignment in LaTeX is justified, but if it's been changed in your document class or through packages, you can reset it by placing this command in the preamble or before the start of your document:
   ```latex
   \usepackage{ragged2e}
   \justifying
   ```

2. **Check Local Overrides**: Look for environments or commands in your document that could be setting text alignment to something other than justified. For example, the `flushleft` or `center` environments will change alignment. Make sure these are not being used where you want justified text. If they are needed for specific sections but not others, ensure that their scope is limited correctly.

3. **Handling Special Cases**: If there are particular sections where text justification needs to be enforced or restored after changes, you can use the `justifying` command from the `ragged2e` package within a group or environment:
   ```latex
   \begin{justifying}
       This text will be justified, ensuring that both the left and right edges align flush with the margins.
   \end{justifying}
   ```

4. **Paragraphs with Short Lines**: Sometimes, short lines such as those near images or in columns might not justify well, leading to excessive spacing between words. If this is an issue, consider using the `microtype` package, which can improve the appearance of text in such cases:
   ```latex
   \usepackage{microtype}
   ```

5. **Hyphenation Issues**: Justified text can sometimes lead to poor hyphenation, making the paragraph look awkward. You can adjust hyphenation settings or add manual hyphenations to improve the layout:
   ```latex
   % Enable or improve hyphenation
   \usepackage[english]{babel} % Replace "english" with your language of choice
   ```

By ensuring these settings are correctly applied, your paragraphs should appear justified unless specifically set otherwise by local environments or commands.

---

🙋 **You:**

you have my tiqqunazo.cls class. Tell me if something is being overwritten

---

🤖 **Assistant:**

Your `Tiqqunazo.cls` class file, as described, seems to be a customization built upon the `extarticle` class. From the content you provided, it doesn't explicitly overwrite text justification settings, which should default to fully justified in LaTeX. However, there are various other customizations and package loads that might affect how text is handled, particularly if they include commands that change text alignment or formatting within certain scopes.

Here’s a rundown of possible influences on text justification in your class file:

1. **Font Settings**: You are loading custom fonts with `fontspec`. Ensure that these fonts support proper justification in LaTeX, which they typically should. However, specific font settings or options might influence text appearance:
   ```latex
   \RequirePackage{fontspec}
   \setmainfont{...}
   \newfontfamily\...{...}
   ```

2. **Custom Commands and Environments**: If your class defines new commands or environments that adjust text alignment (like making text centered or left-aligned), these could override global settings when used. For example:
   ```latex
   \newcommand{\section}{...}
   \newcommand{\subsection}{...}
   \newcommand{\subsubsection}{...}
   ```

3. **Packages That Affect Text Formatting**:
   - `parskip` package changes paragraph formatting by adjusting the space between paragraphs and might disable indentation typically used in justified text.
   - `titlesec` is used to customize sectioning commands, which could potentially include alignment settings.

4. **Text Alignment Commands Inside Definitions**: If any part of your class file includes environments like `\begin{flushleft}`, `\begin{center}`, or similar, it would affect text alignment locally.

To further analyze and ensure proper justification, you might want to:
- **Check for Local Overrides in Your Document**: Ensure that no additional packages or commands in your actual `.tex` files are influencing the alignment.
- **Test with Simple Content**: Create a minimal working example using your class and only basic text to see if the justification issue persists without additional content or packages.

Here’s how you can set up a test:

```latex
\documentclass{Tiqqunazo}
\begin{document}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu velit tempus, mollis massa fermentum, auctor risus. Mauris molestie felis in metus bibendum, et elementum sapien sodales.

\vspace{1cm} % Just adding some space
Aliquam erat volutpat. Curabitur fermentum, nulla at interdum malesuada, neque velit molestie elit, vitae venenatis nisl orci vel mi. Morbi sodales, sapien in porttitor placerat, nulla augue ullamcorper nisi, in dapibus sapien justo vitae orci.
\end{document}
```

If the text in this test document justifies correctly without any additional settings, then your class file should generally support justified text by default, and the issue may lie elsewhere in your main document.

---

🙋 **You:**

what is parskip doing? Can I set some configs there to justify?

---

🤖 **Assistant:**

The `parskip` package in LaTeX is used to adjust the vertical spacing between paragraphs. It modifies the amount of space added after a paragraph instead of indenting the first line of each paragraph, which is the traditional formatting style in many types of documents.

### Understanding `parskip`
- **Purpose**: It changes the paragraph behavior to skip a line (or part of a line) between paragraphs, which can improve readability in certain kinds of documents, like informal articles or those that follow a more modern design approach.
- **Behavior**: Using `parskip` typically means that paragraph indentations are removed, and instead, a vertical space is introduced between paragraphs.

### Adjustments with `parskip`
`parskip` itself doesn't directly control text justification (alignment of text along both the left and right margins). Text justification is generally the default behavior in LaTeX for paragraph alignment. If paragraphs are not justifying properly, it's likely due to other factors, such as the settings in custom document classes or other packages that might interfere with text formatting.

### Configurations
- **To use `parskip`**: If not already, you can include it in your preamble. It doesn't have specific options for justifying text because it's not related to horizontal text alignment but you can control the space:
  ```latex
  \usepackage{parskip}
  ```
- **Customizing spacing**: You can customize the spacing `parskip` provides without loading the package, which might give you better control over your document’s appearance:
  ```latex
  \setlength{\parindent}{0pt}  % Removes paragraph indentation
  \setlength{\parskip}{6pt plus 2pt minus 1pt}  % Adds vertical space between paragraphs
  ```
  This command sequence sets the indentation to zero and adjusts the spacing between paragraphs to be 6pt normally, with a little flexibility (plus 2pt or minus 1pt) depending on the page layout needs.

### Testing Justification
If you're experiencing issues with justification while `parskip` is active, consider testing with and without the package to determine if it's indeed influencing text alignment or if another package/configuration might be affecting it.

### Recommendation
If the primary goal is to ensure fully justified text, focus on:
- Ensuring no other environments or settings (like `flushleft` or `center`) are conflicting.
- Using the `microtype` package, which can improve the appearance of justified text by optimizing the spacing between characters and words:
  ```latex
  \usepackage{microtype}
  ```
- Verifying that your document class or any custom settings you have added do not disable justification.

By controlling paragraph spacing directly and ensuring other settings are properly configured, you can maintain a good control over both the appearance of your paragraphs and the justification of your text.

---

🙋 **You:**

What is this doing? \LoadClass[7pt,twoside]{extarticle}

---

🤖 **Assistant:**

The LaTeX command `\LoadClass` is used within document class files (`.cls` files) to load another class from which the current class will inherit properties. It's similar to using `\documentclass` in regular `.tex` documents but is intended for use in class definitions.

### Breakdown of the Command

- **`\LoadClass[options]{class}`**: This specific command is loading the `extarticle` document class with certain options.
- **`extarticle`**: This is an extended version of the standard `article` class in LaTeX, which provides additional features, mainly more flexibility in handling different font sizes that are not typically available in the `article` class.
- **`7pt`**: This option sets the default font size for the document to 7 points, which is smaller than typical document font sizes (usually 10pt, 11pt, or 12pt). `extarticle` supports this smaller size, whereas the standard `article` class does not.
- **`twoside`**: This option configures the document for two-sided printing, which affects the layout of margins, page numbering, and text alignment, making it different on odd and even pages. This is commonly used in preparing documents that will be printed and bound like a book, where left and right pages need mirrored layouts.

### Implications of These Settings

- **Font Size**: Setting the document to `7pt` is quite small and can be useful for creating documents with a lot of information in a compact format, but it might be challenging to read if used for longer texts.
- **Two-sided Printing**: The `twoside` option is useful for professional printing scenarios but can introduce complexities in margin settings and header/footer configurations if you're not familiar with these aspects. For example, margins may need to be adjusted to accommodate binding, or different headers might be required on left and right pages.

### Customizing the Loaded Class

If you are creating your own class and using `\LoadClass`, it means you are inheriting all the capabilities of `extarticle` but potentially adding or modifying features to suit specific needs, such as:
- Custom margins, header/footer settings.
- Specialized commands that are specific to the type of documents you are producing.
- Additional packages that should be loaded with every use of your custom class.

### Usage Context

This setup is particularly beneficial when you have a specific document layout or style that you want to reuse across multiple documents without resetting the foundational settings each time. This approach helps maintain consistency and efficiency in document preparation.

---

🙋 **You:**

I am changing this value in my pdf and not changing font size
\LoadClass[5pt,twoside]{extarticle}
What else need to modify? Remember that you have Main.tex and Tiqqunazo.cls

---

**Tool:**

Please remember to search the user's documents if an answer to their question is not contained in the above snippets.

---

🤖 **Assistant:**

The `\LoadClass[5pt,twoside]{extarticle}` command in your LaTeX class is supposed to set the default font size to 5pt. If changing this value in your `Tiqqunazo.cls` file does not affect the font size in your document, there could be a few reasons why this issue is occurring:

1. **Overridden Settings in the Main Document**: Check your main `.tex` file to see if the font size is being set there after the document class is declared. If the main document contains commands like `\fontsize`, `\small`, `\large`, etc., applied globally or to specific sections, these will override the font size set in the class file.

2. **Package Conflicts or Custom Font Settings**: Since you're using the `fontspec` package to load and set fonts, ensure that no additional commands are interfering with the base font size. The `fontspec` package might be configuring the font size based on how fonts are defined:
   ```latex
   \setmainfont{DejaVuSansMNerdFontMono-Regular}[SizeFeatures={Size=10}]
   ```
   This example explicitly sets a size, which would override the default size specified in the class. Check for such settings.

3. **Compatibility Issues**: Ensure that the `extarticle` class and the font sizes it supports are compatible with other packages you're using. Sometimes, specific configurations or limitations in one package can prevent another from performing as expected.

To diagnose and resolve this issue, you could try the following steps:

- **Simplify Your Document**: Temporarily comment out non-essential packages and custom settings in your main `.tex` file and recompile to see if the font size changes. This can help identify if a specific package or setting is causing the issue.

- **Check the Class File**: Make sure there are no additional commands inside your `.cls` file that might be setting the font size after `\LoadClass`. Commands nested inside other declarations might reset or override the font size.

- **Test with a Minimal Example**: Create a minimal `.tex` file using your custom class and compile it to see if the font size issue persists. This can help determine if the problem is with the class file itself or with settings in the main document.

Here is a minimal example you can use to test:

```latex
\documentclass{Tiqqunazo} % Make sure this is correctly pointing to your custom class
\begin{document}
Hello, this is a test of font size.
\end{document}
```

If the font size issue is resolved in this minimal setup, the problem likely lies in the settings or packages used in your main document. If not, the issue might be in the class file or in how the `extarticle` class interacts with the font settings.

---

🙋 **You:**

How can I set the section and subsection fonts?
\setmainfont{DejaVuSansMNerdFontMono-Regular}[SizeFeatures={Size=7}] % overrides the Tiqqunazo.cls class size
\newfontfamily\DejaVuSans{DejaVuSansMNerdFontMono-Regular}[Extension=.ttf]
\newfontfamily\FiraRegular{FiraCodeNerdFont-Regular}[Extension=.ttf]
\newfontfamily\HackRegular{HackNerdFont-Regular}[Extension=.ttf]
\titleformat*{\section}{\large\HackRegular}
\titleformat*{\subsection}{\normalsize\HackRegular}
\titleformat*{\subsubsection}{\small\HackRegular}

---

🤖 **Assistant:**

To set the fonts for sections, subsections, and subsubsections in LaTeX, you are correctly using the `titlesec` package. However, it seems like you want to ensure that these settings apply effectively using the fonts you've specified. Here's how you can refine these settings using your provided font families and the `titlesec` package commands.

### Step-by-Step Setup

1. **Ensure the Font Family is Correctly Set Up**:
   Since you are defining new font families, ensure they are correctly referenced when setting the font for the section titles. Here is how you've defined the font families:
   ```latex
   \newfontfamily\DejaVuSans{DejaVuSansMNerdFontMono-Regular}[Extension=.ttf]
   \newfontfamily\FiraRegular{FiraCodeNerdFont-Regular}[Extension=.tt

---

🙋 **You:**

How can I set the section and subsection fonts?
\setmainfont{DejaVuSansMNerdFontMono-Regular}[SizeFeatures={Size=7}] % overrides the Tiqqunazo.cls class size
\newfontfamily\DejaVuSans{DejaVuSansMNerdFontMono-Regular}[Extension=.ttf]
\newfontfamily\FiraRegular{FiraCodeNerdFont-Regular}[Extension=.ttf]
\newfontfamily\HackRegular{HackNerdFont-Regular}[Extension=.ttf]
\titleformat*{\section}{\large\HackRegular}
\titleformat*{\subsection}{\normalsize\HackRegular}
\titleformat*{\subsubsection}{\small\HackRegular}

I think I am missing a default font size for hackregular

---

🤖 **Assistant:**

The issue you're encountering with the font sizes for sections, subsections, and subsubsections seems to be due to the absence of a specific size set for the `HackRegular` font when used in headings. In LaTeX, `large`, `normalsize`, and `small` are size modifiers that scale based on the default document font size, but if the font size isn't explicitly set when defining a new font family, it might not reflect the changes correctly.

To ensure that your headings are displayed with the appropriate font sizes using `HackRegular`, you can specify the size directly when defining the font family or when applying it in the `titleformat` command. Here are the steps you can take:

1. **Define the Font Size in the Font Family**: When you declare your new font family, you can include the font size directly. This is useful if you want all instances of `HackRegular` to be a certain size, but it's less flexible if you want to use the same font at different sizes throughout your document.

   ```latex
   \newfontfamily\HackRegular{HackNerdFont-Regular}[Extension=.ttf, Scale=MatchLowercase]
   ```

   This approach uses the `Scale` option to match the x-height of the current lowercase letters, maintaining relative font size with the main document font. Alternatively, you can use a specific point size:

   ```latex
   \newfontfamily\HackRegular{HackNerdFont-Regular}[Extension=.ttf, SizeFeatures={Size=10}]
   ```

2. **Specify Font Size in `titleformat` Commands**: This method gives you more flexibility, allowing you to set different sizes for different heading levels. You'll adjust the `titleformat` commands to include explicit font size commands:

   ```latex
   \titleformat*{\section}{\fontsize{14pt}{17pt}\selectfont\HackRegular}
   \titleformat*{\subsection}{\fontsize{12pt}{15pt}\selectfont\HackRegular}
   \titleformat*{\subsubsection}{\fontsize{10pt}{12pt}\selectfont\HackRegular}
   ```

   Here, `\fontsize{14pt}{17pt}` sets the font size to 14pt with a 17pt line spacing, which is good for headings. Adjust these values to fit your layout and preference.

3. **Apply Changes and Re-compile**: After updating your commands, recompile your document to see the changes. Make sure that these settings provide the desired appearance, and adjust the sizes as necessary.

These methods ensure that your section titles use the `HackRegular` font at the sizes you want, overriding the default sizes that may not apply correctly due to the global font settings in your document.

---

🙋 **You:**

is \setfont to dejavu sans overriding my hacknerdfont assignation?

---

🤖 **Assistant:**

Yes, setting `\setmainfont` to DejaVu Sans may impact the appearance of your document's main body text, but it should not directly override the font settings for sections, subsections, and subsubsections that you have explicitly defined using `\HackRegular` within the `\titleformat` commands, unless there's a misconfiguration or interference from another package or setting.

Here's how these commands work together:

1. **\setmainfont{DejaVuSansMNerdFontMono-Regular}[SizeFeatures={Size=7}]**: This command sets the default font for the main body of the document to DejaVu Sans Mono Nerd Font at a size of 7pt. This is your document's primary font for all text unless specified otherwise.

2. **\newfontfamily\HackRegular{HackNerdFont-Regular}[Extension=.ttf]**: This command creates a new font family named `\HackRegular` that you can use throughout your document. It does not change the main font but allows you to apply `HackRegular` wherever you specify.

3. **\titleformat** Commands: These commands define the appearance of section headings, subsections, etc. For example:
   ```latex
   \titleformat*{\section}{\large\HackRegular}
   \titleformat*{\subsection}{\normalsize\HackRegular}
   \titleformat*{\subsubsection}{\small\HackRegular}
   ```
   These commands set the headings to use the `HackRegular` font, with size modifiers (`\large`, `\normalsize`, `\small`) that scale based on the default document font size. These settings should override the main document font (DejaVu Sans) for these specific elements.

### Potential Issues
If the headings do not appear as expected, consider the following potential issues:

- **Size Modifiers Not Effective**: The size modifiers (`\large`, `\normalsize`, `\small`) are relative to the base font size set by `\setmainfont`. If 7pt is too small as a base, these modifiers may not create a noticeable size difference. It's better to specify exact sizes in your `\titleformat` commands as previously suggested.

- **Conflict or Inheritance Issues**: Ensure no other settings or packages interfere with these font settings. Sometimes, packages or settings deep in the preamble or class files can cause unexpected behavior.

- **Font Loading Issues**: Verify that the fonts are correctly loaded and that the paths or font names do not contain errors.

### Testing and Debugging
To test and debug the settings:
- **Isolate the Problem**: Comment out other non-essential packages and commands to see if the issue persists.
- **Use Explicit Size Definitions**: As mentioned earlier, specifying exact font sizes in your `\titleformat` commands can help avoid relative size issues:
  ```latex
  \titleformat*{\section}{\fontsize{14pt}{17pt}\selectfont\HackRegular}
  \titleformat*{\subsection}{\fontsize{12pt}{15pt}\selectfont\HackRegular}
  \titleformat*{\subsubsection}{\fontsize{10pt}{12pt}\selectfont\HackRegular}
  ```
- **Compile and Observe**: Make changes one at a time and recompile to see the effect of each change, helping you identify what works and what doesn't.

This approach should help you configure your document exactly as you need, using the specified fonts for the body text and headings.

---

🙋 **You:**

That is how it looks like. Check tiqqunazo.cls again and main.tex and analyze how can I control everything from the class itself and prevent this kind of issues

---

**Tool:**

Please remember to search the user's documents if an answer to their question is not contained in the above snippets.

---

🙋 **You:**

That is how it looks like. Check tiqqunazo.cls again and main.tex and analyze how can I control everything from the class itself and prevent this kind of issues
Main.tex
\documentclass{Tiqqunazo}
\usepackage{lipsum}
\usepackage{epigraph}
\usepackage{booktabs}
\usepackage{enumitem}
\usepackage{emoji}
\usepackage{fontspec}
\usepackage{titlesec}

% Font family definitions
\newfontfamily\DejaVuSans{DejaVuSansMNerdFontMono-Regular}[Extension=.ttf]
\newfontfamily\FiraRegular{FiraCodeNerdFont-Regular}[Extension=.ttf]
\newfontfamily\HackRegular{HackNerdFont-Regular}[Extension=.ttf, SizeFeatures={Size=10}]

\setmainfont{DejaVuSansMNerdFontMono-Regular}[SizeFeatures={Size=6}] % overrides the Tiqqunazo.cls class size
\titleformat*{\section}{\fontsize{10pt}\selectfont\HackRegular}
\titleformat*{\subsection}{\fontsize{10pt}\selectfont\HackRegular}
\titleformat*{\subsubsection}{\fontsize{10pt}\selectfont\HackRegular}
% \makeatletter
% \if@todonotes@disabled
% \newcommand{\hlfix}[2]{#1}
% \else
% \newcommand{\hlfix}[2]{\texthl{#1}\todo{#2}}
% \fi
% \makeatother

\graphicspath{{images/}}
\usepackage[backend=biber,style=numeric,autocite=footnote]{biblatex}
\addbibresource{plantar.bib}

%%%%%%%%%%%%%%%%%%%%%% VALORES DE LA CARÁTULA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\title{LEE ESTO PARA HACER UN CAMBIO REAL} % Cambia el título del documento
\author{La Partida} % Cambia el nombre del autor
%\project{Plantar cara al pasado para imaginar el futuro} % Cambia (u omite) el nombre del proyecto
%\date{} % Cambia el valor de la fecha mostrada por defecto
%\imagefolder{./imagenes} % Cambia de carpeta para buscar imágenes
%\logo{} % Añade la imagen del logotipo a la portada
\version{Versión 1.2} % Cambia el número de versión

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
\clearpage
\begin{sloppypar} % Start of general sloppy environment
\include{prologue}
\end{sloppypar} % End of general sloppy environment
\tableofcontents
\clearpage

\part{Plantar cara al pasado para imaginar el porvenir}
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

\part{Sobre la Acción Crítica}
\include{3-accion-critica/00-cite}
\include{3-accion-critica/01-intro}
\include{3-accion-critica/02-chapter1}
\include{3-accion-critica/03-chapter2}
\include{3-accion-critica/04-chapter3}
\include{3-accion-critica/05-chapter4}

\printbibliography
%\printhelp % Úsalo para ver/imprimir las páginas de ayuda
\end{document}

Tiqqunazo.cls
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
\LoadClass[5pt,twoside]{extarticle}
\RequirePackage[%
  papersize={4.25in,5.5in}, % tamaño de papel media carta
  headheight=12pt %,          % ajuste del tamaño de la cabecera
  % top=0.6in,                % mrgen superior
  % bottom=0.6255in,          % margen inferior
  % left=0.43in,            % margen izquierdo
  % right=0.43in            % margen derecho
  ]{geometry}

% CARGA DE LOS PAQUETES NECESARIOS
  %\RequirePackage[utf8]{inputenc}
  %\RequirePackage[T1]{fontenc}
  \RequirePackage[english,spanish,mexico]{babel}
  \RequirePackage[spanish=mexican]{csquotes}
  \RequirePackage{xparse}
  \RequirePackage{markdown}
  \RequirePackage{graphicx}
  \RequirePackage[table]{xcolor}
  \RequirePackage{tocloft}
  \RequirePackage{parskip}
  \RequirePackage{fancyhdr}
  \RequirePackage{wrapfig2}
  \RequirePackage{titlesec}
  \RequirePackage{fontspec}
  \RequirePackage[hidelinks]{hyperref}
  \RequirePackage{xurl}
  \RequirePackage{ragged2e}

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
  
    % \begin{centering}
    %   \parbox{0.98\linewidth}{\@starttoc{toc}} 
    %   \vspace{10pt}\linebreak
    % \end{centering}
    % \rule{\textwidth}{1pt} 
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
  \parindent1em 
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

---

**Tool:**

Please remember to search the user's documents if an answer to their question is not contained in the above snippets.

---

🤖 **Assistant:**

To centralize control of your LaTeX document setup and prevent issues where configurations like fonts or section formats are overridden in your main document (`Main.tex`), you should consider moving all related configurations into your class file (`Tiqqunazo.cls`). Here's how you can manage the font settings and section formatting directly from your class file:

### 1. **Define Fonts in the Class File**
Instead of defining new font families in `Main.tex`, declare them within `Tiqqunazo.cls`. This ensures that any font changes needed are made directly in the class file, making the document more portable and reducing the need to alter individual documents.

```latex
% In Tiqqunazo.cls
\RequirePackage{fontspec}
\newfontfamily\DejaVuSans{DejaVuSansMNerdFontMono-Regular}[Extension=.ttf]
\newfontfamily\FiraRegular{FiraCodeNerdFont-Regular}[Extension=.ttf]
\newfontfamily\HackRegular{HackNerdFont-Regular}[Extension=.ttf]
```

### 2. **Set Main Document Font in the Class File**
Control the main document font in `Tiqqunazo.cls` to prevent overrides in individual documents. Specify font size features if needed.

```latex
% In Tiqqunazo.cls
\setmainfont{DejaVuSansMNerdFontMono-Regular}[SizeFeatures={Size=10}]
```

### 3. **Control Section Formatting in the Class File**
You should also move any `\titleformat` commands from `Main.tex` to `Tiqqunazo.cls` to ensure consistent styling across documents using this class.

```latex
% In Tiqqunazo.cls
\RequirePackage{titlesec}
\titleformat*{\section}{\fontsize{14pt}{17pt}\selectfont\HackRegular}
\titleformat*{\subsection}{\fontsize{12pt}{15pt}\selectfont\HackRegular}
\titleformat*{\subsubsection}{\fontsize{10pt}{12pt}\selectfont\HackRegular}
```

### 4. **Adjust Document Formatting Directives**
Ensure that any global formatting options, such as margins, page size, or header/footer styles, are also declared in the class file.

### 5. **Encapsulate All Styling Within the Class**
To keep styling consistent and centralized, make sure that `Main.tex` contains only content and minimal layout directives that are specific to the particular document, not general styling.

### 6. **Documentation and Comments**
It’s helpful to comment extensively in the class file explaining each section and its purpose so that modifications can be made easily in the future. Also, consider adding user documentation within the class file to guide other users in how to use it effectively.

By following these steps, you centralize control and reduce the risk of documents deviating from the intended format and style, making maintenance and updates easier and ensuring consistency across all documents using the `Tiqqunazo` class.

---

🙋 **You:**

Now all styling is in here. Why HackRegular and its defined size of 10 are not displaying properly?
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

% ESTABLECE LAS DIMENSIONES DE LA PÁGINA (y de la mainfont?)
\LoadClass[5pt,twoside]{extarticle}
% Packages Loading
\RequirePackage[%
  papersize={4.25in,5.5in}, % tamaño de papel media carta
  % headheight=12pt %,          % ajuste del tamaño de la cabecera
  % top=0.6in,                % mrgen superior
  % bottom=0.6255in,          % margen inferior
  % left=0.43in,            % margen izquierdo
  % right=0.43in            % margen derecho
  ]{geometry}
\RequirePackage[english,spanish,mexico]{babel}
\RequirePackage[spanish=mexican]{csquotes}
\RequirePackage{xparse}
\RequirePackage{markdown}
\RequirePackage{graphicx}
\RequirePackage[table]{xcolor}
\RequirePackage{tocloft}
\RequirePackage{parskip}
\RequirePackage{fancyhdr}
\RequirePackage{wrapfig2}
% Font family definitions
\RequirePackage{fontspec}
\newfontfamily\DejaVuSans{DejaVuSansMNerdFontMono-Regular}[Extension=.ttf]
\newfontfamily\FiraRegular{FiraCodeNerdFont-Regular}[Extension=.ttf]
\newfontfamily\HackRegular{HackNerdFont-Regular}[Extension=.ttf, SizeFeatures={Size=10}]
\setmainfont{DejaVuSansMNerdFontMono-Regular}[SizeFeatures={Size=6}] % overrides the Tiqqunazo.cls class size

% Title fonts
\RequirePackage{titlesec}
\titleformat*{\section}{\fontsize{10pt}\selectfont\HackRegular}
\titleformat*{\subsection}{\fontsize{10pt}\selectfont\HackRegular}
\titleformat*{\subsubsection}{\fontsize{10pt}\selectfont\HackRegular}

\RequirePackage[hidelinks]{hyperref}
\RequirePackage{xurl}
\RequirePackage{ragged2e}
\RequirePackage{lipsum} % TODO: Remove
\RequirePackage{epigraph}
\RequirePackage{booktabs}
\RequirePackage{enumitem}
\RequirePackage{emoji}
\RequirePackage{fontspec}
\RequirePackage{titlesec}

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
  
    % \begin{centering}
    %   \parbox{0.98\linewidth}{\@starttoc{toc}} 
    %   \vspace{10pt}\linebreak
    % \end{centering}
    % \rule{\textwidth}{1pt} 
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
  \parindent1em 
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

---

**Tool:**

Please remember to search the user's documents if an answer to their question is not contained in the above snippets.

---

🤖 **Assistant:**

It appears that `HackRegular` is not displaying properly because it might not be getting applied correctly within your class or document settings. Here are a few points to check and possible solutions:

1. **Font Loading and Command Redefinition:** Ensure that the font is correctly loaded in the `Tiqqunazo.cls` file and there are no overriding commands in `Main.tex` that might be interfering with the application of `HackRegular` to your section titles. Since you have defined `\HackRegular` with a specific size using `SizeFeatures={Size=10}`, ensure that this specification is not being negated elsewhere in your documents.

2. **Title Formatting:** You are using `\titleformat*` from the `titlesec` package to set the fonts for sections, subsections, etc. Verify that these commands are placed correctly and not being overridden. You might want to remove the `*` in `\titleformat*` to ensure the settings apply to all start and following formatting consistently. For example:
   ```latex
   \titleformat{\section}{\fontsize{10pt}{12pt}\selectfont\HackRegular}{}{0em}{}
   ```

3. **Package Conflicts or Order of Commands:** Check for any conflicts or the order in which packages are loaded. The order of package loading can sometimes lead to unexpected results. Make sure `fontspec` and `titlesec` are loaded before any font definitions and custom formatting.

4. **Explicit Font Size and Family:** You might be setting `\HackRegular` with a specific size but also overriding it when applying to section formats. Use `\fontsize{10pt}{12pt}\selectfont` within `\titleformat` to ensure that the font size and leading are correctly applied.

5. **Testing Changes:** After making changes in the `.cls` or `.tex` files, compile the document to see if the desired style is applied. Sometimes, multiple compilations are needed when using LaTeX to update all references and formatting changes.

If these adjustments don't resolve the issue, it could be beneficial to include logging commands within your `.tex` files to debug how fonts and formats are being applied, especially if you suspect certain settings aren't being carried through the compilation process.

---

🙋 **You:**

setmainfont overrides or conflicts with titleformat?

---

🤖 **Assistant:**

Using `\setmainfont` in conjunction with `\titleformat` from the `titlesec` package does not inherently cause conflicts, but the way they interact can affect your document's typesetting if not carefully managed.

Here’s how they generally work:

- **`\setmainfont`**: This command, provided by the `fontspec` package, sets the default font for the entire document. This setting applies to all text unless explicitly overridden by local commands.

- **`\titleformat`**: This command from the `titlesec` package is used to specify the formatting of sectional headings (like chapters, sections, subsections, etc.). It allows you to define the font, size, spacing, and other properties specific to these headings.

### How They Interact

1. **Base Font Setting**: When you set a font with `\setmainfont`, it establishes the default appearance for all text. This default can be overridden for specific text elements.

2. **Local Overrides**: With `\titleformat`, you can specify a different font just for your headings. This specification should override the base font settings for those particular sections. For example, if you set the main font to `DejaVuSans` but specify `HackRegular` for your headings, `HackRegular` should appear in the headings despite the main body text being in `DejaVuSans`.

### Potential Issues and Solutions

- **Font Size Not Applying**: If you notice that the size specifications in `\titleformat` don't seem to take effect, it might be due to missing or incorrect size commands in the formatting definition. Ensure you use `\fontsize{size}{line spacing}\selectfont` to explicitly set the font size and line spacing.

- **Font Family Not Changing**: If the font doesn’t change as expected in your section titles, make sure that the font is correctly loaded with `\newfontfamily` and that you are applying it correctly in `\titleformat`.

- **Command Conflict**: Rarely, the order of commands or the way packages are loaded can affect settings. Make sure `fontspec` and `titlesec` are loaded at the right points in your preamble, and that font definitions are placed after `fontspec` is loaded but before they are applied in `\titleformat`.

- **Caching Issues**: Sometimes, LaTeX editors hold on to older settings due to caching issues. Fully recompiling the document (sometimes more than once) can resolve unexpected behavior.

Here’s a correct setup example:
```latex
\documentclass{article}
\usepackage{fontspec}
\usepackage{titlesec}

\setmainfont{DejaVuSansMono-Regular.ttf}[Scale=MatchLowercase]
\newfontfamily\SectionFont{HackNerdFont-Regular.ttf}[Scale=MatchLowercase]

\titleformat{\section}
  {\normalfont\SectionFont\fontsize{12pt}{15pt}\selectfont}
  {\thesection}{1em}{}

\begin{document}
\section{Introduction}
This is some text in the document.
\end{document}
```

Ensure that any font changes or size specifications are clearly defined and correctly placed within your LaTeX documents or classes to avoid unintended results.

---

🙋 **You:**

Provide an up-to-date tutorial on how to modify the fonts for paragraphs and sections, subsections. Explain all I need to know to understand Tiqqunazo.cls

---

🤖 **Assistant:**

Certainly! Below, I’ll provide a detailed tutorial on modifying fonts for paragraphs and sections, subsections, and other elements in a LaTeX document, specifically tailored to a class file like `Tiqqunazo.cls`. This will include an overview of relevant packages and commands used in the `Tiqqunazo.cls` to help you understand and customize it effectively.

### Understanding Font Management in LaTeX

**1. Packages Needed**
- **`fontspec`**: Essential for loading and setting fonts when using XeLaTeX or LuaLaTeX, which are recommended for modern font management because they support TrueType and OpenType fonts.
- **`titlesec`**: Used to customize the titles of sections, subsections, etc., allowing for detailed control over their appearance.

**2. Setting the Document's Main Font**
To set the main font of the document, you use the `\setmainfont` command provided by the `fontspec` package. This sets the default font for the entire document unless specifically overridden.

```latex
\usepackage{fontspec}
\setmainfont{DejaVuSansMono-Regular.ttf}[Scale=MatchLowercase]
```

**3. Defining Additional Font Families**
If you want to use different fonts for different parts of your document (like headings), define them with `\newfontfamily`. 

```latex
\newfontfamily\SectionFont{HackNerdFont-Regular.ttf}[Scale=MatchLowercase]
```

### Customizing Section Titles Using `titlesec`

**1. Basic Usage**
The `titlesec` package allows you to define the format of sectional units. Here’s a basic example of setting up section titles with a custom font:

```latex
\usepackage{titlesec}
\titleformat{\section}
  {\normalfont\SectionFont\fontsize{12pt}{15pt}\selectfont}
  {\thesection}{1em}{}
```

- **`\normalfont\SectionFont`**: Applies the `SectionFont` defined earlier.
- **`\fontsize{12pt}{15pt}\selectfont`**: Sets the font size to 12pt and the line spacing to 15pt.
- **`{\thesection}`**: Specifies what gets printed as the label, here the section number.
- **`{1em}`**: The separation between the title label and title text.
- **`{}`**: The title formatting that follows the label.

**2. Advanced Customization**
You can further customize headings to include before and after spacing, specific color, or even conditions like numbering styles or inclusion in the Table of Contents.

```latex
\titleformat{\subsection}
  {\normalfont\SectionFont\color{blue}\fontsize{10pt}{13pt}\selectfont}
  {\thesubsection}{1em}{}
\titlespacing*{\subsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
```

- **`\color{blue}`**: Changes the font color to blue for subsection titles.
- **`{0pt}`**: No indentation from the left margin.
- **`{3.25ex plus 1ex minus .2ex}`**: Space before the subsection title.
- **`{1.5ex plus .2ex}`**: Space after the subsection title.

### Applying Changes in `Tiqqunazo.cls`

To apply these changes consistently across documents using the `Tiqqunazo.cls`, you should define these settings within the class file itself. This centralizes the formatting rules, ensuring that every document using this class file adheres to the same styling guidelines.

### Final Thoughts

By understanding and utilizing `fontspec` and `titlesec`, you can achieve a high level of customization over your document's typography in LaTeX. Make sure to test the class file with a simple document after changes to see the effects and ensure there are no compilation errors. Also, document any changes in the class file for future reference or other users.

This setup should give you full control over the typography in your documents using the `Tiqqunazo.cls`, making your documents both professional and consistent.

---

🙋 **You:**

Check this http://mirrors.ctan.org/macros/unicodetex/latex/fontspec/fontspec.pdf and this http://mirrors.ctan.org/macros/latex/contrib/titlesec/titlesec.pdf and tell me what is wrong with my declarations

% Font family definitions
\RequirePackage{fontspec}
\newfontfamily{\DejaVuSans}{DejaVuSansMNerdFontMono-Regular.ttf}
\newfontfamily{\FiraRegular}{FiraCodeNerdFont-Regular.ttf}
\newfontfamily{\HackRegular}{HackNerdFont-Regular.ttf}

% Title fonts
\RequirePackage{titlesec}
\titleformat*{\section}{\HackRegular}
\titleformat*{\subsection}{\HackRegular}
\titleformat*{\subsubsection}{\HackRegular}

%\setmainfont{\DejaVuSans}[SizeFeatures={Size=6}] % overrides the Tiqqunazo.cls class size

---

🤖 **Assistant:**

Reviewing your font and section title formatting declarations in LaTeX, let's ensure they conform to the guidelines and capabilities outlined in the `fontspec` and `titlesec` documentation. Here's a detailed analysis and potential adjustments needed:

### Font Family Definitions

Your declarations for font families look mostly correct, assuming that the font files are correctly installed or accessible to LaTeX. Here's the standard syntax you've used, which is correct:

```latex
\newfontfamily{\DejaVuSans}{DejaVuSansMNerdFontMono-Regular.ttf}
\newfontfamily{\FiraRegular}{FiraCodeNerdFont-Regular.ttf}
\newfontfamily{\HackRegular}{HackNerdFont-Regular.ttf}
```

### Title Fonts and Section Formatting

When using `titlesec` to format sectional headings with specific fonts, you need to ensure that the commands also set the font size and other properties explicitly if needed, as these are not just about changing the font face but often require adjustments to the font size, weight, and spacing.

Here's what you have:
```latex
\titleformat*{\section}{\HackRegular}
\titleformat*{\subsection}{\HackRegular}
\titleformat*{\subsubsection}{\HackRegular}
```

### Potential Issues and Corrections

1. **Lack of Font Size and Style**: The commands you've used for `titleformat*` correctly change the font to `\HackRegular`, but they don't specify the font size or other style attributes. This might lead to inconsistent font sizing or styling across different sections or compared to the rest of the document. 

    To correct this, you might consider adding size, weight, and spacing details, like so:
    ```latex
    \titleformat{\section}
      {\HackRegular\Large\bfseries} % Large, bold
      {\thesection}{1em}{}
    \titleformat{\subsection}
      {\HackRegular\normalsize\bfseries} % Normal size, bold
      {\thesubsection}{1em}{}
    \titleformat{\subsubsection}
      {\HackRegular\small\bfseries} % Small, bold
      {\thesubsubsection}{1em}{}
    ```

    This sets different sizes and ensures the sections are bold, which is typical for section headings.

2. **Font Features and Sizes**: If you want to apply specific features like font size directly from the font family definition, you can use options in `\newfontfamily`. However, this isn't shown in your setup, and typically, it’s more flexible to set sizes explicitly in the context where the font is used, such as in `titleformat`.

3. **Uncommenting `\setmainfont`**: Your commented-out `\setmainfont` would set the main body font, which is a common practice. If you want to use `\DejaVuSans` as your document's main font, ensure to uncomment and correctly configure it:
    ```latex
    \setmainfont{DejaVuSansMNerdFontMono-Regular.ttf}[Scale=MatchLowercase, SizeFeatures={Size=10}]
    ```

    Adjust the `SizeFeatures` as needed, or set specific font sizes in different contexts using `\fontsize`.

### Best Practices

- **Consistency in Font Sizes**: Make sure that the font sizes are consistent and appropriate for the layout of your document.
- **Documentation**: Check the `fontspec` and `titlesec` documentation for more detailed options like line spacing (`\titlespacing`) or specific styling conditions.

Implementing these corrections will help in maintaining a uniform appearance for your document's section headings and ensure they integrate well with the overall typographic hierarchy.

---

🙋 **You:**

This is LuaHBTeX, Version 1.16.0 (TeX Live 2023)  (format=lualatex 2024.2.22)  8 MAY 2024 20:23
 restricted system commands enabled.
**Main
(./Main.tex
LaTeX2e <2022-11-01> patch level 1
Lua module: luaotfload 2022-10-03 3.23 Lua based OpenType font support
Lua module: lualibs 2022-10-04 2.75 ConTeXt Lua standard libraries.
Lua module: lualibs-extended 2022-10-04 2.75 ConTeXt Lua libraries -- extended c
ollection.
luaotfload | conf : Root cache directory is "/Users/angel.mora.mx/Library/texliv
e/2023/texmf-var/luatex-cache/generic/names".
luaotfload | init : Loading fontloader "fontloader-2022-10-03.lua" from kpse-res
olved path "/usr/local/texlive/2023/texmf-dist/tex/luatex/luaotfload/fontloader-
2022-10-03.lua".
Lua-only attribute luaotfload@noligature = 1
luaotfload | init : Context OpenType loader version 3.120
Inserting `luaotfload.node_processor' in `pre_linebreak_filter'.
Inserting `luaotfload.node_processor' in `hpack_filter'.
Inserting `luaotfload.glyph_stream' in `glyph_stream_provider'.
Inserting `luaotfload.define_font' in `define_font'.
Lua-only attribute luaotfload_color_attribute = 2
luaotfload | conf : Root cache directory is "/Users/angel.mora.mx/Library/texliv
e/2023/texmf-var/luatex-cache/generic/names".
Inserting `luaotfload.harf.strip_prefix' in `find_opentype_file'.
Inserting `luaotfload.harf.strip_prefix' in `find_truetype_file'.
Removing  `luaotfload.glyph_stream' from `glyph_stream_provider'.
Inserting `luaotfload.harf.glyphstream' in `glyph_stream_provider'.
Inserting `luaotfload.harf.finalize_vlist' in `post_linebreak_filter'.
Inserting `luaotfload.harf.finalize_hlist' in `hpack_filter'.
Inserting `luaotfload.cleanup_files' in `wrapup_run'.
Inserting `luaotfload.harf.finalize_unicode' in `finish_pdffile'.
Inserting `luaotfload.glyphinfo' in `glyph_info'.
Lua-only attribute luaotfload.letterspace_done = 3
Inserting `luaotfload.aux.set_sscale_dimens' in `luaotfload.patch_font'.
Inserting `luaotfload.aux.set_font_index' in `luaotfload.patch_font'.
Inserting `luaotfload.aux.patch_cambria_domh' in `luaotfload.patch_font'.
Inserting `luaotfload.aux.fixup_fontdata' in `luaotfload.patch_font_unsafe'.
Inserting `luaotfload.aux.set_capheight' in `luaotfload.patch_font'.
Inserting `luaotfload.aux.set_xheight' in `luaotfload.patch_font'.
Inserting `luaotfload.rewrite_fontname' in `luaotfload.patch_font'. L3 programm
ing layer <2023-02-22>
Inserting `tracingstacklevels' in `input_level_string'. (./Tiqqunazo.cls
Document Class: Tiqqunazo 2023 Project Documentation LaTeX class
(/usr/local/texlive/2023/texmf-dist/tex/latex/extsizes/extarticle.cls
Document Class: extarticle 1996/10/08 v1.0 Non Standard LaTeX document class
(/usr/local/texlive/2023/texmf-dist/tex/latex/extsizes/size8.clo
File: size8.clo 1999/11/11 v1.4a NON-Standard LaTeX file (size option)
luaotfload | db : Font names database loaded from /Users/angel.mora.mx/Library/t
exlive/2023/texmf-var/luatex-cache/generic/names/luaotfload-names.luc.gz)
(/usr/local/texlive/2023/texmf-dist/tex/latex/base/exscale.sty
Package: exscale 2018/09/24 v2.1i Standard LaTeX package exscale
LaTeX Font Info:    Redeclaring symbol font `largesymbols' on input line 57.
LaTeX Font Info:    Overwriting symbol font `largesymbols' in version `normal'
(Font)                  OMX/cmex/m/n --> OMX/cmex/m/n on input line 57.
LaTeX Font Info:    Overwriting symbol font `largesymbols' in version `bold'
(Font)                  OMX/cmex/m/n --> OMX/cmex/m/n on input line 57.
\big@size=\dimen139
)
\c@part=\count183
\c@section=\count184
\c@subsection=\count185
\c@subsubsection=\count186
\c@paragraph=\count187
\c@subparagraph=\count188
\c@figure=\count189
\c@table=\count190
\abovecaptionskip=\skip48
\belowcaptionskip=\skip49
\bibindent=\dimen140
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/geometry/geometry.sty
Package: geometry 2020/01/02 v5.9 Page Geometry

(/usr/local/texlive/2023/texmf-dist/tex/latex/graphics/keyval.sty
Package: keyval 2022/05/29 v1.15 key=value parser (DPC)
\KV@toks@=\toks16
)
(/usr/local/texlive/2023/texmf-dist/tex/generic/iftex/ifvtex.sty
Package: ifvtex 2019/10/25 v1.7 ifvtex legacy package. Use iftex instead.

(/usr/local/texlive/2023/texmf-dist/tex/generic/iftex/iftex.sty
Package: iftex 2022/02/03 v1.0f TeX engine tests
))
\Gm@cnth=\count191
\Gm@cntv=\count192
\c@Gm@tempcnt=\count193
\Gm@bindingoffset=\dimen141
\Gm@wd@mp=\dimen142
\Gm@odd@mp=\dimen143
\Gm@even@mp=\dimen144
\Gm@layoutwidth=\dimen145
\Gm@layoutheight=\dimen146
\Gm@layouthoffset=\dimen147
\Gm@layoutvoffset=\dimen148
\Gm@dimlist=\toks17
)
(/usr/local/texlive/2023/texmf-dist/tex/generic/babel/babel.sty
Package: babel 2023/02/13 3.86 The Babel package

(/usr/local/texlive/2023/texmf-dist/tex/generic/babel/luababel.def
\bbl@readstream=\read2
\l@dumylang=\language2
Package babel Info: Non-standard hyphenation setup on input line 118.
\l@nohyphenation=\language3
\l@german-x-2023-03-06=\language4
\l@ngerman-x-2023-03-06=\language5
\l@afrikaans=\language6
\l@ancientgreek=\language7
\l@ibycus=\language8
\l@arabic=\language9
\l@armenian=\language10
\l@basque=\language11
\l@belarusian=\language12
\l@bulgarian=\language13
\l@catalan=\language14
\l@pinyin=\language15
\l@churchslavonic=\language16
\l@coptic=\language17
\l@croatian=\language18
\l@czech=\language19
\l@danish=\language20
\l@dutch=\language21
\l@ukenglish=\language22
\l@usenglishmax=\language23
\l@esperanto=\language24
\l@estonian=\language25
\l@ethiopic=\language26
\l@farsi=\language27
\l@finnish=\language28
\l@schoolfinnish=\language29
\l@french=\language30
\l@friulan=\language31
\l@galician=\language32
\l@georgian=\language33
\l@german=\language34
\l@ngerman=\language35
\l@swissgerman=\language36
\l@greek=\language37
\l@monogreek=\language38
\l@hungarian=\language39
\l@icelandic=\language40
\l@assamese=\language41
\l@bengali=\language42
\l@gujarati=\language43
\l@hindi=\language44
\l@kannada=\language45
\l@malayalam=\language46
\l@marathi=\language47
\l@oriya=\language48
\l@pali=\language49
\l@panjabi=\language50
\l@tamil=\language51
\l@telugu=\language52
\l@indonesian=\language53
\l@interlingua=\language54
\l@irish=\language55
\l@italian=\language56
\l@kurmanji=\language57
\l@classiclatin=\language58
\l@latin=\language59
\l@liturgicallatin=\language60
\l@latvian=\language61
\l@lithuanian=\language62
\l@macedonian=\language63
\l@mongolian=\language64
\l@mongolianlmc=\language65
\l@bokmal=\language66
\l@nynorsk=\language67
\l@occitan=\language68
\l@piedmontese=\language69
\l@polish=\language70
\l@portuguese=\language71
\l@romanian=\language72
\l@romansh=\language73
\l@russian=\language74
\l@sanskrit=\language75
\l@serbian=\language76
\l@serbianc=\language77
\l@slovak=\language78
\l@slovenian=\language79
\l@spanish=\language80
\l@swedish=\language81
\l@thai=\language82
\l@turkish=\language83
\l@turkmen=\language84
\l@ukrainian=\language85
\l@uppersorbian=\language86
\l@welsh=\language87
\babelcatcodetablenum=\catcodetable12
\bbl@pattcodes=\catcodetable13
)
\babel@savecnt=\count194
\U@D=\dimen149
\l@unhyphenated=\language88

(/usr/local/texlive/2023/texmf-dist/tex/generic/babel/luababel.def
\bbl@attr@locale=\attribute4
)
(/usr/local/texlive/2023/texmf-dist/tex/generic/babel-english/english.ldf
Language: english 2017/06/06 v3.3r English support from the babel system
Package babel Info: Hyphen rules for 'canadian' set to \l@english
(babel)             (\language0). Reported on input line 102.
Package babel Info: Hyphen rules for 'australian' set to \l@ukenglish
(babel)             (\language22). Reported on input line 105.
Package babel Info: Hyphen rules for 'newzealand' set to \l@ukenglish
(babel)             (\language22). Reported on input line 108.
)
(/usr/local/texlive/2023/texmf-dist/tex/generic/babel-spanish/spanish.ldf
Language: spanish.ldf 2021/05/27 v5.0q Spanish support from the babel system
\es@quottoks=\toks18
\es@quotdepth=\count195
Package babel Info: Making " an active character on input line 570.

(/usr/local/texlive/2023/texmf-dist/tex/generic/hyph-utf8/loadhyph/loadhyph-es.
tex UTF-8 Spanish hyphenation patterns
(/usr/local/texlive/2023/texmf-dist/tex/generic/hyph-utf8/patterns/tex/hyph-es.
tex))))
(/usr/local/texlive/2023/texmf-dist/tex/generic/babel/locale/es/babel-spanish.t
ex
Package babel Info: Importing font and identification data for spanish
(babel)             from babel-es.ini. Reported on input line 11.
)
(/usr/local/texlive/2023/texmf-dist/tex/generic/babel/locale/en/babel-english.t
ex
Package babel Info: Importing font and identification data for english
(babel)             from babel-en.ini. Reported on input line 11.
) (/usr/local/texlive/2023/texmf-dist/tex/latex/csquotes/csquotes.sty
Package: csquotes 2022-09-14 v5.2n context-sensitive quotations (JAW)

(/usr/local/texlive/2023/texmf-dist/tex/latex/etoolbox/etoolbox.sty
Package: etoolbox 2020/10/05 v2.5k e-TeX tools for LaTeX (JAW)
\etb@tempcnta=\count196
)
\csq@reset=\count197
\csq@gtype=\count198
\csq@glevel=\count199
\csq@qlevel=\count266
\csq@maxlvl=\count267
\csq@tshold=\count268
\csq@ltx@everypar=\toks19

(/usr/local/texlive/2023/texmf-dist/tex/latex/csquotes/csquotes.def
File: csquotes.def 2022-09-14 v5.2n csquotes generic definitions (JAW)
)
Package csquotes Info: Trying to load configuration file 'csquotes.cfg'...
Package csquotes Info: ... configuration file loaded successfully.

(/usr/local/texlive/2023/texmf-dist/tex/latex/csquotes/csquotes.cfg
File: csquotes.cfg 
)
Package csquotes Info: Redefining alias 'spanish' -> 'spanish/mexican'.
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/l3packages/xparse/xparse.sty
(/usr/local/texlive/2023/texmf-dist/tex/latex/l3kernel/expl3.sty
Package: expl3 2023-02-22 L3 programming layer (loader) 

(/usr/local/texlive/2023/texmf-dist/tex/latex/l3backend/l3backend-luatex.def
File: l3backend-luatex.def 2023-01-16 L3 backend support: PDF output (LuaTeX)
\l__color_backend_stack_int=\count269
\l__pdf_internal_box=\box51
))
Package: xparse 2023-02-02 L3 Experimental document command parser
) (/usr/local/texlive/2023/texmf-dist/tex/latex/markdown/markdown.sty
(/usr/local/texlive/2023/texmf-dist/tex/generic/markdown/markdown.tex
\markdownOptionFrozenCacheCounter=\count270
\markdownInputFileStream=\read3
\markdownOutputFileStream=\write3
Package markdown Info: Using mode 3: The lt3luabridge package on input line 258
0.

(/usr/local/texlive/2023/texmf-dist/tex/generic/lt3luabridge/lt3luabridge.tex
\g_luabridge_method_int=\count271

Package luabridge Info: Using direct Lua access as the bridging method

))
Package: markdown 2023-02-28 v2.21.0-0-gee15b88 markdown renderer
(/usr/local/texlive/2023/texmf-dist/tex/latex/paralist/paralist.sty
Package: paralist 2017/01/22 v2.7 Extended list environments
\pltopsep=\skip50
\plpartopsep=\skip51
\plitemsep=\skip52
\plparsep=\skip53
\pl@lab=\toks20
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/amsmath/amsmath.sty
Package: amsmath 2022/04/08 v2.17n AMS math features
\@mathmargin=\skip54

For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2023/texmf-dist/tex/latex/amsmath/amstext.sty
Package: amstext 2021/08/26 v2.01 AMS text

(/usr/local/texlive/2023/texmf-dist/tex/latex/amsmath/amsgen.sty
File: amsgen.sty 1999/11/30 v2.0 generic functions
\@emptytoks=\toks21
\ex@=\dimen150
))
(/usr/local/texlive/2023/texmf-dist/tex/latex/amsmath/amsbsy.sty
Package: amsbsy 1999/11/29 v1.2d Bold Symbols
\pmbraise@=\dimen151
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/amsmath/amsopn.sty
Package: amsopn 2022/04/08 v2.04 operator names
)
\inf@bad=\count272
LaTeX Info: Redefining \frac on input line 236.
\uproot@=\count273
\leftroot@=\count274
LaTeX Info: Redefining \overline on input line 399.
LaTeX Info: Redefining \colon on input line 410.
\classnum@=\count275
\DOTSCASE@=\count276
LaTeX Info: Redefining \ldots on input line 496.
LaTeX Info: Redefining \dots on input line 499.
LaTeX Info: Redefining \cdots on input line 620.
\Mathstrutbox@=\box52
\strutbox@=\box53
LaTeX Info: Redefining \big on input line 722.
LaTeX Info: Redefining \Big on input line 723.
LaTeX Info: Redefining \bigg on input line 724.
LaTeX Info: Redefining \Bigg on input line 725.
\big@size=\dimen152
LaTeX Font Info:    Redeclaring font encoding OML on input line 743.
LaTeX Font Info:    Redeclaring font encoding OMS on input line 744.
\macc@depth=\count277
LaTeX Info: Redefining \bmod on input line 905.
LaTeX Info: Redefining \pmod on input line 910.
LaTeX Info: Redefining \smash on input line 940.
LaTeX Info: Redefining \relbar on input line 970.
LaTeX Info: Redefining \Relbar on input line 971.
\c@MaxMatrixCols=\count278
\dotsspace@=\muskip16
\c@parentequation=\count279
\dspbrk@lvl=\count280
\tag@help=\toks22
\row@=\count281
\column@=\count282
\maxfields@=\count283
\andhelp@=\toks23
\eqnshift@=\dimen153
\alignsep@=\dimen154
\tagshift@=\dimen155
\tagwidth@=\dimen156
\totwidth@=\dimen157
\lineht@=\dimen158
\@envbody=\toks24
\multlinegap=\skip55
\multlinetaggap=\skip56
\mathdisplay@stack=\toks25
LaTeX Info: Redefining \[ on input line 2953.
LaTeX Info: Redefining \] on input line 2954.
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/amsfonts/amssymb.sty
Package: amssymb 2013/01/14 v3.01 AMS font symbols

(/usr/local/texlive/2023/texmf-dist/tex/latex/amsfonts/amsfonts.sty
Package: amsfonts 2013/01/14 v3.01 Basic AMSFonts support
\symAMSa=\mathgroup4
\symAMSb=\mathgroup5
LaTeX Font Info:    Redeclaring math symbol \hbar on input line 98.
LaTeX Font Info:    Overwriting math alphabet `\mathfrak' in version `bold'
(Font)                  U/euf/m/n --> U/euf/b/n on input line 106.
))
(/usr/local/texlive/2023/texmf-dist/tex/latex/csvsimple/csvsimple.sty
(/usr/local/texlive/2023/texmf-dist/tex/latex/l3packages/l3keys2e/l3keys2e.sty
Package: l3keys2e 2023-02-02 LaTeX2e option processing using LaTeX3 keys
)
Package: csvsimple 2022/09/20 v2.3.2 LaTeX CSV file processing
) (/usr/local/texlive/2023/texmf-dist/tex/latex/csvsimple/csvsimple-legacy.sty
Package: csvsimple-legacy 2022/09/20 version 2.3.2 LaTeX2e CSV file processing

(/usr/local/texlive/2023/texmf-dist/tex/latex/pgf/utilities/pgfrcs.sty
(/usr/local/texlive/2023/texmf-dist/tex/generic/pgf/utilities/pgfutil-common.te
x
\pgfutil@everybye=\toks26
\pgfutil@tempdima=\dimen159
\pgfutil@tempdimb=\dimen160
)
(/usr/local/texlive/2023/texmf-dist/tex/generic/pgf/utilities/pgfutil-latex.def
\pgfutil@abb=\box54
) (/usr/local/texlive/2023/texmf-dist/tex/generic/pgf/utilities/pgfrcs.code.tex
(/usr/local/texlive/2023/texmf-dist/tex/generic/pgf/pgf.revision.tex)
Package: pgfrcs 2023-01-15 v3.1.10 (3.1.10)
))
(/usr/local/texlive/2023/texmf-dist/tex/latex/pgf/utilities/pgfkeys.sty
(/usr/local/texlive/2023/texmf-dist/tex/generic/pgf/utilities/pgfkeys.code.tex
\pgfkeys@pathtoks=\toks27
\pgfkeys@temptoks=\toks28

(/usr/local/texlive/2023/texmf-dist/tex/generic/pgf/utilities/pgfkeyslibraryfil
tered.code.tex
\pgfkeys@tmptoks=\toks29
))) (/usr/local/texlive/2023/texmf-dist/tex/latex/base/ifthen.sty
Package: ifthen 2022/04/13 v1.1d Standard LaTeX ifthen package (DPC)
) (/usr/local/texlive/2023/texmf-dist/tex/latex/tools/shellesc.sty
Package: shellesc 2019/11/08 v1.0c unified shell escape interface for LaTeX
Package shellesc Info: Restricted shell escape enabled on input line 77.
)
\csv@file=\read4
\c@csvinputline=\count284
\c@csvrow=\count285
\c@csvcol=\count286
\csv@out=\write4
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/fancyvrb/fancyvrb.sty
Package: fancyvrb 2023/01/19 4.5a verbatim text (tvz,hv)
\FV@CodeLineNo=\count287
\FV@InFile=\read5
\FV@TabBox=\box55
\c@FancyVerbLine=\count288
\FV@StepNumber=\count289
\FV@OutFile=\write5
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/graphics/graphicx.sty
Package: graphicx 2021/09/16 v1.2d Enhanced LaTeX Graphics (DPC,SPQR)

(/usr/local/texlive/2023/texmf-dist/tex/latex/graphics/graphics.sty
Package: graphics 2022/03/10 v1.4e Standard LaTeX Graphics (DPC,SPQR)

(/usr/local/texlive/2023/texmf-dist/tex/latex/graphics/trig.sty
Package: trig 2021/08/11 v1.11 sin cos tan (DPC)
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/graphics-cfg/graphics.cfg
File: graphics.cfg 2016/06/04 v1.11 sample graphics configuration
)
Package graphics Info: Driver file: luatex.def on input line 107.

(/usr/local/texlive/2023/texmf-dist/tex/latex/graphics-def/luatex.def
File: luatex.def 2022/09/22 v1.2d Graphics/color driver for luatex
))
\Gin@req@height=\dimen161
\Gin@req@width=\dimen162
)
(/usr/local/texlive/2023/texmf-dist/tex/generic/ltxcmds/ltxcmds.sty
Package: ltxcmds 2020-05-10 v1.25 LaTeX kernel commands for general use (HO)
)
\markdownLaTeXCitationsCounter=\count290

(/usr/local/texlive/2023/texmf-dist/tex/generic/gobble/gobble.sty
Package: gobble 2019/01/04 v0.2 Provides more gobble macros

(/usr/local/texlive/2023/texmf-dist/tex/generic/gobble/gobble.tex))
(/usr/local/texlive/2023/texmf-dist/tex/latex/url/url.sty
\Urlmuskip=\muskip17
Package: url 2013/09/16  ver 3.4  Verb mode for urls, etc.
)
\markdownLaTeXRowCounter=\count291
\markdownLaTeXRowTotal=\count292
\markdownLaTeXColumnCounter=\count293
\markdownLaTeXColumnTotal=\count294
\markdownLaTeXTable=\toks30
\markdownLaTeXTableAlignment=\toks31
\markdownLaTeXTableEnd=\toks32
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/xcolor/xcolor.sty
Package: xcolor 2022/06/12 v2.14 LaTeX color extensions (UK)

(/usr/local/texlive/2023/texmf-dist/tex/latex/graphics-cfg/color.cfg
File: color.cfg 2016/01/02 v1.6 sample color configuration
)
Package xcolor Info: Driver file: luatex.def on input line 227.

(/usr/local/texlive/2023/texmf-dist/tex/latex/colortbl/colortbl.sty
Package: colortbl 2022/06/20 v1.0f Color table columns (DPC)

(/usr/local/texlive/2023/texmf-dist/tex/latex/tools/array.sty
Package: array 2022/09/04 v2.5g Tabular extension package (FMi)
\col@sep=\dimen163
\ar@mcellbox=\box56
\extrarowheight=\dimen164
\NC@list=\toks33
\extratabsurround=\skip57
\backup@length=\skip58
\ar@cellbox=\box57
)
\everycr=\toks34
\minrowclearance=\skip59
\rownum=\count295
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/graphics/mathcolor.ltx)
Package xcolor Info: Model `cmy' substituted by `cmy0' on input line 1353.
Package xcolor Info: Model `hsb' substituted by `rgb' on input line 1357.
Package xcolor Info: Model `RGB' extended on input line 1369.
Package xcolor Info: Model `HTML' substituted by `rgb' on input line 1371.
Package xcolor Info: Model `Hsb' substituted by `hsb' on input line 1372.
Package xcolor Info: Model `tHsb' substituted by `hsb' on input line 1373.
Package xcolor Info: Model `HSB' substituted by `hsb' on input line 1374.
Package xcolor Info: Model `Gray' substituted by `gray' on input line 1375.
Package xcolor Info: Model `wave' substituted by `hsb' on input line 1376.
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/tocloft/tocloft.sty
Package: tocloft 2017/08/31 v2.3i parameterised ToC, etc., typesetting
Package tocloft Info: The document has section divisions on input line 51.
\cftparskip=\skip60
\cftbeforetoctitleskip=\skip61
\cftaftertoctitleskip=\skip62
\cftbeforepartskip=\skip63
\cftpartnumwidth=\skip64
\cftpartindent=\skip65
\cftbeforesecskip=\skip66
\cftsecindent=\skip67
\cftsecnumwidth=\skip68
\cftbeforesubsecskip=\skip69
\cftsubsecindent=\skip70
\cftsubsecnumwidth=\skip71
\cftbeforesubsubsecskip=\skip72
\cftsubsubsecindent=\skip73
\cftsubsubsecnumwidth=\skip74
\cftbeforeparaskip=\skip75
\cftparaindent=\skip76
\cftparanumwidth=\skip77
\cftbeforesubparaskip=\skip78
\cftsubparaindent=\skip79
\cftsubparanumwidth=\skip80
\cftbeforeloftitleskip=\skip81
\cftafterloftitleskip=\skip82
\cftbeforefigskip=\skip83
\cftfigindent=\skip84
\cftfignumwidth=\skip85
\c@lofdepth=\count296
\c@lotdepth=\count297
\cftbeforelottitleskip=\skip86
\cftafterlottitleskip=\skip87
\cftbeforetabskip=\skip88
\cfttabindent=\skip89
\cfttabnumwidth=\skip90
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/parskip/parskip.sty
Package: parskip 2021-03-14 v2.0h non-zero parskip adjustments

(/usr/local/texlive/2023/texmf-dist/tex/latex/kvoptions/kvoptions.sty
Package: kvoptions 2022-06-15 v3.15 Key value format for package options (HO)

(/usr/local/texlive/2023/texmf-dist/tex/latex/kvsetkeys/kvsetkeys.sty
Package: kvsetkeys 2022-10-05 v1.19 Key value parser (HO)
)))
(/usr/local/texlive/2023/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty
Package: fancyhdr 2022/11/09 v4.1 Extensive control of page headers and footers

\f@nch@headwidth=\skip91
\f@nch@O@elh=\skip92
\f@nch@O@erh=\skip93
\f@nch@O@olh=\skip94
\f@nch@O@orh=\skip95
\f@nch@O@elf=\skip96
\f@nch@O@erf=\skip97
\f@nch@O@olf=\skip98
\f@nch@O@orf=\skip99
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/wrapfig2/wrapfig2.sty
Package: wrapfig2 2023-02-23 v.6.1.1 Wrap text around figures, tables, framed t
ext blocks


! Package wrapfig2 Error:  
(wrapfig2)                +++++++++++++++++++++++++++++++++++++++++++
(wrapfig2)                Package amsmath already loaded 
(wrapfig2)                If you need amsmath, load it after wrapfig2
(wrapfig2)                Expect error messages 
(wrapfig2)                +++++++++++++++++++++++++++++++++++++++++++
(wrapfig2)                
(wrapfig2)                .

See the wrapfig2 package documentation for explanation.
Type  H <return>  for immediate help.
 ...                                              
                                                  
l.39     }{Abort the job}}{\relax}
                                
Abort the job

(/usr/local/texlive/2023/texmf-dist/tex/latex/l3packages/xfp/xfp.sty
Package: xfp 2023-02-02 L3 Floating point unit
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/float/float.sty
Package: float 2001/11/08 v1.3d Float enhancements (AL)
\c@float@type=\count298
\float@exts=\toks35
\float@box=\box58
\@float@everytoks=\toks36
\@floatcapt=\box59
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/curve2e/curve2e.sty
Package: curve2e 2023-01-01 v.2.2.22 Extension package for pict2e

(/usr/local/texlive/2023/texmf-dist/tex/latex/pict2e/pict2e.sty
Package: pict2e 2020/09/30 v0.4b Improved picture commands (HjG,RN,JT)

(/usr/local/texlive/2023/texmf-dist/tex/latex/pict2e/pict2e.cfg
File: pict2e.cfg 2016/02/05 v0.1u pict2e configuration for teTeX/TeXLive
)
Package pict2e Info: Driver file: luatex.def on input line 112.
Package pict2e Info: Driver file for pict2e: p2e-luatex.def on input line 114.

(/usr/local/texlive/2023/texmf-dist/tex/latex/pict2e/p2e-luatex.def
File: p2e-luatex.def 2016/02/05 v0.1u Driver-dependant file (RN,HjG,JT)
)
\pIIe@GRAPH=\toks37
\@arclen=\dimen165
\@arcrad=\dimen166
\pIIe@tempdima=\dimen167
\pIIe@tempdimb=\dimen168
\pIIe@tempdimc=\dimen169
\pIIe@tempdimd=\dimen170
\pIIe@tempdime=\dimen171
\pIIe@tempdimf=\dimen172
)
\@tdA=\dimen173
\@tdB=\dimen174
\@tdC=\dimen175
\@tdD=\dimen176
\@tdE=\dimen177
\@tdF=\dimen178
\defaultlinewidth=\dimen179
\PbDim=\skip100
\legendbox=\box60
\MV@C=\count299
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/xkeyval/xkeyval.sty
Package: xkeyval 2022/06/16 v2.9 package option processing (HA)

(/usr/local/texlive/2023/texmf-dist/tex/generic/xkeyval/xkeyval.tex
(/usr/local/texlive/2023/texmf-dist/tex/generic/xkeyval/xkvutils.tex
\XKV@toks=\toks38
\XKV@tempa@toks=\toks39
)
\XKV@depth=\count300
File: xkeyval.tex 2014/12/03 v2.7a key=value parser (HA)
))
\@float@every@text=\toks40
\c@text=\count301
\wrapoverhang=\dimen180
\WF@size=\dimen181
\c@WF@wrappedlines=\count302
\WF@box=\box61
\NWF@box=\box62
\WF@everypar=\toks41
\WF@correctlines@switch=\count303
\insertwidth=\dimen182
\radius=\dimen183
\WFinsertwidthL=\dimen184
\WFinsertwidthH=\dimen185
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/fontspec/fontspec.sty
Package: fontspec 2022/01/15 v2.8a Font selection for XeLaTeX and LuaLaTeX
Lua module: fontspec 2022/01/15 2.8a Font selection for XeLaTeX and LuaLaTeX
(/usr/local/texlive/2023/texmf-dist/tex/latex/fontspec/fontspec-luatex.sty
Package: fontspec-luatex 2022/01/15 v2.8a Font selection for XeLaTeX and LuaLaT
eX
\l__fontspec_script_int=\count304
\l__fontspec_language_int=\count305
\l__fontspec_strnum_int=\count306
\l__fontspec_tmp_int=\count307
\l__fontspec_tmpa_int=\count308
\l__fontspec_tmpb_int=\count309
\l__fontspec_tmpc_int=\count310
\l__fontspec_em_int=\count311
\l__fontspec_emdef_int=\count312
\l__fontspec_strong_int=\count313
\l__fontspec_strongdef_int=\count314
\l__fontspec_tmpa_dim=\dimen186
\l__fontspec_tmpb_dim=\dimen187
\l__fontspec_tmpc_dim=\dimen188

(/usr/local/texlive/2023/texmf-dist/tex/latex/base/fontenc.sty
Package: fontenc 2021/04/29 v2.0v Standard LaTeX package
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/fontspec/fontspec.cfg)))
luaotfload | aux : font no 19 (nil) does not define feature smcp for script latn
 with language dflt

Package fontspec Info: Font family 'DejaVuSansMNerdFontMono-Regular.ttf(0)'
(fontspec)             created for font 'DejaVuSansMNerdFontMono-Regular.ttf'
(fontspec)             with options [].
(fontspec)              
(fontspec)              This font family consists of the following NFSS
(fontspec)             series/shapes:
(fontspec)              
(fontspec)             - 'normal' (m/n) with NFSS spec.:
(fontspec)             <->"[DejaVuSansMNerdFontMono-Regular.ttf]:mode=node;scri
pt=latn;language=dflt;"
(fontspec)             - 'small caps'  (m/sc) with NFSS spec.: 

luaotfload | aux : font no 22 (nil) does not define feature smcp for script latn
 with language dflt

Package fontspec Info: Font family 'FiraCodeNerdFont-Regular.ttf(0)' created
(fontspec)             for font 'FiraCodeNerdFont-Regular.ttf' with options
(fontspec)             [].
(fontspec)              
(fontspec)              This font family consists of the following NFSS
(fontspec)             series/shapes:
(fontspec)              
(fontspec)             - 'normal' (m/n) with NFSS spec.:
(fontspec)             <->"[FiraCodeNerdFont-Regular.ttf]:mode=node;script=latn
;language=dflt;"
(fontspec)             - 'small caps'  (m/sc) with NFSS spec.: 

luaotfload | aux : font no 25 (nil) does not define feature smcp for script latn
 with language dflt

Package fontspec Info: Font family 'HackNerdFont-Regular.ttf(0)' created for
(fontspec)             font 'HackNerdFont-Regular.ttf' with options [].
(fontspec)              
(fontspec)              This font family consists of the following NFSS
(fontspec)             series/shapes:
(fontspec)              
(fontspec)             - 'normal' (m/n) with NFSS spec.:
(fontspec)             <->"[HackNerdFont-Regular.ttf]:mode=node;script=latn;lan
guage=dflt;"
(fontspec)             - 'small caps'  (m/sc) with NFSS spec.: 


(/usr/local/texlive/2023/texmf-dist/tex/latex/titlesec/titlesec.sty
Package: titlesec 2021/07/05 v2.14 Sectioning titles
\ttl@box=\box63
\beforetitleunit=\skip101
\aftertitleunit=\skip102
\ttl@plus=\dimen189
\ttl@minus=\dimen190
\ttl@toksa=\toks42
\titlewidth=\dimen191
\titlewidthlast=\dimen192
\titlewidthfirst=\dimen193
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/hyperref/hyperref.sty
Package: hyperref 2023-02-07 v7.00v Hypertext links for LaTeX

(/usr/local/texlive/2023/texmf-dist/tex/generic/pdftexcmds/pdftexcmds.sty
Package: pdftexcmds 2020-06-27 v0.33 Utility functions of pdfTeX for LuaTeX (HO
)

(/usr/local/texlive/2023/texmf-dist/tex/generic/infwarerr/infwarerr.sty
Package: infwarerr 2019/12/03 v1.5 Providing info/warning/error messages (HO)
)
Package pdftexcmds Info: \pdf@primitive is available.
Package pdftexcmds Info: \pdf@ifprimitive is available.
Package pdftexcmds Info: \pdfdraftmode found.
\pdftexcmds@toks=\toks43
)
(/usr/local/texlive/2023/texmf-dist/tex/generic/kvdefinekeys/kvdefinekeys.sty
Package: kvdefinekeys 2019-12-19 v1.6 Define keys (HO)
)
(/usr/local/texlive/2023/texmf-dist/tex/generic/pdfescape/pdfescape.sty
Package: pdfescape 2019/12/09 v1.15 Implements pdfTeX's escape features (HO)
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/hycolor/hycolor.sty
Package: hycolor 2020-01-27 v1.10 Color options for hyperref/bookmark (HO)
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/letltxmacro/letltxmacro.sty
Package: letltxmacro 2019/12/03 v1.6 Let assignment for LaTeX macros (HO)
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/auxhook/auxhook.sty
Package: auxhook 2019-12-17 v1.6 Hooks for auxiliary files (HO)
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/hyperref/nameref.sty
Package: nameref 2022-05-17 v2.50 Cross-referencing by name of section

(/usr/local/texlive/2023/texmf-dist/tex/latex/refcount/refcount.sty
Package: refcount 2019/12/15 v3.6 Data extraction from label references (HO)
)
(/usr/local/texlive/2023/texmf-dist/tex/generic/gettitlestring/gettitlestring.s
ty
Package: gettitlestring 2019/12/15 v1.6 Cleanup title references (HO)
)
\c@section@level=\count315
)
\@linkdim=\dimen194
\Hy@linkcounter=\count316
\Hy@pagecounter=\count317
 (/usr/local/texlive/2023/texmf-dist/tex/latex/hyperref/pd1enc.def
File: pd1enc.def 2023-02-07 v7.00v Hyperref: PDFDocEncoding definition (HO)
)
(/usr/local/texlive/2023/texmf-dist/tex/generic/intcalc/intcalc.sty
Package: intcalc 2019/12/15 v1.3 Expandable calculations with integers (HO)
)
(/usr/local/texlive/2023/texmf-dist/tex/generic/etexcmds/etexcmds.sty
Package: etexcmds 2019/12/15 v1.7 Avoid name clashes with e-TeX commands (HO)
)
\Hy@SavedSpaceFactor=\count318

(/usr/local/texlive/2023/texmf-dist/tex/latex/hyperref/puenc.def
File: puenc.def 2023-02-07 v7.00v Hyperref: PDF Unicode definition (HO)
)
Package hyperref Info: Hyper figures OFF on input line 4177.
Package hyperref Info: Link nesting OFF on input line 4182.
Package hyperref Info: Hyper index ON on input line 4185.
Package hyperref Info: Plain pages OFF on input line 4192.
Package hyperref Info: Backreferencing OFF on input line 4197.
Package hyperref Info: Implicit mode ON; LaTeX internals redefined.
Package hyperref Info: Bookmarks ON on input line 4425.
\c@Hy@tempcnt=\count319
LaTeX Info: Redefining \url on input line 4763.
\XeTeXLinkMargin=\dimen195

(/usr/local/texlive/2023/texmf-dist/tex/generic/bitset/bitset.sty
Package: bitset 2019/12/09 v1.3 Handle bit-vector datatype (HO)

(/usr/local/texlive/2023/texmf-dist/tex/generic/bigintcalc/bigintcalc.sty
Package: bigintcalc 2019/12/15 v1.5 Expandable calculations on big integers (HO
)
))
\Fld@menulength=\count320
\Field@Width=\dimen196
\Fld@charsize=\dimen197
Package hyperref Info: Hyper figures OFF on input line 6042.
Package hyperref Info: Link nesting OFF on input line 6047.
Package hyperref Info: Hyper index ON on input line 6050.
Package hyperref Info: backreferencing OFF on input line 6057.
Package hyperref Info: Link coloring OFF on input line 6062.
Package hyperref Info: Link coloring with OCG OFF on input line 6067.
Package hyperref Info: PDF/A mode OFF on input line 6072.

(/usr/local/texlive/2023/texmf-dist/tex/latex/base/atbegshi-ltx.sty
Package: atbegshi-ltx 2021/01/10 v1.0c Emulation of the original atbegshi
package with kernel methods
)
\Hy@abspage=\count321
\c@Item=\count322
\c@Hfootnote=\count323
)
Package hyperref Info: Driver (autodetected): hluatex.

(/usr/local/texlive/2023/texmf-dist/tex/latex/hyperref/hluatex.def
File: hluatex.def 2023-02-07 v7.00v Hyperref driver for luaTeX

(/usr/local/texlive/2023/texmf-dist/tex/generic/stringenc/stringenc.sty
Package: stringenc 2019/11/29 v1.12 Convert strings between diff. encodings (HO
)
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/base/atveryend-ltx.sty
Package: atveryend-ltx 2020/08/19 v1.0a Emulation of the original atveryend pac
kage
with kernel methods
)
\Fld@listcount=\count324
\c@bookmark@seq@number=\count325

(/usr/local/texlive/2023/texmf-dist/tex/latex/rerunfilecheck/rerunfilecheck.sty
Package: rerunfilecheck 2022-07-10 v1.10 Rerun checks for auxiliary files (HO)

(/usr/local/texlive/2023/texmf-dist/tex/generic/uniquecounter/uniquecounter.sty
Package: uniquecounter 2019/12/15 v1.4 Provide unlimited unique counter (HO)
)
Package uniquecounter Info: New unique counter `rerunfilecheck' on input line 2
85.
)
\Hy@SectionHShift=\skip103
) (/usr/local/texlive/2023/texmf-dist/tex/latex/xurl/xurl.sty
Package: xurl 2022/01/09 v 0.10 modify URL breaks
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/ragged2e/ragged2e.sty
Package: ragged2e 2023/02/25 v3.4 ragged2e Package
\CenteringLeftskip=\skip104
\RaggedLeftLeftskip=\skip105
\RaggedRightLeftskip=\skip106
\CenteringRightskip=\skip107
\RaggedLeftRightskip=\skip108
\RaggedRightRightskip=\skip109
\CenteringParfillskip=\skip110
\RaggedLeftParfillskip=\skip111
\RaggedRightParfillskip=\skip112
\JustifyingParfillskip=\skip113
\CenteringParindent=\skip114
\RaggedLeftParindent=\skip115
\RaggedRightParindent=\skip116
\JustifyingParindent=\skip117
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/lipsum/lipsum.sty
Package: lipsum 2021-09-20 v2.7 150 paragraphs of Lorem Ipsum dummy text
\g__lipsum_par_int=\count326
\l__lipsum_a_int=\count327
\l__lipsum_b_int=\count328

(/usr/local/texlive/2023/texmf-dist/tex/latex/lipsum/lipsum.ltd.tex))
(/usr/local/texlive/2023/texmf-dist/tex/latex/epigraph/epigraph.sty
Package: epigraph 2020/01/02 v1.5e typesetting epigraphs

(/usr/local/texlive/2023/texmf-dist/tex/latex/nextpage/nextpage.sty
Package: nextpage 2009/09/03 v1.1a additional page commands
)
\beforeepigraphskip=\skip118
\afterepigraphskip=\skip119
\epigraphwidth=\skip120
\epigraphrule=\skip121
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/booktabs/booktabs.sty
Package: booktabs 2020/01/12 v1.61803398 Publication quality tables
\heavyrulewidth=\dimen198
\lightrulewidth=\dimen199
\cmidrulewidth=\dimen256
\belowrulesep=\dimen257
\belowbottomsep=\dimen258
\aboverulesep=\dimen259
\abovetopsep=\dimen260
\cmidrulesep=\dimen261
\cmidrulekern=\dimen262
\defaultaddspace=\dimen263
\@cmidla=\count329
\@cmidlb=\count330
\@aboverulesep=\dimen264
\@belowrulesep=\dimen265
\@thisruleclass=\count331
\@lastruleclass=\count332
\@thisrulewidth=\dimen266
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/enumitem/enumitem.sty
Package: enumitem 2019/06/20 v3.9 Customized lists
\labelindent=\skip122
\enit@outerparindent=\dimen267
\enit@toks=\toks44
\enit@inbox=\box64
\enit@count@id=\count333
\enitdp@description=\count334
)
(/usr/local/texlive/2023/texmf-dist/tex/latex/emoji/emoji.sty
Package: emoji 2021/07/17 v0.2.2 Emoji support in (Lua)LaTeX

(/usr/local/texlive/2023/texmf-dist/tex/latex/emoji/emoji-table.def
File: emoji-table.def 2021/07/17 v0.2.2 Emojisupportin(Lua)LaTeX
)))
(/usr/local/texlive/2023/texmf-dist/tex/latex/biblatex/biblatex.sty
Package: biblatex 2023/03/05 v3.19 programmable bibliographies (PK/MW)

(/usr/local/texlive/2023/texmf-dist/tex/latex/logreq/logreq.sty
Package: logreq 2010/08/04 v1.0 xml request logger
\lrq@indent=\count335

(/usr/local/texlive/2023/texmf-dist/tex/latex/logreq/logreq.def
File: logreq.def 2010/08/04 v1.0 logreq spec v1.0
))
\c@tabx@nest=\count336
\c@listtotal=\count337
\c@listcount=\count338
\c@liststart=\count339
\c@liststop=\count340
\c@citecount=\count341
\c@citetotal=\count342
\c@multicitecount=\count343
\c@multicitetotal=\count344
\c@instcount=\count345
\c@maxnames=\count346
\c@minnames=\count347
\c@maxitems=\count348
\c@minitems=\count349
\c@citecounter=\count350
\c@maxcitecounter=\count351
\c@savedcitecounter=\count352
\c@uniquelist=\count353
\c@uniquename=\count354
\c@refsection=\count355
\c@refsegment=\count356
\c@maxextratitle=\count357
\c@maxextratitleyear=\count358
\c@maxextraname=\count359
\c@maxextradate=\count360
\c@maxextraalpha=\count361
\c@abbrvpenalty=\count362
\c@highnamepenalty=\count363
\c@lownamepenalty=\count364
\c@maxparens=\count365
\c@parenlevel=\count366
\blx@tempcnta=\count367
\blx@tempcntb=\count368
\blx@tempcntc=\count369
\c@blx@maxsection=\count370
\blx@maxsegment@0=\count371
\blx@notetype=\count372
\blx@parenlevel@text=\count373
\blx@parenlevel@foot=\count374
\blx@sectionciteorder@0=\count375
\blx@sectionciteorderinternal@0=\count376
\blx@entrysetcounter=\count377
\blx@biblioinstance=\count378
\labelnumberwidth=\skip123
\labelalphawidth=\skip124
\biblabelsep=\skip125
\bibitemsep=\skip126
\bibnamesep=\skip127
\bibinitsep=\skip128
\bibparsep=\skip129
\bibhang=\skip130
\blx@bcfin=\read6
\blx@bcfout=\write6
\blx@langwohyphens=\language89
\c@mincomprange=\count379
\c@maxcomprange=\count380
\c@mincompwidth=\count381
Package biblatex Info: Trying to load biblatex default data model...
Package biblatex Info: ... file 'blx-dm.def' found.

(/usr/local/texlive/2023/texmf-dist/tex/latex/biblatex/blx-dm.def
File: blx-dm.def 2023/03/05 v3.19 biblatex localization (PK/MW)
)
Package biblatex Info: Trying to load biblatex style data model...
Package biblatex Info: ... file 'numeric.dbx' not found.
Package biblatex Info: Trying to load biblatex custom data model...
Package biblatex Info: ... file 'biblatex-dm.cfg' not found.
\c@afterword=\count382
\c@savedafterword=\count383
\c@annotator=\count384
\c@savedannotator=\count385
\c@author=\count386
\c@savedauthor=\count387
\c@bookauthor=\count388
\c@savedbookauthor=\count389
\c@commentator=\count390
\c@savedcommentator=\count391
\c@editor=\count392
\c@savededitor=\count393
\c@editora=\count394
\c@savededitora=\count395
\c@editorb=\count396
\c@savededitorb=\count397
\c@editorc=\count398
\c@savededitorc=\count399
\c@foreword=\count400
\c@savedforeword=\count401
\c@holder=\count402
\c@savedholder=\count403
\c@introduction=\count404
\c@savedintroduction=\count405
\c@namea=\count406
\c@savednamea=\count407
\c@nameb=\count408
\c@savednameb=\count409
\c@namec=\count410
\c@savednamec=\count411
\c@translator=\count412
\c@savedtranslator=\count413
\c@shortauthor=\count414
\c@savedshortauthor=\count415
\c@shorteditor=\count416
\c@savedshorteditor=\count417
\c@labelname=\count418
\c@savedlabelname=\count419
\c@institution=\count420
\c@savedinstitution=\count421
\c@lista=\count422
\c@savedlista=\count423
\c@listb=\count424
\c@savedlistb=\count425
\c@listc=\count426
\c@savedlistc=\count427
\c@listd=\count428
\c@savedlistd=\count429
\c@liste=\count430
\c@savedliste=\count431
\c@listf=\count432
\c@savedlistf=\count433
\c@location=\count434
\c@savedlocation=\count435
\c@organization=\count436
\c@savedorganization=\count437
\c@origlocation=\count438
\c@savedoriglocation=\count439
\c@origpublisher=\count440
\c@savedorigpublisher=\count441
\c@publisher=\count442
\c@savedpublisher=\count443
\c@language=\count444
\c@savedlanguage=\count445
\c@origlanguage=\count446
\c@savedoriglanguage=\count447
\c@pageref=\count448
\c@savedpageref=\count449
\shorthandwidth=\skip131
\shortjournalwidth=\skip132
\shortserieswidth=\skip133
\shorttitlewidth=\skip134
\shortauthorwidth=\skip135
\shorteditorwidth=\skip136
\locallabelnumberwidth=\skip137
\locallabelalphawidth=\skip138
\localshorthandwidth=\skip139
\localshortjournalwidth=\skip140
\localshortserieswidth=\skip141
\localshorttitlewidth=\skip142
\localshortauthorwidth=\skip143
\localshorteditorwidth=\skip144
Package biblatex Info: Trying to load enhanced support for Unicode engines...
Package biblatex Info: ... file 'blx-unicode.def' found.

(/usr/local/texlive/2023/texmf-dist/tex/latex/biblatex/blx-unicode.def)
Package biblatex Info: Trying to load compatibility code...
Package biblatex Info: ... file 'blx-compat.def' found.

(/usr/local/texlive/2023/texmf-dist/tex/latex/biblatex/blx-compat.def
File: blx-compat.def 2023/03/05 v3.19 biblatex compatibility (PK/MW)
)
Package biblatex Info: Trying to load generic definitions...
Package biblatex Info: ... file 'biblatex.def' found.

(/usr/local/texlive/2023/texmf-dist/tex/latex/biblatex/biblatex.def
File: biblatex.def 2023/03/05 v3.19 biblatex compatibility (PK/MW)
\c@textcitecount=\count450
\c@textcitetotal=\count451
\c@textcitemaxnames=\count452
\c@biburlbigbreakpenalty=\count453
\c@biburlbreakpenalty=\count454
\c@biburlnumpenalty=\count455
\c@biburlucpenalty=\count456
\c@biburllcpenalty=\count457
\biburlbigskip=\muskip18
\biburlnumskip=\muskip19
\biburlucskip=\muskip20
\biburllcskip=\muskip21
\c@smartand=\count458
)
Package biblatex Info: Trying to load bibliography style 'numeric'...
Package biblatex Info: ... file 'numeric.bbx' found.

(/usr/local/texlive/2023/texmf-dist/tex/latex/biblatex/bbx/numeric.bbx
File: numeric.bbx 2023/03/05 v3.19 biblatex bibliography style (PK/MW)
Package biblatex Info: Trying to load bibliography style 'standard'...
Package biblatex Info: ... file 'standard.bbx' found.

(/usr/local/texlive/2023/texmf-dist/tex/latex/biblatex/bbx/standard.bbx
File: standard.bbx 2023/03/05 v3.19 biblatex bibliography style (PK/MW)
\c@bbx:relatedcount=\count459
\c@bbx:relatedtotal=\count460
))
Package biblatex Info: Trying to load citation style 'numeric'...
Package biblatex Info: ... file 'numeric.cbx' found.

(/usr/local/texlive/2023/texmf-dist/tex/latex/biblatex/cbx/numeric.cbx
File: numeric.cbx 2023/03/05 v3.19 biblatex citation style (PK/MW)
Package biblatex Info: Redefining '\cite'.
Package biblatex Info: Redefining '\parencite'.
Package biblatex Info: Redefining '\footcite'.
Package biblatex Info: Redefining '\footcitetext'.
Package biblatex Info: Redefining '\smartcite'.
Package biblatex Info: Redefining '\supercite'.
Package biblatex Info: Redefining '\textcite'.
Package biblatex Info: Redefining '\textcites'.
Package biblatex Info: Redefining '\cites'.
Package biblatex Info: Redefining '\parencites'.
Package biblatex Info: Redefining '\smartcites'.
)
Package biblatex Info: Trying to load configuration file...
Package biblatex Info: ... file 'biblatex.cfg' found.

(/usr/local/texlive/2023/texmf-dist/tex/latex/biblatex/biblatex.cfg
File: biblatex.cfg 
)
Package biblatex Info: LuaTeX detected.
(biblatex)             Assuming input encoding 'utf8'.
Package biblatex Info: Document encoding is UTF8 ....
Package biblatex Info: ... and expl3
(biblatex)             2023-02-22 L3 programming layer (loader) 
(biblatex)             is new enough (at least 2020/04/06),
(biblatex)             setting 'casechanger=expl3'.

(/usr/local/texlive/2023/texmf-dist/tex/latex/biblatex/blx-case-expl3.sty
Package: blx-case-expl3 2023/03/05 v3.19 expl3 case changing code for biblatex
))
Package csquotes Info: Checking for multilingual support...
Package csquotes Info: ... found 'babel' package.
Package csquotes Info: Adjusting default style.
Package csquotes Info: Redefining alias 'default' -> 'spanish'.

(./Main.aux
LaTeX Info: Redefining \. on input line 19.
LaTeX Info: Redefining \% on input line 19.
 (./prologue.aux) (./1-plantar-cara/00-prologue.aux)
(./1-plantar-cara/01-manifest.aux) (./1-plantar-cara/02-about-the-party.aux)
(./1-plantar-cara/03-institutional-struggle.aux)
(./1-plantar-cara/04-our-intuitions.aux) (./1-plantar-cara/05-know-to-do.aux)
(./1-plantar-cara/06-lefts-right.aux) (./1-plantar-cara/07-some-warnings.aux)
(./2-lephucr/01b-intro.aux) (./2-lephucr/02-cap1.aux) (./2-lephucr/03-cap2.aux) (./2-lephucr/04-cap3.aux) (./2-lephucr/05-cap4.aux) (./2-lephucr/06-cap5.aux)
(./3-accion-critica/00-cite.aux) (./3-accion-critica/01-intro.aux)
(./3-accion-critica/02-chapter1.aux) (./3-accion-critica/03-chapter2.aux

LaTeX Warning: Label `tab:tablename' multiply defined.


LaTeX Warning: Label `tab:tablename' multiply defined.

) (./3-accion-critica/04-chapter3.aux

LaTeX Warning: Label `tab:tablename' multiply defined.

) (./3-accion-critica/05-chapter4.aux

LaTeX Warning: Label `tab:tablename' multiply defined.

))
\openout1 = Main.aux

LaTeX Font Info:    Checking defaults for OML/cmm/m/it on input line 37.
LaTeX Font Info:    ... okay on input line 37.
LaTeX Font Info:    Checking defaults for OMS/cmsy/m/n on input line 37.
LaTeX Font Info:    ... okay on input line 37.
LaTeX Font Info:    Checking defaults for OT1/cmr/m/n on input line 37.
LaTeX Font Info:    ... okay on input line 37.
LaTeX Font Info:    Checking defaults for T1/cmr/m/n on input line 37.
LaTeX Font Info:    ... okay on input line 37.
LaTeX Font Info:    Checking defaults for TS1/cmr/m/n on input line 37.
LaTeX Font Info:    Trying to load font information for TS1+cmr on input line 3
7.
 (/usr/local/texlive/2023/texmf-dist/tex/latex/base/ts1cmr.fd
File: ts1cmr.fd 2022/07/10 v2.5l Standard LaTeX font definitions
)
LaTeX Font Info:    ... okay on input line 37.
LaTeX Font Info:    Checking defaults for TU/lmr/m/n on input line 37.
LaTeX Font Info:    ... okay on input line 37.
LaTeX Font Info:    Checking defaults for OMX/cmex/m/n on input line 37.
LaTeX Font Info:    ... okay on input line 37.
LaTeX Font Info:    Checking defaults for U/cmr/m/n on input line 37.
LaTeX Font Info:    ... okay on input line 37.
LaTeX Font Info:    Checking defaults for PD1/pdf/m/n on input line 37.
LaTeX Font Info:    ... okay on input line 37.
LaTeX Font Info:    Checking defaults for PU/pdf/m/n on input line 37.
LaTeX Font Info:    ... okay on input line 37.

*geometry* driver: auto-detecting
*geometry* detected driver: luatex
*geometry* verbose mode - [ preamble ] result:
* driver: luatex
* paper: custom
* layout: <same size as paper>
* layoutoffset:(h,v)=(0.0pt,0.0pt)
* modes: twoside 
* h-part:(L,W,R)=(36.85806pt, 215.0023pt, 55.28712pt)
* v-part:(T,H,B)=(47.69867pt, 278.23827pt, 71.54805pt)
* \paperwidth=307.14749pt
* \paperheight=397.48499pt
* \textwidth=215.0023pt
* \textheight=278.23827pt
* \oddsidemargin=-35.41193pt
* \evensidemargin=-16.98286pt
* \topmargin=-61.57132pt
* \headheight=12.0pt
* \headsep=25.0pt
* \topskip=9.0pt
* \footskip=30.0pt
* \marginparwidth=131.0pt
* \marginparsep=10.0pt
* \columnsep=10.0pt
* \skip\footins=7.0pt plus 4.0pt minus 2.0pt
* \hoffset=0.0pt
* \voffset=0.0pt
* \mag=1000
* \@twocolumnfalse
* \@twosidetrue
* \@mparswitchtrue
* \@reversemarginfalse
* (1in=72.27pt=25.4mm, 1cm=28.453pt)

LaTeX Info: Redefining \. on input line 37.
LaTeX Info: Redefining \% on input line 37.
(/usr/local/texlive/2023/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
\scratchcounter=\count461
\scratchdimen=\dimen268
\scratchbox=\box65
\nofMPsegments=\count462
\nofMParguments=\count463
\everyMPshowfont=\toks45
\MPscratchCnt=\count464
\MPscratchDim=\dimen269
\MPnumerator=\count465
\makeMPintoPDFobject=\count466
\everyMPtoPDFconversion=\toks46
) (/usr/local/texlive/2023/texmf-dist/tex/latex/epstopdf-pkg/epstopdf-base.sty
Package: epstopdf-base 2020-01-24 v2.11 Base part for package epstopdf
Package epstopdf-base Info: Redefining graphics rule for `.eps' on input line 4
85.

(/usr/local/texlive/2023/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg
File: epstopdf-sys.cfg 2010/07/13 v1.3 Configuration of (r)epstopdf for TeX Liv
e
))

Package fontspec Info: Adjusting the maths setup (use [no-math] to avoid
(fontspec)             this).

\symlegacymaths=\mathgroup6
LaTeX Font Info:    Overwriting symbol font `legacymaths' in version `bold'
(Font)                  OT1/cmr/m/n --> OT1/cmr/bx/n on input line 37.
LaTeX Font Info:    Redeclaring math accent \acute on input line 37.
LaTeX Font Info:    Redeclaring math accent \grave on input line 37.
LaTeX Font Info:    Redeclaring math accent \ddot on input line 37.
LaTeX Font Info:    Redeclaring math accent \tilde on input line 37.
LaTeX Font Info:    Redeclaring math accent \bar on input line 37.
LaTeX Font Info:    Redeclaring math accent \breve on input line 37.
LaTeX Font Info:    Redeclaring math accent \check on input line 37.
LaTeX Font Info:    Redeclaring math accent \hat on input line 37.
LaTeX Font Info:    Redeclaring math accent \dot on input line 37.
LaTeX Font Info:    Redeclaring math accent \mathring on input line 37.
LaTeX Font Info:    Redeclaring math symbol \Gamma on input line 37.
LaTeX Font Info:    Redeclaring math symbol \Delta on input line 37.
LaTeX Font Info:    Redeclaring math symbol \Theta on input line 37.
LaTeX Font Info:    Redeclaring math symbol \Lambda on input line 37.
LaTeX Font Info:    Redeclaring math symbol \Xi on input line 37.
LaTeX Font Info:    Redeclaring math symbol \Pi on input line 37.
LaTeX Font Info:    Redeclaring math symbol \Sigma on input line 37.
LaTeX Font Info:    Redeclaring math symbol \Upsilon on input line 37.
LaTeX Font Info:    Redeclaring math symbol \Phi on input line 37.
LaTeX Font Info:    Redeclaring math symbol \Psi on input line 37.
LaTeX Font Info:    Redeclaring math symbol \Omega on input line 37.
LaTeX Font Info:    Redeclaring math symbol \mathdollar on input line 37.
LaTeX Font Info:    Redeclaring symbol font `operators' on input line 37.
LaTeX Font Info:    Encoding `OT1' has changed to `TU' for symbol font
(Font)              `operators' in the math version `normal' on input line 37.
LaTeX Font Info:    Overwriting symbol font `operators' in version `normal'
(Font)                  OT1/cmr/m/n --> TU/lmr/m/n on input line 37.
LaTeX Font Info:    Encoding `OT1' has changed to `TU' for symbol font
(Font)              `operators' in the math version `bold' on input line 37.
LaTeX Font Info:    Overwriting symbol font `operators' in version `bold'
(Font)                  OT1/cmr/bx/n --> TU/lmr/m/n on input line 37.
LaTeX Font Info:    Overwriting symbol font `operators' in version `normal'
(Font)                  TU/lmr/m/n --> TU/lmr/m/n on input line 37.
LaTeX Font Info:    Overwriting math alphabet `\mathit' in version `normal'
(Font)                  OT1/cmr/m/it --> TU/lmr/m/it on input line 37.
LaTeX Font Info:    Overwriting math alphabet `\mathbf' in version `normal'
(Font)                  OT1/cmr/bx/n --> TU/lmr/b/n on input line 37.
LaTeX Font Info:    Overwriting math alphabet `\mathsf' in version `normal'
(Font)                  OT1/cmss/m/n --> TU/lmss/m/n on input line 37.
LaTeX Font Info:    Overwriting math alphabet `\mathtt' in version `normal'
(Font)                  OT1/cmtt/m/n --> TU/lmtt/m/n on input line 37.
LaTeX Font Info:    Overwriting symbol font `operators' in version `bold'
(Font)                  TU/lmr/m/n --> TU/lmr/b/n on input line 37.
LaTeX Font Info:    Overwriting math alphabet `\mathit' in version `bold'
(Font)                  OT1/cmr/bx/it --> TU/lmr/b/it on input line 37.
LaTeX Font Info:    Overwriting math alphabet `\mathsf' in version `bold'
(Font)                  OT1/cmss/bx/n --> TU/lmss/b/n on input line 37.
LaTeX Font Info:    Overwriting math alphabet `\mathtt' in version `bold'
(Font)                  OT1/cmtt/m/n --> TU/lmtt/b/n on input line 37.
Package hyperref Info: Link coloring OFF on input line 37.

(./Main.out) (./Main.out)
\@outlinefile=\write7

\openout7 = Main.out
luaotfload | cache : Lookup cache loaded from /Users/angel.mora.mx/Library/texli
ve/2023/texmf-var/luatex-cache/generic/names/luaotfload-lookup-cache.luc.

Package fontspec Info: Font family 'AppleColorEmoji(0)' created for font
(fontspec)             'Apple Color Emoji' with options
(fontspec)             [BoldFont={},ItalicFont={},SmallCapsFont={},Renderer=Har
fBuzz].
(fontspec)              
(fontspec)              This font family consists of the following NFSS
(fontspec)             series/shapes:
(fontspec)              
(fontspec)             - 'normal' (m/n) with NFSS spec.:
(fontspec)             <->"AppleColorEmoji:mode=harf;script=DFLT;language=dflt;
"
(fontspec)             - 'small caps'  (m/sc) with NFSS spec.: 



Package fancyhdr Warning: \headheight is too small (12.0pt): 
(fancyhdr)                Make it at least 13.54596pt, for example:
(fancyhdr)                \setlength{\headheight}{13.54596pt}.
(fancyhdr)                You might also make \topmargin smaller to compensate:

(fancyhdr)                \addtolength{\topmargin}{-1.54596pt}.

[1{/usr/local/texlive/2023/texmf-var/fonts/map/pdftex/updmap/pdftex.map}

]
Package biblatex Info: Trying to load language 'spanish'...
Package biblatex Info: ... file 'spanish.lbx' found.

(/usr/local/texlive/2023/texmf-dist/tex/latex/biblatex/lbx/spanish.lbx
File: spanish.lbx 2023/03/05 v3.19 biblatex localization (PK/MW)
)
Package biblatex Info: Trying to load language 'english'...
Package biblatex Info: ... file 'english.lbx' found.

(/usr/local/texlive/2023/texmf-dist/tex/latex/biblatex/lbx/english.lbx
File: english.lbx 2023/03/05 v3.19 biblatex localization (PK/MW)
)
Package biblatex Info: LuaTeX detected.
(biblatex)             Assuming input encoding 'utf8'.
Package biblatex Info: Automatic encoding selection.
(biblatex)             Assuming data encoding 'utf8'.

\openout6 = Main.bcf
Package biblatex Info: Trying to load bibliographic data...
Package biblatex Info: ... file 'Main.bbl' found.

(./Main.bbl)
Package biblatex Info: Reference section=0 on input line 37.
Package biblatex Info: Reference segment=0 on input line 37.

</tmp/lua_Gyvbbf></tmp/lua_A1ImtQ></tmp/lua_X0yjAc></tmp/lua_xhDIcp>]
(./Main.toc
LaTeX Info: Redefining \sptext on input line 1.
LaTeX Info: Redefining \. on input line 1.
LaTeX Info: Redefining \% on input line 1.
LaTeX Font Info:    Trying to load font information for U+msa on input line 2.
 (/usr/local/texlive/2023/texmf-dist/tex/latex/amsfonts/umsa.fd
File: umsa.fd 2013/01/14 v3.01 AMS symbols A
)
LaTeX Font Info:    Trying to load font information for U+msb on input line 2.

(/usr/local/texlive/2023/texmf-dist/tex/latex/amsfonts/umsb.fd
File: umsb.fd 2013/01/14 v3.01 AMS symbols B
) [3

[413] [414] (./Main.aux
LaTeX Info: Redefining \sptext on input line 19.
LaTeX Info: Redefining \. on input line 19.
LaTeX Info: Redefining \% on input line 19.
 (./prologue.aux) (./1-plantar-cara/00-prologue.aux)
(./1-plantar-cara/01-manifest.aux) (./1-plantar-cara/02-about-the-party.aux)
(./1-plantar-cara/03-institutional-struggle.aux)
(./1-plantar-cara/04-our-intuitions.aux) (./1-plantar-cara/05-know-to-do.aux)
(./1-plantar-cara/06-lefts-right.aux) (./1-plantar-cara/07-some-warnings.aux)
(./2-lephucr/01b-intro.aux) (./2-lephucr/02-cap1.aux) (./2-lephucr/03-cap2.aux) (./2-lephucr/04-cap3.aux) (./2-lephucr/05-cap4.aux) (./2-lephucr/06-cap5.aux)
(./3-accion-critica/00-cite.aux) (./3-accion-critica/01-intro.aux)
(./3-accion-critica/02-chapter1.aux) (./3-accion-critica/03-chapter2.aux)
(./3-accion-critica/04-chapter3.aux) (./3-accion-critica/05-chapter4.aux))

LaTeX Warning: There were undefined references.


LaTeX Warning: There were multiply-defined labels.

Package rerunfilecheck Info: File `Main.out' has not changed.
(rerunfilecheck)             Checksum: 41AF4BD240E259C06E2E9F8CC98DFDDD;14745.

Package biblatex Warning: Please (re)run Biber on the file:
(biblatex)                Main
(biblatex)                and rerun LaTeX afterwards.

Package logreq Info: Writing requests to 'Main.run.xml'.

\openout1 = Main.run.xml
)

Here is how much of LuaTeX's memory you used:
 37199 strings out of 478285
 125094,2373549 words of node,token memory allocated
 5217 words of node memory still in use:
   7 hlist, 2 vlist, 2 rule, 214 glue, 4 kern, 1 glyph, 696 attribute, 128 glue_
spec, 350 attribute_list, 1 write, 132 pdf_action nodes
   avail lists: 1:3,2:1032,3:325,4:87,5:323,6:206,7:6577,8:132,9:385,10:64,11:93
3,12:15
 54538 multiletter control sequences out of 65536+600000
 84 fonts using 26465015 bytes
 97i,13n,89p,2958b,2276s stack positions out of 10000i,1000n,20000p,200000b,200000s

warning  (pdf backend): unreferenced destination with name 'Hfootnote.195'

warning  (pdf backend): unreferenced destination with name 'section*.48'

warning  (pdf backend): unreferenced destination with name 'section*.56'
</usr/local/texlive/2023/texmf-dist/fonts/opentype/public/lm/lmromancaps10-regul
ar.otf></usr/local/texlive/2023/texmf-dist/fonts/opentype/public/lm/lmsans8-regu
lar.otf></usr/local/texlive/2023/texmf-dist/fonts/opentype/public/lm/lmroman7-re
gular.otf></usr/local/texlive/2023/texmf-dist/fonts/opentype/public/lm/lmsans10-
bold.otf></usr/local/texlive/2023/texmf-dist/fonts/opentype/public/lm/lmmono8-re
gular.otf></usr/local/texlive/2023/texmf-dist/fonts/opentype/public/lm/lmroman7-
italic.otf></usr/local/texlive/2023/texmf-dist/fonts/opentype/public/lm/lmroman5
-regular.otf></usr/local/texlive/2023/texmf-dist/fonts/opentype/public/lm/lmroma
n8-italic.otf></usr/local/texlive/2023/texmf-dist/fonts/opentype/public/lm/lmrom
an10-bolditalic.otf></usr/local/texlive/2023/texmf-dist/fonts/opentype/public/lm
/lmroman10-bold.otf></usr/local/texlive/2023/texmf-dist/fonts/opentype/public/lm
/lmroman6-regular.otf></System/Library/Fonts/Apple Color Emoji.ttc></usr/local/t
exlive/2023/texmf-dist/fonts/opentype/public/lm/lmroman8-regular.otf></usr/local
/texlive/2023/texmf-dist/fonts/opentype/public/lm/lmroman10-regular.otf></usr/lo
cal/texlive/2023/texmf-dist/fonts/opentype/public/lm/lmroman12-bold.otf></usr/lo
cal/texlive/2023/texmf-dist/fonts/opentype/public/lm/lmroman8-bold.otf>
Output written on Main.pdf (414 pages, 12520977 bytes).

PDF statistics: 3617 PDF objects out of 4296 (max. 8388607)
 3052 compressed objects within 31 object streams
 923 named destinations out of 1000 (max. 131072)
 393 words of extra memory for PDF output out of 10000 (max. 100000000)

---

🤖 **Assistant:**

The provided log file is extensive and includes details about the LaTeX compilation process. Focusing on the specific issue related to your LaTeX configuration and your questions about the interaction between `fontspec` and `titlesec`, here are a few things to consider and check based on the output and typical practices:

### Compatibility Between `fontspec` and `titlesec`
1. **Command Usage**: The log shows normal initialization of `fontspec` and `titlesec`, which means the basic loading and execution of these packages are correct. This suggests that your issue may be more about usage and configurations rather than fundamental compatibility.

2. **Font Commands in `titlesec`**: From the log, it's clear that LuaTeX is successfully utilizing `fontspec` to manage fonts. However, it's crucial that the `titlesec` commands correctly refer to the defined font families. You should ensure that `\HackRegular` and similar commands actually refer to a correctly loaded font family, which might require using the syntax:
   ```latex
   \titleformat*{\section}{\HackRegular\selectfont}
   ```
   This ensures that the font is not only set but also selected for use.

3. **Font Loading Issues**: There were no errors related to the loading of the `HackNerdFont-Regular.ttf` or other specified fonts, indicating the paths and names are correctly recognized. However, make sure that the fonts support the necessary features, like small caps or weights, as font features can be specific.

### Debugging Tips
- **Explicit Font Size and Features**: When setting up titles with `titlesec`, explicitly mention the size and weight if the document requires it. Sometimes, `fontspec` changes don't propagate as expected due to scope or group limitations.
- **Log Messages and Warnings**: The log file contains several LaTeX warnings about overfull boxes and potential size issues with headings. These warnings can sometimes help diagnose misconfigurations in how `titlesec` and `fontspec` are applied.
- **Test Minimal Example**: To isolate issues, create a minimal document that only tests `fontspec` and `titlesec` interaction with your fonts. This can help identify if the problem is indeed with these packages or if it's caused by interactions with other packages or document settings.

### Example for Testing
Here's a simple snippet to test font application in section titles:
```latex
\documentclass{article}
\usepackage{fontspec}
\usepackage{titlesec}

\setmainfont{DejaVuSansMono-Regular.ttf} % Adjust based on actual font
\newfontfamily\HackRegular{HackNerdFont-Regular.ttf}

\titleformat*{\section}{\HackRegular\Large}

\begin{document}
\section{Test Section}
This is a test of the section styling.
\end{document}
```

Adjust the font paths and names as necessary, and ensure they are accessible to LuaTeX. This test should clarify if the basic setup works before integrating it back into your larger document. If this test passes without issue, then the problem may lie elsewhere in your main document or in the interaction with other styles or packages.

---

🙋 **You:**

Check all the logs mentioning fontspec and see if can figure out why my font is not being applied. I tested the selectfont option in the titleformat but still nothing
(/usr/local/texlive/2023/texmf-dist/tex/latex/fontspec/fontspec.sty
Package: fontspec 2022/01/15 v2.8a Font selection for XeLaTeX and LuaLaTeX
Lua module: fontspec 2022/01/15 2.8a Font selection for XeLaTeX and LuaLaTeX
(/usr/local/texlive/2023/texmf-dist/tex/latex/fontspec/fontspec-luatex.sty
Package: fontspec-luatex 2022/01/15 v2.8a Font selection for XeLaTeX and LuaLaT
\l__fontspec_script_int=\count304
\l__fontspec_language_int=\count305
\l__fontspec_strnum_int=\count306
\l__fontspec_tmp_int=\count307
\l__fontspec_tmpa_int=\count308
\l__fontspec_tmpb_int=\count309
\l__fontspec_tmpc_int=\count310
\l__fontspec_em_int=\count311
\l__fontspec_emdef_int=\count312
\l__fontspec_strong_int=\count313
\l__fontspec_strongdef_int=\count314
\l__fontspec_tmpa_dim=\dimen186
\l__fontspec_tmpb_dim=\dimen187
\l__fontspec_tmpc_dim=\dimen188
(/usr/local/texlive/2023/texmf-dist/tex/latex/fontspec/fontspec.cfg)))
Package fontspec Info: Font family 'DejaVuSansMNerdFontMono-Regular.ttf(0)'
(fontspec)             created for font 'DejaVuSansMNerdFontMono-Regular.ttf'
(fontspec)             with options [].
(fontspec)              
(fontspec)              This font family consists of the following NFSS
(fontspec)             series/shapes:
(fontspec)              
(fontspec)             - 'normal' (m/n) with NFSS spec.:
(fontspec)             <->"[DejaVuSansMNerdFontMono-Regular.ttf]:mode=node;scri
(fontspec)             - 'small caps'  (m/sc) with NFSS spec.: 
Package fontspec Info: Font family 'FiraCodeNerdFont-Regular.ttf(0)' created
(fontspec)             for font 'FiraCodeNerdFont-Regular.ttf' with options
(fontspec)             [].
(fontspec)              
(fontspec)              This font family consists of the following NFSS
(fontspec)             series/shapes:
(fontspec)              
(fontspec)             - 'normal' (m/n) with NFSS spec.:
(fontspec)             <->"[FiraCodeNerdFont-Regular.ttf]:mode=node;script=latn
(fontspec)             - 'small caps'  (m/sc) with NFSS spec.: 
Package fontspec Info: Font family 'HackNerdFont-Regular.ttf(0)' created for
(fontspec)             font 'HackNerdFont-Regular.ttf' with options [].
(fontspec)              
(fontspec)              This font family consists of the following NFSS
(fontspec)             series/shapes:
(fontspec)              
(fontspec)             - 'normal' (m/n) with NFSS spec.:
(fontspec)             <->"[HackNerdFont-Regular.ttf]:mode=node;script=latn;lan
(fontspec)             - 'small caps'  (m/sc) with NFSS spec.: 
Package fontspec Info: Adjusting the maths setup (use [no-math] to avoid
(fontspec)             this).
Package fontspec Info: Font family 'AppleColorEmoji(0)' created for font
(fontspec)             'Apple Color Emoji' with options
(fontspec)             [BoldFont={},ItalicFont={},SmallCapsFont={},Renderer=Har
(fontspec)              
(fontspec)              This font family consists of the following NFSS
(fontspec)             series/shapes:
(fontspec)              
(fontspec)             - 'normal' (m/n) with NFSS spec.:
(fontspec)             <->"AppleColorEmoji:mode=harf;script=DFLT;language=dflt;
(fontspec)             - 'small caps'  (m/sc) with NFSS spec.:

---

🤖 **Assistant:**

The logs you provided contain key details from the `fontspec` package regarding the setup and use of the font families in your document. The key points to focus on are the entries related to the initialization of your fonts like `HackNerdFont-Regular.ttf`, `DejaVuSansMNerdFontMono-Regular.ttf`, and `FiraCodeNerdFont-Regular.ttf`.

### Observations:
1. **Font Family Creation**: Each of the font families (DejaVuSans, FiraCode, and HackNerdFont) is successfully created with the default options. The log entries confirm that the font files are recognized and loaded without specifying issues like missing files or unsupported features.

2. **Font Features and Specifications**:
   - Each font family log entry ends with a specification that indicates the mode (node) and scripts applicable (latn for Latin). This is typical for `fontspec` and shows that the basic font loading is functioning.
   - The entries also note the existence of 'normal' and 'small caps' shapes, though it does not detail if the small caps feature is genuinely available or operational in the fonts, which could be a limitation if you intended to use that style.

3. **Potential Issues with `titlesec`**:
   - If the `titleformat` commands are still not applying the desired font, it could be due to how the font family names are declared or called. Ensure that the font family names used in `titlesec` exactly match those defined by `fontspec`. For example, if you define `\newfontfamily\HackRegular{HackNerdFont-Regular.ttf}`, then you should refer exactly to `\HackRegular` in your `titleformat`.
   - Using `\selectfont` as suggested earlier is crucial, and your syntax should resemble:
     ```latex
     \titleformat*{\section}{\HackRegular\selectfont}
     ```

4. **Additional Configuration**:
   - There is no indication that the fonts have options set for specific features beyond the defaults. If you need specific features like letter spacing or font scaling, these need to be explicitly set during the font loading or in the `titleformat`.

5. **Testing**:
   - Ensure that the document is being compiled with LuaLaTeX or XeLaTeX, as these are the engines that support `fontspec`.
   - Try to compile a minimal document with only the necessary packages and the section modification to isolate if other packages or settings interfere.

### Example for Isolated Testing:
```latex
\documentclass{article}
\usepackage{fontspec}
\usepackage{titlesec}

\setmainfont{DejaVu Sans}[Extension=.ttf, Path=./]  % Adjust path and extension
\newfontfamily\HackRegular{Hack-Regular.ttf}[Path=./]  % Adjust path

\titleformat*{\section}{\HackRegular\selectfont\Large}

\begin{document}

\section{Test Section}
This is a test of the section styling with Hack Regular.

\end{document}
```

Replace `"./"` with the actual path to your fonts if they are not in the same directory as your document. This will help ensure the fonts are loaded correctly and applied as expected. Adjust the file names and paths according to your actual setup.

If this minimal example works correctly, then the problem might be related to how the larger document manages package interactions or font settings. If this still doesn't work, it might be necessary to check if the fonts themselves are fully compatible with `fontspec` expectations, or if they have any specific limitations or issues in their current version.

---

🙋 **You:**

Check the file thoroughly and suggest something else to try cause I havent been able to modify the font. And I saw that setmainfont is overwriting everything else
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

% ESTABLECE LAS DIMENSIONES DE LA PÁGINA (y de la mainfont?)
\LoadClass[8pt,twoside]{extarticle}
% Packages Loading
\RequirePackage[%
  papersize={4.25in,5.5in}, % tamaño de papel media carta
  % headheight=12pt %,          % ajuste del tamaño de la cabecera
  % top=0.6in,                % mrgen superior
  % bottom=0.6255in,          % margen inferior
  % left=0.43in,            % margen izquierdo
  % right=0.43in            % margen derecho
  ]{geometry}
\RequirePackage[english,spanish,mexico]{babel}
\RequirePackage[spanish=mexican]{csquotes}
\RequirePackage{xparse}
\RequirePackage{markdown}
\RequirePackage{graphicx}
\RequirePackage[table]{xcolor}
\RequirePackage{tocloft}
\RequirePackage{parskip}
\RequirePackage{fancyhdr}
\RequirePackage{wrapfig2}
% Font family definitions
\RequirePackage{fontspec}
\newfontfamily{\DejaVuSans}{DejaVuSansMNerdFontMono-Regular.ttf}
\newfontfamily{\FiraRegular}{FiraCodeNerdFont-Regular.ttf}
\newfontfamily{\HackRegular}{HackNerdFont-Regular.ttf}

% Title fonts
\RequirePackage{titlesec}
\titleformat{\section}
  {\HackRegular\selectfont\Large} % Large, bold
\titleformat{\subsection}
  {\HackRegular\selectfont} % Normal size, bold
\titleformat{\subsubsection}
  {\HackRegular\selectfont} % Small, bold

%\setmainfont{\DejaVuSans}[SizeFeatures={Size=6}] % overrides the Tiqqunazo.cls class size

\RequirePackage[hidelinks]{hyperref}
\RequirePackage{xurl}
\RequirePackage{ragged2e}
\RequirePackage{lipsum} % TODO: Remove
\RequirePackage{epigraph}
\RequirePackage{booktabs}
\RequirePackage{enumitem}
\RequirePackage{emoji}
\RequirePackage{fontspec}
\RequirePackage{titlesec}

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
  
    % \begin{centering}
    %   \parbox{0.98\linewidth}{\@starttoc{toc}} 
    %   \vspace{10pt}\linebreak
    % \end{centering}
    % \rule{\textwidth}{1pt} 
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
  \parindent1em 
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

---

🤖 **Assistant:**

Based on the detailed examination of your `Tiqqunazo.cls` file, it seems there might be an issue with the `\setmainfont` command you noted being commented out. If it were uncommented and active, it would indeed set the main font for the entire document to `DejaVuSans`, which might override the specific font settings you established for sections, subsections, etc., using `fontspec`.

Here are some targeted suggestions to ensure that your desired fonts apply correctly without being overridden:

1. **Explicit Font Commands in Text**: Instead of relying on `\setmainfont` or `\newfontfamily` applied globally, specify the font directly within the sections or wherever you need different fonts. Use `\fontspec` directly in the format commands.

2. **Using `\addtoks` with `titlesec`**:
   You can try using `\addtoks` command with `titlesec` to ensure the font changes are applied at the right stage of processing. Here’s an adjusted version of your section commands:

   ```latex
   \titleformat{\section}
     {\HackRegular\selectfont\Large} % Large, bold
   \titleformat{\subsection}
     {\HackRegular\selectfont\normalsize} % Normal size, bold
   \titleformat{\subsubsection}
     {\HackRegular\selectfont\small} % Small, bold
   ```

3. **Check the Path and File Names**:
   Ensure the font files are correctly named and accessible in the directory specified or in the standard directories scanned by XeLaTeX or LuaLaTeX. Typos or path errors could cause the defaults to be applied instead.

4. **Scope of Font Commands**:
   To prevent `\setmainfont` from affecting your entire document, ensure that it is scoped only where needed or use more specific commands like `\newfontface` for less pervasive effects.

5. **Debugging Font Application**:
   Temporarily modify the `\titleformat` command to include an unmistakable font attribute, such as color or font size, to see if the command itself is being applied correctly:

   ```latex
   \titleformat{\section}
     {\HackRegular\selectfont\color{red}\LARGE} % Red, large, bold
   ```

   This change will make it very apparent whether the `\titleformat` settings are being applied. If you see the correct formatting without the correct font, the issue is likely with how the font is being called or loaded.

6. **Document Compilation**:
   Ensure you are compiling the document with XeLaTeX or LuaLaTeX, as these engines are necessary for `fontspec` to function correctly. PDFLaTeX will not process these font commands correctly.

7. **Package Conflicts**:
   Check for potential conflicts with other packages. Although nothing specific jumps out from your class file, sometimes package interactions can lead to unexpected behaviors.

If the direct inclusion of font specification in `\titleformat` does not resolve the issue, consider creating a minimal working example that includes only the relevant parts (e.g., the document class, `fontspec`, `titlesec`, and a couple of sections) and see if the problem persists. This approach helps isolate whether the issue is within the class file or perhaps influenced by other parts of your main document setup.

---

🙋 **You:**

provide all code suggestions for the options you presented

---

🤖 **Assistant:**

Certainly! Let's walk through each of the suggestions I made, providing you with concrete code snippets you can use to test and potentially resolve the issues with font application in your document class.

### 1. Explicit Font Commands in Text

For explicit font commands directly within sections, you can define your section formatting like this:

```latex
\RequirePackage{titlesec}
\RequirePackage{fontspec}

\newfontfamily\sectionfont{HackNerdFont-Regular.ttf}
\titleformat{\section}
  {\sectionfont\Large\bfseries} % Large, bold
```

### 2. Adjusting `titleformat` for Specific Font Application

Here’s how you could adjust the `titleformat` to explicitly call the font family each time:

```latex
\RequirePackage{titlesec}
\RequirePackage{fontspec}

\newfontfamily\sectionfont{HackNerdFont-Regular.ttf}

\titleformat{\section}
  {\sectionfont\Large\bfseries} % Large, bold
\titleformat{\subsection}
  {\sectionfont\normalsize\bfseries} % Normal size, bold
\titleformat{\subsubsection}
  {\sectionfont\small\bfseries} % Small, bold
```

### 3. Checking Path and File Names

Ensure that your font files are named correctly and located in the same directory as your document or in a directory that is scanned by your TeX system. If the font is in a different directory, specify the path:

```latex
\newfontfamily\sectionfont[Path = /path/to/fonts/]{HackNerdFont-Regular.ttf}
```

### 4. Scope of Font Commands

To limit the scope of the `\setmainfont`, you could ensure it is only used in specific environments or parts of your document:

```latex
{
\setmainfont{DejaVuSansMNerdFontMono-Regular.ttf}[SizeFeatures={Size=10}]
% Content where this font setting should apply
}
```

### 5. Debugging Font Application

This is to see if the formatting commands are applied even if the font doesn't change:

```latex
\titleformat{\section}
  {\normalfont\selectfont\color{red}\LARGE\bfseries} % Noticeably large and red
```

### 6. Document Compilation

Ensure your document command includes the correct compiler (XeLaTeX or LuaLaTeX):

```bash
xelatex yourdocument.tex
# or
lualatex yourdocument.tex
```

### 7. Package Conflicts

Minimize conflicts by isolating font-related commands and testing them in a minimal document:

```latex
\documentclass{article}
\usepackage{fontspec}
\usepackage{titlesec}

\newfontfamily\sectionfont{HackNerdFont-Regular.ttf}

\titleformat{\section}
  {\sectionfont\Large\bfseries}

\begin{document}
\section{Introduction}
This is a test section.
\end{document}
```

These snippets are tailored to use in testing and debugging scenarios to help determine where the issue with font application might lie.

---

🙋 **You:**

Shoudlnt I define fonts in a different way for the extarticle class or for any specific library?

---

🤖 **Assistant:**

In LaTeX, the process of defining fonts using packages like `fontspec` is generally consistent across different document classes, including `extarticle`. The `fontspec` package is specifically designed for use with XeLaTeX and LuaLaTeX, allowing direct use of OpenType and TrueType fonts. The method of defining fonts doesn't fundamentally change based on the document class but depends more on the compiler being used.

However, here are a few things to consider that could affect font definition:

1. **Document Class Features**: Some classes might have predefined styles or font settings that could potentially override your custom settings if not handled correctly. In your case, the `extarticle` class is an extended version of the standard `article` class, allowing for more font size options but not imposing specific restrictions on font commands.

2. **Interaction with Other Packages**: The interaction between `fontspec` and other packages like `titlesec` or `geometry` usually doesn't require adjustments in the way fonts are defined. However, be mindful of the order in which packages are loaded, as some packages might redefine commands that could affect font settings.

3. **Compilation Method**: Always ensure that you compile your document with XeLaTeX or LuaLaTeX when using `fontspec`. Compiling with pdfLaTeX, for instance, will not work because it does not support direct font loading from system fonts.

4. **Explicit Font Path**: Sometimes, especially when fonts are not located in standard directories that LaTeX scans, you might need to specify the path explicitly, as mentioned previously. This can be necessary in a multi-user environment or when using fonts installed in non-standard locations.

5. **Debugging Tip**: If a font doesn't seem to apply correctly, simplify the document to a minimal example that includes only the font-setting commands and a few lines of text. This can help isolate whether the issue is with the font command itself or an interaction with other elements in the document.

Here’s a simple example to ensure your font settings are correct in a minimal document:

```latex
\documentclass{extarticle}
\usepackage{fontspec}
\usepackage{titlesec}

% Define fonts
\newfontfamily\bodyfont{DejaVuSansMNerdFontMono-Regular.ttf}
\newfontfamily\sectionfont{HackNerdFont-Regular.ttf}

% Apply font to section titles
\titleformat{\section}
  {\sectionfont\Large\bfseries}

\setmainfont{DejaVuSansMNerdFontMono-Regular.ttf}[SizeFeatures={Size=10}]

\begin{document}
\section{Sample Section Title}
This is a test of the document body text in DejaVu Sans Mono.
\end{document}
```

Run this with XeLaTeX or LuaLaTeX to ensure everything functions as expected. If this minimal example works, but your larger document does not, incrementally reintroduce elements from your main document to pinpoint the problem.

---

🙋 **You:**

So return the new Main.tex file that would need to set to load fonts in the Main.tex from the class definitions
\documentclass{Tiqqunazo}

% \makeatletter
% \if@todonotes@disabled
% \newcommand{\hlfix}[2]{#1}
% \else
% \newcommand{\hlfix}[2]{\texthl{#1}\todo{#2}}
% \fi
% \makeatother

\graphicspath{{images/}}
\usepackage[backend=biber,style=numeric,autocite=footnote]{biblatex}
\addbibresource{plantar.bib}

%%%%%%%%%%%%%%%%%%%%%% VALORES DE LA CARÁTULA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\title{LEE ESTO PARA HACER UN CAMBIO REAL} % Cambia el título del documento
\author{La Partida} % Cambia el nombre del autor
%\project{Plantar cara al pasado para imaginar el futuro} % Cambia (u omite) el nombre del proyecto
%\date{} % Cambia el valor de la fecha mostrada por defecto
%\imagefolder{./imagenes} % Cambia de carpeta para buscar imágenes
%\logo{} % Añade la imagen del logotipo a la portada
\version{Versión 1.2} % Cambia el número de versión

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
\setmainfont\dejavusans

\clearpage
\begin{sloppypar} % Start of general sloppy environment

\include{prologue}
\end{sloppypar} % End of general sloppy environment
\tableofcontents
\clearpage

\part{Plantar cara al pasado para imaginar el porvenir}
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

\part{Sobre la Acción Crítica}
\include{3-accion-critica/00-cite}
\include{3-accion-critica/01-intro}
\include{3-accion-critica/02-chapter1}
\include{3-accion-critica/03-chapter2}
\include{3-accion-critica/04-chapter3}
\include{3-accion-critica/05-chapter4}

\printbibliography
%\printhelp % Úsalo para ver/imprimir las páginas de ayuda
\end{document}

---

🤖 **Assistant:**

To ensure that fonts are loaded from the class definition, and considering you're using a custom document class `Tiqqunazo` which is based on the `extarticle` class, you should make sure all font definitions and customizations are handled within the class file itself. This encapsulation makes the main document cleaner and ensures consistent font usage across different documents using the same class.

Here's an optimized version of your `Main.tex` file that ensures fonts are handled by the class:

```latex
\documentclass{Tiqqunazo}

\graphicspath{{images/}}
\usepackage[backend=biber,style=numeric,autocite=footnote]{biblatex}
\addbibresource{plantar.bib}

%%%%%%%%%%%%%%%%%%%%%% VALORES DE LA CARÁTULA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\title{LEE ESTO PARA HACER UN CAMBIO REAL} % Cambia el título del documento
\author{La Partida} % Cambia el nombre del autor
\version{Versión 1.2} % Cambia el número de versión

%%%%%%%%%%%%%%%%%%%%%%% AJUSTES GENERALES %%%%%%%%%%%%%%%%%%%%%%%
\setcounter{tocdepth}{1} % Establece la profundidad del índice en portada.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\begin{document}

\maketitle
\clearpage

\tableofcontents
\clearpage

\part{Plantar cara al pasado para imaginar el porvenir}
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

\part{Sobre la Acción Crítica}
\include{3-accion-critica/00-cite}
\include{3-accion-critica/01-intro}
\include{3-accion-critica/02-chapter1}
\include{3-accion-critica/03-chapter2}
\include{3-accion-critica/04-chapter3}
\include{3-accion-critica/05-chapter4}

\printbibliography
\end{document}
```

**Key Changes:**

1. **Removed Unnecessary Commands**: I've streamlined the file by removing unnecessary or commented-out commands, focusing on document content inclusion and bibliography management.
2. **Font Management**: Any font-specific commands (`\setmainfont`, `\newfontfamily`) should be defined within the `Tiqqunazo.cls` file to ensure they are managed centrally and consistently. Make sure to configure these commands right after loading the `fontspec` package in your class file.

**Class File Adjustments**:
- Ensure `fontspec` and related font definitions are in the class file (`Tiqqunazo.cls`).
- Define `\setmainfont` and `\newfontfamily` commands right after `\RequirePackage{fontspec}` to avoid conflicts and ensure they apply globally across the document.

This setup will ensure that all font management is centralized within the class file, which is particularly useful for maintaining consistency across multiple documents or revisions of the same document.

---

🙋 **You:**

the code you returned didnt change anything regarding fonts loading...

---

🤖 **Assistant:**

You're right, I didn't include the specifics for handling fonts directly in the `Tiqqunazo.cls` file within the response. Let's address that and make sure the font settings are properly configured in your document class file. Here's how you can update your class file to handle fonts effectively using `fontspec` and ensure that these settings are centrally managed:

### Changes to the `Tiqqunazo.cls` File:

1. **Load the Fontspec Package**: This should be done at the beginning of your class file.
2. **Define Font Families and Main Font**: Set up your main fonts and any specific font families you'd like to use throughout the document.

Here's an example of how you could set up the fonts in the `Tiqqunazo.cls` file:

```latex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Tiqqunazo}[2023/05/22 Project Documentation LaTeX class]

\LoadClass[8pt,twoside]{extarticle}

% Packages for layout, language, encoding
\RequirePackage[english,spanish,mexico]{babel}
\RequirePackage{fontspec}
\RequirePackage{titlesec}
\RequirePackage{geometry}

% Setting paper size and margins
\geometry{papersize={4.25in, 5.5in}, headheight=12pt, top=0.6in, bottom=0.625in, left=0.43in, right=0.43in}

% Font family definitions
\setmainfont{DejaVuSansMNerdFontMono-Regular.ttf}[Extension=.ttf, Path=./fonts/]
\newfontfamily{\HackRegular}{HackNerdFont-Regular.ttf}[Extension=.ttf, Path=./fonts/]

% Title fonts
\titleformat{\section}{\HackRegular\Large\bfseries}
\titleformat{\subsection}{\HackRegular\large\bfseries}
\titleformat{\subsubsection}{\HackRegular\normalsize\bfseries}

% Additional setup like hyperref, xurl, etc.
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{xurl}

\endinput
```

### Key Details:

- **Font Paths**: You might need to specify the path to the fonts if they are not in the standard directory that LaTeX typically checks. This can be done using the `[Path=./fonts/]` option in `\setmainfont` and `\newfontfamily`. Replace `./fonts/` with the actual path to your fonts if they're stored elsewhere.
- **File Extension**: Explicitly specify the `.ttf` extension if needed. This can sometimes help clear up any confusion LaTeX might have about the file format.
- **Font Commands in the Document**: With the fonts defined in the class file, you don't need to redefine them in your `Main.tex`. The main document should now cleanly use the styles set up by the class without additional font commands.

Make sure that the paths and filenames match exactly what's on your system. This setup in your class file ensures that font management is centralized, reducing the need for repetitive definitions in each document and helping maintain a consistent style across your projects.

---

🙋 **You:**

how do I define main and section fonts in the Main.tex file?

---

🤖 **Assistant:**

To define the main and section fonts in your `Main.tex` file while using LaTeX with the `fontspec` package, you need to make sure you're using XeLaTeX or LuaLaTeX as your compiler, as these support direct font loading from system fonts. Here's how you can define your main document font and specific fonts for sections:

1. **Set the Main Font**: This font will be used throughout the document unless specified otherwise. You set it with the `\setmainfont` command.

2. **Set Fonts for Sections, Subsections, etc.**: You can specify fonts for different sectional units using the `\titleformat` command from the `titlesec` package.

Here's an example setup that you can place in the preamble of your `Main.tex` file:

```latex
\documentclass{article}
\usepackage{fontspec}
\usepackage{titlesec}

% Define the main document font
\setmainfont{DejaVu Sans}[
  Path = ./fonts/, % Adjust the path to where your fonts are located
  Extension = .ttf,
  BoldFont = *-Bold,
  ItalicFont = *-Italic
]

% Define fonts for section headings
\titleformat{\section}
  {\normalfont\LARGE\scshape} % Using small caps for sections
  {\thesection} % Label
  {1em} % Space between label and title text
  {} % Before-code

\titleformat{\subsection}
  {\normalfont\Large\bfseries} % Bold for subsections
  {\thesubsection} % Label
  {1em} % Space between label and title text
  {} % Before-code

\titleformat{\subsubsection}
  {\normalfont\large\bfseries\itshape} % Bold italic for subsubsections
  {\thesubsubsection} % Label
  {1em} % Space between label and title text
  {} % Before-code

\begin{document}

\section{Introduction}
This is the introduction of the document.

\subsection{Background}
Background information goes here.

\subsubsection{Details}
Detailed information goes here.

\end{document}
```

### Notes:
- **Font Path and Extensions**: Ensure the `Path` and `Extension` are correctly specified if your fonts are not in the standard directory. Adjust these parameters to reflect where you've stored the font files on your system.
- **Fonts for Sections**: The `\titleformat` command allows detailed customization of the font appearance for sections, subsections, and other structural units. Modify the font commands according to your design preferences.

This setup will ensure that the entire document follows a consistent font policy, and each section can have a distinct appearance based on the specifications you've set in the `Main.tex` file.

---

🤖 **Assistant:**

To define the main and section fonts in your `Main.tex` file when using a custom document class like `Tiqqunazo`, which relies on the `fontspec` package for font management, you should follow a structured approach. Here’s how to specify different fonts for the main text and different section levels in LaTeX when using `fontspec` with LuaLaTeX or XeLaTeX, which handle OpenType fonts natively.

### Step 1: Include the Fontspec Package
Since `fontspec` should already be loaded in your custom class, you won't need to load it again in `Main.tex`. You only need to set the fonts using the commands provided by `fontspec`.

### Step 2: Define Your Fonts
1. **Set the Main Font**:
   This command sets the default font for the entire document. You can specify options like font features or size adjustments if needed.

   ```latex
   \setmainfont{DejaVu Sans}[Scale=1.0, Extension=.ttf, Path=./fonts/, UprightFont=*-Regular, BoldFont=*-Bold, ItalicFont=*-Italic, BoldItalicFont=*-BoldItalic]
   ```

2. **Define Fonts for Sections**:
   If you want to use a different font for section headings, you’ll need to define it and then tell LaTeX to use it in the titles.

   ```latex
   \newfontfamily{\sectionfont}{Hack Nerd Font}[Scale=1.1, Extension=.ttf, Path=./fonts/]
   ```

### Step 3: Modify Title Formats
Use the `titlesec` package to specify the font for different sections. This package allows detailed customization of headings.

```latex
\usepackage{titlesec}

% Applying the custom font to section titles
\titleformat{\section}
  {\sectionfont\Large\bfseries}
  {\thesection}{1em}{}

\titleformat{\subsection}
  {\sectionfont\large\bfseries}
  {\thesubsection}{1em}{}

\titleformat{\subsubsection}
  {\sectionfont\normalsize\bfseries}
  {\thesubsubsection}{1em}{}
```

### Step 4: Put it All Together in `Main.tex`
Now, integrate everything into your main file, ensuring that the paths to the fonts are correctly specified and that the fonts are properly installed or accessible in the specified directory.

```latex
\documentclass{Tiqqunazo}

\begin{document}

\section{Introduction}
This is an example of using different fonts for body text and section titles.

\subsection{Background}
Subsection text styled differently from the main text.

\subsubsection{Details}
Further details with the same style.

\end{document}
```

### Notes:
- **Font Path**: Adjust the `Path=./fonts/` to where your fonts are actually stored. If they are in the same directory as your `.tex` file, you may omit the `Path` option.
- **Font Names**: Ensure the font names match exactly with the filenames (minus the extension). Incorrect names or paths will cause LaTeX to fail in compiling the document.
- **Scaling**: Adjust the `Scale=` option if the fonts appear too large or too small compared to each other.

This setup ensures that your document has a consistent appearance with different styles for body and heading texts, controlled centrally from your main LaTeX file.

---

🙋 **You:**

still no difference. Fonts not loading at all!!!
\documentclass{Tiqqunazo}

% \makeatletter
% \if@todonotes@disabled
% \newcommand{\hlfix}[2]{#1}
% \else
% \newcommand{\hlfix}[2]{\texthl{#1}\todo{#2}}
% \fi
% \makeatother

\graphicspath{{images/}}
\usepackage[backend=biber,style=numeric,autocite=footnote]{biblatex}
\addbibresource{plantar.bib}

% fonts
\newfontfamily\dejavusans{DejaVuSansMNerdFontMono-Regular.ttf}
\newfontfamily{\FiraRegular}{FiraCodeNerdFont-Regular.ttf}
\newfontfamily\HackRegular{HackNerdFont-Regular.ttf}
% Title fonts
\titleformat{\section}{\FiraRegular\selectfont\Large} % Large, bold
\titleformat{\subsection}{\HackRegular\selectfont\normal} % Normal size, bold
\titleformat{\subsubsection}{\HackRegular\selectfont\small} % Small, bold

%%%%%%%%%%%%%%%%%%%%%% VALORES DE LA CARÁTULA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\title{LEE ESTO PARA HACER UN CAMBIO REAL} % Cambia el título del documento
\author{La Partida} % Cambia el nombre del autor
%\project{Plantar cara al pasado para imaginar el futuro} % Cambia (u omite) el nombre del proyecto
%\date{} % Cambia el valor de la fecha mostrada por defecto
%\imagefolder{./imagenes} % Cambia de carpeta para buscar imágenes
%\logo{} % Añade la imagen del logotipo a la portada
\version{Versión 1.2} % Cambia el número de versión

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
%\setmainfont\dejavusans

\clearpage
\begin{sloppypar} % Start of general sloppy environment

\include{prologue}
\end{sloppypar} % End of general sloppy environment
\tableofcontents
\clearpage

\part{Plantar cara al pasado para imaginar el porvenir}
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

\part{Sobre la Acción Crítica}
\include{3-accion-critica/00-cite}
\include{3-accion-critica/01-intro}
\include{3-accion-critica/02-chapter1}
\include{3-accion-critica/03-chapter2}
\include{3-accion-critica/04-chapter3}
\include{3-accion-critica/05-chapter4}

\printbibliography
%\printhelp % Úsalo para ver/imprimir las páginas de ayuda
\end{document}

Tiqqunazo.cls
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

% ESTABLECE LAS DIMENSIONES DE LA PÁGINA (y de la mainfont?)
\LoadClass[8pt,twoside]{extarticle}
% Packages Loading
\RequirePackage[%
  papersize={4.25in,5.5in}, % tamaño de papel media carta
  % headheight=12pt %,          % ajuste del tamaño de la cabecera
  % top=0.6in,                % mrgen superior
  % bottom=0.6255in,          % margen inferior
  % left=0.43in,            % margen izquierdo
  % right=0.43in            % margen derecho
  ]{geometry}
\RequirePackage[english,spanish,mexico]{babel}
\RequirePackage[spanish=mexican]{csquotes}
\RequirePackage{xparse}
\RequirePackage{markdown}
\RequirePackage{graphicx}
\RequirePackage[table]{xcolor}
\RequirePackage{tocloft}
\RequirePackage{parskip}
\RequirePackage{fancyhdr}
\RequirePackage{wrapfig2}
% Font family definitions
\RequirePackage{fontspec}
\RequirePackage{titlesec}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{xurl}
\RequirePackage{ragged2e}
\RequirePackage{lipsum} % TODO: Remove
\RequirePackage{epigraph}
\RequirePackage{booktabs}
\RequirePackage{enumitem}
\RequirePackage{emoji}
\RequirePackage{fontspec}
\RequirePackage{titlesec}

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
  
    % \begin{centering}
    %   \parbox{0.98\linewidth}{\@starttoc{toc}} 
    %   \vspace{10pt}\linebreak
    % \end{centering}
    % \rule{\textwidth}{1pt} 
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
  \parindent1em 
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

---

🤖 **Assistant:**

If the fonts are still not loading, there are a few more checks and adjustments you can make to troubleshoot and resolve the issue:

### Ensure the Font Files are Accessible
1. **Font File Location**: Make sure the font files (`*.ttf` or `*.otf`) are in a location accessible to the LaTeX compiler. Typically, this would be in the same directory as your `.tex` file or in a subdirectory that is referenced correctly.

2. **Correct Path Specification**: If the fonts are in a directory, specify the correct path in the `\newfontfamily` command, like so:
   ```latex
   \newfontfamily\dejavusans{DejaVuSansMNerdFontMono-Regular.ttf}[Path=./fonts/]
   ```

### Verify Font Names and Extensions
- **Exact Names**: Confirm that the font file names are spelled correctly in your LaTeX document, matching exactly to the font files (case-sensitive).

### Use \setmainfont in the Preamble
Place the `\setmainfont` command in the preamble of your `Main.tex` file to set the default document font, ensuring it gets applied:
```latex
\setmainfont{DejaVuSansMNerdFontMono-Regular.ttf}[Extension=.ttf, Path=./fonts/]
```

### Simplify the Font Commands
Simplify the commands to define the main and section fonts by avoiding redundancy or misconfiguration, especially if options are conflicting or incorrectly specified.

### Complete Example for Main.tex:
Here’s a full example to illustrate how you might set up your document:
```latex
\documentclass{Tiqqunazo}

% Ensure the fontspec package is loaded in Tiqqunazo.cls
% Path is assuming fonts are in the same directory or specified correctly

\newfontfamily\dejavusans{DejaVuSansMNerdFontMono-Regular.ttf}[Extension=.ttf, Path=./fonts/]
\newfontfamily\sectionfont{HackNerdFont-Regular.ttf}[Extension=.ttf, Path=./fonts/]

\titleformat{\section}
  {\sectionfont\Large\bfseries}
  {\thesection}{1em}{}

\titleformat{\subsection}
  {\sectionfont\large\bfseries}
  {\thesubsection}{1em}{}

\titleformat{\subsubsection}
  {\sectionfont\normalsize\bfseries}
  {\thesubsubsection}{1em}{}

\begin{document}
\setmainfont{DejaVuSansMNerdFontMono-Regular.ttf}[Extension=.ttf, Path=./fonts/]

\section{Introduction}
This is an example of using different fonts for body text and section titles.

\subsection{Background}
Subsection text styled differently from the main text.

\subsubsection{Details}
Further details with the same style.

\end{document}
```

### Check Compilation Method
- **Compiler**: Ensure you are using **XeLaTeX** or **LuaLaTeX**. These compilers support `fontspec` directly. If you're using PDFLaTeX, it won't recognize `fontspec` commands.

### Debugging
- **Log Files**: Check the `.log` files generated by LaTeX for any specific errors regarding font loading. This might give you more insight into what is failing.

If these steps don't resolve the issue, there might be a more specific problem with how the fonts are being handled in the class file or a compatibility issue with other packages. Revisiting the `.cls` file settings and simplifying the configuration to test basic font loading can help isolate the issue.

---

🤖 **Assistant:**

It looks like your message didn't come through. Could you please resend it?

---

🙋 **You:**

So shouldn't the font be changed in here? It's using \renewcommand

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

---

🤖 **Assistant:**

Yes, you are correct in noting that the `\renewcommand` and `\RenewDocumentCommand` for sections in the LaTeX class file should specify the font to be used for the section headings. From the excerpts you've provided, it seems like the commands currently only adjust the formatting (like bolding or making text uppercase) but don't explicitly set the font.

To apply a specific font to these headings, you need to include the font commands within the sectioning commands. For example, if you have predefined font commands like `\FiraRegular` or `\HackRegular`, you can directly use these within the section definitions.

Here is how you could modify the commands for sections, subsections, and subsubsections to use specific fonts:

```latex
% CONFIGURACIÓN DE ESTILO DE CABECERA/PIE DE PÁGINA
\renewcommand\section{%
  \@startsection{section}{1}{\z@}{0.1ex}{3ex}{\FiraRegular\Huge\bfseries}%
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
    \HackRegular\Large\bfseries\MakeUppercase}%
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
  \@startsection{subsubsection}{3}{\z@}{2ex}{2ex}{\HackRegular\large\bfseries}%
}
\let\oldsubsubsection\subsubsection
\RenewDocumentCommand{\subsubsection}{s m o}{%
  \IfBooleanTF{#1}{\oldsubsubsection*{#2}}{\oldsubsubsection{#2}}%
  \IfNoValueF{#3}{\label{sss:#3}\ifdrafting
                                  \textit{\color{magenta}~Anchor sss:#3}
                                \fi
                  } 
}
```

This modification explicitly sets the fonts for the section headings using the `\FiraRegular` and `\HackRegular` commands you defined earlier. By placing the font command right before the sizing and style commands (like `\Huge` and `\bfseries`), it ensures that these sections use the specified fonts. Make sure that these fonts are properly defined and loaded in your document or class file, as shown earlier in your setup.

---

🙋 **You:**

now that you understand that there are commands being overwritten, tell me how to define also footer, page and front page font in those configs in Tiqqunazo.cls

---

🤖 **Assistant:**

To set the font for the footer, page numbers, and the front page in your custom LaTeX class (`Tiqqunazo.cls`), you'll need to specify the desired font family within the respective settings for those elements. Here's how you can adjust these settings by incorporating your font definitions into these areas:

### 1. Footer and Page Numbers
To set the font for the footer and page numbers, modify the `\fancypagestyle` definitions. Since you've defined fonts like `\DejaVuSans`, `\FiraRegular`, and `\HackRegular`, you can apply these directly to the footer and page numbers. Here's an example of how to apply `\DejaVuSans`:

```latex
\fancypagestyle{title}{%
  \renewcommand{\headrulewidth}{1pt} 
  \fancyhf{}
  \lhead{\rule[-2ex]{0pt}{2ex}\textbf{\@revision}}
  \rhead{\rule[-2ex]{0pt}{2ex}\textbf{\@date}} 
  \lfoot{\footnotesize\DejaVuSans\MakeUppercase\@lfooter}
  \cfoot{\footnotesize\DejaVuSans\thepage}
  \rfoot{\footnotesize\DejaVuSans\MakeUppercase\@rfooter}
}

\fancypagestyle{plain}{% Adjust this for other generic pages
  \renewcommand{\headrulewidth}{0pt}
  \fancyhf{}
  \lfoot{\footnotesize\DejaVuSans\MakeUppercase\@lfooter}
  \cfoot{\footnotesize\DejaVuSans\thepage}
  \rfoot{\footnotesize\DejaVuSans\MakeUppercase\@rfooter}
}
```

### 2. Front Page Fonts
For the front page, typically set up in the `\titlepage` command, specify the font family directly where you define the text. Here's an example:

```latex
\renewcommand{\titlepage}{%
  \thispagestyle{title}
  \begin{flushleft}
    {\DejaVuSans\fontsize{24}{21}\selectfont\textbf{\MakeUppercase{\@title}}\par}
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
  % Additional content can follow here
}
```

In this setup, the front page uses `\DejaVuSans` for the title and project name. Adjust this according to which font you wish to apply.

### General Tip:
Always ensure that your font families (`\DejaVuSans`, `\FiraRegular`, `\HackRegular`) are defined at the beginning of your class file using `\newfontfamily`. This makes them available throughout your document. Here's a reminder of how to define them:

```latex
\RequirePackage{fontspec}
\newfontfamily\DejaVuSans{DejaVuSansMNerdFontMono-Regular.ttf}
\newfontfamily\FiraRegular{FiraCodeNerdFont-Regular.ttf}
\newfontfamily\HackRegular{HackNerdFont-Regular.ttf}
```

Adjust these paths and font names according to your setup and where the font files are stored. Make sure the paths and font names are correct to ensure the fonts are loaded successfully.

---

🙋 **You:**

\begin{verse}
Text
\end{verse}

Could cause duplication in 1-plantar-cara/00-prologue.txt? It's now showing all sections within the part two times

---

🤖 **Assistant:**

The issue you're experiencing with duplication in your LaTeX document could be related to a few different factors. If you are seeing sections appear twice after using environments like `\begin{verse} ... \end{verse}`, it might be due to a problem with how environments are being handled or redefined within your document or class file. Here's a troubleshooting approach to help resolve this issue:

### 1. Check for Redefinitions
Make sure that the `verse` environment is not being redefined in your custom class file (`Tiqqunazo.cls`) or in any of the `.tex` files included in your project. A redefinition could inadvertently cause content to be processed more than once.

### 2. Inspect Included Files
The duplication issue could be a result of how files are included within your main document. Ensure that files like `1-plantar-cara/00-prologue.tex` are not being included multiple times by mistake. Check the main document and any other files that handle file inclusion:

```latex
\include{1-plantar-cara/00-prologue}
```

### 3. Investigate the `verse` Environment
The `verse` environment typically shouldn't cause duplication unless it's being misused or there's an error in how it's defined. Check if there's a custom redefinition in your class file or preamble that might be causing unexpected behavior:

- **Default Definition**: By default, `verse` is a simple environment used for formatting poetry or quotations. It should not affect the processing of sections or duplication.
- **Custom Modifications**: If `verse` has been modified, ensure that the modification does not contain any commands that might lead to content being repeated.

### 4. Check Package Interactions
Consider if there are any package interactions that could be affecting the `verse` environment. This includes packages related to text formatting or layout that might be redefining environments or changing how LaTeX handles groups of text.

### 5. Debugging LaTeX
A methodical approach to debugging this issue could involve:
- **Commenting Out**: Temporarily comment out the `verse` environment usage and see if the duplication persists.
- **Simplifying**: Reduce the document to a minimal example where the error occurs. This can help isolate the problem.
- **Log Files**: Check the log files generated by LaTeX for any warnings or errors related to the problematic sections.

Here’s a small example of how you might set up a minimal test document to isolate the issue:

```latex
\documentclass{Tiqqunazo}
\begin{document}
\begin{verse}
This is a test verse.
\end{verse}

\section{Test Section}
This is a test section to see duplication.
\end{document}
```

This will help you determine if the problem is with the environment itself or something else within your document structure. If the issue persists in the minimal setup, it suggests a deeper issue within the class file or a package conflict. If it resolves, the problem might be somewhere in the more complex setup of your full document.

---

🙋 **You:**

This command is causing to get the table of contents printing more than once? What could be the reason if not that?
  \renewcommand\section{%
    \@startsection{section}{1}{\z@}{0.1ex}{3ex}{\FiraRegular\large\textbf\MakeUppercase}%
  }

---

**Tool:**

Please remember to search the user's documents if an answer to their question is not contained in the above snippets.

---

🤖 **Assistant:**

To address the issue with the table of contents being printed more than once, and also to correctly apply the font settings for sections, subsections, and the main document, you should ensure the configuration commands in your `.cls` file and `Main.tex` file are consistent and not conflicting.

### Updated `Tiqqunazo.cls`:

Add or modify the font definitions and ensure they are correctly applied within the section and subsection commands.

```latex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Tiqqunazo}[2023 Project Documentation LaTeX class]

\LoadClass[8pt,twoside]{extarticle}
\RequirePackage[%
  papersize={4.25in,5.5in},
]{geometry}
\RequirePackage[english,spanish,mexico]{babel}
\RequirePackage[spanish=mexican]{csquotes}
\RequirePackage{xparse}
\RequirePackage{markdown}
\RequirePackage{graphicx}
\RequirePackage[table]{xcolor}
\RequirePackage{tocloft}
\RequirePackage{parskip}
\RequirePackage{fancyhdr}
\RequirePackage{wrapfig2}
\RequirePackage{fontspec}
\RequirePackage{titlesec}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{xurl}
\RequirePackage{ragged2e}
\RequirePackage{lipsum}
\RequirePackage{epigraph}
\RequirePackage{booktabs}
\RequirePackage{enumitem}
\RequirePackage{emoji}

% Define fonts
\newfontfamily{\DejaVuSans}{DejaVuSansMNerdFontMono-Regular.ttf}
\newfontfamily{\FiraRegular}{FiraCodeNerdFont-Regular.ttf}
\newfontfamily{\HackRegular}{HackNerdFont-Regular.ttf}

% Configure title fonts
\titleformat{\section}
  {\FiraRegular\large\bfseries\MakeUppercase}
\titleformat{\subsection}
  {\HackRegular\normalsize\bfseries}
\titleformat{\subsubsection}
  {\HackRegular\small\bfseries}

% User Information Commands
\newcommand{\imagefolder}[1]{\def\@imagefolder{#1}}
\newcommand{\version}[1]{\def\@revision{#1}}
\newcommand{\project}[1]{\def\@project{#1}}
\newcommand{\logo}[1]{\def\@logo{#1}}
\newcommand{\footertext}[2]{\def\@lfooter{#1} \def\@rfooter{#2}}
\newcommand{\shorttitle}[1]{\def\@shorttitle{#1}}
\newcommand{\nofootertext}{\def\@lfooter{} \def\@rfooter{}}
\newcommand{\imageref}[1]{\def\@imageref{#1}}

% Default values
\title{Documento de prueba}
\author{~}
\project{~}
\imagefolder{.}
\version{Versi\'on 2.0}
\def\@lfooter{Plantar Cara}
\def\@rfooter{\@author}
\imageref{~}

% Custom Table of Contents
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

% Create Cover Page
\AtBeginDocument{\pagestyle{fancyplain}\titlepage%
    \ifsectionnumbers 
        \renewcommand{\thesection}{\arabic{section}}
        \renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
        \renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}} 
    \else 
        \ifsubsectionnumbers 
            \renewcommand{\thesection}{\kern-1em}
            \renewcommand{\thesubsection}{\arabic{subsection}}
            \renewcommand{\thesubsubsection}{\arabic{subsection}.\arabic{subsubsection}}
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
    \pagebreak 
}

% Header/Footer Style
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

% Section Style Configuration
\renewcommand\section{%
    \@startsection{section}{1}{\z@}{0.1ex}{3ex}{\FiraRegular\large\textbf\MakeUppercase}%
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

% Subsection Style Configuration
\renewcommand\subsection{%
    \@startsection{subsection}{2}{\z@}{2ex}{2ex}{%
        \HackRegular\Large\bfseries\MakeUppercase}%
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
    \@startsection{subsubsection}{3}{\z@}{2ex}{2ex}{\HackRegular\large\textbf}%
}
\let\oldsubsubsection\subsubsection
\RenewDocumentCommand{\subsubsection}{s m o}{%
    \IfBooleanTF{#1}{\oldsubsubsection*{#2}}{\oldsubsubsection{#2}}%
    \IfNoValueF{#3}{\label{sss:#3}\ifdrafting
                                    \textit{\color{magenta}~Anchor sss:#3}
                                  \fi
                    } 
}

% Additional commands for nested subsections
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

% Drafting Options
\newif

---

🤖 **Assistant:**

\ifdrafting 
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

% Hyperlink Text Configuration
\definecolor{linkblue}{RGB}{0,69,217} 
\NewDocumentCommand{\link}{m g}{%
    \IfNoValueTF{#2}{% 
        \href{#1}{\color{linkblue}#1}%
    }
    {%
        \href{#1}{\color{linkblue}#2}%
    }%
}

% Section Header Images
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

% Side Notes
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

% Enhanced Lists
\newenvironment{nicelist}[1]{%
    \parindent1em 
    \textbf{#1}
    \begin{itemize}
}
{%
    \end{itemize}%
}
    
% Enhanced Enumerations
\newenvironment{niceenum}[1]{%
    \parindent1em 
    \textbf{#1}
    \begin{enumerate}
}
{%
    \end{enumerate}%
}

% Enhanced Descriptions
\newenvironment{nicedesc}[1]{%
    \parindent1em
    \textbf{#1}
    \begin{description}
}
{%
    \end{description}%
}
    
% Numbering Options
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
        \else 
            \def\@nextsectionnumber{#1} 
        \fi 
    }   
    \IfNoValueF{#2}{%
        \if\relax\detokenize{#2}\relax
        \else 
            \def\@nextpagenumber{#2} 
        \fi 
    } 
    \resetnumberingtrue 
}

% Help Documentation
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
```

### Updated `Main.tex`:

Ensure the `Tiqqunazo.cls` class is loaded, and the font commands are correctly set in the document preamble.

```latex
\documentclass{Tiqqunazo}

\graphicspath{{images/}}
\usepackage[backend=biber,style=numeric,autocite=footnote]{biblatex}
\addbibresource{plantar.bib}

%%%%%%%%%%%%%%%%%%%%%% VALORES DE LA CARÁTULA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\title{LEE ESTO PARA HACER UN CAMBIO REAL}
\author{La Partida}
\version{Versión 1.2}

%%%%%%%%%%%%%%%%%%%%%%% AJUSTES GENERALES %%%%%%%%%%%%%%%%%%%%%%%
\setcounter{tocdepth}{1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\begin{document}
\setmainfont{DejaVuSansMNerdFontMono-Regular.ttf}

\clearpage
\begin{sloppypar}

\include{prologue}
\end{sloppypar}
\tableofcontents
\clearpage

\part{Plantar cara al pasado para imaginar el porvenir}
\include{1-plantar-cara/00-prologue}
\include{1-plantar-cara/01-manifest}
\include{1-plantar-cara/02-about-the-party}
\include

---

🙋 **You:**

1. what are the font length options? Like Large, large, etc
2. what is textbf and bfseries?

---

🤖 **Assistant:**

1. **Font Length Options in LaTeX:**

   LaTeX provides a series of predefined font size commands which can be used to adjust the size of the text. Here is a list of the standard font size commands from smallest to largest:

   - `\tiny`
   - `\scriptsize`
   - `\footnotesize`
   - `\small`
   - `\normalsize` (default size)
   - `\large`
   - `\Large`
   - `\LARGE`
   - `\huge`
   - `\Huge`

2. **Explanation of `\textbf` and `\bfseries`:**

   - **`\textbf`**: This command is used to make the text enclosed within it bold. It is used inline with the text. For example:
     ```latex
     \textbf{This text is bold.}
     ```
   
   - **`\bfseries`**: This is a font declaration command that switches the font to boldface. It affects all the text following it until the end of the group or environment it is in. For example:
     ```latex
     {\bfseries This entire text is bold.}
     ```
     or
     ```latex
     \begin{bfseries}
     This text is bold.
     \end{bfseries}
     ```

### Example Usage in LaTeX Code

**Using Font Length Options:**
```latex
\documentclass{article}
\begin{document}

\Huge This is huge text.

\huge This is very large text.

\LARGE This is larger text.

\Large This is large text.

\large This is slightly larger text.

\normalsize This is normal text.

\small This is small text.

\footnotesize This is footnote-sized text.

\scriptsize This is script-sized text.

\tiny This is very tiny text.

\end{document}
```

**Using `\textbf` and `\bfseries`:**
```latex
\documentclass{article}
\begin{document}

This is normal text. \textbf{This is bold text using \textbf.} 

{\bfseries This is bold text using \bfseries.}

\begin{bfseries}
This is bold text within a bfseries environment.
\end{bfseries}

\end{document}
```

---

🙋 **You:**

is this content index showing chapters within parts? Or just sections?
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

---

🤖 **Assistant:**

The provided code for customizing the table of contents (ToC) is set to show sections and subsections within the ToC, but not chapters. Here’s a detailed breakdown:

1. **Suppressing Dots and Page Numbers for Subsections:**
   - `\renewcommand{\cftdot}{}`: Removes the dots (leaders) between section titles and page numbers.
   - `\cftpagenumbersoff{subsection}`: Turns off the page numbers for subsections in the ToC.

2. **Setting the ToC Depth:**
   - `\setcounter{tocdepth}{2}`: Sets the depth of the ToC to 2, which means it includes sections (`tocdepth=1`) and subsections (`tocdepth=2`). This does not include chapters (`tocdepth=0`) or subsubsections (`tocdepth=3`).

3. **Customizing the Appearance of Section and Subsection Numbers:**
   - `\renewcommand{\cftsecpresnum}{\begin{lrbox}{\@tempboxa}}`: Customizes the appearance before section numbers.
   - `\renewcommand{\cftsecaftersnum}{\end{lrbox}}`: Customizes the appearance after section numbers.
   - `\setlength{\cftsecnumwidth}{0pt}`: Sets the width for section numbers to 0 points, effectively hiding the numbers.
   
   - `\renewcommand{\cftsubsecpresnum}{\begin{lrbox}{\@tempboxa}}`: Customizes the appearance before subsection numbers.
   - `\renewcommand{\cftsubsecaftersnum}{\end{lrbox}}`: Customizes the appearance after subsection numbers.
   - `\setlength{\cftsubsecnumwidth}{0pt}`: Sets the width for subsection numbers to 0 points, effectively hiding the numbers.

4. **Indentation for Subsections:**
   - `\cftsetindents{subsection}{0em}{0em}`: Sets the indentation for subsections to 0em, meaning no additional indentation.

### Summary

The table of contents as configured will display:
- Sections (with titles but no numbers or dots)
- Subsections (with titles but no numbers or dots)

It will **not** display:
- Chapters
- Subsubsections

### To Include Chapters in the ToC

If you want to include chapters in the ToC, you should set `tocdepth` to 0:

```latex
\setcounter{tocdepth}{0}
```

And ensure that chapters are formatted accordingly in your document structure.

---

🙋 **You:**

Please set DejaVuSans font wherever possible in this config:


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
  \setcounter{tocdepth}{1}
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
      {\DejaVuSans\fontsize{24}{21}\selectfont\textbf{\MakeUppercase{\@title}}\par}
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
  
    % \begin{centering}
    %   \parbox{0.98\linewidth}{\@starttoc{toc}} 
    %   \vspace{10pt}\linebreak
    % \end{centering}
    % \rule{\textwidth}{1pt} 
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
  \lfoot{\footnotesize\DejaVuSans\MakeUppercase\@lfooter}
  \cfoot{\footnotesize\DejaVuSans\thepage}
  \rfoot{\footnotesize\DejaVuSans\MakeUppercase\@rfooter}

  % CONFIGURACIÓN DE ESTILO DE CABECERA/PIE DE PÁGINA
  \renewcommand\section{%
    \@startsection{section}{1}{\z@}{0.1ex}{3ex}{\FiraRegular\Large\MakeUppercase}%
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
    \HackRegular\Large}%
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
  \@startsection{subsubsection}{3}{\z@}{2ex}{2ex}{\DejaVuSans\Large}%
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
  \parindent1em 
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

including TOC, header version and date and author

---

🤖 **Assistant:**

To set the `DejaVuSans` font wherever possible in the provided configuration, the font should be applied to various document elements such as the title page, footer, headers, sections, subsections, subsubsections, and other custom commands. Below is the adjusted configuration:

```latex
% ESTABLECE VALORES POR DEFECTO EN CASO CONTRARIO
\title{Documento de prueba}
\author{~}
\project{~}
\imagefolder{.}
\version{Versi\'on 2.0}
\def\@lfooter{Plantar Cara}
\def\@rfooter{\@autor}
\imageref{~}

% PERSONALIZACIÓN DEL ÍNDICE DE CONTENIDOS
\renewcommand{\cftdot}{}
\cftpagenumbersoff{subsection}
\setcounter{tocdepth}{1}
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
    {\DejaVuSans\fontsize{24}{21}\selectfont\textbf{\MakeUppercase{\@title}}\par}
    {\DejaVuSans\Large\@autor}
    \vspace{12pt}\linebreak 
    \textbf{\DejaVuSans\Huge\@project}
    \vspace{9pt}\linebreak 
    \ifdefined\@logo
      \edef\tmp{%
        \noexpand%
        \includegraphics[width=0.3\textwidth]{\@imagefolder/\@logo}%
        }\tmp%
    \fi 
    \linebreak\vfill
  \end{flushleft}

  % \begin{centering}
  %   \parbox{0.98\linewidth}{\@starttoc{toc}} 
  %   \vspace{10pt}\linebreak
  % \end{centering}
  % \rule{\textwidth}{1pt} 
  \pagebreak 
}

% ESTILO DE CABECERA/PIE DE PÁGINA
\fancypagestyle{title}{%
  \renewcommand{\headrulewidth}{1pt} 
  \fancyhf{}
  \lhead{\DejaVuSans\rule[-2ex]{0pt}{2ex}\textbf{\@revision}}
  \rhead{\DejaVuSans\rule[-2ex]{0pt}{2ex}\textbf{\@date}} 
}

\renewcommand{\headrulewidth}{0pt}
\fancyhead[RE,RO]{}
\fancyhead[LE,LO]{}
\lfoot{\footnotesize\DejaVuSans\MakeUppercase\@lfooter}
\cfoot{\footnotesize\DejaVuSans\thepage}
\rfoot{\footnotesize\DejaVuSans\MakeUppercase\@rfooter}

% CONFIGURACIÓN DE ESTILO DE CABECERA/PIE DE PÁGINA
\renewcommand\section{%
  \@startsection{section}{1}{\z@}{0.1ex}{3ex}{\DejaVuSans\Large\textbf\MakeUppercase}%
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
    \DejaVuSans\Large}%
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
  \@startsection{subsubsection}{3}{\z@}{2ex}{2ex}{\DejaVuSans\large}%
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
    \DejaVuSans\textbf{-- #1}
  \end{flushleft}
}

\newcommand{\subsubsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \DejaVuSans\textbf{---- #1}
  \end{flushleft}
}

\newcommand{\subsubsubsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \DejaVuSans\MakeUppercase{#1}
  \end{flushleft}
}

\newcommand{\subsubsubsubsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \DejaVuSans\MakeUppercase{-- #1}
  \end{flushleft}
}

\newcommand{\subsubsubsubsubsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \DejaVuSans\MakeUppercase{---- #1}
  \end{flushleft}
}

% OPCIONES DE BOSQUEJO
\newif\ifdrafting 
\newcommand{\drafting}{%
  \draftingtrue 
} 
\newcommand{\temp}[1]{%
  \ifdrafting 
    \DejaVuSans\textit{\color{blue}#1} 
  \fi 
}

\newcommand{\crit}[1]{%
  \ifdrafting 
    \DejaVuSans\textit{\color{red}#1} 
  \fi 
}

% CONFIGURACIÓN DEL TEXTO DE HIPERVÍNCULO
\definecolor{linkblue}{RGB}{0,69,217} 
\NewDocumentCommand{\link}{m g}{%
  \IfNoValueTF{#2}{% 
    \href{#1}{\DejaVuSans\color{linkblue}#1}%
  }
  {%
    \href{#1}{\DejaVuSans\color{linkblue}#2}%
  }%
}

% CONFIGURACIÓN DE IMÁGENES DE CABECERA DE SECCIÓN
\AtEndDocument{\DejaVuSans\vfill\textit{\@imageref}}
\NewDocumentCommand{\image}{m m g}{%
  \begin{figure}[h!]
    \centering
    \includegraphics[width=#1\textwidth]{\@imagefolder/#2}
    \IfNoValueF{#3}{
      \caption{\label{img:#2} \DejaVuSans #3}
    }
  \end{figure}
}

% APOSTILLAS
\renewcommand{\arraystretch}{1.5} 
\NewDocumentCommand{\tipbox}{s m m}{%
  \IfBooleanTF{#1}{

---

🤖 **Assistant:**

%
    \begin{wrapfigure}{r}{0.33\textwidth}
      \begin{tabular}{|p{0.3\textwidth}|}
        \cellcolor{black}
        \DejaVuSans\textbf{\textcolor{white}{#2}}\\
        \DejaVuSans\textit{#3}\\
        \hline
      \end{tabular}
    \end{wrapfigure}
  }{%
    \begin{figure}[h]
      \centering
      \begin{tabular}{|p{0.3\textwidth}|}
        \cellcolor{black}
        \DejaVuSans\textbf{\textcolor{white}{#2}}\\
        \DejaVuSans\textit{#3}\\
        \hline
      \end{tabular}
    \endfigure}
  } 
}

% LISTAS BONITAS
\newenvironment{nicelist}[1]{%
  \parindent1em 
  \DejaVuSans\textbf{#1}
    \begin{itemize}
}
{%
  \end{itemize}%
}

% ENUMERACIONES BONITAS
\newenvironment{niceenum}[1]{%
  \parindent1em 
  \DejaVuSans\textbf{#1}
    \begin{enumerate}
}
{%
  \end{enumerate}%
}

% DESCRIPCIONES BONITAS
\newenvironment{nicedesc}[1]{%
  \parindent1em
  \DejaVuSans\textbf{#1}
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
```

This configuration applies the `DejaVuSans` font to the title page, headers, footers, sections, subsections, subsubsections, and various custom commands. It ensures a consistent appearance across the entire document.

---

🙋 **You:**

index is still using old font, not DejaVuSans

---

🤖 **Assistant:**

To ensure that the `DejaVuSans` font is applied to the table of contents (TOC) as well, you need to explicitly set the font for the TOC entries. Here’s how you can adjust the TOC settings to use `DejaVuSans`:

```latex
% ESTABLECE VALORES POR DEFECTO EN CASO CONTRARIO
\title{Documento de prueba}
\author{~}
\project{~}
\imagefolder{.}
\version{Versi\'on 2.0}
\def\@lfooter{Plantar Cara}
\def\@rfooter{\@autor}
\imageref{~}

% PERSONALIZACIÓN DEL ÍNDICE DE CONTENIDOS
\renewcommand{\cftdot}{}
\cftpagenumbersoff{subsection}
\setcounter{tocdepth}{1}
\renewcommand{\cftsecpresnum}{\begin{lrbox}{\@tempboxa}}
\renewcommand{\cftsecaftersnum}{\end{lrbox}}
\setlength{\cftsecnumwidth}{0pt}
\renewcommand{\cftsubsecpresnum}{\begin{lrbox}{\@tempboxa}}
\renewcommand{\cftsubsecaftersnum}{\end{lrbox}}
\setlength{\cftsubsecnumwidth}{0pt}
\cftsetindents{subsection}{0em}{0em}
\renewcommand{\cftsecfont}{\DejaVuSans}       % Set font for section entries
\renewcommand{\cftsubsecfont}{\DejaVuSans}    % Set font for subsection entries
\renewcommand{\cftsecpagefont}{\DejaVuSans}   % Set font for section page numbers
\renewcommand{\cftsubsecpagefont}{\DejaVuSans}% Set font for subsection page numbers

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
    {\DejaVuSans\fontsize{24}{21}\selectfont\textbf{\MakeUppercase{\@title}}\par}
    {\DejaVuSans\Large\@autor}
    \vspace{12pt}\linebreak 
    \textbf{\DejaVuSans\Huge\@project}
    \vspace{9pt}\linebreak 
    \ifdefined\@logo
      \edef\tmp{%
        \noexpand%
        \includegraphics[width=0.3\textwidth]{\@imagefolder/\@logo}%
        }\tmp%
    \fi 
    \linebreak\vfill
  \end{flushleft}

  % \begin{centering}
  %   \parbox{0.98\linewidth}{\@starttoc{toc}} 
  %   \vspace{10pt}\linebreak
  % \end{centering}
  % \rule{\textwidth}{1pt} 
  \pagebreak 
}

% ESTILO DE CABECERA/PIE DE PÁGINA
\fancypagestyle{title}{%
  \renewcommand{\headrulewidth}{1pt} 
  \fancyhf{}
  \lhead{\DejaVuSans\rule[-2ex]{0pt}{2ex}\textbf{\@revision}}
  \rhead{\DejaVuSans\rule[-2ex]{0pt}{2ex}\textbf{\@date}} 
}

\renewcommand{\headrulewidth}{0pt}
\fancyhead[RE,RO]{}
\fancyhead[LE,LO]{}
\lfoot{\footnotesize\DejaVuSans\MakeUppercase\@lfooter}
\cfoot{\footnotesize\DejaVuSans\thepage}
\rfoot{\footnotesize\DejaVuSans\MakeUppercase\@rfooter}

% CONFIGURACIÓN DE ESTILO DE CABECERA/PIE DE PÁGINA
\renewcommand\section{%
  \@startsection{section}{1}{\z@}{0.1ex}{3ex}{\DejaVuSans\Large\textbf\MakeUppercase}%
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
    \DejaVuSans\Large}%
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
  \@startsection{subsubsection}{3}{\z@}{2ex}{2ex}{\DejaVuSans\large}%
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
    \DejaVuSans\textbf{-- #1}
  \end{flushleft}
}

\newcommand{\subsubsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \DejaVuSans\textbf{---- #1}
  \end{flushleft}
}

\newcommand{\subsubsubsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \DejaVuSans\MakeUppercase{#1}
  \end{flushleft}
}

\newcommand{\subsubsubsubsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \DejaVuSans\MakeUppercase{-- #1}
  \end{flushleft}
}

\newcommand{\subsubsubsubsubsubsubsection}[1]{%
  \begin{flushleft}
    \vspace{12pt} 
    \DejaVuSans\MakeUppercase{---- #1}
  \end{flushleft}
}

% OPCIONES DE BOSQUEJO
\newif\ifdrafting 
\newcommand{\drafting}{%
  \draftingtrue 
} 
\newcommand{\temp}[1]{%
  \ifdrafting 
    \DejaVuSans\textit{\color{blue}#1} 
  \fi 
}

\newcommand{\crit}[1]{%
  \ifdrafting 
    \DejaVuSans\textit{\color{red}#1} 
  \fi 
}

% CONFIGURACIÓN DEL TEXTO DE HIPERVÍNCULO
\definecolor{linkblue}{RGB}{0,69,217} 
\NewDocumentCommand{\link}{m g}{%
  \IfNoValueTF{#2}{% 
    \href{#1}{\DejaVuSans\color{linkblue}#1}%
  }
  {%
    \href{#1}{\DejaVuSans\color{linkblue}#2}%
  }%
}

% CONFIGURACIÓN DE IMÁGENES DE CABECERA DE SECCIÓN
\AtEndDocument{\DejaVuSans\vfill\textit{\@imageref}}
\NewDocumentCommand{\image}{m m g}{%
  \begin{figure}[h!]
    \centering