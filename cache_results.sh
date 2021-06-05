#!/bin/bash

CACHE_OUTPUT_KEYS=("elapsed_time" "ul2.misses" "ul2.miss_rate")
for ((i = 0; i < ${#CACHE_OUTPUT_KEYS[*]}; i++)); do 
  echo "==== ${CACHE_OUTPUT_KEYS[$i]} ===="
  grep --with-filename ${CACHE_OUTPUT_KEYS[$i]} ./cache_output/*
done

