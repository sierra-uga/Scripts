#!/bin/sh
#SBATCH --job-name=“phylogenetic-cores”
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=10G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=sb29930@uga.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e errors/cores.err-%N
#SBATCH -o errors/cores.out-%N

# load/variables
module load QIIME2/2023.7
rooted_tree=/home/sb29930/art001/data-clean/rooted-tree.qza
table=/home/sb29930/art001/data-clean/table.qza
metad=/home/sb29930/art001/analysis/artemis-eDNA-metadata-final.tsv
output=/home/sb29930/art001/analysis

qiime diversity core-metrics-phylogenetic \
  --i-phylogeny $rooted_tree \
  --i-table $table \
  --p-sampling-depth 13000 \
  --m-metadata-file $metad \
  --output-dir $output/final-core-metrics
  