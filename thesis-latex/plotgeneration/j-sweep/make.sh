#!/bin/bash
# Change the working directory to the script's directory
cd "$(dirname "$0")"

jvalues=("02" "01" "005" "001" "0005")
observables=( "current_border" "current_center" "double_occ_border" "double_occ_bordernb" "double_occ_center" "double_occ_centernb" "single_occ_border" "single_occ_bordernb" "single_occ_center" "single_occ_centernb" )

python3 ./../convert-json-zip-to-csv.py --clear --zip_file_name "clear" --observable_index 0 --out_file_suffix "clear"

for observableindex in "${!observables[@]}"; do
    unzip_flag=""
    if [[ "$observable_index" -eq 0 ]]; then
        unzip_flag="--unzip"
    fi

    for jvalue in "${jvalues[@]}"; do
        python3 ./../convert-json-zip-to-csv.py "$unzip_flag" --zip_file_name "j$jvalue" --observable_index "$observableindex" --out_file_suffix "j$jvalue-${observables[$observableindex]}"
    done
done

for observable in "${observables[@]}"; do
    for precisionorder in "o0" "o1" "o2"; do
        for jvalue in "${jvalues[@]}"; do
            paste -d "," "compare$precisionorder-exact-j$jvalue-$observable.csv" "exact-exact-j$jvalue-$observable.csv" > "out-j$jvalue-$precisionorder-$observable.csv"
        done
    done
done

gnuplot j-sweep.gp