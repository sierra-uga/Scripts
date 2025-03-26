#!/bin/sh
#SBATCH --job-name=“dada2-analysis”
#SBATCH --partition=long-bigmem
#SBATCH --nodes=1
#SBATCH --qos=long-bigmem
#SBATCH -A ISAAC-UTK0268
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=15
#SBATCH --mem-per-cpu=30G
#SBATCH --time=7-00:00:00
#SBATCH --nodelist=clrm1218
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/dada2.err-%N
#SBATCH -o /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/dada2.out-%N


# load/variables
module load gcc/10.2.0 #prereq for qiime
module load anaconda3/2021.05 #prereq for qiime
module load qiime2/2022.8 
input=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean
output=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-clean

nums=(250 245 240 235)

for num in "${nums[@]}"
do
    qiime dada2 denoise-paired \
    --i-demultiplexed-seqs $input/syncom1-demultiplexed-samples.qza \
    --p-n-threads 0 \
    --p-trunc-len-f $num \
    --p-trunc-len-r 200 \
    --p-chimera-method pooled \
    --o-table $output/paired_end_read_filtered_cutadapt_${num}_table.qza \
    --verbose \
    --o-representative-sequences $output/paired_end_read_filtered_cutadapt_${num}_rep-seqs.qza \
    --o-denoising-stats $output/paired_end_read_filtered_cutadapt_${num}_denoising-stats.qza

    qiime metadata tabulate \
    --m-input-file $output/paired_end_read_filtered_cutadapt_${num}_denoising-stats.qza \
    --o-visualization $output/paired_end_read_filtered_cutadapt_${num}_denoising-stats.qzv
done

#from https://forum.qiime2.org/t/dada2-trimming-tests-approach/31327/2