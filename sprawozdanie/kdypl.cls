% Klasa dokument\'ow do sk{\l}adu prac magisterskich/licencjackich
% na Wydziale Nauk Społecznych UAM (wersja 1.0)
%
%
% This work may be distributed under the terms of the LaTeX Project
% Public License, as described in lppl.txt in the base LaTeX
% distribution.  Either version 1.0 or, at your option, any later version.
%
% Klasa kmgr mo\.ze by\'c rozpowszechniana na zasadach publicznej
% licencji LaTeX Project (The LaTeX project public license, LPPL,
% por. http://www.latex-project.org/lppl/)
% Istota LPPL sprowadza si\k{e} do tego, \.ze modyfikacje pliku dozwolone
% s\k{a} wylacznie pod warunkiem zmiany jego nazwy.
%

\def\ThisClassVersionId{v1.0}
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kmgr}[2010/05/30 \ThisClassVersionId, Praca magisterska/licencjacka]

\def\@baseclass{report}
\def\@rodzajpracy{magisterska}
\def\@BInterlinia{\relax}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\@baseclass}}
\PassOptionsToClass{a4paper,oneside,openany,11pt}{\@baseclass}
%
\newif\if@kmgrauthoryear
\DeclareOption{autorrok}{\@kmgrauthoryeartrue}
\newif\if@kmgrbackref \DeclareOption{backref}{\@kmgrbackreftrue}
\DeclareOption{licencjacka}{\def\@rodzajpracy{licencjacka}}
% opcja `brudnopis' jest poprawiona -- teraz wykorzystuje pakiet `prelim2e'
\DeclareOption{brudnopis}{\AtEndOfClass{\input{prelim2e.sty}%
  \renewcommand{\PrelimWords}{\ThisDocVersionId}\linespread{1.0}}}
\DeclareOption{xodstep}{\AtEndOfClass{\linespread{1.3}}}
\ProcessOptions
%
\LoadClass{\@baseclass}
%
\usepackage{graphicx}
%\usepackage[MeX]{polski}
%%
\if@kmgrbackref 
  \usepackage[breaklinks,pagebackref]{hyperref}\else
  \usepackage[breaklinks]{hyperref} \fi
  \if@kmgrauthoryear 
  \typeout{*** Cytowanie autor-rok ***}\RequirePackage{natbib}\fi
%
%
\textwidth\paperwidth
\advance\textwidth -55mm
\oddsidemargin-1in
\advance\oddsidemargin 30mm
\evensidemargin-1in
\advance\evensidemargin 25mm
\topmargin -1in
\advance\topmargin 25mm
\setlength\textheight{48\baselineskip}
\addtolength\textheight{\topskip}
\marginparwidth15mm
%
\widowpenalty999999
\tolerance450
\pretolerance250
\hfuzz=1.5pt
\hbadness1450
%
\def\AndNextAuthor{\ifnum\language=0\& \else i \fi}
\newcount\authornumber
\authornumber=0
%
\def\author#1{%
  \global\advance\authornumber\@ne
  \expandafter\def\csname theauthor\number\authornumber\endcsname
      {\ignorespaces#1\unskip}%
  \expandafter\def\csname theauthorid\number\authornumber
  \endcsname{???\ClassError{kmgr}{Brak numeru albumu}\@ehc}%
  \expandafter\let\csname thenetaddress\number\authornumber\endcsname\relax }
