#!/bin/sh
#SBATCH --job-name=“paired”
#SBATCH --partition=campus
#SBATCH --nodes=1
#SBATCH --qos=campus
#SBATCH -A ISAAC-UTK0268
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=1-00:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/paired.err-%N
#SBATCH -o /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/paired.out-%N

# load/variables
module load gcc/10.2.0 #prereq for qiime
module load anaconda3/2021.05 #prereq for qiime
module load qiime2/2022.8 
input=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean
output=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean

qiime vsearch join-pairs \
  --i-demultiplexed-seqs $input/syncom1-demultiplexed-samples.qza \
  --o-joined-sequences $output/demux-joined.qza