#!/bin/bash 

source ./config.sh

reference_file=$(find -L ../data -name "*.fasta" -o -name "*.fa")
forward_reads=$(find -L ../data -name "*_R1.fastq.gz" -o -name "*_R1.fq.gz")
reverse_reads=$(find -L ../data -name "*_R2.fastq.gz" -o -name "*_R2.fq.gz")

reference_count=$(echo $reference_files | wc -w) 
forward_count=$(echo $forward_reads | wc -w)
reverse_count=$(echo $reverse_reads | wc -w)

# Construction of the Index

kallisto index -i ../scratch/transcripts.idx ${reference_file}

if [ "${type_seq}" == "SingleEnded" ];
then
    # Quantification
    kallisto quant \
    -i ../scratch/transcripts.idx \
    -o ../results/ \
    ${num_boot} \
    --single \
    ${len_frag} \
    ${std_frag} \
    ${forward_reads} \
    -t ${num_thread}
else
    # Quantification
    kallisto quant \
    -i ../scratch/transcripts.idx \
    -o ../results/ \
    -t ${num_thread} \
    ${num_boot} \
    ${len_frag} \
    ${std_frag} \
    ${forward_reads} \
    ${reverse_reads}
fi