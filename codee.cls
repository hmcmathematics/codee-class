% \iffalse meta-comment
% 
% codee.cls -- CODEE Journal Article Class.
%
% $Id$
%
% Copyright (C) 2009, Consortium for Ordinary Differential
%                     Equations Educators.
%
% Contact Information:
%
% To be added later.
%
% License:
% 
% To be determined.  Good options are GPL, LPPL, some Creative
% Commons licenses.
%
% \fi
%%


\NeedsTeXFormat{LaTeX2e}[1995/06/01]
\ProvidesClass{codee}[2009/03/05 v0.05 CODEE Journal]

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
%\RequirePackage[psamsfonts]{amsfonts}
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

\ifcodeefinal
\RequirePackage[opticals,mathlf,minionint]{MinionPro}
\RequirePackage[toc,eqno,bib,lineno]{tabfigures}
\RequirePackage[sf,scaled=0.85]{myriad}
\else
% If Minion not available, use Times and Helvetica.
\RequirePackage{times}
\RequirePackage[scaled=0.85]{helvet}
\providecommand{\lnstyle}{\relax}
\fi

%%% Use Computer Modern Typewriter as the monospace typeface.
%%% (Code from cmtty.sty.)

\DeclareRobustCommand{\tyfamily}{%
  \fontfamily{cmtt}\fontencoding{OT1}\fontseries{m}\selectfont}

\DeclareTextFontCommand{\textty}{\tyfamily}


\let\texttt\textty
\let\tt\tyfamily
\let\ttfamily\tyfamily

%%% Make it possible to hyphenate type set in Computer Modern
%%% typewriter.

