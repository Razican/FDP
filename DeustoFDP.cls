\NeedsTeXFormat{LaTeX2e}[1999/01/01]
\ProvidesClass{DeustoFDP}[2013/07/26 v0.1 Final Degree Proyect template for University of Deusto]

\LoadClass[a4paper,10pt]{book}          % We are using the template book as our base

\RequirePackage[UKenglish]{babel}       % LaTeX in English
\RequirePackage{csquotes}               % Using british quotes
\RequirePackage[citestyle=numeric-comp, % Defining the style for the biblography
                bibstyle=numeric,
                %style=trad-plain,
                %backref=true,
                maxnames=99,
                backrefstyle=two,
                abbreviate=false,
                backend=biber]
                {biblatex}
                                        % Document margins
\RequirePackage[tmargin=3cm,bmargin=3cm,lmargin=3.5cm,rmargin=2.5cm]{geometry}
\RequirePackage{setspace}               % Line spacing set to one and a half
\onehalfspacing
                                        % Space between paragraphs
\setlength{\parskip}{1ex plus 0.5ex minus 0.2ex}
\setlength\parindent{0pt}               % Without indentation

\RequirePackage{enumitem}
\setitemize{noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt}
\setenumerate{noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt}
\setlist[description,2]{font=\normalfont\itshape}
\setlist[description,3]{font=\normalfont\itshape}

\RequirePackage{fontspec}               % We load the fonts
\setmainfont{Arial}                     % Arial for the body of the text

\RequirePackage{fancyhdr}               % Package for personalizing the header and the footer of the page

\makeatletter                           % White pages on chapter change
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else%
\hbox{} \thispagestyle{empty} \newpage%
\if@twocolumn\hbox{}\newpage\fi\fi\fi}%
\makeatother

\fancypagestyle{plain}{                 % We redefine the page style at the begining of new chapters
  \fancyhf{}
  \fancyfoot[LE,RO]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{phdthesis}{             % We redefine the style for the front page
  \fancyhf{}
  \fancyhead[RO]{\itshape\MakeUppercase{Proyecto Fin de Grado}}
  \fancyhead[LE]{\sectionfont\itshape\thechapter. \leftmark}
  \fancyfoot[LE,RO]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}
\pagestyle{phdthesis}
\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{#1}}{}}

\makeatletter                           % First page of each chapter according to the style
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef{\thispagestyle{phdthesis}\@chapter}{\thispagestyle{plain}\@schapter}}
\makeatother

\RequirePackage{graphicx}               % Package for including images
\RequirePackage{booktabs}               % Package for doing professional tables
\RequirePackage{subcaption}             % Packages for doing sub-captions
\RequirePackage[chapter]{minted}        % Package for writing source code
                                        % Environment personalization for the source code
\renewcommand\listingscaption{Algorithm}
\renewcommand\listoflistingscaption{Algorithm Index}
\renewcommand{\listoflistings}{%
  %\addcontentsline{toc}{chapter}{\listoflistingscaption}%
  \listof{listing}{\listoflistingscaption}%
}

\RequirePackage{titlesec}               % Package for personalizing chapters
\newfontfamily\sectionfont{Arial}%texgyrebonum}% Font for titles

                                        % Special formats for chapters and sections
\titleformat{\chapter}[display]{\sectionfont\bfseries}{}{0pt}{\filleft\Large\thechapter.\quad\uppercase}[\titlerule\vspace{-2em}]
\titleformat{name=\chapter,numberless}{\sectionfont\bfseries}{}{0pt}{\Large}[\vspace{-2em}]
\titleformat{\section}{\sectionfont\bfseries}{}{0pt}{\Large\thesection. \uppercase}
\titleformat*{\subsection}{\large\bfseries\sectionfont}
\titleformat*{\subsubsection}{\large\bfseries\sectionfont}

\RequirePackage{etoolbox}
%\RequirePackage{tocbibind}              % Package for including various content tables in the main content table
\RequirePackage[titles]{tocloft}         % Package for personalizing the content table
\preto\section{\ifnum\value{section}=0\addtocontents{toc}{\vskip10pt}\fi}
\preto\figure{\ifnum\value{figure}=0\addtocontents{lof}{{\bfseries Cap\'itulo \thechapter\vskip10pt}}\fi}
\preto\table{\ifnum\value{table}=0\addtocontents{lot}{{\bfseries Cap\'itulo \thechapter\vskip10pt}}\fi}
\preto\listing{\ifnum\value{listing}=0\addtocontents{lol}{{\bfseries Cap\'itulo \thechapter\vskip10pt}}\fi}

\RequirePackage{hyperref}               % Package for introducing hyperlinks in the document
\hypersetup{
  unicode=true,
  bookmarksopen,
  breaklinks,
  plainpages=false,
  pdfborder={0 0 0},
}
\RequirePackage{microtype}              % Package that includes microtyping

\RequirePackage{flafter}                % Do not allow floating objects going backwards
