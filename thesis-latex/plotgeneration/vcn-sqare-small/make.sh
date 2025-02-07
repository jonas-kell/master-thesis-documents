#!/bin/bash

# Change the working directory to the script's directory
cd "$(dirname "$0")"


run_names=("comparisons" "variational-1" "variational-2" "variational-5" "variational-10" "variational-20" "variational-200" "variational-800")
observables=( "energy" "variance" )

python3 ./../convert-json-zip-to-csv.py --clear --zip_file_name "clear" --observable_index 0 --out_file_suffix "clear"

for observableindex in "${!observables[@]}"; do
    unzip_flag=""
    if [[ "$observable_index" -eq 0 ]]; then
        unzip_flag="--unzip"
    fi

    for run_name in "${run_names[@]}"; do
        python3 ./../convert-json-zip-to-csv.py "$unzip_flag" --imag --zip_file_name "square-vcn-$run_name.zip" --observable_index "$observableindex" --out_file_suffix "${observables[$observableindex]}"
    done
done

gnuplot vcn-energy.gp