#!/bin/bash 

reference_file=$(find -L ../data -name "*.fasta" -o -name "*.fa")
forward_reads=$(find -L ../data -name "*_R1.fastq.gz" -o -name "*_R1.fq.gz")
reverse_reads=$(find -L ../data -name "*_R2.fastq.gz" -o -name "*_R2.fq.gz")

# Construction of the Index
kallisto index -i ../scratch/transcripts.idx ${reference_file}

if [ "${type_seq}" == "SingleEnded" ];
then
    # Quantification
    kallisto quant -i ../scratch/transcripts.idx -o ../results/testing_one ${num_boot} --single ${len_frag} ${std_frag} ${forward_reads}
else
    # Quantification
    kallisto quant -i ../scratch/transcripts.idx -o ../results/testing_one ${num_boot} ${forward_reads} ${reverse_reads}
fi