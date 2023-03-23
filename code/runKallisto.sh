#!/bin/bash 

# Construction of the Index
kallisto index -i ../scratch/transcripts.idx ${reference_file}

if [ "${type_seq}" == "SingleEnded" ];
then
    # Quantification
    kallisto quant \
    -i ../scratch/transcripts.idx \
    -o ../results/testing_one \
    -t ${num_thread} \
    ${num_boot} \
    --single \
    ${len_frag} \
    ${std_frag} \
    ${forward_reads}
else
    # Quantification
    kallisto quant \
    -i ../scratch/transcripts.idx \
    -o ../results/testing_one \
    -t ${num_thread} \
    ${num_boot} \
    ${forward_reads} \
    ${reverse_reads}
fi