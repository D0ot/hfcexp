#!/bin/bash

BPRED_OUTPUT_KEYS=("elapsed_time" "misses")
for ((i = 0; i < ${#BPRED_OUTPUT_KEYS[*]}; i++)); do 
  echo "==== ${BPRED_OUTPUT_KEYS[$i]} ===="
  grep --with-filename ${BPRED_OUTPUT_KEYS[$i]} ./pred_output/*
done

