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
forward_reads=$(find -L ../data -name "*_R1.fastq.gz" -o -name "*_R1.fq.gz")
reverse_reads=$(find -L ../data -name "*_R2.fastq.gz" -o -name "*_R2.fq.gz")
gtf_file=$(find -L ../data -name "*.gtf")

reference_count=$(echo $reference_file | wc -w) 
forward_count=$(echo $forward_reads | wc -w)
reverse_count=$(echo $reverse_reads | wc -w)

# Kallisto

if [ -z "${1}" ]; then
  num_thread=$(get_cpu_count.py)
else
  num_thread="${1}"
fi

if [ -z "${2}" ]; then
  type_seq="SingleEnded"
else
  type_seq="${2}"
fi

if [ -z "${3}" ]; then
  len_frag=""
else
  len_frag="-l ${3}"
fi

if [ -z "${4}" ]; then
  std_frag=""
else
  std_frag="-s ${4}"
fi

if [ -z "${5}" ]; then
  num_boot=""
else
  num_boot="-b ${5}"
fi
