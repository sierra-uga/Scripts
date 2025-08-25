#!/bin/sh
#SBATCH --job-name=“tree”
#SBATCH --partition=campus
#SBATCH --nodes=1
#SBATCH --qos=campus
#SBATCH -A ISAAC-UTK0268
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --time=1-00:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/tree.err-%N
#SBATCH -o /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/tree.out-%N


# load/variables
module load gcc/10.2.0
module load anaconda3/2021.05
module load qiime2/2022.8
input=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean/final-rep-seqs.qza
output=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean

qiime phylogeny align-to-tree-mafft-fasttree \
  --i-sequences $input \
  --o-alignment $output/final-rep-seqs.qza \
  --o-masked-alignment $output/final-masked-aligned-rep-seqs.qza \
  --o-tree $output/final-unrooted-tree.qza \
  --o-rooted-tree $output/final-rooted-tree.qza 
  