#!/bin/bash
#SBATCH --job-name=synth+
#SBATCH --output=output/stdout/synth_job_%A_%a.out
#SBATCH --error=output/stderr/synth_job_%A_%a.err
#SBATCH --array=0-13
#SBATCH --cpus-per-task=10
#SBATCH --mem=40G
#SBATCH --gpus=0
#SBATCH --time=1-00:00:00

# Benchmarks
input_dir="./benchmark"
input_files=("arg_rec_paper_table1.txt")

file_index=0
line_index=$((SLURM_ARRAY_TASK_ID))

input_file="${input_files[$file_index]}"

temp_file=$(mktemp "/tmp/${input_file%.txt}_line$(printf "%02d" $line_index).XXXXXX")
trap 'rm -f "$temp_file"' EXIT

sed -n "$((line_index + 1))p" "$input_dir/$input_file" > "$temp_file"

cat $temp_file

apptainer run --bind .:/sift --bind /tmp:/tmp ../sift-container.sif /sift/main.py -br "$temp_file" -p 10

exit_status=$?

if [ $exit_status -ne 0 ]; then
    echo "Error: The command failed with exit status $exit_status." >&2
fi

exit $exit_status
