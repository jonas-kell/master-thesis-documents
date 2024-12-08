#!/bin/bash

# Change the working directory to the script's directory
cd "$(dirname "$0")"

echo "Generating Gnuplot scripts"

plotfolders=( "binary-entropy-function" "concurrence-from-spin" "energy-variance" "j-sweep" "monte-carlo-variance-test" "vcn-eff-stepsize"  )
# plotfolders=( "vcn-eff-stepsize"  )
# for plotfolder in "${plotfolders[@]}"; do
#     "./thesis-latex/plotgeneration/$plotfolder/make.sh"
# done

echo "Compiling Project Work Presentation"
# (cd project-work-presentation; latexmk --shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -pdf -outdir=. project-work-presentation.tex)

echo "Compiling Practical Training Report"
(cd practical-training-latex; latexmk --shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -pdf -outdir=. practical-training-report-jonas-kell.tex)
