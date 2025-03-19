#!/bin/sh
#SBATCH --job-name=“import-data”
#SBATCH --partition=campus
#SBATCH --nodes=1
#SBATCH --qos=campus
#SBATCH -A ISAAC-UTK0268
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=15G
#SBATCH --time=1-00:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e errors/import-data.err-%N
#SBATCH -o errors/import-data.out-%N

# import data
module load gcc/10.2.0
module load anaconda3/2021.05
module load qiime2/2022.8
input=/nfs/home/sbartle7/CERES/SynCom1/data-raw/fastq
output=/nfs/home/sbartle7/CERES/SynCom1/data-clean/syncom1-demultiplexed-samples.qza

# for demultiplexed sequences only!
qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path $input \
  --input-format CasavaOneEightSingleLanePerSampleDirFmt \
  --output-path $output
  
# visualize qza to see quality, and to know where to trim with dada2
qiime demux summarize \
--i-data $output \
--o-visualization syncom1-demux.qza

# visualize using --> www.view.qiime2.org 