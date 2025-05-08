#!/bin/bash
#SBATCH --job-name=graph_separator
#SBATCH --output=job_%A_%a.out
#SBATCH --error=job_%A_%a.err
#SBATCH --array=0-12
#SBATCH --cpus-per-task=64
#SBATCH --mem=184G
#SBATCH --gpus=0
#SBATCH --time=24:00:00

# Benchmarks
input_dir="./benchmark"
input_files=("test_all_small_fg_recovery.txt")

file_index=$(0)
line_index=$((SLURM_ARRAY_TASK_ID))

input_file="${input_files[$file_index]}"

temp_file=$(mktemp "/tmp/${input_file%.txt}_table1_line${line_index}.XXXXXX")

sed -n "$((line_index + 1))p" "$input_dir/$input_file" > "$temp_file"

apptainer run --bind .:/graph-separator --bind /tmp:/tmp ../graph-separator.sif /graph-separator/main.py -br "$temp_file" -p 64

rm "$temp_file"
