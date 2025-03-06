#!/bin/sh
#SBATCH --job-name=“dada2-analysis”
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=20G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e errors/dada2.err-%N
#SBATCH -o errors/dada2.out-%N

# load/variables
module load QIIME2/2023.7
input=/nfs/home/sbartle7/CERES/SynCom1/data-clean
output=/nfs/home/sbartle7/CERES/SynCom1/data-clean

# basic -- trims to 120 basepairs
qiime dada2 denoise-paired \
        --i-demultiplexed-seqs $input/syncom1-demux.qza \
        --p-n-threads 0 \
        --p-trunc-len-f 220 \
        --p-trunc-len-r 200 \
        --p-chimera-method pooled \
        --verbose \
        --o-table $output/table-dada2.qza \
        --o-representative-sequences $output/rep-seqs.qza \
        --o-denoising-stats $output/stats-dada2.qza
        