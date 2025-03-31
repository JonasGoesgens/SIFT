#!/bin/bash

output_dir="output/tables"
result_file="latex/Table1.txt"
prefix_file="latex/Table1_prefixes.txt"

echo "" > "$result_file"

declare -A max_values
declare -A table_entries
declare -A prefixes_map

mask_latex() {
    echo "$1" | sed 's/\\/\\\\/g; s/\$/\\\$/g; s/%/\\%/g'
}

demask_latex() {
    echo "$1" | sed 's/\\\$/\$/g; s/\\%/%/g; s/\\\\/\\/g'
}

while IFS= read -r line; do
    source_name=$(echo "$line" | awk '{print $1}')
    source_name=$(echo "$source_name" | sed 's/\\//g')
    source_name=$(echo "$source_name" | tr '[:upper:]' '[:lower:]')

    prefixes_map["$source_name"]="$line"
done < "$prefix_file"

for input_file in "$output_dir"/*_table1_*_table.txt; do
    base_name=$(basename "$input_file" _table.txt)

    source_name="${base_name%_table1_line*}"
    line_index="${base_name##*_line}"

    source_name=$(echo "$source_name" | tr '[:upper:]' '[:lower:]')

    while IFS= read -r line; do

        value=$(mask_latex $(echo "$line" | awk -F'&' '{print $2}' | tr -d ' '))
        pure_value=$(echo "$value" | sed 's/\\//g; s/\$//g')
        if [[ ! ${max_values[$source_name]} ]]; then
            max_values[$source_name]=$value
        else
            pure_max_value=$(echo "${max_values[$source_name]}" | sed 's/\\//g; s/\$//g')

            if [[ $(echo "$pure_value > $pure_max_value" | bc -l) ]]; then
                max_values[$source_name]=$value
            fi
        fi
        table_entries["$source_name,$line_index"]="$line"

    done < "$input_file"
done


for source in $(printf "%s\n" "${!max_values[@]}" | sort); do

    output_line="${max_values[$source]}"

    for i in {0..3}; do
        entry=${table_entries["$source,$i"]}

        if [[ $entry ]]; then
            part2=$(mask_latex "$(echo "$entry" | awk -F'&' '{print $3}')")
            part3=$(mask_latex "$(echo "$entry" | awk -F'&' '{print $4}')")
            part4=$(mask_latex "$(echo "$entry" | awk -F'&' '{print $5}')")
            part5=$(mask_latex "$(echo "$entry" | awk -F'&' '{print $6}')")

            output_line+="&$part2&$part3&$part4&$part5"
        fi
    done
    prefix="${prefixes_map[$source]}"

    final_output="$(demask_latex "&${output_line}")"
    final_output="${prefix}${final_output}\\\\"
    echo "${final_output}" >> "$result_file"
done

echo "The table was saved as '$result_file'."
