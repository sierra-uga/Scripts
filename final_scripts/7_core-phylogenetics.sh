#!/bin/sh
#SBATCH --job-name=“core-phylo”
#SBATCH --partition=short
#SBATCH --nodes=1
#SBATCH --qos=short
#SBATCH -A ISAAC-UTK0268
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=0-01:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/core-phylo.err-%N
#SBATCH -o /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/core-phylo.out-%N


# load/variables
module load gcc/10.2.0
module load anaconda3/2021.05
module load qiime2/2022.8
rooted_tree=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean/rooted-tree.qza
table=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean/final-table-dada2.qza
metad=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/analysis/syncom1-metadata.tsv
output=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/analysis

qiime diversity core-metrics-phylogenetic \
  --i-phylogeny $rooted_tree \
  --i-table $table \
  --p-sampling-depth 7305 \
  --m-metadata-file $metad \
  --output-dir $output/final-final-core-metrics
  
