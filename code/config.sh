#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
else
  echo "args:"
  for i in $*; do 
    echo $i 
  done
  echo ""
fi

reference_file=$(find -L ../data -name "*.fasta" -o -name "*.fa")
#forward_reads=$(find -L ../data -name "*_R1_*" | tr '\n' ',' | sed 's/,*$//g')
#reverse_reads=$(find -L ../data -name "*_R2_*" | tr '\n' ',' | sed 's/,*$//g')

total_reads=$(find -L ../data -name "*_R1_*" -o -name "*_R2_*")

gtf_file=$(find -L ../data -name "*.gtf")

reference_count=$(echo $reference_file | wc -w) 
forward_count=$(echo $forward_reads | wc -w)
reverse_count=$(echo $reverse_reads | wc -w)
gtf_count=$(echo $gtf_file | wc -w)

# Kallisto

if [ -z "${1}" ]; then
  num_thread=$(get_cpu_count.py)
else
  num_thread="${1}"
fi

if [ -z "${2}" ]; then
  kmer_size=""
else
  kmer_size="-k ${2}"
fi