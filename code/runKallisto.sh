#!/bin/bash 

source ./config.sh

if [ $reference_count -eq 1 ];
then

    # Construction of the Index    
    echo "Constructing the Index!"
    kallisto index -i ../scratch/transcripts.idx ${reference_file} ${kmer_size}

    if [ $total_reads_count -gt 0 ];
    then

        # Quantification
        echo "Beginning the Creation of the BUS File!"

        kallisto bus \
        -i ../scratch/transcripts.idx \
        -o ../results/testing \
        -x 10xv3 \
        -t ${num_thread} \
        ${total_reads} 
    else
        echo "No .Fastq.gz files were Found!"
    fi
    
else
    echo "This tool requires one (.gtf) annotation and reference (.fasta, .fa) file."
fi