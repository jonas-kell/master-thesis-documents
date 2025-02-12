#!/bin/bash

# Change the working directory to the script's directory
cd "$(dirname "$0")"


stepsizes=("exact" "ets006" "ets002" "ets0006" "ets0002")
observables=( "energy" "variance" "param0re" "param1re" "param2re" "param3re" "param4re" "param5re" "param0im" "param1im" "param2im"  "param3im"  "param4im" "param5im" )

python3 ./../convert-json-zip-to-csv.py --clear --zip_file_name "clear" --observable_index 0 --out_file_suffix "clear"

for observableindex in "${!observables[@]}"; do
    unzip_flag=""
    if [[ "$observable_index" -eq 0 ]]; then
        unzip_flag="--unzip"
    fi

    for stepsize in "${stepsizes[@]}"; do
        python3 ./../convert-json-zip-to-csv.py "$unzip_flag" --imag --zip_file_name "vcn-param-tests-$stepsize.zip" --observable_index "$observableindex" --out_file_suffix "${observables[$observableindex]}"
    done
done

gnuplot energy-variance.gp
gnuplot vcn-parameters.gp