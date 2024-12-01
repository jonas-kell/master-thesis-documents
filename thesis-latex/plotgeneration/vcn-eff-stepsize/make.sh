#!/bin/bash

# Change the working directory to the script's directory
cd "$(dirname "$0")"


stepsizes=("exact" "ets006" "ets0006" "ets00006" "ets000006" "ets0000006")
observables=( "energy" "variance" "param0re" "param0im"  "param1re" "param1im"  "param2re" "param2im"  "param3re" "param3im"  "param4re" "param4im"  "param5re" "param5im" )

python3 ./../convert-json-zip-to-csv.py --clear --zip_file_name "clear" --observable_index 0 --out_file_suffix "clear"

for observableindex in "${!observables[@]}"; do
    unzip_flag=""
    if [[ "$observable_index" -eq 0 ]]; then
        unzip_flag="--unzip"
    fi

    for stepsize in "${stepsizes[@]}"; do
        python3 ./../convert-json-zip-to-csv.py "$unzip_flag" --zip_file_name "vcn-param-tests-$stepsize.zip" --observable_index "$observableindex" --out_file_suffix "${observables[$observableindex]}"
    done
done

gnuplot vcn-energy.gp
gnuplot vcn-parameters.gp