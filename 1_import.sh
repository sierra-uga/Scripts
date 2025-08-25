#!/bin/sh
#SBATCH --job-name=“import-data”
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
#SBATCH -e /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/import-data.err-%N
#SBATCH -o /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/import-data.out-%N

# import data
module load gcc/10.2.0 #prereq for qiime
module load anaconda3/2021.05 #prereq for qiime
module load qiime2/2022.8 
input=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-raw/UTK0268_jdebruyn_DeBruyn_Taylor_240924/trimmed-syncom1-manifest-file.tsv
output=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean/trimmed-syncom1-demultiplexed-samples.qza

# for demultiplexed sequences only!
qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path $input \
  --output-path $output \
  --input-format PairedEndFastqManifestPhred33V2
  