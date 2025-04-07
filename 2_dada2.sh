#!/bin/sh
#SBATCH --job-name=“dada2-analysis”
#SBATCH --partition=long-bigmem
#SBATCH --nodes=1
#SBATCH --qos=long-bigmem
#SBATCH -A ISAAC-UTK0268
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --mem-per-cpu=30G
#SBATCH --time=6-00:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/dada2.err-%N
#SBATCH -o /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/dada2.out-%N

# load/variables
module load gcc/10.2.0 #prereq for qiime
module load anaconda3/2021.05 #prereq for qiime
module load qiime2/2022.8 
input=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean
output=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean

# basic -- trims to 120 basepairs
qiime dada2 denoise-paired \
        --i-demultiplexed-seqs $input/trimmed-syncom1-demultiplexed-samples.qza \
        --p-n-threads 0 \
        --p-trunc-len-f 290 \
        --p-trunc-len-r 260 \
        --p-chimera-method pooled \
        --verbose \
        --o-table $output/final-table-dada2.qza \
        --o-representative-sequences $output/final-rep-seqs.qza \
        --o-denoising-stats $output/final-stats-dada2.qza