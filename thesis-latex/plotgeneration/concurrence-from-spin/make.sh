#!/bin/bash

# Change the working directory to the script's directory
cd "$(dirname "$0")"

python3 ./../convert-json-zip-to-csv.py --unzip --clear --zip_file_name "concurrence-comparison.zip" --observable_index 0 --out_file_suffix "concurrence"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "concurrence-comparison.zip" --observable_index 2 --out_file_suffix "purity"

gnuplot concurrence.gp