#!/bin/bash

output_dir="output/tables"
result_file="output/tables/arg_rec_paper_table1_line03_table.txt"

echo "" > "$result_file"

declare -A max_values
declare -A table_entries

mask_latex() {
    echo "$1" | sed 's/\\/\\\\/g; s/\$/\\\$/g; s/%/\\%/g'
}

demask_latex() {
    echo "$1" | sed 's/\\\$/\$/g; s/\\%/%/g; s/\\\\/\\/g'
}

indices=("avg_objects_learning" "num_edges_learning" "orig_args" "rec_args" "extra_args" \
          "max_all_features" "avg_admissible_features" "avg_time_learning" "avg_objects_verifi" \
          "num_edges_verifi" "avg_time_verifi" "success_rate")

units=("" "" "" "" "" "" "" '\\seconds' "" "" '\\seconds' '\\%' )

total_runs=0
for input_file in "$output_dir"/arg_rec_paper_table1_line03_run*_table.txt; do
    total_runs=$(($total_runs + 1))
    base_name=$(basename "$input_file" _table.txt)
    source_name="${base_name%_run*}"

    while IFS= read -r line; do
        values=($(echo "$line" | awk -F'&' '{for(i=2;i<=NF;i++) print $i}' | tr -d ' '))

        for i in "${!indices[@]}"; do
            key=${indices[$i]}
            value=$(echo "${values[$i]}" | tr -d '$')
            value=$(echo "$value" | tr -d "${units[$i]}")
            echo $value
            echo ${units[$i]}
            if [[ $key == orig_args || $key == rec_args || $key == extra_args || $key == max_all_features ]]; then
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
    if [[ ! "orig_args rec_args extra_args max_all_features success_rate" =~ $key ]]; then
       max_values[$key]=$(bc <<< "scale=2; ${max_values[$key]} / $total_runs")
    fi
done

stats_table_out=""
for i in "${!indices[@]}"; do
    key=${indices[$i]}
    unit=${units[$i]}

    stats_table_out+="&\$${max_values[$key]}$unit\$"
done
#final_output=$stats_table_out
final_output="$(demask_latex "${stats_table_out}")"
#final_output="${final_output}\\"
echo "${final_output}" >>"$result_file"

echo "Die Tabelle wurde als '$result_file' gespeichert."
