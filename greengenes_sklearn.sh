#!/bin/sh
#SBATCH --job-name=“sklern”
#SBATCH --partition=long
#SBATCH --nodes=1
#SBATCH --qos=long
#SBATCH -A ISAAC-UTK0268
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --time=6-00:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/sklern.err-%N
#SBATCH -o /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/sklern.out-%N

# using previously trained classifier to tabulate sequences
# load/variables
module load gcc/10.2.0 #prereq for qiime
module load anaconda3/2021.05 #prereq for qiime
module load qiime2/2022.8 
trained_classifier=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/training-feature-classifiers/greengenes-classifier.qza
output=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/analysis
taxonomy_assignment=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean/Syncom1-taxonomy-greengenes.qza  # an output
unknown_reads=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean/rep-seqs-dada2.qza 

qiime feature-classifier classify-sklearn \
  --i-reads $unknown_reads \
  --i-classifier $trained_classifier \
  --p-confidence 0.7 \
  --o-classification $taxonomy_assignment