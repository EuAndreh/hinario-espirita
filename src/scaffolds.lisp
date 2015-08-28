(defpackage hinario-espirita.scaffolds
  (:use cl
        cool-read-macros
        hinario-espirita.util
        rutil)
  (:import-from cl-locale
                i18n))
(in-package hinario-espirita.scaffolds)
(in-readtable cool-readtable)

(defparameter skeleton #"
\documentclass[~a]{article}
\usepackage[portuguese]{babel}
\usepackage{pdfpages}
\usepackage[~a]{hyperref}
\usepackage[~a]{songs}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{graphicx}
\usepackage{fancyhdr}

\usepackage{etoolbox}
\patchcmd{\showauthors}{\bfseries}{\itshape\normalsize}{}{}

~a

\newindex{titleidx}{~a}
\titleprefixword{}
\indexsongsas{titleidx}{\thepage}

\begin{document}
\includepdf[pages={1}]{~a}
\showindex{~a \\ \large{\today} \\ \small{(~a)}}{titleidx}

\begin{songs}{titleidx}
~a
\input{musicas.sbd}
\end{songs}

\end{document}"#)

(defparameter paper-margin #"
\setlength{\oddsidemargin}{0in}
\setlength{\evensidemargin}{0in}
\setlength{\textwidth}{6.5in}
\setlength{\topmargin}{0in}
\setlength{\topskip}{0in}
\setlength{\headheight}{0in}
\setlength{\headsep}{0in}
\setlength{\textheight}{9.1in}
\settowidth{\versenumwidth}{1.\ }"#)

(defparameter transparencias-margin+stuff #"
\setlength{\oddsidemargin}{-0.5in}
\setlength{\evensidemargin}{-0.5in}
\setlength{\textwidth}{7.5in}
\setlength{\topmargin}{-0.75in}
\setlength{\topskip}{0in}
\setlength{\headheight}{13.6pt}
\setlength{\headsep}{0.5in}
\setlength{\textheight}{9in}

% Repeat the chorus on subsequent pages of a song so that the projector-
% operator won't have to flip back to the first page for each chorus.
% This feature is only supported for eTeX-compatible versions of LaTeX.
\ifx\eTeXversion\undefined\else
  \ifx\eTeXversion\relax\else
    \repchoruses
  \fi
\fi

% Define some headers for each slide to help the projector-operator
% find the correct slide.  We use the fancyhdr package for this.
\usepackage{extramarks}
\pagestyle{fancy}
\fancyhf{}
\rhead{\sffamily\firstrightmark}
\renewcommand{\headrulewidth}{0pt}

\renewcommand{\songmark}{\markboth{}{\thesongnum}}
\renewcommand{\versemark}{\markboth{}{\thesongnum. \songtitle}}
\renewcommand{\chorusmark}{\markboth{}{\thesongnum. \songtitle}}"#)

(defparameter slides-margin+stuff #"
\setlength{\oddsidemargin}{-0.5in}
\setlength{\evensidemargin}{-0.5in}
\setlength{\textwidth}{10in}
\setlength{\topmargin}{-0.75in}
\setlength{\topskip}{0in}
\setlength{\headheight}{13.6pt}
\setlength{\headsep}{0.5in}
\setlength{\textheight}{6.5in}

\noversenumbers

\renewcommand{\lyricfont}{
  \fontfamily{helvet}\fontseries{b}\fontsize{28pt}{28pt}\selectfont
}

% Define some headers for each slide to help the projector-operator
% find the correct slide.  We use the fancyhdr package for this.
\IfFileExists{fancyhdr.sty}{
  \usepackage{fancyhdr}
  \usepackage{extramarks}
  \pagestyle{fancy}
  \fancyhf{}
  \lhead{\sffamily\firstleftmark}
  \rhead{\sffamily\firstrightmark}
  \renewcommand{\headrulewidth}{0pt}

  \renewcommand{\songmark}{\markboth{}{\thesongnum}}
  \renewcommand{\versemark}{
    \ifvnumbered
      \markboth{\thesongnum. \songtitle}{Verse \theversenum}%
    \else
      \markboth{\thesongnum. \songtitle}{}%
    \fi
  }
  \renewcommand{\chorusmark}{\markboth{\thesongnum. \songtitle}{Chorus}}
}{}"#)

(defparameter boneco-margin+stuff #"
\setlength{\oddsidemargin}{-0.4in}
\setlength{\evensidemargin}{3in} % CifrasBoneco é 3in
\setlength{\textwidth}{7.7in}
\setlength{\topmargin}{0in}
\setlength{\topskip}{0in}
\setlength{\headheight}{0in}
\setlength{\headsep}{0in}
\setlength{\textheight}{9.1in}
\settowidth{\versenumwidth}{1.\ }

\renewcommand{\lyricfont}{\LARGE}
\renewcommand{\idxtitlefont}{\large}
\renewcommand{\idxrefsfont}{\large}

\usepackage{fancyhdr}
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[C]{\Large\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}}

\renewcommand{\showauthors}{\Large\it\songauthors}
\renewcommand{\stitlefont}{\Huge\sffamily\slshape}

\renewcommand{\idxrefsfont}{\\\LARGE}
\renewcommand{\idxtitlefont}{\sffamily\slshape\LARGE\relax\ignorespaces\unskip}"#)

@export
(defparameter %scaffolds (make-hash-table))

(defmacro def-get (&rest names)
  `(progn
     ,@(mapcar #`(defun ,a1 (name)
               (funcall (get# ,(mkeyw a1) (get# name %scaffolds))))
           names)
     (export ',names)))

(defmacro deftex (name args)
  `(progn
     (set# ,name %scaffolds
            {:tex [fmt skeleton ,@args]
             :pdf [i18n ,(string-downcase (& name ".pdf"))]
             :name [i18n ,(string-downcase name)]})))

(def-get pdf tex name)

(deftex :hinario
    ("a4"
     "bookmarks" "lyric" paper-margin "IndiceHinario"
     #i"Capa.pdf" #i"índice" #i"clicável"
     ""))

(deftex :cifras
    ("a4"
     "bookmarks" "chorded" paper-margin "IndiceCifras"
     #i"Capa.pdf" #i"índice" #i"clicável"
     ""))

(deftex :transparencias
    ("a4,onesided"
     "bookmarks" "slides" transparencias-margin+stuff
     "IndiceTransparencias"
     #i"Capa.pdf" #i"índice" #i"clicável"
     #"\pagestyle{fancy} \lhead{\today}"#))

(deftex :slides
    ("letterpaper,oneside,landscape"
     "pdfpagemode=UseThumbs" "slides"
     slides-margin+stuff
     "IndiceSlides"
     #i"Capa.pdf" #i"índice" #i"clicável"
     ""))

(deftex :hinario-boneco
    ("a4"
     "bookmarks" "lyric" boneco-margin+stuff "IndiceHinarioBoneco"
     #i"Capa.pdf" #i"índice" #i"clicável"
     #"\pagestyle{plain}"#))

(deftex :cifras-boneco
    ("a4"
     "bookmarks" "chorded" boneco-margin+stuff "IndiceCifrasBoneco"
     #i"Capa.pdf" #i"índice" #i"clicável"
     #"\pagestyle{plain}"#))
