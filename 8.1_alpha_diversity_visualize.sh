#!/bin/sh
#SBATCH --job-name=“alpha”
#SBATCH --partition=short
#SBATCH --nodes=1
#SBATCH --qos=short
#SBATCH -A ISAAC-UTK0268
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=0-01:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/alpha-diversity-things.err-%N
#SBATCH -o /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/alpha-diversity-things.out-%N


# load/variables
module load gcc/10.2.0
module load anaconda3/2021.05
module load qiime2/2022.8
rooted_tree=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean/rooted-tree.qza
table=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean
metad=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/analysis/syncom1-metadata.tsv
output=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/final-core-metrics

qiime tools export \
--input-path $output/final-rare_goods_coverage.qza \
--output-path $output/final-rare_goods_coverage.tsv

qiime tools export \
--input-path $output/final-rare_chao1.qza \
--output-path $output/final-rare_chao1.tsv

qiime tools export \
--input-path $output/final-rare_simpsons.qza \
--output-path $output/final-rare_simpsons.tsv
