#!/bin/bash

# Change the working directory to the script's directory
cd "$(dirname "$0")"


geometrysizes=("size2" "size4" "size6" "size8" "size10")
observables=( "energy" "variance" "spincurrentvert" "spincurrenthoriz" "concurrencevert" "concurrencehoriz" )

python3 ./../convert-json-zip-to-csv.py --clear --zip_file_name "clear" --observable_index 0 --out_file_suffix "clear"

for observableindex in "${!observables[@]}"; do
    unzip_flag=""
    if [[ "$observable_index" -eq 0 ]]; then
        unzip_flag="--unzip"
    fi

    for geometrysize in "${geometrysizes[@]}"; do
        python3 ./../convert-json-zip-to-csv.py "$unzip_flag" --zip_file_name "system-size-dependency-$geometrysize.zip" --observable_index "$observableindex" --out_file_suffix "${observables[$observableindex]}"
    done
done

gnuplot system-size-energy.gp