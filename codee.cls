% \iffalse meta-comment
%
% codee.cls -- CODEE Journal Article Class.
%
% Copyright (C) 2009-2016  Consortium for Ordinary Differential Equations Educators.
%
% This work may be distributed and/or modified under the conditions of
% the LaTeX Project Public License, either version 1.3 of this license
% or (at your option) any later version.
%
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is CODEE <codee@hmc.edu>
%
% This work consists of all files listed in manifest.txt.
%
% Source code available from https://github.com/hmcmathematics/codee-class/
%
% \fi
%%


\NeedsTeXFormat{LaTeX2e}[1995/06/01]
\ProvidesClass{codee}[2016/06/07 v1.00 CODEE Journal]

%%% Get some useful information when errors occur.
\setcounter{errorcontextlines}{25}


%%% Set some defaults for color scheme and publication type.
\newcommand{\@colorscheme}{article}
\newcommand{\@pubtype}{Article}

%%% Declare and set some options.
\DeclareOption{article}%
{\renewcommand{\@colorscheme}{article}%
  \renewcommand{\@pubtype}{Article}}
  
\DeclareOption{review}%
{\renewcommand{\@colorscheme}{review}%
  \renewcommand{\@pubtype}{Review}}
  
\DeclareOption{project}%
{\renewcommand{\@colorscheme}{project}%
  \renewcommand{\@pubtype}{Project}}

\newif\ifcodeefinal\codeefinalfalse
\DeclareOption{codeefinal}%
{\codeefinaltrue}

\ExecuteOptions{}
\ProcessOptions


%%% Load the base class.
\LoadClass[12pt,twoside]{article}

%%% Load some required/very useful packages.
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{xspace}
\RequirePackage{verbatim}
\RequirePackage{ifthen}
\RequirePackage{graphics}
\RequirePackage{url}
\RequirePackage{fancyhdr}
\RequirePackage{ifpdf}
\RequirePackage[tmargin=1in,hmarginratio=1:1,vmarginratio=1:1]{geometry}

\RequirePackage{color}
\definecolor{article}{cmyk}{0.48,0.31,0,0}
\definecolor{review}{cmyk}{0.26,0,0.38,0}
\definecolor{project}{cmyk}{0.2,0.44,0.28,0}
\definecolor{articlelt}{cmyk}{0.20,0.13,0,0}
\definecolor{reviewlt}{cmyk}{0.11,0.01,0.17,0}
\definecolor{projectlt}{cmyk}{0.08,0.19,0.11,0}


%%% Set the base font.

\RequirePackage[toc,eqno,bib,lineno]{tabfigures}
\RequirePackage{textcomp}
\RequirePackage[sb]{libertine}
\RequirePackage[scaled=0.9]{sourcecodepro}
\RequirePackage[libertine,bigdelims,vvarbb]{newtxmath} % bb from STIX
\RequirePackage[cal=boondoxo]{mathalfa} % mathcal
\useosf % osf for text, not math
\RequirePackage[supstfm=libertinesups,%
    supscaled=1.2,%
    raised=-.13em]{superiors}

% Make sure we have lining-style figures we can use for section
% heads, page numbers, titles, and so on.
\DeclareRobustCommand{\lnstyle}{\libertineLF}
\DeclareRobustCommand{\sflnstyle}{\biolinumLF}
\DeclareTextFontCommand{\textln}{\lnstyle}
\DeclareTextFontCommand{\textsfln}{\sflnstyle}
    

%%% Load hyperref if not loaded.
\@ifpackageloaded{hyperref}{}{%
  \AtBeginDocument{\usepackage{hyperref}}
}

