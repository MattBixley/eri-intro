#!/bin/bash -e
#SBATCH --time=00:20:00
#SBATCH --cpus-per-task=2
#SBATCH --mem=3G
#SBATCH --account=2023-nesi_slurm_testing
#SBATCH --partition=interactive

module purge
module load R/4.3.2-foss-2023a

Rscript matrix.R