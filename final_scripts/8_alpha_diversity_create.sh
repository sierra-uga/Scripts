#!/bin/sh
#SBATCH --job-name=“alpha-diversity”
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
table=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/analysis/final-final-core-metrics/rarefied_table.qza
output=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/final-final-core-metrics

#### GOODS COVERAGE
qiime diversity alpha \
  --i-table $table \
  --p-metric goods_coverage \
  --o-alpha-diversity $output/rare_goods_coverage.qza
#### RICHNESS
qiime diversity alpha \
  --i-table $table \
  --p-metric chao1 \
  --o-alpha-diversity $output/rare_chao1.qza

qiime diversity alpha \
  --i-table $table \
  --p-metric simpsons \
  --o-alpha-diversity $output/rare_simpsons.qza
  
  nano 8_OTU_alpha_diversity_create.sh

table-dn-97.qza
  