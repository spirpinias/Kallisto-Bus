#!/bin/bash 

source ./config.sh

if [ $reference_count -eq 1 ] && [ $gtf_count -eq 1 ];
then

    # Construction of the Index    
    echo "Constructing the Index!"
    kallisto index -i ../scratch/transcripts.idx ${reference_file} ${kmer_size}

    if [ "${type_seq}" == "SingleEnded" ];
    then
        echo "Running in Single End Mode!"
        flag_single="--single"
        read_flags="${forward_reads}"
    else
        echo "Running in Paired End Mode!"
        flag_single=""
        read_flags="${forward_reads} ${reverse_reads}"
    fi
        # Quantification
        echo "Beginning the Quantification!"

        kallisto quant \
        -i ../scratch/transcripts.idx \
        -o ../results/ \
        ${num_boot} \
        --pseudobam \
        --gtf ${gtf_file} \
        ${flag_single} \
        --genomebam \
        ${len_frag} \
        ${std_frag} \
        ${read_flags} \
        -t ${num_thread}
else
    echo "This tool requires one (.gtf) annotation and reference (.fasta, .fa) file."
fi