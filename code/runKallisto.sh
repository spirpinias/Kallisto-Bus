#!/bin/bash 

source ./config.sh

if [ $reference_count -eq 1 ];
then

    # Construction of the Index    
    echo "Constructing the Index!"
    kallisto index -i ../scratch/transcripts.idx ${reference_file} ${kmer_size}

    if [ $total_reads_count -gt 0 ] && if [ $(($total_reads_count % 2)) -eq "0" ];
    then

        # Quantification
        echo "Beginning the Creation of the BUS File!"

        kallisto bus \
        -i ../scratch/transcripts.idx \
        -o ../results/ \
        ${chem_type} \
        -t ${num_thread} \
        ${total_reads} 

        mv ../results/output.bus ../results/${output_prefix}.bus
    else
        echo "No Sequencing Files Found! (.Fastq.gz)!"
    fi
    
else
    echo "This tool requires one reference sequence (.fasta, .fa) file."
fi