#!/bin/bash
#SBATCH --job-name=graph_separator
#SBATCH --output=job_%A_%a.out
#SBATCH --error=job_%A_%a.err
#SBATCH --array=33
#SBATCH --cpus-per-task=22
#SBATCH --mem=310G
#SBATCH --gpus=0
#SBATCH --time=12:00:00

# Benchmarks
input_dir="./benchmark/table1"
input_files=("Blocks3.txt" "Blocks4.txt" "Delivery.txt" "Driverlog.txt" "Ferry.txt" "Grid.txt" "Grid_Lock.txt" "Gripper.txt" "Hanoi.txt" "Logistics.txt" "Miconic.txt" "Npuzzle.txt" "Sokoban.txt" "Sokoban_Pull.txt")

file_index=$((SLURM_ARRAY_TASK_ID / 3))
line_index=$((SLURM_ARRAY_TASK_ID % 3))

input_file="${input_files[$file_index]}"

temp_file=$(mktemp "/tmp/${input_file%.txt}_table1_line${line_index}.XXXXXX")

sed -n "$((line_index + 1))p" "$input_dir/$input_file" > "$temp_file"

apptainer run --bind .:/graph-separator --bind /tmp:/tmp ../graph-separator.sif /graph-separator/main.py -br "$temp_file" -p 22

rm "$temp_file"
