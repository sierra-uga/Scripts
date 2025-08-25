#!/bin/sh
#SBATCH --job-name=“metadata-tabulate”
#SBATCH --partition=campus-bigmem
#SBATCH --nodes=1
#SBATCH --qos=campus-bigmem
#SBATCH -A ISAAC-UTK0268
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH --time=1-00:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/metadata-tab.err-%N
#SBATCH -o /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/metadata-tab.out-%N

# load/variables
module load gcc/10.2.0 #prereq for qiime
module load anaconda3/2021.05 #prereq for qiime
module load qiime2/2022.8 
taxonomy_assignment=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean/final-taxonomy-silva.qza  # an output
output=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/analysis

qiime metadata tabulate \
  --m-input-file $taxonomy_assignment \
  --o-visualization $output/final_taxonomy_trimmed_may6.qzv  # import into qiime2 view, download as tsv file
  