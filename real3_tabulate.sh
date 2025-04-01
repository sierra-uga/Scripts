#!/bin/sh
#SBATCH --job-name=“tabulate”
#SBATCH --partition=campus
#SBATCH --nodes=1
#SBATCH --qos=campus
#SBATCH -A ISAAC-UTK0268
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --time=1-00:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/tabulate.err-%N
#SBATCH -o /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/tabulate.out-%N

# import data
module load gcc/10.2.0
module load anaconda3/2021.05
module load qiime2/2022.8
input=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean
output=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/analysis

qiime metadata tabulate \
  --m-input-file $input/stats-dada2.qza \
  --o-visualization $output/stats-dada2.qzv