%%% Set some defaults for hyperref.
\AtBeginDocument{%
  \hypersetup{backref,
    colorlinks=true,
    breaklinks=True,
    citecolor=blue,
    bookmarks,
    pdfpagemode=UseOutlines,
    pdfpagelayout=SinglePage
}
  
  %% Define a command for creating a link to a URL in text while
  %% displaying the URL (as opposed to using text as a link, for
  %% which \href is fine).
  \providecommand{\hlurl}[1]{\href{#1}{\textsfln{#1}}}
}

% The following code *does not work*, because hyperref redefines
% the \url command to do things its way.
%
% %% Use sans-serif for URLs.
% \def\url@sfstyle{%
%  \@ifundefined{selectfont}{\def\UrlFont{\sf\lnstyle}}{\def\UrlFont{\sffamily\lnstyle}}}
%
% \renewcommand{\url}{\begingroup \urlstyle{sf}\Url}
%
% We can get sans-serif URLs, by adding a line similar to
%    \renewcommand{\url}[1]{\hlurl{#1}}
% inside the \AtBeginDocument{} block, but then you run into
% issues with URLs containing characters that TeX considers to be
% special (e.g., _).  So we'll just leave things as-is for now.

\ifpdf
  %%% Allow searching for ligatures in PDF.
  \IfFileExists{glyphtounicode}{%
    \input{glyphtounicode}
    \pdfgentounicode=1}{}
  \RequirePackage{microtype}
  \DisableLigatures{encoding = T1, family = tt* }
\fi


%%% Code for handling \author and \affiliation commands.  Code is
%%% taken from or based on Boris Veytsman's erdc class; some of
%%% that code was based on work done for the AMS.
\newcommand{\xandlist}[4]{\@andlista{{#1}{#2}{#3}}#4\and\and}
\def\@andlista#1#2\and#3\and{\@andlistc{#2}\@ifnotempty{#3}{%
  \@andlistb#1{#3}}}
\def\@andlistb#1#2#3#4#5\and{%
  \@ifempty{#5}{%
    \@andlistc{#2#4}%
  }{%
    \@andlistc{#1#4}\@andlistb{#1}{#3}{#3}{#5}%
  }}
\let\@andlistc\@iden
\newcommand{\nxandlist}[4]{%
  \def\@andlistc##1{\toks@\@xp{\the\toks@##1}}%
  \toks@{\toks@\@emptytoks \@andlista{{#1}{#2}{#3}}}%
  \the\@xp\toks@#4\and\and
  \edef#4{\the\toks@}%
  \let\@andlistc\@iden}
\def\@@and{and}
\newcommand{\andify}{%
  \nxandlist{\unskip, }{\unskip{} \@@and~}{\unskip, \@@and~}}
\def\and{\unskip{ }\@@and{ }\ignorespaces}
\let\@xp\expandafter\relax
\let\@nx=\noexpand
\def\@oparg#1[#2]{\@ifnextchar[{#1}{#1[#2]}}
\long\def\@ifempty#1{\@xifempty#1@@..\@nil}
\long\def\@xifempty#1#2@#3#4#5\@nil{%
  \ifx#3#4\@xp\@firstoftwo\else\@xp\@secondoftwo\fi}
\long\def\@ifnotempty#1{\@ifempty{#1}{}}
\def\setboxz@h{\setbox\z@\hbox}
\def\@addpunct#1{%
  \relax\ifhmode
    \ifnum\spacefactor>\@m \else#1\fi
  \fi}
\newtoks\@emptytoks
\def\authors{}
\def\addresses{}
\def\author#1{%
  \ifx\@empty\authors\gdef\authors{#1}\else
  \g@addto@macro{\authors}{\and#1}\fi
  \ifx\@empty\@addresses\gdef\addresses{\author{#1}}\else
  \g@addto@macro{\addresses}{\par\author{#1}}\fi}
\def\affiliation#1{%
  \ifx\@empty\@addresses\gdef\addresses{#1\par}\else
  \g@addto@macro{\addresses}{#1\par\vspace{\baselineskip}}\fi}




%%% Additional frontmatter commands.
\newcommand{\@pubname}{Consortium of Ordinary Differential Equations Journal}
\newcommand{\@codeebase}{http://www.codee.org/ref/}

\newcommand{\shortauthor}[1]{\gdef\@shortauthor{#1}}
\newcommand{\@shortauthor}{\@latex@warning@no@line{No
    \noexpand\shortauthor given} No \texttt{shortauthor} Defined}

\newcommand{\shorttitle}[1]{\gdef\@shorttitle{#1}}
\renewcommand*{\title}[2][\DefaultTitle]{%
  \def\DefaultTitle{#2}
  \gdef\@shorttitle{#1}%
  \gdef\@title{#2}}


% \let\@ldTitle\title
% \renewcommand{\title}[1]{\newcommand{\@headtitle}{#1}\@ldTitle{#1}}
% \newcommand{\address}[1]{\relax}
\newcommand{\dedicatory}[1]{\relax}
\newcommand{\keywords}[1]{\gdef\@keywords{#1}}
\newcommand{\@keywords}{\@latex@warning@no@line{No \noexpand\keywords given}\relax}
\newcommand{\articlenumber}[1]{\gdef\@articlenumber{#1}}
\newcommand{\@articlenumber}{\@latex@warning@no@line{No \noexpand\articlenumber given}\relax}
\newcommand{\submissiondate}[1]{\gdef\@submitdate{#1}}
\newcommand{\@submitdate}{\@latex@warning@no@line{No
    \noexpand\submissiondate given}{To Be Determined}}
\newcommand{\publicationdate}[1]{\gdef\@pubdate{#1}}
\newcommand{\@pubdate}{\@latex@warning@no@line{No
    \noexpand\publicationdate given}{To Be Determined}}



%%% Define some environments for formatting text.
\renewenvironment{abstract}{%
  \begin{quotation}
    \noindent\textbf{Abstract: }}%
  {\end{quotation}}



%%% Define the page headers.
\pagestyle{fancy}
  \fancyhf{}                    % Clear all headers and footers.
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyfoot[C]{\textbf{\textsfln{\thepage}}
}

\fancypagestyle{front}{%
  \fancyhf{}
  \fancyfoot[RE,LO]{\textsf{\emph{CODEE Journal}}}
  \fancyfoot[LE,RO]{\hlurl{http://www.codee.org/}}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{1pt}
}


%%% Redefine the \sectionmark and \subsectionmark commands.  Note that
%%%  this redefinition must occur after setting pagestyle to fancy.
\renewcommand{\sectionmark}[1]{%
  \markboth{#1}{}}
\renewcommand{\subsectionmark}[1]{%
  \markright{#1}{}}


%%% Make the section numbers appear using lining figures.
%%% (\Tf@font comes from the tabfigures package.)
\renewcommand{\@seccntformat}[1]{{\sflnstyle\csname%
the#1\endcsname}\quad}%

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\Large\bfseries\sflnstyle}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\large\bfseries\sflnstyle}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalsize\bfseries\sflnstyle}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalsize\bfseries\sflnstyle}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalsize\bfseries\sflnstyle}}


\renewcommand{\maketitle}{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{front}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \let\footnote\thanks
  {\LARGE\raggedright\noindent\emph{\lnstyle\@title} \par}%
  {\large
    \lineskip .5em%
     \def\author##1{%
       \def\@tempa{##1}%
       \nxandlist{\unskip, }{\unskip{} \@@and~}{\unskip, \@@and~}\@tempa
       {\upshape\normalsize\@tempa}\par\vspace{1.5\p@}}%
     \begin{minipage}{\textwidth}
     \textit{\footnotesize\addresses}\par
   \end{minipage}
    \vskip 1em%
  }
    {\normalsize\noindent\textsf{\textbf{Keywords:}} \@keywords \par}%
    \par
    {\small\noindent Manuscript received on \@submitdate;
      published on \@pubdate.\par}%
    \vskip 1.5em% 
}


\endinput

