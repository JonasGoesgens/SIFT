#!/bin/bash
#SBATCH --job-name=arg_rec_sift
#SBATCH --output=output/stdout/job_%A_%a.out
#SBATCH --error=output/stderr/job_%A_%a.err
#SBATCH --array=0-14
#SBATCH --cpus-per-task=64
#SBATCH --mem=360G
#SBATCH --gpus=0
#SBATCH --time=7-00:00:00

# Benchmarks
output_dir=${1:-"./output"}
line_index=$((SLURM_ARRAY_TASK_ID))
input_base="./clingo/Static_optimization_Naive.lp"
input_instance="$output_dir/statics/clingo/arg_rec_paper_table1_line$(printf "%02d" $line_index)_0_00.lp"

if [ $line_index -eq 3 ]; then
    input_instance="$output_dir/statics/clingo/arg_rec_paper_table1_line$(printf "%02d" $line_index)_run00_0_00.lp"
fi

apptainer exec \
  --bind .:/sift \
  --bind /tmp:/tmp \
  ../sift-container.sif \
  clingo $input_base $input_instance -t 64,split

exit_status=$?

#0 (Success/Unknown): Generally means successful execution, including finding a solution (SAT) or determining no solution exists (UNSAT).
#10 (SAT): A model was found.
#20 (UNSAT): Proven that no model exists.
#30 (OPTIMAL)
successful_exit_statuses=(0 10 20 30)

if [[ ! " ${successful_exit_statuses[@]} " =~ " ${exit_status} " ]]; then
    echo "Error: The command failed with exit status $exit_status." >&2
else
    exit_status=0
fi

exit $exit_status