\begingroup
\catcode`\`=\active
\gdef\FV@fontfamily@tt{%
  \def\FV@FontScanPrep{\FV@MakeActive\`}%
%% SR modification begin - 1995
%%  \def\FV@FontFamily{\tt`{{\string`}}}}
  \def\FV@FontFamily{\tyfamily\edef`{{\string`}}}}
%% SR modification end
\gdef\FV@fontfamily@cmtt{%
  \def\FV@FontScanPrep{\FV@MakeActive\`}%
  \def\FV@FontFamily{\edef`{{\string`}}\fontfamily{cmtt}}}
\endgroup

\AtBeginDocument{\def\verbatim@font{\normalfont\tyfamily}}



% \@ifpackageloaded{hyperref}{%  hyperref is loaded
%   \AtBeginDocument{%
%     \hypersetup{backref,
%       colorlinks=true,
%       breaklinks=true,
%       pdfpagemode=FullScreen}

%     %% Define a command for creating a link to a URL in text while
%     %% displaying the URL (as opposed to using text as a link, for
%     %% which \href is fine).
%     \providecommand{\hlurl}[1]{\href{#1}{\textsf{\lnstyle{}#1}}}
%   }
% }{% hyperref not loaded
%   \ClassWarning{codee}{Load hyperref for additional functionality.}
%   \providecommand{\hlurl}[1]{\textsf{\lnstyle{}#1}}
%   \providecommand{\href}[2]{#1}
% }



%%% Load hyperref if not loaded.
\@ifpackageloaded{hyperref}{}{%
  \AtBeginDocument{\usepackage{hyperref}}
}

%%% Set some defaults for hyperref.
\AtBeginDocument{%
  \hypersetup{backref,
    colorlinks=true,
    breaklinks=true,
    pdfpagemode=FullScreen}
  
  %% Define a command for creating a link to a URL in text while
  %% displaying the URL (as opposed to using text as a link, for
  %% which \href is fine).
  \providecommand{\hlurl}[1]{\href{#1}{\textsf{\lnstyle{}#1}}}
}


%% Use sans-serif for URLs.
\def\url@sfstyle{%
 \@ifundefined{selectfont}{\def\UrlFont{\sf\lnstyle}}{\def\UrlFont{\sffamily\lnstyle}}}

\renewcommand{\url}{\begingroup \urlstyle{sf}\Url}

\begingroup
\catcode`\`=\active
\gdef\FV@fontfamily@tt{%
  \def\FV@FontScanPrep{\FV@MakeActive\`}%
%% SR modification begin - 1995
%%  \def\FV@FontFamily{\tt`{{\string`}}}}
  \def\FV@FontFamily{\tyfamily\edef`{{\string`}}}}
%% SR modification end
\gdef\FV@fontfamily@cmtt{%
  \def\FV@FontScanPrep{\FV@MakeActive\`}%
  \def\FV@FontFamily{\edef`{{\string`}}\fontfamily{cmtt}}}
\endgroup


\ifpdf

%%% Allow searching for ligatures in PDF.
\InputIfFileExists{glyphtounicode}{}{}
\pdfgentounicode=1
\usepackage{microtype}
\fi


%%% Define some commands for use with this class.
\newcommand{\@pubname}{Consortium of Ordinary Differential Equations Journal}
\newcommand{\@codeebase}{http://www.codee.org/ref/}
% \def\author#1{\gdef\@author{#1}\gdef\@headauthor{#1}}
% \def\@author{\@latex@warning@no@line{No \noexpand\author given}\relax}
% \def\title#1{\gdef\@title{#1}\gdef\@headtitle{#1}}
% \def\@title{\@latex@warning@no@line{No \noexpand\title given}\relax}
\let\@ldAuthor\author
\renewcommand{\author}[1]{\renewcommand{\thanks}[1]{}%
  \renewcommand{\and}{; }%
  \edef\@headauthor{#1}\@ldAuthor{#1}}
\let\@ldTitle\title
\renewcommand{\title}[1]{\newcommand{\@headtitle}{#1}\@ldTitle{#1}}
\newcommand{\address}[1]{\relax}
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
% \def\issuevolume#1{\gdef\@issuevolume{#1}}
% \def\@issuevolume{\@latex@warning@no@line{No \noexpand\volume given}\relax}
% \def\issuenumber#1{\gdef\@issuenumber{#1}}
% \def\@issuenumber{\@latex@warning@no@line{No \noexpand\number given}\relax}



%%% Define some environments for formatting text.
\renewenvironment{abstract}{%
  \begin{quotation}
    \noindent\textbf{Abstract: }}%
  {\end{quotation}}



%%% Define the page headers.
\pagestyle{fancy}
  \fancyhf{}                    % Clear all headers and footers.
  \fancyhead[LE]{\textsf{\textbf{\lnstyle\thepage}}}
  \fancyhead[RE]{\textsf{\nouppercase{\@headtitle}}}
  \fancyhead[LO]{\textsf{\nouppercase{\@headauthor}}}
  % \fancyhead[RE]{\textsf{\nouppercase{\leftmark}}}
  % \fancyhead[LO]{\textsf{\nouppercase{\rightmark}}}
  \fancyhead[RO]{\textsf{\textbf{\lnstyle\thepage}}}
  \fancyfoot[LE,RO]{\textsf{\textsc{Codee} Learning Assets Library: \@pubtype}}
  \fancyfoot[RE,LO]{\hlurl{\@codeebase\@articlenumber}}
  \renewcommand{\headrulewidth}{1pt}
  \renewcommand{\footrulewidth}{1pt}

\fancypagestyle{front}{%
  \fancyhf{}
  \fancyfoot[LE,LO]{{\fontshape{scit}\selectfont Codee}\emph{ Journal}}
  \fancyfoot[RE,RO]{\textsf{Learning Assets Library: \@pubtype\
      \textbullet\ \hlurl{\@codeebase\@articlenumber}}}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{1pt}
}

% \pagestyle{fancy}{%
%   \fancyhf{} %% Clear all headers and footers.
%   \fancyhead[E]{%
%     \fcolorbox{\@colorscheme}{\@colorscheme}{%
%       \makebox[\textwidth][l]{%
%         {\color{white}\textsc{Codee} Learning Assets Library: \@title}
% %        {\color{white}\textsc{Codee} Learning Assets Library: \@pubtype}
%       }
%     }
%   }
%   \fancyhead[O]{\small{\fcolorbox{\@colorscheme}{\@colorscheme}{\href{\@codeebase\@articlenumber}{\@codeebase\@articlenumber}}\hfill}}
% %   \fancyhead[LE]{\nouppercase\leftmark}
% %   \fancyhead[RO]{\nouppercase\rightmark}
%   \fancyfoot[LE]{\textbf{\thepage{}}}
%   \fancyfoot[RO]{\textbf{\thepage}}
% %   \fancyfoot[LE]{\emph{\@pubname}}
% %   \fancyfoot[RO]{Volume \textbf{\@issuevolume}, Number \@issuenumber}
% }
% \fancypagestyle{front}{%
% \fancyhf{}
% }


%%% Redefine the \sectionmark and \subsectionmark commands.  Note that
%%%  this redefinition must occur after setting pagestyle to fancy.
\renewcommand{\sectionmark}[1]{%
  \markboth{#1}{}}
\renewcommand{\subsectionmark}[1]{%
  \markright{#1}{}}


%%% Make the section numbers appear using lining figures.
%%% (\Tf@font comes from the tabfigures package.)
% \renewcommand{\@seccntformat}[1]{{\fontfamily{pkc}\selectfont\csname%
% the#1\endcsname}\quad}%
\renewcommand{\@seccntformat}[1]{{\lnstyle\csname%
the#1\endcsname}\quad}%

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\sffamily\Large\bfseries\lnstyle}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\sffamily\large\bfseries\lnstyle}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\sffamily\normalsize\bfseries\lnstyle}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\sffamily\normalsize\bfseries\lnstyle}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\sffamily\normalsize\bfseries\lnstyle}}


%%% Define the layout of the article header.
% \renewcommand{\@maketitle}{%
%   \thispagestyle{front}
% %  \vspace{-1in}
%   \let \footnote \thanks
%   {\LARGE\raggedright\noindent\emph{\lnstyle\@title} \par}%
%   \vskip 1.5em%
%   {\large
%     \lineskip .5em%
%     \global\let\and\\
%     \noindent\@author\par
%     \vskip 1em%
%   }
%     {\normalsize\noindent\textsf{\textbf{Keywords:}} \@keywords \par}%
%     \par
%     {\small\noindent Manuscript received on \@submitdate;
%       published on \@pubdate.\par}%
%     \par
%     \vskip 1.5em% 
%     \global\let\@thanks\relax
%     \global\let\thanks\relax
% }
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
  \let \footnote \thanks
  {\LARGE\raggedright\noindent\emph{\lnstyle\@title} \par}%
  {\large
    \lineskip .5em%
    \global\let\and\\
    \noindent\@author\par
    \vskip 1em%
  }
    {\normalsize\noindent\textsf{\textbf{Keywords:}} \@keywords \par}%
    \par
    {\small\noindent Manuscript received on \@submitdate;
      published on \@pubdate.\par}%
    \par
    \vskip 1.5em% 
}


\endinput

