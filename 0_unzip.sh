#!/bin/sh
#SBATCH --job-name=“gunzip”
#SBATCH --partition=campus
#SBATCH --qos=campus
#SBATCH -A ISAAC-UTK0268
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=8G
#SBATCH --time=1-00:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e errors/import-data.err-%N
#SBATCH -o errors/import-data.out-%N

#unzip all the fastq files in the current directory (should be /fastq)
gunzip *.fastq.gz