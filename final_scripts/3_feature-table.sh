#!/bin/sh
#SBATCH --job-name=“feature-table”
#SBATCH --partition=long-bigmem
#SBATCH --nodes=1
#SBATCH --qos=long-bigmem
#SBATCH -A ISAAC-UTK0268
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --mem-per-cpu=30G
#SBATCH --time=6-00:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/feature.err-%N
#SBATCH -o /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/feature.out-%N

# for visualization of the rep-seqs and asv table
# load/variables
module load gcc/10.2.0 #prereq for qiime
module load anaconda3/2021.05 #prereq for qiime
module load qiime2/2022.8 
input=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean
metad=input=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/analysis/syncom1-metadata.tsv
output=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean

qiime feature-table summarize \
  --i-table $input/final-table-dada2.qza \
  --o-visualization $output/table-dada2-visual.qzv
  --m-sample-metadata-file $metad
  
qiime feature-table tabulate-seqs \
  --i-data $input/final-rep-seqs-dada2.qza \
  --o-visualization $output/rep-seqs-dada2-visual.qzv

