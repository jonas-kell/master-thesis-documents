#!/bin/bash
# Change the working directory to the script's directory
cd "$(dirname "$0")"

python3 ./../convert-json-zip-to-csv.py --clear --zip_file_name "clear" --observable_index 0 --out_file_suffix "clear"

for value in "02" "01" "005" "001" "0005"; do
    python3 ./../convert-json-zip-to-csv.py --unzip --zip_file_name "j$value" --observable_index 0 --out_file_suffix "j$value-current_border"
    python3 ./../convert-json-zip-to-csv.py         --zip_file_name "j$value" --observable_index 1 --out_file_suffix "j$value-current_center"
    python3 ./../convert-json-zip-to-csv.py         --zip_file_name "j$value" --observable_index 2 --out_file_suffix "j$value-double_occ_border"
    python3 ./../convert-json-zip-to-csv.py         --zip_file_name "j$value" --observable_index 3 --out_file_suffix "j$value-double_occ_bordernb"
    python3 ./../convert-json-zip-to-csv.py         --zip_file_name "j$value" --observable_index 4 --out_file_suffix "j$value-single_occ_center"
    python3 ./../convert-json-zip-to-csv.py         --zip_file_name "j$value" --observable_index 5 --out_file_suffix "j$value-single_occ_centernb"
done

gnuplot j-sweep.gp