#!/bin/sh
#SBATCH --job-name=“import-visual”
#SBATCH --partition=campus-bigmem
#SBATCH --nodes=1
#SBATCH --qos=campus-bigmem
#SBATCH -A ISAAC-UTK0268
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=8G
#SBATCH --time=1-00:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e errors/import-data.err-%N
#SBATCH -o errors/import-data.out-%N

# import data
module load gcc/10.2.0
module load anaconda3/2021.05
module load qiime2/2022.8
output=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean/syncom1-demultiplexed-samples.qza

# visualize qza to see quality, and to know where to trim with dada2
qiime demux summarize \
--i-data $output \
--o-visualization syncom1-demux.qzv

# visualize using --> www.view.qiime2.org 
