% This file provides a LaTeX2e class for theses that are formatted as
% per Syracuse University (SU) requirements and recommendations. It 
% modifies the standard LaTeX book class.
% 
% Author: Arun Subramanian, arsubram@syr.edu
% Last modified: Sept. 22, 2011
%
% Comments:
% ========
% 		1.	Use the file Example.tex to gain familiarity with the class 
% 		2. 	The class file is bug free as far as I have tested it. Email 
% 			me any corrections. 
% 		3. 	Also, if you wish to improve the class in any way, while 
% 			maintaining consistency with SU guidelines, feel free to email 
% 			me with your suggestions and updated class file.
% 		4. 	Currently, only one undergraduate and one graduate degree can 
% 			be listed for the title page (see example provided). This 
% 			seems to be a "typical set," and so I am not investing more 
% 			time and energy generalizing this.
% 		5.	Time permitting, I will try to incorporate \hyperref{} 
% 			compatibility (i.e., creating PDFs with bookmarks). I will 
% 			also be grateful if anyone using this is eager and able to 
% 			take up the project on their own :-)
%
% -----< Identification >-----
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{syrthesis}

% -----< Initial code >-----
% [optional code here]
\newcommand{\thesismonthyr}[2]{%
\ifx\empty#1\empty\else\gdef\@tmonth{#1}\gdef\@tyear{#2}\fi
}
\date{\@tmonth\: \@tyear}

