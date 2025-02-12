#!/bin/bash
# Change the working directory to the script's directory
cd "$(dirname "$0")"

samplenumbers=("400" "2000" "4000" "20000" "40000")

python3 ./../convert-json-zip-to-csv.py --clear --zip_file_name "clear" --observable_index 0 --out_file_suffix "clear"

for samplenumber in "${samplenumbers[@]}"; do
    python3 ./../convert-json-zip-to-csv.py --unzip --zip_file_name "${samplenumber}samples" --observable_index 0 --out_file_suffix "${samplenumber}-current"
    python3 ./../convert-json-zip-to-csv.py         --zip_file_name "${samplenumber}samples" --observable_index 1 --out_file_suffix "${samplenumber}-double_occ_0"
    python3 ./../convert-json-zip-to-csv.py         --zip_file_name "${samplenumber}samples" --observable_index 2 --out_file_suffix "${samplenumber}-double_occ_1"
    python3 ./../convert-json-zip-to-csv.py         --zip_file_name "${samplenumber}samples" --observable_index 3 --out_file_suffix "${samplenumber}-double_occ_2"
    python3 ./../convert-json-zip-to-csv.py         --zip_file_name "${samplenumber}samples" --observable_index 4 --out_file_suffix "${samplenumber}-double_occ_3"
    python3 ./../convert-json-zip-to-csv.py         --zip_file_name "${samplenumber}samples" --observable_index 5 --out_file_suffix "${samplenumber}-single_occ_0"
    python3 ./../convert-json-zip-to-csv.py         --zip_file_name "${samplenumber}samples" --observable_index 6 --out_file_suffix "${samplenumber}-single_occ_1"
    python3 ./../convert-json-zip-to-csv.py         --zip_file_name "${samplenumber}samples" --observable_index 7 --out_file_suffix "${samplenumber}-single_occ_2"
    python3 ./../convert-json-zip-to-csv.py         --zip_file_name "${samplenumber}samples" --observable_index 8 --out_file_suffix "${samplenumber}-single_occ_3"
done

gnuplot spin-current.gp
gnuplot occupation.gp