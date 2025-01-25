#!/bin/bash

# Change the working directory to the script's directory
cd "$(dirname "$0")"


stepsizes=("01" "001" "0001" "00001")
observables=( "energy" "variance" "param0re" "param1re" "param2re" "param3re" "param4re" "param5re" "param0im" "param1im" "param2im"  "param3im"  "param4im" "param5im" )

python3 ./../convert-json-zip-to-csv.py --clear --zip_file_name "clear" --observable_index 0 --out_file_suffix "clear"

for observableindex in "${!observables[@]}"; do
    unzip_flag=""
    if [[ "$observable_index" -eq 0 ]]; then
        unzip_flag="--unzip"
    fi

    for stepsize in "${stepsizes[@]}"; do
        python3 ./../convert-json-zip-to-csv.py "$unzip_flag" --imag --zip_file_name "vcn-init-tests-sigma$stepsize.zip" --observable_index "$observableindex" --out_file_suffix "${observables[$observableindex]}"
    done
done

gnuplot vcn-energy.gp
gnuplot vcn-parameters.gp