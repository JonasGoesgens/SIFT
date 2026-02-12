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
line_index=$((SLURM_ARRAY_TASK_ID))
input_base="./clingo/Static_optimization_Naive.lp"
input_instance="./output/statics/clingo/test_all_small_fg_recovery_verif_line$(printf "%02d" $line_index)_0_00.lp"

apptainer exec \
  --bind .:/sift \
  --bind /tmp:/tmp \
  ../sift-container.sif \
  clingo $input_base $input_instance -t 64,split

exit_status=$?

if [ $exit_status -ne 0 ]; then
    echo "Error: The command failed with exit status $exit_status." >&2
fi

exit $exit_status
