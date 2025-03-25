#!/bin/sh
#SBATCH --job-name=“feature-table”
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=5G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e errors/feature.err-%N
#SBATCH -o errors/feature.out-%N

# for visualization of the rep-seqs and asv table
# load/variables
module load QIIME2/2023.7
input=/nfs/home/sbartle7/CERES/SynCom1/data-clean
metad=/nfs/home/sbartle7/CERES/SynCom1/anaylsis/SynCom1-metadata.tsv
output=/nfs/home/sbartle7/CERES/SynCom1/data-clean

qiime feature-table summarize \
  --i-table $input/table.qza \
  --o-visualization $output/asv_table.qzv
  --m-sample-metadata-file $metad
  
qiime feature-table tabulate-seqs \
  --i-data $input/rep-seqs.qza \
  --o-visualization $output/rep-seqs.qzv
