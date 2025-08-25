#!/bin/sh
#SBATCH --job-name=“gunzip”
#SBATCH --partition=campus
#SBATCH --qos=campus
#SBATCH -A ISAAC-UTK0268
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=10G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e errors/import-data.err-%N
#SBATCH -o errors/import-data.out-%N

cp -r /nfs/home/sbartle7/CERES/SynCom1/data-raw/fastq /nfs/home/sbartle7/CERES/SynCom1/data-raw/zipped-fastq