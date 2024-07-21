#!/bin/bash --login
###
###
#job name
#SBATCH --job-name=LCDM
#job stdout file
#SBATCH --output=LCDM.out.%J
#job stderr file
#SBATCH --error=LCDM.err.%J
#maximum job time in D-HH:MM
#SBATCH --time=2-23:59
#SBATCH --account=scw2169
#SBATCH --ntasks=4 #number of parallel processes (tasks) you are requesting - maps to MPI processes
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=4096 #memory per process in MB 
#SBATCH --mail-type=END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user= xyz@swansea.ac.uk     # change to your email to get updates

module load anaconda/2023.09
module load compiler/gnu/12/1.0 
module load mpi/openmpi/4.1.5 # use intel compilers if using intelmpi

source /path/to/your/virtual/environment/bin/activate # if using python virtual environment
# conda activate yourenv # if using conda environments

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

mpirun -n 4 cobaya-run Planck_LCDM.yaml --resume
mpirun -n 4 cobaya-run Planck_LCDM.yaml --minimize
