#!/bin/bash
#SBATCH --job-name=graph_separator
#SBATCH --output=job_%A_%a.out
#SBATCH --error=job_%A_%a.err
#SBATCH --array=0-47
#SBATCH --cpus-per-task=22
#SBATCH --mem=32G
#SBATCH --gpus=0
#SBATCH --time=12:00:00

# Benchmarks
input_dir="./benchmark/table2"
input_files=("MultBlocks3.txt" "MultBlocks4.txt" "MultDelivery.txt" "MultDriverlog.txt" "MultFerry.txt" "MultGrid_Lock.txt" "MultGripper.txt" "MultHanoi.txt" "MultLogistics.txt" "MultMiconic.txt" "MultNpuzzle.txt" "MultSokoban_Pull.txt")

file_index=$((SLURM_ARRAY_TASK_ID / 4))
line_index=$((SLURM_ARRAY_TASK_ID % 4))

input_file="${input_files[$file_index]}"

temp_file=$(mktemp "/tmp/${input_file%.txt}_table2_line${line_index}.XXXXXX")

sed -n "$((line_index + 1))p" "$input_dir/$input_file" > "$temp_file"

apptainer run --bind .:/graph-separator --bind /tmp:/tmp ../graph-separator.sif /graph-separator/main.py -br "$temp_file" -p 22

rm "$temp_file"
