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
reference_count=$(echo $reference_file | wc -w)
total_reads=$(find -L ../data -name "*_R1_*" -o -name "*_R2_*" -o -name "*_R1.fastq.gz" -o -name "*_R2.fastq.gz")
total_reads_count=$(echo $total_reads | wc -w)
 

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

if [ -z "${3}" ]; then
  output_prefix="finalResult"
else
  output_prefix="${3}"
fi

if [ -z "${4}" ]; then
  chem_type=""
else
  chem_type="-x ${4}"
fi