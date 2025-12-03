#!/bin/bash
#SBATCH --job-name=graph_separator
#SBATCH --output=job_%A_%a.out
#SBATCH --error=job_%A_%a.err
#SBATCH --array=5
#SBATCH --cpus-per-task=10
#SBATCH --mem=180G
#SBATCH --gpus=0
#SBATCH --time=4:00:00

# Benchmarks
input_dir="./benchmark"
input_files=("generate_all_arg_masks.txt")

file_index=0
line_index=$((SLURM_ARRAY_TASK_ID))

input_file="${input_files[$file_index]}"

temp_file=$(mktemp "/tmp/${input_file%.txt}_table1_line${line_index}.XXXXXX")
trap 'rm -f "$temp_file"' EXIT

sed -n "$((line_index + 1))p" "$input_dir/$input_file" > "$temp_file"

apptainer run --bind .:/graph-separator --bind /tmp:/tmp ../graph-separator.sif /graph-separator/generate_arg_mask.py -br "$temp_file" -p 10

exit_status=$?

if [ $exit_status -ne 0 ]; then
    echo "Error: The command failed with exit status $exit_status." >&2
fi

exit $exit_status
