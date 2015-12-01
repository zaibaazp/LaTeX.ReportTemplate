#!/bin/bash
# Delete everything except the .tex file, then runs pdflatex and bibtex the amount of
# times necessary to produce a proper pdf file. 

if [ -z $1 ]; then
    echo "Usage (1):"
    echo "./rerunpdf.sh <texfile>"
    echo ""
    exit 1
fi

mv $1.tex ../
rm $1.*
mv ../$1.tex ./

pdflatex -synctex=1 -interaction=nonstopmode $1

# Uncomment both lines if you have a .bib file available in this directory.
# bibtex $1
# pdflatex -synctex=1 -interaction=nonstopmode $1
pdflatex -synctex=1 -interaction=nonstopmode $1

clear

echo Done!
