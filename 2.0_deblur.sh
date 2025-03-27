#!/bin/sh
#SBATCH --job-name=“deblur1”
#SBATCH --partition=campus-bigmem	
#SBATCH --nodes=1
#SBATCH --qos=campus-bigmem	
#SBATCH -A ISAAC-UTK0268
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --mem-per-cpu=30G
#SBATCH --time=1-00:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/deblur1.err-%N
#SBATCH -o /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/deblur1.out-%N

# load/variables
module load gcc/10.2.0 #prereq for qiime
module load anaconda3/2021.05 #prereq for qiime
module load qiime2/2022.8 
input=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean
output=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean


# basic -- trims to 120 basepairs
qiime quality-filter q-score \
 --i-demux $input/syncom1-demultiplexed-samples.qza \
 --o-filtered-sequences $output/demux-filtered.qza \
 --o-filter-stats $output/demux-filter-stats.qza
 
 