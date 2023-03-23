#!/bin/bash 

reference_file=$(find -L ../data -name "*.fasta" -o -name "*.fa")
forward_reads=$(find -L ../data -name "*_R1.fastq.gz" -o -name "*_R1.fq.gz")
reverse_reads=$(find -L ../data -name "*_R2.fastq.gz" -o -name "*_R2.fq.gz")

# Construction of the Index
kallisto index -i ../results/transcripts.idx ${reference_file}

# Quantification
#kallisto quant -i ../scratch/transcripts.idx -o output -b 100 ${forward_reads} ${reverse_reads}

