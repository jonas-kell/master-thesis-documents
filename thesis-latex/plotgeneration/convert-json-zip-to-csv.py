from typing import List, Any, Dict, Union
import os
import zipfile
import argparse
import json
import csv
import glob

# Get the current directory
current_directory = os.getcwd()
print("Working in : ", current_directory)

parser = argparse.ArgumentParser(description="Parse command-line arguments.")

parser.add_argument("--zip_file_name", required=True)
parser.add_argument("--unzip", action="store_true", required=False)
parser.add_argument("--observable_index", required=True)
parser.add_argument("--out_file_suffix", required=True)

args = vars(parser.parse_args())

if args["unzip"]:
    print("Deleting all json and csv artifacts")

    csv_files = glob.glob(os.path.join(current_directory, "*.csv"))
    json_files = glob.glob(os.path.join(current_directory, "*.json"))

    for file in csv_files + json_files:
        os.remove(file)

print("Extracting/locating files")
extracted_files = []
# List all files in the current directory
for file_name in os.listdir(current_directory):
    if os.path.isfile(os.path.join(current_directory, file_name)):
        if file_name.endswith(".zip") and file_name.startswith(args["zip_file_name"]):
            with zipfile.ZipFile(file_name, "r") as zip_ref:
                if args["unzip"]:
                    print("Extracting: ", file_name)
                    zip_ref.extractall(current_directory)

                # Add the names of the extracted files to the list
                extracted_files.extend(zip_ref.namelist())

print("Extracted or found files:", extracted_files)

observable_index = int(args["observable_index"])
print("Extracting observable with index", observable_index)


def name_split(name: str):
    name_parts = name.replace(".json", "").split("-")
    last = name_parts[-1]
    prev_last = name_parts[-2]
    rest = name.replace(f"{prev_last}-{last}", "")

    return (prev_last, last, rest)


# Extracting straightforward ones
for json_file_name in extracted_files:

    descriptor, finer_descriptor, file_name_rest = name_split(json_file_name)

    if not finer_descriptor.startswith("mc"):
        loaded_data: Dict[str, Union[float, str, Dict[Any, Any], List[Any]]] = {}

        with open(json_file_name, mode="r") as file:
            loaded_data = json.load(file)

        print(loaded_data["hamiltonian"])

        observable = loaded_data["observables"][observable_index]
        print(observable)
        label_to_write = observable["label"]

        data_array = loaded_data["measurements"]

        times_to_extract = []
        values_to_extract = []

        for measurement_point in data_array:
            time = measurement_point["time"]
            val = measurement_point["data"][observable_index]

            times_to_extract.append(time)
            values_to_extract.append(val)

        out_file_name = f"{descriptor}-{finer_descriptor}-{args['out_file_suffix']}.csv"
        with open(out_file_name, mode="w", newline="") as file:
            writer = csv.writer(file)
            writer.writerow([label_to_write])  # Descriptor
            writer.writerow(["Time", "Value"])  # Header
            for time, value in zip(times_to_extract, values_to_extract):
                writer.writerow([time, value])
