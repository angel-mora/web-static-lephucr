---
title: TeX Formatting Questions.
tags:
- '1'
- '2'
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# TeX Formatting Questions.

## ✅ TODOs
- [ ] s,textsize=scriptsize,spanish]{todonotes}
- [ ] [color=red!40]{#1}} % Indica que esta parte ya está concluida
- [ ] [color=red!95]{Homologar criterio de uso de las comillas.}}
- [ ] [color=red!90]{[Cita requerida, #1]}} % Indica que hace falta una cita
- [ ] [color=green!40]{#1}} % Nota para comentar que hay que reescribir algo
- [ ] [color=cyan!40]{#1}} % Indica que requiere un ajuste de estilo
- [ ] notes@disabled
- [ ] {#2}}
- [ ] pensamiento es estratégico}
- [ ] s los casos donde se lee plural
- [ ] momento en nuestra vida. Se trata de una configuración tecnológica de la realidad, una disposición de las cosas para que la gente actúe y responda frente a ellas de cierto modo. En la era de información, el rostro del totalitarismo se confunde en un virus capitalista que ciertamente ha dominado la nuda vida: en la sociedad no hay vida así sin más. Corporaciones, máquinas y aparatos ejercen su poder sin ninguna resistencia organizada capaz de proponer una alternativa universal al \emph{estado} actual de las cosas.
- [ ] grado de interioridad en la vida psíquica de las personas pues la Ley ha pasado a ser la norma, a estar completamente internalizada. Nuestras relaciones son espectáculares porque están mediadas a través de la representación cibernética y nuestro deseo bajo el Biopoder porque la industria farmacopornográfica se encarga de generar dinero de la enfermedad y de la frustración sexual. La cibernética es el arte del control, la disciplina propia de tiempos donde la información se vuelve la mercancía que más valor produce.
- [ ] s

## 📌 Summary
What part of this file is

## 🧠 Full Chat


What part of this file is 
1. managing the depth of the index
2. Adding numbers to chapters

```tex
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
    fontsize=9pt,%
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
%\usepackage{fontspec}
%\setmainfont{Spectral-Regular}
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

\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}
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
Primera edición, 2020. \\

\textcopyright{} \oldstylenums{2022} Versión 0.1 Disonancias\\
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

\minisec{Resumen}

\begin{quotation}
    ¿Cuáles son las posibilidades de actuar en en el momento más incierto y más absurdo de la Historia? Mientras cientos de activistas marchan religiosamente exigiendo al \emph{gobierno} (como si hubiera, de hecho, algo ahí que responda al llamado) un mundo más libre, más justo, más ecológico, los males propios de nuestro tiempo están presentes en todo momento en nuestra vida. Se trata de una configuración tecnológica de la realidad, una disposición de las cosas para que la gente actúe y responda frente a ellas de cierto modo. En la era de información, el rostro del totalitarismo se confunde en un virus capitalista que ciertamente ha dominado la nuda vida: en la sociedad no hay vida así sin más. Corporaciones, máquinas y aparatos ejercen su poder sin ninguna resistencia organizada capaz de proponer una alternativa universal al \emph{estado} actual de las cosas.

    Vivimos una imperceptible guerra civil en la que el enemigo a vencer no está ni siquiera en el montón de idiotas que rigen las corporaciones y los gobiernos nacionales sino en una religiosidad que profesa simpatía por la dominación mercantil. La Iglesia de esta fe se llama Estado moderno y en su génesis se encuentra la posiblidad misma de su destitución. En este texto contribuyo a analizar la relación entre Estado, capitalismo y mercados, así como el funcionamiento de la forma Estado como si se tratase de una ingeniería inversa, de un hackeo, pues el Leviatán funciona a partir de máquinas y de aparatos de captura, tiene agentes pagados que se encargan de cumplir diversas funciones alrededor del proceso de extracción de valor. Además de agentes, posee ejércitos, fuerza de trabajo que alimenta cada día la interacción entre mercados, que a su vez se vuelve el único medio por el cual es posible adquirir los medios de subsistencia. Sin embargo, el virus capitalista hace de cualquier necesidad un producto y del deseo, interés.

    No vivimos por sino a pesar del capitalismo, toda relación social está mediada por las mercanías.

    Con la caída del modelo de producción fordista y la pulverización de la fábrica nos encontramos no solo frente a un momento de crisis en el modelo de trabajo del hombre-masa sino también frente a la acelerada pauperización de las resistencias y disidencias políticas. El Imperio se caracteriza por un reconocimiento cínico de la imposibilidad del proyecto universalista del Estado. Entonces, la policía y la publicidad, mecanismos del Estado moderno, se transforman en Espectáculo y Biopoder. Se borra todo grado de interioridad en la vida psíquica de las personas pues la Ley ha pasado a ser la norma, a estar completamente internalizada. Nuestras relaciones son espectáculares porque están mediadas a través de la representación cibernética y nuestro deseo bajo el Biopoder porque la industria farmacopornográfica se encarga de generar dinero de la enfermedad y de la frustración sexual. La cibernética es el arte del control, la disciplina propia de tiempos donde la información se vuelve la mercancía que más valor produce.

    Frente al sinsentido contemporáneo, el \emph{sujeto} experimenta también una crisis profunda. El Comité Invisible llama Bloom al hombre-masa que se encuentra en el límite de la deserción, frustrado y castrado, enfermo de nihilismo y dispuesto al afuera. Sin embargo, la redención de esta forma masculina ha producido un Partido de la nada, la neorreacción, con una agenda tecnoutópica cuyo fin es hacer total el poder de la cibernética imperial. El Bloom es un hombre cínico que ha perdido incluso el significado que le daba el trabajo como recompensa frente a la alienación de verse reducido a un mero instrumento en una cadena de producción viva. Su fuerza vital es capturada por los agentes del Estaado encargados de producir el \emph{deseo de Estado} para alimentar una posición totalitaria y exterminista detrás de la que en realidad se oculta un profundo sentimiento infantil de abandono y represión sexual.

    En este contexto, la acción crítica se inscribe en lo que yo llamo \emph{tecnocrítica}, análisis y develamiento de las condiciones tecnomateriales de posibilidad de las formas hablantes, de formas de opresión como el género, la raza o la clase. Solo así es posible entender los problemas económicos que hacen necesario al Estado y a sus agentes como soporte de información del capitalismo. Con la intención de encontrar una alternativa universalista, analizo diversos manifiestos y posiciones políticas contemporáneas alrededor del Partido y la hegemonía. Concluyo desarrollando algunas notas rumbo a la construcción del manifiesto para un Partido destituyente.
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
```

The given code does not contain any specific part that is managing the depth of the index, nor does it contain any code that explicitly adds numbers to chapters.

1. The part managing the depth of the index cannot be determined from the given code.

2. The given code does not add numbers to chapters.

What part of this LaTeX code is 
1. managing the depth of the index
2. Adding numbers to chapters

Code:
```tex
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
    fontsize=9pt,%
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
%\usepackage{fontspec}
%\setmainfont{Spectral-Regular}
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

\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}
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
Primera edición, 2020. \\

\textcopyright{} \oldstylenums{2022} Versión 0.1 Disonancias\\
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

\minisec{Resumen}

\begin{quotation}
    ¿Cuáles son las posibilidades de actuar en en el momento más incierto y más absurdo de la Historia? Mientras cientos de activistas marchan religiosamente exigiendo al \emph{gobierno} (como si hubiera, de hecho, algo ahí que responda al llamado) un mundo más libre, más justo, más ecológico, los males propios de nuestro tiempo están presentes en todo momento en nuestra vida. Se trata de una configuración tecnológica de la realidad, una disposición de las cosas para que la gente actúe y responda frente a ellas de cierto modo. En la era de información, el rostro del totalitarismo se confunde en un virus capitalista que ciertamente ha dominado la nuda vida: en la sociedad no hay vida así sin más. Corporaciones, máquinas y aparatos ejercen su poder sin ninguna resistencia organizada capaz de proponer una alternativa universal al \emph{estado} actual de las cosas.

    Vivimos una imperceptible guerra civil en la que el enemigo a vencer no está ni siquiera en el montón de idiotas que rigen las corporaciones y los gobiernos nacionales sino en una religiosidad que profesa simpatía por la dominación mercantil. La Iglesia de esta fe se llama Estado moderno y en su génesis se encuentra la posiblidad misma de su destitución. En este texto contribuyo a analizar la relación entre Estado, capitalismo y mercados, así como el funcionamiento de la forma Estado como si se tratase de una ingeniería inversa, de un hackeo, pues el Leviatán funciona a partir de máquinas y de aparatos de captura, tiene agentes pagados que se encargan de cumplir diversas funciones alrededor del proceso de extracción de valor. Además de agentes, posee ejércitos, fuerza de trabajo que alimenta cada día la interacción entre mercados, que a su vez se vuelve el único medio por el cual es posible adquirir los medios de subsistencia. Sin embargo, el virus capitalista hace de cualquier necesidad un producto y del deseo, interés.

    No vivimos por sino a pesar del capitalismo, toda relación social está mediada por las mercanías.

    Con la caída del modelo de producción fordista y la pulverización de la fábrica nos encontramos no solo frente a un momento de crisis en el modelo de trabajo del hombre-masa sino también frente a la acelerada pauperización de las resistencias y disidencias políticas. El Imperio se caracteriza por un reconocimiento cínico de la imposibilidad del proyecto universalista del Estado. Entonces, la policía y la publicidad, mecanismos del Estado moderno, se transforman en Espectáculo y Biopoder. Se borra todo grado de interioridad en la vida psíquica de las personas pues la Ley ha pasado a ser la norma, a estar completamente internalizada. Nuestras relaciones son espectáculares porque están mediadas a través de la representación cibernética y nuestro deseo bajo el Biopoder porque la industria farmacopornográfica se encarga de generar dinero de la enfermedad y de la frustración sexual. La cibernética es el arte del control, la disciplina propia de tiempos donde la información se vuelve la mercancía que más valor produce.

    Frente al sinsentido contemporáneo, el \emph{sujeto} experimenta también una crisis profunda. El Comité Invisible llama Bloom al hombre-masa que se encuentra en el límite de la deserción, frustrado y castrado, enfermo de nihilismo y dispuesto al afuera. Sin embargo, la redención de esta forma masculina ha producido un Partido de la nada, la neorreacción, con una agenda tecnoutópica cuyo fin es hacer total el poder de la cibernética imperial. El Bloom es un hombre cínico que ha perdido incluso el significado que le daba el trabajo como recompensa frente a la alienación de verse reducido a un mero instrumento en una cadena de producción viva. Su fuerza vital es capturada por los agentes del Estaado encargados de producir el \emph{deseo de Estado} para alimentar una posición totalitaria y exterminista detrás de la que en realidad se oculta un profundo sentimiento infantil de abandono y represión sexual.

    En este contexto, la acción crítica se inscribe en lo que yo llamo \emph{tecnocrítica}, análisis y develamiento de las condiciones tecnomateriales de posibilidad de las formas hablantes, de formas de opresión como el género, la raza o la clase. Solo así es posible entender los problemas económicos que hacen necesario al Estado y a sus agentes como soporte de información del capitalismo. Con la intención de encontrar una alternativa universalista, analizo diversos manifiestos y posiciones políticas contemporáneas alrededor del Partido y la hegemonía. Concluyo desarrollando algunas notas rumbo a la construcción del manifiesto para un Partido destituyente.
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
```



1. The code does not contain anything related to managing the depth of the index.

2. Adding numbers to chapters is done by using the `scrbook` document class and setting the `chapterprefix` option to `true` or `false` depending on whether you want to include the word "Chapter" before the chapter number. In this code, `chapterprefix` is set to `false`, so chapter numbers will be displayed without the word "Chapter".

How can I add Obsidian wikilinks "[[link]]" to gollum git wiki gem in ruby

To add support for Obsidian-style wikilinks to Gollum git wiki gem in Ruby, you can modify the `Gollum::Markup::LinkParser` class to recognize and parse Obsidian-style links.

Here's an example of how you can modify the `Gollum::Markup::LinkParser` class to recognize Obsidian-style links:

```ruby
module Gollum
  module Markup
    class LinkParser
      alias_method :old_extract_links, :extract_links
      
      def extract_links
        old_extract_links
        extract_obsidian_links
      end
      
      def extract_obsidian_links
        @text.scan(/\[\[([^\]]+)\]\]/).each do |link|
          path = link[0]
          if !path.include?(':') && !path.start_with?('/') && !path.start_with?('#')
            href = "#{path.gsub(' ', '-').downcase}.html"
            @links << Link.new(href, path)
          end
        end
      end
    end
  end
end
```

This modification adds a new `extract_obsidian_links` method that scans the text for Obsidian-style links using a regular expression. It then creates a new `Link` object for each link found, with a URL that converts spaces to hyphens and lowercases the link text, and adds the link to the `@links` array.

You can then use the modified Gollum gem in your Ruby project to parse Obsidian-style links.

What is the easiest way to call a latex build from a ruby on rails application?  It will generate a book through a latex template for a given folder of markdown files

One way to call a LaTeX build from a Ruby on Rails application is to use the `system` method in Ruby to execute a command-line interface (CLI) command. 

Assuming you have LaTeX and related tools installed on your system, you can use a CLI command to generate a PDF from your LaTeX template and Markdown files. Here is an example command to generate a PDF using `pandoc` and `pdflatex`:

```
pandoc -s --toc --pdf-engine=pdflatex -o output.pdf input.md
```

To call this command from your Rails application, you can use the following code in a controller action or background job:

```ruby
system("pandoc -s --toc --pdf-engine=pdflatex -o output.pdf input.md")
```

Replace `input.md` with the path to your Markdown file and `output.pdf` with the desired output file name and location.

You can also use Ruby libraries like `kramdown-rfc2629` or `pandoc-ruby` to generate LaTeX code from Markdown files and then use a LaTeX engine like `pdflatex` to generate a PDF file. This would allow you to have more control over the LaTeX code and output formatting.