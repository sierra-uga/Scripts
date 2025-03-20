#!/bin/sh
#SBATCH --job-name=“import-silva”
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=5G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e import-silva.err-%N
#SBATCH -o import-silva.out-%N

# load/variables
module load QIIME2/2023.7
/nfs/home/sbartle7/CERES/SynCom1/data-clean
base_Silva_seq=/nfs/home/sbartle7/CERES/SynCom1/SILVA/SILVA138-nr99_sequences_16S.fasta
base_Silva_tax=/nfs/home/sbartle7/CERES/SynCom1/SILVA/SILVA138-nr99_taxonomy_16S.txt
qiime_Silva_seq=/nfs/home/sbartle7/CERES/SynCom1/SILVA/qiime_Silva_seq.qza
qiime_Silva_tax=/nfs/home/sbartle7/CERES/SynCom1/SILVA/qiime_Silva_tax.qza

#import fasta file
qiime tools import \
  --type 'FeatureData[Sequence]' \
  --input-path $base_Silva_seq \
  --output-path $qiime_Silva_seq

#import taxonomy text file
qiime tools import \
  --type 'FeatureData[Taxonomy]' \
  --input-format HeaderlessTSVTaxonomyFormat \
  --input-path $base_Silva_tax \
  --output-path $qiime_Silva_tax