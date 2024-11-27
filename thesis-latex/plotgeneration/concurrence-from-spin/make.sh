#!/bin/bash

# Change the working directory to the script's directory
cd "$(dirname "$0")"

python3 ./../convert-json-zip-to-csv.py --unzip --clear --zip_file_name "concurrence-comparison.zip" --observable_index 0 --out_file_suffix "concurrence"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "concurrence-comparison.zip" --observable_index 2 --out_file_suffix "purity"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "concurrence-comparison.zip" --observable_index 3 --out_file_suffix "pauli_00"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "concurrence-comparison.zip" --observable_index 4 --out_file_suffix "pauli_0x"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "concurrence-comparison.zip" --observable_index 5 --out_file_suffix "pauli_0y"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "concurrence-comparison.zip" --observable_index 6 --out_file_suffix "pauli_0z"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "concurrence-comparison.zip" --observable_index 7 --out_file_suffix "pauli_x0"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "concurrence-comparison.zip" --observable_index 8 --out_file_suffix "pauli_xx"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "concurrence-comparison.zip" --observable_index 9 --out_file_suffix "pauli_xy"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "concurrence-comparison.zip" --observable_index 10 --out_file_suffix "pauli_xz"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "concurrence-comparison.zip" --observable_index 11  --out_file_suffix "pauli_y0"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "concurrence-comparison.zip" --observable_index 12  --out_file_suffix "pauli_yx"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "concurrence-comparison.zip" --observable_index 13  --out_file_suffix "pauli_yy"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "concurrence-comparison.zip" --observable_index 14  --out_file_suffix "pauli_yz"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "concurrence-comparison.zip" --observable_index 15  --out_file_suffix "pauli_z0"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "concurrence-comparison.zip" --observable_index 16  --out_file_suffix "pauli_zx"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "concurrence-comparison.zip" --observable_index 17  --out_file_suffix "pauli_zy"
python3 ./../convert-json-zip-to-csv.py                 --zip_file_name "concurrence-comparison.zip" --observable_index 18  --out_file_suffix "pauli_zz"

gnuplot concurrence.gp
gnuplot purity.gp
gnuplot pauli-measurements.gp