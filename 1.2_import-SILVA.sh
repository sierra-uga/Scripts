#!/bin/sh
#SBATCH --job-name=“import-silva”
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
#SBATCH -e /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/import-silva.err-%N
#SBATCH -o /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/import-silva.out-%N

# load/variables
module load gcc/10.2.0
module load anaconda3/2021.05
module load qiime2/2022.8
base_Silva_seq=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/SILVA/silva_132_99_16S.fna
base_Silva_tax=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/SILVA/taxonomy_all_levels.txt
qiime_Silva_seq=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/SILVA/qiime_Silva_seq.qza
qiime_Silva_tax=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/SILVA/qiime_Silva_tax.qza

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