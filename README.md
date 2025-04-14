To build the container run:  
`apptainer build ../sift-container.sif sift-container.def`  
To use the container on a single python comand use:  
`apptainer run ../sift-container.sif main.py -p <number of processes> -d pddl_files/<domain> -i pddl_files/<instance> [pddl_files/<instance2>]`  
To get an interactive shell use:  
`apptainer shell ../sift-container.sif`
To rerun the paper experiments on a slurm cluster
`sbatch -p <your_partition> submit_jobs_??.sh`
To merge the output table ensure all merge_table??.sh scripts are executable (chmod +x), run:
`-/merge_table??.sh`
you find the tables in the latex folder.
all other output will be in the output folder.
