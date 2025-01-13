To build the container run:  
`apptainer build ../sift-container.sif sift-container.def`  
To use the container on a single python comand use:  
`apptainer run ../sift-container.sif main.py -d pddl_files/<domain> -i pddl_files/<instance> <pddl_files/<instance2>>`  
To get an interactive shell use:  
`apptainer shell ../sift-container.sif`
