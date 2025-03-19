#!/bin/sh
#SBATCH --job-name=“rename”
#SBATCH --partition=campus
#SBATCH --nodes=1
#SBATCH --qos=campus
#SBATCH -A ISAAC-UTK0268
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=15G
#SBATCH --time=1-00:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e errors/import-data.err-%N
#SBATCH -o errors/import-data.out-%N

for file in *S[0-9]*.fastq.gz; do
    new_name="${file/S/L}"
    mv "$file" "$new_name"
done