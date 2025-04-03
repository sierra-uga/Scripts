#!/bin/sh
#SBATCH --job-name=“barplot”
#SBATCH --partition=campus
#SBATCH --nodes=1
#SBATCH --qos=campus
#SBATCH -A ISAAC-UTK0268
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --time=1-00:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/barplot.err-%N
#SBATCH -o /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/barplot.out-%N

input=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean
metad=input=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/analysis/syncom1-metadata.tsv
output=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/analysis

qiime taxa barplot \
  --i-table $input/table-dada2.qza \
  --i-taxonomy $input/Syncom1-taxonomy-silva-dada2.qza \
  --m-metadata-file $metad \
  --o-visualization $output/dada2-taxa-bar-plots.qzv