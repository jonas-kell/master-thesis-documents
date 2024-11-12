#!/bin/bash
# Change the working directory to the script's directory
cd "$(dirname "$0")"

python3 ./../convert-json-zip-to-csv.py --unzip --clear --zip_file_name "40000samples" --observable_index 0 --out_file_suffix "40000-current"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "40000samples" --observable_index 1 --out_file_suffix "40000-double_occ_0"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "40000samples" --observable_index 2 --out_file_suffix "40000-double_occ_1"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "40000samples" --observable_index 3 --out_file_suffix "40000-single_occ_0"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "40000samples" --observable_index 4 --out_file_suffix "40000-single_occ_1"

python3 ./../convert-json-zip-to-csv.py --unzip         --zip_file_name "4000samples" --observable_index 0 --out_file_suffix "4000-current"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "4000samples" --observable_index 1 --out_file_suffix "4000-double_occ_0"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "4000samples" --observable_index 2 --out_file_suffix "4000-double_occ_1"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "4000samples" --observable_index 3 --out_file_suffix "4000-single_occ_0"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "4000samples" --observable_index 4 --out_file_suffix "4000-single_occ_1"

python3 ./../convert-json-zip-to-csv.py --unzip         --zip_file_name "400samples" --observable_index 0 --out_file_suffix "400-current"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "400samples" --observable_index 1 --out_file_suffix "400-double_occ_0"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "400samples" --observable_index 2 --out_file_suffix "400-double_occ_1"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "400samples" --observable_index 3 --out_file_suffix "400-single_occ_0"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "400samples" --observable_index 4 --out_file_suffix "400-single_occ_1"

gnuplot mc-variance.gp