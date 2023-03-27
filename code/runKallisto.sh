#!/bin/bash 

source ./config.sh

if [ $reference_count -eq 1 ] && [ $gtf_count -eq 1 ];
then

    # Construction of the Index    
    kallisto index -i ../scratch/transcripts.idx ${reference_file} ${kmer_size}

    if [ "${type_seq}" == "SingleEnded" ];
    then
        echo "You are running in Single Ended Mode!"
        # Quantification
        kallisto quant \
        -i ../scratch/transcripts.idx \
        -o ../results/ \
        ${num_boot} \
        --single \
        --pseudobam \
        --gtf ${gtf_file} \
        --genomebam \
        ${len_frag} \
        ${std_frag} \
        ${forward_reads} \
        -t ${num_thread}
    else
        echo "You are running in Paired Ended Mode!"
        # Quantification
        kallisto quant \
        -i ../scratch/transcripts.idx \
        -o ../results/ \
        -t ${num_thread} \
        --pseudobam \
        --gtf ${gtf_file} \
        --genomebam \
        ${num_boot} \
        ${len_frag} \
        ${std_frag} \
        ${forward_reads} \
        ${reverse_reads}
    fi
    echo "This tool requires one (.gtf) annotation and reference (.fasta, .fa) file.
fi