#!/bin/sh
#SBATCH --job-name=“cut-adapt-part1”
#SBATCH --partition=campus-bigmem
#SBATCH --nodes=1
#SBATCH --qos=campus-bigmem
#SBATCH -A ISAAC-UTK0268
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --time=1-00:00:00
#SBATCH --mail-user=sbartle7@utk.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/cut-adapt-part1.err-%N
#SBATCH -o /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/scripts/errors/cut-adapt-part1.out-%N

# Set the output directory
DERIVED=/lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-raw/trimmed-reads

# Load singularity module if needed (depends on your cluster setup)
module load singularity

# Process files
for R1 in /lustre/isaac24/scratch/sbartle7/CERES/SynCom1/data-raw/UTK0268_jdebruyn_DeBruyn_Taylor_240924/fastq/*_R1_001.fastq.gz ; do
    R2=${R1/_R1_/_R2_}
    echo "Processing:"
    echo "R1: $R1"
    echo "R2: $R2"
    base1=$(basename $R1)
    base2=$(basename $R2)

    singularity exec docker://quay.io/biocontainers/cutadapt:5.0--py39hbcbf7aa_0 cutadapt \
        --discard-untrimmed \
        --pair-filter=any \
        --minimum-length 200 \
        --action=none \
        -j 8 \
        -a ^GTGYCAGCMGCCGCGGTAA...ATTAGAWACCCBNGTAGTCC \
        -A ^GGACTACNVGGGTWTCTAAT...TTACCGCGGCKGCTGRCAC \
        -o $DERIVED/test_${base1}.fastq.gz -p $DERIVED/test_${base2}.fastq.gz \
        $R1 $R2
done
