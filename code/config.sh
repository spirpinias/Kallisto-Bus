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

if [ -z "${2}" ]; then
  type_seq="SingleEnded"
else
  type_seq="${2}"
fi

if [ -z "${3}" ]; then
  len_frag="75"
else
  len_frag="${3}"
fi

if [ -z "${4}" ]; then
  std_frag="8.5"
else
  std_frag="${4}"
fi

if [ -z "${5}" ]; then
  num_boot="10"
else
  num_boot="${5}"
fi
