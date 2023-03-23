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


# Kallisto

if [ -z "${1}" ]; then
  num_thread=$(get_cpu_count.py)
else
  num_thread="${1}"
fi

if [ -z "${1}" ]; then
  type_seq="SingleEnded"
else
  type_seq="${1}"
fi

if [ -z "${2}" ]; then
  len_frag=""
else
  len_frag="-l ${2}"
fi

if [ -z "${3}" ]; then
  std_frag=""
else
  std_frag="-s ${3}"
fi

if [ -z "${4}" ]; then
  num_boot=""
else
  num_boot="-b ${4}"
fi
