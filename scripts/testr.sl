#!/bin/bash -e
#SBATCH --job-name=SpeedTest_R
#SBATCH --time=00:20:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=10G
#SBATCH --account=2023-nesi_slurm_testing
#SBATCH --partition=compute

## clean working environment and load required modules
module purge
module load R/4.3.2-foss-2023a

## make tmp dir for outputs
dir=/agr/scratch/projects/2023-nesi_slurm_testing/${SLURM_JOB_ID}
echo $dir
mkdir -p $dir
cd $dir

submitdir=${SLURM_SUBMIT_DIR}
echo $submitdir

## run actual job
Rscript $submitdir/matrix.R


## copy and clean up
cp $dir/* $submitdir
rm -r $dir

