#!/bin/bash

# Change the working directory to the script's directory
cd "$(dirname "$0")"

python3 ./../convert-json-zip-to-csv.py --unzip --clear --zip_file_name "energy-variance.zip" --observable_index 0 --out_file_suffix "energy"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "energy-variance.zip" --observable_index 1 --out_file_suffix "variance"

gnuplot energy.gp
gnuplot variance.gp