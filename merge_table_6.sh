#!/bin/bash

work_dir="output/tables"
output_file="$work_dir"/arg_rec_paper_table1_table.txt

max_line_index=16

declare -A max_values
declare -A table_entries

mask_latex() {
    echo "$1" | sed 's/\\/\\\\/g; s/\$/\\\$/g; s/%/\\%/g'
}

demask_latex() {
    echo "$1" | sed 's/\\\$/\$/g; s/\\%/%/g; s/\\\\/\\/g'
}

indices=("avg_objects_learning" "num_edges_learning" "orig_args" "rec_args" "extra_args" \
    "avg_all_oi_features" "avg_admissible_oi_features" \
    "avg_all_features" "avg_admissible_features" "avg_time_learning" \
    "avg_objects_verifi" "num_edges_verifi" "avg_time_verifi" "success_rate")
#num_dec_digits=(0 0 0 0 0 0 0 0 0 0 0 0)

max_aggregation=("orig_args" "rec_args" "extra_args")
avg_aggregation=()
for index in "${indices[@]}"; do
    if [[ ! "${max_aggregation[*]}" =~ "$index" ]]; then
        avg_aggregation+=("$index")
    fi
done

units=("" "" "" "" "" "" "" "" "" '\\seconds' "" "" '\\seconds' '\\%' )
num_units=${#units[@]}

split_lines=("03" "09" "11" "13" "14" "15")

for table_line in "${split_lines[@]}"; do

    for key in "${!max_values[@]}"; do
        #echo $key
        #echo ${max_values[$key]}
        max_values[$key]=0
        #echo ${max_values[$key]}
    done

    result_file_line="$work_dir"/arg_rec_paper_table1_line"$table_line"_table.txt
    total_runs=0
    for input_file in "$work_dir"/arg_rec_paper_table1_line"$table_line"_run*_table.txt; do
        total_runs=$(($total_runs + 1))
        base_name=$(basename "$input_file" _table.txt)
        source_name="${base_name%_run*}"

        while IFS= read -r line; do
            values=($(echo "$line" | awk -F'&' '{for(i=2;i<=NF;i++) print $i}' | tr -d ' '))

            for i in "${!indices[@]}"; do
                key=${indices[$i]}
                value=$(echo "${values[$i]}" | tr -d '$')
                value=$(echo "$value" | tr -d "${units[$i]}")
                #echo $value
                #echo ${units[$i]}
                if [[ "${max_aggregation[*]}" =~ "$key"* ]]; then
                    if (( $(echo "${value} > ${max_values[$key]:-0}" ) )); then
                        max_values[$key]=$value
                    fi
                else
                    max_values[$key]=$(( ${max_values[$key]} + value ))
                fi

            done

        done < "$input_file"
    done

    #total_runs=25

    for key in "${!max_values[@]}"; do
        if [[ "${avg_aggregation[*]}" =~ "$key"* ]]; then
        max_values[$key]=$(bc <<< "scale=2; ${max_values[$key]} / $total_runs")
        fi
    done

    for key in "${!max_values[@]}"; do
        max_values[$key]=$(echo "scale=0; "${max_values[$key]}" / 1" | bc)
    done

    stats_table_out=""
    for i in "${!indices[@]}"; do
        key=${indices[$i]}
        unit=${units[$i]}

        stats_table_out+="&\$${max_values[$key]}$unit\$"
    done
    final_output="$(demask_latex "${stats_table_out}")"
    echo "${final_output}" > "$result_file_line"

    echo "Saved table line'$table_line' as '$result_file_line'."

done

default_line=""
for i in $(seq 0 $((num_units - 1))); do
    default_line+="&-${units[i]}"
done
default_line="$(demask_latex "${default_line}")"

lines=()
for i in $(seq 0 $max_line_index); do
    lines[i]=$default_line
done

for input_file in "$work_dir"/arg_rec_paper_table1_line*_table.txt; do
    if [[ $input_file =~ arg_rec_paper_table1_line([0-9]{2})_table\.txt ]]; then
        line_number=${BASH_REMATCH[1]}
        line_number_int=$((10#$line_number))
        if (( line_number_int >= 0 && line_number_int <= max_line_index )); then
            #echo $line_number
            #echo $line_number_int
            #echo $(cat "$input_file")
            lines[line_number_int]=$(cat "$input_file")
        else
            echo "Warning: Line number $line_number out of range (00-$max_line_index) for file '$input_file'."
        fi
    fi
done

{
    for i in $(seq 0 $max_line_index); do
        echo "${lines[i]}"
    done
} > "$output_file"

echo "Merged table saved as '$output_file'."
