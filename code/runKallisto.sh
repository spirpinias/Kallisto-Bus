#!/bin/bash 

source ./config.sh

if [ $reference_count -eq 1 ];
then

    # Construction of the Index    
    echo "Constructing the Index!"
    kallisto index -i ../scratch/transcripts.idx ${reference_file} ${kmer_size}

    # Quantification
    echo "Beginning the Quantification!"

    kallisto bus \
    -i ../scratch/transcripts.idx \
    -o ../results/ \
    -B ${total_reads} \
    -t ${num_thread}
else
    echo "This tool requires one (.gtf) annotation and reference (.fasta, .fa) file."
fi
##-x "10xv3" \