\newcommand{\ugdegree}[1]%
  {\ifx\empty#1\empty\else\gdef\@ugdegree{#1}\fi}
\newcommand{\uginst}[1]%
  {\ifx\empty#1\empty\else\gdef\@uginst{#1}\fi}
\newcommand{\ugyear}[1]
  {\ifx\empty#1\empty\else\gdef\@ugyear{#1}\fi}

\newcommand{\mcadegree}[1]{\def\@mcadegree{#1}}
\mcadegree{}
  
  
\newcommand{\msdegree}[1]{\def\@msdegree{#1}}
\msdegree{}
%\global\let\@msdegree\@empty
%\global\let\msdegree\relax

\newcommand{\gradinst}[1]
  {\ifx\empty#1\empty\else\gdef\@gradinst{#1}\fi}
\newcommand{\msyear}[1]%
  {\ifx\empty#1\empty\else\gdef\@msyear{#1}\fi}
\newcommand{\degree}[1]%
  {\ifx\empty#1\empty\else\gdef\@degree{#1}\fi}
\newcommand{\program}[1]%
  {\ifx\empty#1\empty\else\gdef\@program{#1}\fi}

% Up to three (co-)advisors
\newcommand{\thesisadvisorA}[1]{\def\@thesisadvisorA{#1}}
\thesisadvisorA{}
\newcommand{\thesisadvisorB}[1]{\def\@thesisadvisorB{#1}}
\thesisadvisorB{}
\newcommand{\thesisadvisorC}[1]{\def\@thesisadvisorC{#1}}
\thesisadvisorC{}

\newcommand{\thesistype}[1]%
  {\ifx\empty#1\empty\else\gdef\@thesistype{#1}\fi}

\newcommand{\capage}{%
		\addtocounter{page}{1} \relax
}

\newcommand{\@insAdv}[1]{%
\par\vspace{10\p@}
 \rule{12em}{.1pt}%
\par\vspace{-10\p@}
#1\\
}

\newcommand{\signaturecontent}{
\relax
}
% --------------------------

% -----< Option declaration >-----
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{capage}{% "Easter egg" option
\renewcommand{\capage}{%
	\newpage \thispagestyle{empty}
	\vfill 
	{\centering \Large COMMITTEE APPROVAL PAGE GOES HERE \\ 
		REMOVE WITH PDF SOFTWARE BEFORE SUBMISSION}
	\vfill
	\pagebreak
}
}

\DeclareOption{unsignedthesis}{ % Unsigned title page
\renewcommand{\signaturecontent}{ %
\vfill
\begin{minipage}[c]{\textwidth}
\centering
\singlespacing
\ifx \@thesisadvisorA\@empty
\relax
\else
%Committee Members: 
\\ \par
\@thesisadvisorA \par
\fi
\ifx \@thesisadvisorB\@empty
\relax
\else
\@thesisadvisorB \par
\fi
\ifx \@thesisadvisorC\@empty
\relax
\else
\@thesisadvisorC
\fi
\end{minipage}
}}

\DeclareOption{signedthesis}{ % Signed title page
\renewcommand{\signaturecontent}{ %
\vfill
{\flushright
{\small Approved \rule{12em}{.1pt}%
\par\vspace{-10\p@}
\@thesisadvisorA \\
\ifx \@thesisadvisorB\@empty
\relax
\else
 \@insAdv{\@thesisadvisorB}
\fi
\ifx \@thesisadvisorC\@empty
\relax
\else
 \@insAdv{\@thesisadvisorC}
\fi
}}
\vspace{20\p@}\par
{\flushright
\small Date \rule{14.2em}{0.1pt}\par}
}
}


% -----< Option Execution >-----

\ProcessOptions 	\relax

% -----< Package Loading >-----

\LoadClass[oneside,openany]{book}
\RequirePackage[letterpaper,
				left=1.5in,right=1in,
				top=1in,bottom=1in]{geometry}
\RequirePackage[doublespacing]{setspace}
\RequirePackage[overload]{textcase}
\RequirePackage{fancyhdr}
\RequirePackage{sectsty}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define pagestyles
\fancypagestyle{fmatter}{%
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyfoot[C]{\thepage}
}

\fancypagestyle{body}{%
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyhead[R]{\thepage}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% -----< Redefine Chapter Headings >-----

% Numbered chapter heading style:

\renewcommand{\@makechapterhead}[1]{%
\thispagestyle{body}
  % \vspace*{50\p@}%
   \vspace*{0.1in}%
  {\renewcommand{\rmdefault}{ppl}
  %\small	\parindent \z@ 
	\raggedright \normalfont
    %\hrule                                           % horizontal line
    \vspace{1pt}%                                    % add some vertical space
    \ifnum \c@secnumdepth >\m@ne
        \LARGE\scshape \@chapapp\space \thechapter    % Chapter followed by number
        \par\nobreak
        \vskip -10\p@
    \fi
    \interlinepenalty\@M
    \Huge \scshape #1\par                            % chapter title
    \vspace{1pt}%                                    % add some vertical space
    %\hrule                                           % horizontal rule
    \nobreak
    \vskip 10\p@
	\vspace*{1in}
  }\renewcommand{\rmdefault}{ptm}}

% Unnumbered chapter heading style:

\renewcommand{\@makeschapterhead}[1]{%
  \vspace*{0.2in}%
  {\renewcommand{\rmdefault}{ppl}
 	% \parindent \z@ 
	\raggedright \normalfont
    % \hrule                                           % horizontal line
    \vspace{5pt}%                                    % add some vertical space
    \interlinepenalty\@M
    \Huge \scshape #1\par                            % chapter title
    \vspace{5pt}%                                    % add some vertical space
    % \hrule                                           % horizontal line
    \nobreak
    \vskip 40\p@
  }\renewcommand{\rmdefault}{ptm}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% -----< Front matter chapters >-----

% First a generic frontmatter format
\newenvironment{frontmatters}[1]{%
\chapter*{#1}
%\par\noindent
%\ignorespacesafterend
}{%
}

% Abstract: different environment rather than redefine pre-existing
% environment
\newenvironment{abstract}{%
\vspace{2in}
{\parindent \z@ \raggedright \normalfont
\makebox[\textwidth][c]{\renewcommand{\rmdefault}{ppl} \Large  \sc Abstract }}
\fontfamily{ptm}\selectfont
\vspace*{25\p@}
\par\noindent
\ignorespacesafterend
\pagestyle{empty}
}{%
\newpage
\par \relax
}

% Acknowledgment 
\newenvironment{acknowledgment}{%
\begin{frontmatters}{Acknowledgments}
\addcontentsline{toc}{chapter}{Acknowledgments}
}{%
\end{frontmatters}
}

% Table of contents, Figures & Tables
\renewcommand{\contentsname}{Table of Contents}
\renewcommand{\figurename}{Fig. }
\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \fontfamily{ptm}\selectfont
	\@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }

% LOF
\renewcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
	\addcontentsline{toc}{chapter}{\listfigurename}
    \fontfamily{ptm}\selectfont
	\@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }

% LOT
\renewcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
	\addcontentsline{toc}{chapter}{\listtablename}
    \fontfamily{ptm}\selectfont
	\@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -----< Title page >-----

\newcommand{\syrtitle}{%
\thispagestyle{empty}
\fontfamily{ppl}\selectfont
\begin{centering}
\vspace*{25\p@}
{\Large \MakeTextUppercase{\@title} \par}
\vspace{50\p@}
{\normalsize 
By\\
\vspace{25\p@}
\makebox[\textwidth][c]{\large \@author}  \par
\vspace{-2ex}
{\singlespacing
%\makebox[\textwidth][c]{\@ugdegree,\ \@uginst, \@ugyear} \par
\makebox[\textwidth][c]{\@ugdegree} \par
{\ifx \@msdegree\@empty
\par\relax
\else
\makebox[\textwidth][c]{\@msdegree} \par
\fi}
}
\vspace{50\p@}
\par {\singlespacing
\makebox[\textwidth][c]{\MakeTextUppercase{\@thesistype}} \par
\vspace{25\p@}
Submitted in partial fulfillment of the requirements for the degree of\par
\makebox[\textwidth][c]{\@degree\ in \@program} \par
}
% \vspace{25\p@}
\vfill
\begin{minipage}[c]{\textwidth}
\centering
\singlespacing
Syracuse University \par
\@date 
\end{minipage}
}
\end{centering}
\signaturecontent
}

% ----< Make the full title matter >----
% This one puts a copyright page and committee approval page
\newcommand{\makefinaltitle}{%
	\syrtitle
	{% 
	 \newpage \thispagestyle{empty}
	 \vspace*{50\p@}
	 { \centering Copyright\ \copyright\ \@tyear\ \@author \\
		All rights reserved \par}
	}{%
		\capage
	}
}

% this one creates a draft version that can 
% also be used for QEs and proposals
\newcommand{\makereviewtitle}{%
	\syrtitle
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ------< Modification of \frontmatter >-----
\renewcommand{\frontmatter}{%
\cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}
	\pagestyle{fmatter}
}
% ------< Modification of \mainmatter >-----
\newcommand{\bodychapters}{%
\mainmatter
\pagestyle{body}
}
% -----< Sections, subsections, subsubsections>-----
\allsectionsfont{\fontfamily{ppl}\selectfont}
\subsubsectionfont{\fontfamily{ppl}\selectfont\itshape}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Vita
\newenvironment{vitalist}{%
\let\olditem\item% 
\renewcommand\item[1][]{\olditem \MakeTextUppercase{##1}}%
\begin{description}
}{%
\end{description}
}

\newenvironment{vita}{%
\newpage
\chapter*{Vita}
\thispagestyle{empty}
\pagestyle{empty}
\begin{vitalist}
\item[Name of author: ] \@author \\
}{%
\end{vitalist}
}


% Bibliography
\renewcommand\bibname{References}
\renewenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
	  \addcontentsline{toc}{chapter}{\bibname}	  
	  \fontfamily{ptm}\selectfont
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m
	  \thispagestyle{body}
	  \pagestyle{body}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Misc
\AtBeginDocument{%
\setlength{\headheight}{15pt}
\usepackage[T1]{fontenc}
\renewcommand{\rmdefault}{ptm} % Use Times as the default roman font
\setcounter{page}{0}
\pagenumbering{roman}
}

% End of class
\endinput

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% STUFF BELOW WAS REPLACED BY '\signaturecontent' IN TITLE PAGE CODE %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\vfill
%{\flushright
%{\small Approved \rule{12em}{.1pt}%
%\par\vspace{-10\p@}
%\@thesisadvisorA \\
%\ifx \@thesisadvisorB\@empty
%\relax
%\else
% \@insAdv{\@thesisadvisorB}
%\fi
%\ifx \@thesisadvisorC\@empty
%\relax
%\else
% \@insAdv{\@thesisadvisorC}
%\fi
%}}
%\vspace{20\p@}\par
%{\flushright
%\small Date \rule{14.2em}{0.1pt}\par}