#!/bin/sh
#SBATCH --job-name=“deblur-new”
#SBATCH --partition=campus-bigmem
#SBATCH --nodes=1
#SBATCH --qos=campus-bigmem
#SBATCH -A ISAAC-UTK0268
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --time=1-00:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/deblur-new.err-%N
#SBATCH -o /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/deblur-new.out-%N

# load/variables
module load gcc/10.2.0 #prereq for qiime
module load anaconda3/2021.05 #prereq for qiime
module load qiime2/2022.8 
input=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean
output=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean

qiime deblur denoise-other \
  --i-demultiplexed-seqs $input/syncom1-demultiplexed-samples.qza \
  --i-reference-seqs $input/silva_repseqs.qza \
  --p-jobs-to-start 8 \
  --p-trim-length 250 \
  --p-sample-stats \
  --o-representative-sequences $output/new-deblur-repseqs.qza \
  --o-table $output/new-deblur-table.qza \
  --o-stats $output/new-deblur-stats.qza \
  --verbose