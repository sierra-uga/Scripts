#!/bin/sh
#SBATCH --job-name=“alpha”
#SBATCH --partition=short
#SBATCH --nodes=1
#SBATCH --qos=short
#SBATCH -A ISAAC-UTK0268
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=0-01:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/alpha-diversity-things.err-%N
#SBATCH -o /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/alpha-diversity-things.out-%N


# load/variables
module load gcc/10.2.0
module load anaconda3/2021.05
module load qiime2/2022.8
input=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean
output=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/analysis

qiime feature-table summarize \
  --i-data $input/final-table-dada2.qza \
  --o-visualization $output/rep-seqs-dada2-visual.qzv
