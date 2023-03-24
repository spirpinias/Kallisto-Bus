#!/bin/bash 

reference_file=$(find -L ../data -name "*.fasta" -o -name "*.fa")
forward_reads=$(find -L ../data -name "*_R1.fastq.gz" -o -name "*_R1.fq.gz")
reverse_reads=$(find -L ../data -name "*_R2.fastq.gz" -o -name "*_R2.fq.gz")

# Construction of the Index
kallisto index -i ../scratch/transcripts.idx ${reference_file}


kallisto quant -i ../scratch/transcripts.idx -o ../results/testing_one -b 10 --single -l 199.757 -s 8.65 ${forward_reads}
#if [ "${type_seq}" == "SingleEnded" ];
#then
    # Quantification
    
#else
 #   # Quantification
  #  kallisto quant \
  #  -i ../scratch/transcripts.idx \
   # -o ../results/testing_one \
    #-t ${num_thread} \
   # ${num_boot} \
   # ${len_frag} \
    #${std_frag} \
    #${forward_reads} \
    #${reverse_reads}
#fi