#!/bin/bash

if [ ! -f /.dockerenv ]; then
  echo "This script must be run with the provided docker-compose infrastructure"
  exit 1
fi

# Ensure this code runs on script exit
trap 'echo "Setting ownership of the files in this folder back to executing user"; cleanup_function' EXIT
cleanup_function() {
  sudo chown -R $(id -u):$(id -g) .
}

# Change the working directory to the script's directory
cd "$(dirname "$0")"

echo "Generating Gnuplot scripts"

plotfolders=( "binary-entropy-function" "concurrence-from-spin" "energy-variance" "j-sweep" "monte-carlo-variance-test" "vcn-eff-stepsize" "vcn-starting-values" )

for plotfolder in "${plotfolders[@]}"; do
    "./thesis-latex/plotgeneration/$plotfolder/make.sh"
done

echo "Compiling Project Work Presentation"
(cd project-work-presentation; sudo --preserve-env=PATH env latexmk --shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -pdf -outdir=. project-work-presentation.tex)

echo "Compiling Practical Training Report"
(cd practical-training-latex; sudo --preserve-env=PATH env latexmk --shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -pdf -outdir=. practical-training-report-jonas-kell.tex)

echo "Compiling Main Thesis"
(cd thesis-latex; sudo --preserve-env=PATH env latexmk --shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -pdf -outdir=. master-thesis-jonas-kell.tex)
