from typing import List, Any, Dict, Union
import os
import zipfile
import argparse
import json
import csv
import glob
import numpy as np

# Get the current directory
current_directory = os.getcwd()
print("Working in:", current_directory)

parser = argparse.ArgumentParser(description="Parse command-line arguments.")

parser.add_argument("--zip_file_name", required=True)
parser.add_argument("--unzip", action="store_true", required=False)
parser.add_argument("--clear", action="store_true", required=False)
parser.add_argument("--observable_index", required=True)
parser.add_argument("--out_file_suffix", required=True)

args = vars(parser.parse_args())

if args["clear"]:
    print("Deleting all json and csv artifacts")

    csv_files = glob.glob(os.path.join(current_directory, "*.csv"))
    json_files = glob.glob(os.path.join(current_directory, "*.json"))

    for file in csv_files + json_files:
        os.remove(file)

print("Extracting/locating files from:", args["zip_file_name"])
extracted_files = []
# List all files in the current directory
for file_name in os.listdir(current_directory):
    if os.path.isfile(os.path.join(current_directory, file_name)):
        if file_name.endswith(".zip") and (
            file_name.replace(".zip", "") == args["zip_file_name"]
            or file_name == args["zip_file_name"]
        ):
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
    rest = name.replace(f"{prev_last}-{last}.json", "")

    return (prev_last, last, rest)


files_to_skip = []  # mc processing may cause files to get skipped
for json_file_name in extracted_files:

    if json_file_name not in files_to_skip:

        descriptor, finer_descriptor, file_name_rest = name_split(json_file_name)

        if not finer_descriptor.startswith("mc"):
            # treat single values
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

            out_file_name = (
                f"{descriptor}-{finer_descriptor}-{args['out_file_suffix']}.csv"
            )
            with open(out_file_name, mode="w", newline="") as file:
                writer = csv.writer(file, lineterminator="\n")
                writer.writerow([label_to_write])  # Descriptor
                writer.writerow(["Time", "Value"])  # Header
                for time, value in zip(times_to_extract, values_to_extract):
                    writer.writerow([time, value])
        else:
            # treat a monte-carlo multi-sample

            files_to_aggregate = []

            for poss_multi_sample_file_name in extracted_files:
                if poss_multi_sample_file_name not in files_to_skip:
                    (
                        poss_multi_descriptor,
                        poss_multi_finer_descriptor,
                        poss_multi_file_name_rest,
                    ) = name_split(poss_multi_sample_file_name)

                    if (
                        descriptor == poss_multi_descriptor
                        and file_name_rest == poss_multi_file_name_rest
                    ):
                        if poss_multi_finer_descriptor.startswith("mc"):
                            files_to_aggregate.append(poss_multi_sample_file_name)

            for file_to_agg in files_to_aggregate:
                # enough if one of the series triggers this
                files_to_skip.append(file_to_agg)

            print("Treating the multi-sample series: ", file_name_rest, descriptor)
            print(files_to_aggregate)

            # treat a multi-sample
            times_to_extract = []
            values_to_extract = []
            label_to_write = ""
            for sample_index, multi_sample_file_name in enumerate(files_to_aggregate):
                loaded_data: Dict[str, Union[float, str, Dict[Any, Any], List[Any]]] = (
                    {}
                )

                with open(multi_sample_file_name, mode="r") as file:
                    loaded_data = json.load(file)

                if sample_index == 0:
                    print(loaded_data["hamiltonian"])
                    print(loaded_data["sampler"])

                    observable = loaded_data["observables"][observable_index]
                    print(observable)
                    label_to_write = observable["label"]

                data_array = loaded_data["measurements"]

                for measurement_index, measurement_point in enumerate(data_array):
                    time = measurement_point["time"]
                    val = measurement_point["data"][observable_index]

                    if sample_index == 0:
                        times_to_extract.append(time)
                        values_to_extract.append([])

                    values_to_extract[measurement_index].append(val)

            out_file_name = f"{descriptor}-mc-{args['out_file_suffix']}.csv"
            with open(out_file_name, mode="w", newline="") as file:
                writer = csv.writer(file, lineterminator="\n")
                writer.writerow([label_to_write])  # Descriptor
                writer.writerow(["Time", "Value", "StdDev"])  # Header
                for time, value_array in zip(times_to_extract, values_to_extract):
                    value_array = np.array(value_array)
                    writer.writerow([time, value_array.mean(), value_array.std()])
