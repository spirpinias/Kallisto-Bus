#!/bin/bash 

source ./config.sh

if [ $reference_count -eq 1 ] && [ $gtf_count -eq 1 ];
then

    # Construction of the Index    
    kallisto index -i ../scratch/transcripts.idx ${reference_file} ${kmer_size}

    if [ "${type_seq}" == "SingleEnded" ];
    then
        flag_single="--single"
        echo "Running in Single End Mode!"
    else
        flag_single=""
        echo "Running in Paired End Mode!"
    fi

        # Quantification
        kallisto quant \
        -i ../scratch/transcripts.idx \
        -o ../results/ \
        ${num_boot} \
        --pseudobam \
        --gtf ${gtf_file} \
        --genomebam \
        ${len_frag} \
        ${std_frag} \
        ${forward_reads} \
        -t ${num_thread}
else
    echo "This tool requires one (.gtf) annotation and reference (.fasta, .fa) file."
fi