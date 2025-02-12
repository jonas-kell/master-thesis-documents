#!/bin/bash

# Change the working directory to the script's directory
cd "$(dirname "$0")"


run_params=("0" "1" "2" "4" "8" "16" "32" "64" "128")
geometries=("chain" "square")
observables=( "energy" "variance" )

python3 ./../convert-json-zip-to-csv.py --clear --zip_file_name "clear" --observable_index 0 --out_file_suffix "clear"

for observableindex in "${!observables[@]}"; do
    unzip_flag=""
    if [[ "$observable_index" -eq 0 ]]; then
        unzip_flag="--unzip"
    fi

    for run_param in "${run_params[@]}"; do
        for geometry in "${geometries[@]}"; do
            python3 ./../convert-json-zip-to-csv.py "$unzip_flag" --imag --zip_file_name "energy-conservation-$run_param-$geometry.zip" --observable_index "$observableindex" --out_file_suffix "${observables[$observableindex]}"
        done
    done
done

gnuplot energy-conservation.gp