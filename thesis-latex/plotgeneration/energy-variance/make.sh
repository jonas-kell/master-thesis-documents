#!/bin/bash

# Change the working directory to the script's directory
cd "$(dirname "$0")"

runnumbers=("run0" "run1" "run2" "run3" )

python3 ./../convert-json-zip-to-csv.py --clear --zip_file_name "clear" --observable_index 0 --out_file_suffix "clear"

for runnumber in "${runnumbers[@]}"; do
    python3 ./../convert-json-zip-to-csv.py --unzip --zip_file_name "energy-variance-$runnumber.zip" --observable_index 0 --out_file_suffix "energy"
    python3 ./../convert-json-zip-to-csv.py         --zip_file_name "energy-variance-$runnumber.zip" --observable_index 1 --out_file_suffix "variance"
done


gnuplot energy.gp
gnuplot variance.gp