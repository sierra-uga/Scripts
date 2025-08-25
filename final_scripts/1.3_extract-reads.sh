#!/bin/sh
#SBATCH --job-name=“extract-reads”
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
#SBATCH -e /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/extract-reads.err-%N
#SBATCH -o /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/extract-reads.out-%N

# load/variables
module load gcc/10.2.0
module load anaconda3/2021.05
module load qiime2/2022.8
SILVA_taxonomy_seq=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/SILVA/qiime_Silva_seq.qza
reference_sequences=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/training-feature-classifiers/extract-ref-seqs.qza

qiime feature-classifier extract-reads \
  --i-sequences $SILVA_taxonomy_seq \
  --p-f-primer GTGYCAGCMGCCGCGGTAA \
  --p-r-primer GGACTACNVGGGTWTCTAAT \
  --p-min-length 100 \ 
  --p-max-length 400 \ 
  --o-reads $reference_sequences

