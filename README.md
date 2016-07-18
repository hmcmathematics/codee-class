# codee-class: A LaTeX Document Class for the Community of Ordinary Differential Equations Educators (CODEE)


The **Community of Ordinary Differential Equations Educators**
(CODEE) exists to improve the teaching and learning of ordinary
differential equations (ODEs), primarily by encouraging broader
use of modeling projects and computer experiments.  CODEE
publishes an electronic journal containing learning materials
relating to ODEs called the _CODEE Journal_. This journal is
published online at the _CODEE Digital Library_, accessible at
http://www.codee.org/.

The LaTeX class, `codee.cls`, provides the basic formatting for a
submission to the _CODEE Journal_.  Included with the class is the
`how-to-prepare-manuscripts.tex` document and its typeset version,
`how-to-prepare-manuscripts.pdf`, which provide examples and
additional information about writing CODEE submissions.


## Getting the Document Class File

You can get a copy of the latest version of the class and
supporting materials by going to
[the releases page](https://github.com/hmcmathematics/codee-class/releases/latest)
and downloading the latest release listed there, which is currently
[Version 2.0](https://github.com/hmcmathematics/codee-class/releases/tag/v2.0).

Archives are available as
[Zip](https://github.com/hmcmathematics/codee-class/archive/v2.0.zip)
or
[`tar.gz`](https://github.com/hmcmathematics/codee-class/archive/v2.0.tar.gz)
files.

Alternatively, you can clone [this GitHub repository](https://github.com/hmcmathematics/codee-class) (click on the green "Clone or download" button on the right side of the page).

_(We're also looking at making the code available through
[CTAN](http://www.ctan.org)/TeX Live.)_


## Installing and Using the Document Class File

As with any LaTeX document class or style package, you can use the
`codee.cls` file in any of several ways.

The easiest is to copy `codee.cls` into a directory and create
your `.tex` file there, calling the class with

	\documentclass{codee}

A better way is to install it in your own `TEXMF` tree, or, if
you're installing it on a shared system, in a "local" `TEXMF`
tree.  The location of these trees is dependent on the particular
TeX System you're using, as well as any local customizations you
or a system administrator may have done.  For examples, see
[MikTeX](http://docs.miktex.org/manual/localadditions.html)
(Windows) or
[TeX Live](http://www.tug.org/texlive/doc/texlive-en/texlive-en.html#x1-360003.4.6)
(Windows, Mac OS X, Linux).

"[A Directory Structure for TeX Files](http://tug.ctan.org/tds/tds.html)"
provides more information about the structure of `TEXMF` trees.
For the `codee.cls` file, all you need is a set of directories
like `TEXMFROOT/tex/latex/codee` (i.e., once you figure out where
your local or personal `TEXMF` tree lives, you can make sure it
has a `latex` folder inside a `tex` folder, go there (e.g., with
`cd` on a Mac or Linux system), and unpack the `tar.gz` or Zip
archive you downloaded.


## License

The CODEE LaTeX class and accompanying materials listed in
`manifest.txt` are copyright by the Community of Ordinary
Differential Equations Educators and licensed under the LaTeX
Project Public License (LPPL), version 1.3c or later.


## Contact & Support Information

The LaTeX class is developed by and supported by the CODEE
project, on the web at http://www.codee.org/.  There you will find
contact information for the project.

This GitHub project, at
https://github.com/hmcmathematics/codee-class/, is the master
repository for the document class.  If you find issues with the
class's functionality, wish to request new features, or want to
help by fixing bugs or writing code, please file an
[issue/pull request](https://github.com/hmcmathematics/codee-class/issues)
on GitHub.
