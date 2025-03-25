#!/bin/sh
#SBATCH --job-name=“classifier-training”
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

# load/variables
module load gcc/10.2.0
module load anaconda3/2021.05
module load qiime2/2022.8
SILVA_taxonomy=/nfs/home/sbartle7/CERES/SynCom1/SILVA/qiime_Silva_tax.qza
reference_sequences=nfs/home/sbartle7/CERES/SynCom1/training-feature-classifiers/extract-ref-seqs.qza
trained_classifier=nfs/home/sbartle7/CERES/SynCom1/training-feature-classifiers/trained-classifier.qza

# train naive bayes using your trimmed SILVA. Use default parameters 
qiime feature-classifier fit-classifier-naive-bayes \ 
  --i-reference-reads $reference_sequences \
  --i-reference-taxonomy $SILVA_taxonomy \
  --o-classifier $trained_classifier