%
\def\nralbumu#1{%
  \expandafter\def\csname theauthorid\number\authornumber\endcsname
      {\ignorespaces#1\unskip}}
\def\email#1{% -- opcjonalny --
  \expandafter\def\csname thenetaddress\number\authornumber\endcsname
      {\ignorespaces#1\unskip}}

%%\def\authorlist#1{\def\@author{#1}}
\def\@author{\@defaultauthorlist}

\newcount\count@@

\def\@defaultauthorlist{%
   \count@=\authornumber
   \count@@=0
   \loop
   \ifnum\count@>0
      \advance\count@@ by 1
      \begingroup \Large\bf
      \ignorespaces\csname theauthor\number\count@@\endcsname\par
      \normalsize \rm nr~albumu:
      \ignorespaces\csname theauthorid\number\count@@\endcsname\par
      % adres email nie jest drukowany -- ale si{\e} przyda
      %%\ignorespaces\csname thenetaddress\number\count@@\endcsname
      \par 
      \medskip \endgroup
      \advance\count@ by -1
   \repeat
  }

 % <<
\def\UniversityName#1{\def\Univ@Name{#1}}
\def\Univ@Name{Uniwersytet im. Adama Mickiewicza w Poznaniu\\Wydzia{\l} Nauk Spo{\l}ecznych\\Instytut Psychologii}%
%\def\Univ@Name{UNIWERSYTET im. ADAMA MICKIEWICZA w POZNANIU\\WYDZIA\L{} NAUK SPO\L{}ECZNYCH}%
 % <<
\def\oswiadczenieText{%

Ja, ni\.zej podpisany/a \@autor,\ student/ka Wydzia{\l}u Nauk Spo{\l}ecznych Uniwersytetu im. Adama Mickiewicza w Poznaniu o\'swiadczam, \.ze przedk{\l}adan\k{a} prac\k{e} dyplomow\k{a} pt.: ,,\@tytul''\ napisa{\l}em/am samodzielnie. Oznacza to, \.ze przy pisaniu pracy, poza niezb\k{e}dnymi konsultacjami, nie korzysta{\l}em/am z pomocy innych os\'ob, a w szczeg\'olno\'sci nie zleca{\l}em/am opracowania rozprawy lub jej cz\k{e}\'sci innym osobom, ani nie odpisywa{\l}em/am tej rozprawy lub jej cz\k{e}\'sci od innych os\'ob. 

O\'swiadczam r\'ownie\.z, \.ze egzemplarz pracy dyplomowej w formie wydruku komputerowego jest zgodny z egzemplarzem pracy dyplomowej w formie elektronicznej.

Jednocze\'snie przyjmuj\k{e} do wiadomo\'sci, \.ze przypisanie sobie, w pracy dyplomowej, autorstwa istotnego fragmentu lub innych element\'ow cudzego utworu lub ustalenia naukowego stanowi podstaw\k{e} stwierdzenia niewa\.zno\'sci post\k{e}powania w sprawie nadania tytu{\l}u zawodowego.\endgraf }
%
%%%%%%%%%%%%%%%%%%%%%%%%%

\def\archiwumText{%

\noindent
[~~~~~~~~]*~Wyra\.zam zgod\k{e} na udost\k{e}pnianie mojej pracy w czytelni Archiwum UAM.
}


\def\prawaText{%

\noindent
[~~~~~~~~]*~Wyra\.zam zgod\k{e} na udost\k{e}pnianie mojej pracy w zakresie koniecznym do ochrony mojego prawa do autorstwa lub praw os\'{o}b trzecich.
}

\def\noteText{%
\noindent
*~Nale\.zy wpisa\'c TAK w przypadku wyra\.zenia zgody na udost\k{e}pnianie pracy w czytelni Archiwum UAM, NIE w przypadku braku zgody. Niewype{\l}nienie pola oznacza brak zgody na udost\k{e}pnianie pracy.  
}

%%%%%%%%%%%%%%%%%%%%%%%%%
\long\def\oswiadczenie{%%\newpage 

\if@twocolumn \onecolumn \fi
%%\centerline{\large\textbf{O\'swiadczenie}}
%%\vspace*{50mm}
%\chapter*{O\'swiadczenie}%
%\addcontentsline{toc}{chapter}{O\'swiadczenie}%
\par 
\vskip6mm
\noindent
\thispagestyle{empty}
%\oswiadczenieText
\par\vskip15mm 
%\centerline{\vbox{%
%\hbox to.8\textwidth{\hbox to45mm{\dotfill}\hss 
%   \hbox to45mm{\dotfill}} 
%\hbox to.8\textwidth{\hbox to45mm{\hss podpis\hss}\hss
%\hbox to45mm{\hss miejscowo\'s\'c i data\hss}}%
%}}\par
\vskip10mm
%\archiwumText
\vskip15mm
%\centerline{\vbox{%
%\hbox to.8\textwidth{\hbox to45mm{\dotfill}} 
%\hbox to.8\textwidth{\hbox to45mm{\hss podpis\hss}}%
%}}\par
\vskip10mm
%\prawaText
\vskip15mm
%\centerline{\vbox{%
%\hbox to.8\textwidth{\hbox to45mm{\dotfill}} 
%\hbox to.8\textwidth{\hbox to45mm{\hss podpis\hss}}%
%}}\par
\vskip10mm
%\noteText
}\par

%\newpage

%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%% (opcjonalne) Dedykacja
\newif\ifdedicationpage
\dedicationpagefalse%ustawienie domyślne

\def\dedication#1{\gdef\@dedication{#1}}
\def\@dedication{Napisz w{\l}asn\k{a} dedykacj\k{e}!}
\newcommand{\dedicationhere}{%
  \ifdedicationpage
     \newpage \thispagestyle{empty}
     \vspace*{\stretch{3}}
     \begin{flushright}\itshape
       \expandafter\@dedication
     \end{flushright}
%     \vspace*{\stretch{3}}
     \vspace*{\stretch{1}}
  \fi
}
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%


\renewcommand\maketitle{%
  \begin{titlepage}%
    \let\footnotesize\small
    \let\footnoterule\relax
    \let \footnote \thanks
    \begin{center}%
      {\large \textsc{\Univ@Name}\par}
      \par 
    \end{center}%
     \vspace{1cm plus 1fill} 
    \begin{center}%
      {\@author\par}
    \end{center}%
     \vspace{8mm plus 1mm minus 2mm}
    \begin{center}%
      {\huge\textbf{\@title}\par}
     \vspace{5mm plus 1mm minus 1mm}
      {\textbf{\@tytulang}\par}	
      \vspace{2cm plus 1.5fill}

      \vspace{15mm plus .1fill}

	\includegraphics[scale=0.08]{uam.png}


	{\large \@miejsce\space \@date\par}
    \end{center}


    \@thanks
  \end{titlepage}%
  %


  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  %
  \setcounter{page}{2}%

%\oswiadczenie

  % Jezeli podano slowa kluczowe wydrukuj
  \clearpage 
  \thispagestyle{empty}
  \ifvoid\abspagebox\@latex@warning{*** Nie podano streszczenia ***}%
  \else\InsertAbstractHere \fi
  \ifx\@keywords\EmptyKwsList \@latex@warning{*** Nie podano slow kluczowych ***}%
  \else \section*{S{\l}owa kluczowe}\noindent
   \@keywords
  \fi

  \clearpage 
  \thispagestyle{empty}
  \ifvoid\absengpagebox\@latex@warning{*** Nie podano angielskiego streszczenia ***}%
  \else\InsertAbstractengHere \fi
  \ifx\@keywordseng\EmptyKwsList \@latex@warning{*** Nie angielskich podano slow kluczowych ***}%
  \else \section*{Keywords}\noindent
   \@keywordseng
  \fi
%###

%\clearpage
%  \cleardoublepage %%
%  \tableofcontents
%\newpage
%\clearpage 
%  \thispagestyle{empty}~
  %\listoftables
  %\listoffigures
} %% --renewcommand: maketitle --


%%\def\nralbumu#1{\gdef\@nralbumu{#1}}
%%\def\@nralbumu{???\ClassError{kmgr}{Brak numeru albumu}\@ehc}
\def\kierunek#1{\gdef\@kierunek{#1}}
\def\@kierunek{???\ClassError{kmgr}{Nie podano kierunku studiow}\@ehc}
\def\opiekun#1{\gdef\@opiekun{#1}}
\def\@opiekun{???\ClassError{kmgr}{Brak danych opiekuna pracy}\@ehc}
\def\miejsce#1{\gdef\@miejsce{#1}}
\def\@miejsce{Pozna\'n}

\def\autor#1{\gdef\@autor{#1}}
\def\tytul#1{\gdef\@tytul{#1}}
\def\tytulang#1{\gdef\@tytulang{#1}}
%
\def\keywords#1{\gdef\@keywords{#1}}
% slowa kluczowe sa opcjonalne:
%%\def\@keywords{???\ClassError{kmgr}{Brak slow kluczowych}\@ehc}
\def\@keywords{????}
\def\EmptyKwsList{????}
%
\def\keywordseng#1{\gdef\@keywordseng{#1}}
% slowa kluczowe sa opcjonalne:
%%\def\@keywordseng{???\ClassError{kmgr}{Brak angielskich slow kluczowych}\@ehc}
\def\@keywordseng{????}
\def\EmptyKwsListEng{????}
%%
\def\klasyfikacja#1{\gdef\@klasyfikacja{#1}}
\def\@klasyfikacja{???\ClassError{kmgr}{Brak klasyfikacji
    tematycznej}\@ehc}
%
%
\newbox \abspagebox%% *tp **
\def\InsertAbstractHere{\unvbox\abspagebox}
%
\renewenvironment{abstract}{\global% 
  \setbox \abspagebox \vbox \bgroup% 
  \section*{Streszczenie}}
 {\egroup}
%
%
\newbox \absengpagebox%% *tp **
\def\InsertAbstractengHere{\unvbox\absengpagebox}
%
\newenvironment{abstracteng}{\global% 
  \setbox \absengpagebox \vbox \bgroup% 
  \section*{Summary}}
 {\egroup}
%
%###
\renewcommand*\@seccntformat[1]{\csname the#1\endcsname.\enspace}
\def\numberline#1{\hb@xt@\@tempdima{#1.\hfil}}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\mdseries
      \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
      \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
%
\def\@makechapterhead#1{%
  %\vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \normalsize \bfseries \MakeUppercase{\@chapapp}\space \thechapter
        \par\nobreak
        \vskip\baselineskip 
    \fi
    \interlinepenalty\@M
    \LARGE \bfseries #1\par\nobreak
    \vskip 40\p@
  }}
%
\def\@makeschapterhead#1{%
  %\vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \LARGE \bfseries  #1\par\nobreak
    \vskip 40\p@
  }}
%
\renewcommand{\section}{\@startsection{section}{1}{\z@}%
    {-3.5ex \@plus -1ex \@minus -.2ex}%
    {2.3ex \@plus.2ex}%
    {\reset@font\Large\bfseries\raggedright}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
    {-3.25ex\@plus -1ex \@minus -.2ex}%
    {1.5ex \@plus .2ex}%
    {\reset@font\large\bfseries\raggedright}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
    {-3.25ex\@plus -1ex \@minus -.2ex}%
    {1.5ex \@plus .2ex}%
    {\reset@font\normalsize\bfseries\raggedright}}
\renewcommand{\paragraph}{???\ClassError{kmgr}{Zbyt duzo srodtytulow}\@ehc}%
%
% Skorowidz: dodanie kresek w pozycjach skorowidza stopnia drugiego
\renewenvironment{theindex}{%
   \clearpage \refstepcounter{chapter}% potrzebne do prawid{\l}owego
     % dzia{\l}ania zak{\l}adek w dokumencie PDF
   \columnseprule \z@ \columnsep 35\p@
   \twocolumn[\@makeschapterhead{\indexname}]%
   \@mkboth{\indexname}{\indexname}%
   \addcontentsline{toc}{chapter}{\indexname}% 
   \thispagestyle{plain}\parindent\z@
   \parskip\z@ \@plus .3\p@\relax
   \let\item\@idxitem }
   {\clearpage }
\def\indexemdashes{%
\def\@idxitem{\par\hangindent 0pt}
\def\subitem{\par\hangindent 0pt --- }
\def\subsubitem{\par\hangindent 0pt --- --- }
\def\indexspace{\par \vskip 10pt plus 5pt minus 3pt\relax}}
\indexemdashes
%
% Wprowadzenie/zako\'nczenie
\newcommand{\introduction}{%\doublepage
   \chapter*{\IntroName\@mkboth{\IntroName}{\IntroName}}%
\addcontentsline{toc}{chapter}{\IntroName}}
%
\newcommand{\summary}{%\doublepage
   \chapter*{\SummaryName\@mkboth{\SummaryName}{\SummaryName}}%
\addcontentsline{toc}{chapter}{\SummaryName}}
% O\'swiadczenie (dodane 7.4.2005)
%
% Polecenia listoffigures/listoftables uproszczono oraz 
% dodano \addcontentsline, tak aby tytu{\l} spisu pojawi{\l} 
% si\k{e} w spisie tre\'sci i zak\ladkach w pliku PDF:
\renewcommand\listoffigures{%
    \chapter*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}}%
    \addcontentsline{toc}{chapter}{\listfigurename}
    \@starttoc{lof}}
%
\renewcommand\listoftables{%
    \chapter*{\listtablename
      \@mkboth{%
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
    \@starttoc{lot}%
    \addcontentsline{toc}{chapter}{\listtablename}}
%
\renewenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \addcontentsline{toc}{chapter}{\bibname}%<--
      \list{%%
          \@biblabel{\@arabic\c@enumiv}}%\fi}%
           {%%
             \settowidth\labelwidth{\@biblabel{#1}}%
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
           \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

% Uproszczono polecenie \@makecaption, tak \.ze podpisy s\k{a}
% teraz sk{\l}adane od lewego marginesu. 
% Dodano polecenie \source do sk{\l}adania \'xr\'od{\l}a
\long\def\@makecaption#1#2{\par
  \vskip\abovecaptionskip
  \begin{center}\small\textbf{#1}. #2\end{center}
  %\vskip\belowcaptionskip % niepotrzebne bo po caption 
     %winno by\'c \'xr\'od{\l}o
  \par
}
\def\source#1{\par \begin{center}\small 
\SourceName:~#1\end{center}}
%
% Oznakowanie wersji dokumentu na ka\.zdej stronie w postaci
% adresu e-mail pierwszego autora (je\.zeli jest zdefiniowany) lub imienia
% i nazwiska pierwszego autora + tego co autor wpisa{\l} jako
% argument polecenia \nrwersji + bie{\.z}\k{a}ca data.
\def\nrwersji#1{\def\ThisDocVersion{#1}}\nrwersji{????}%
\def\ThisDocVersionId{%
  \expandafter \ifx \csname theauthor1 \endcsname \undefined   
   \else \csname theauthor1\endcsname \fi
   %% adres moze zawierac nie-litery (np `_' powoduje blad), pomijam
  \space \expandafter \ifx (\csname thenetaddress1\endcsname) \undefined   
   \else (\csname thenetaddress1\endcsname) \fi 

  --\space wersja \ThisDocVersion\space %z\space \number\day/\number\month/\number\year~r. 
} 
%
\def\IntroName{Wprowadzenie}
\def\SummaryName{Zako\'nczenie}
\def\SourceName{\'Zr\'od{\l}o}
%
\endinput
