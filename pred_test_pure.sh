#!/bin/bash
SIM_SCALAR=/home/doot/programs/simplescalar/simplesim-3.0 
SIM_BPRED=${SIM_SCALAR}/sim-bpred
SIM_BPRED_CONFIGS=("-bpred:bimod 2048" "-bpred:2lev 1 1024 8 0" "-bpred taken" "-bpred nottaken")
SIM_BPRED_CONFIG_NAMES=(
  "_bimod"
  "_2lev"
  "_taken"
  "_nottaken"
)
OUTPUT_DIR=pred_output

mkdir -p ./${OUTPUT_DIR}

for ((i = 0; i < ${#SIM_BPRED_CONFIGS[*]}; i++))
do
  full_command="${SIM_BPRED} ${SIM_BPRED_CONFIGS[$i]} ./176.gcc/gcc00.peak.ev6 ./176.gcc/data/test/input/cccp.i -o ${OUTPUT_DIR}/gcc_out${SIM_BPRED_CONFIG_NAMES[$i]}.s"
  echo "${full_command} > ./${OUTPUT_DIR}/gcc${SIM_BPRED_CONFIG_NAMES[$i]}.out &>./${OUTPUT_DIR}/gcc${SIM_BPRED_CONFIG_NAMES[$i]}.err"
done

for ((i = 0; i < ${#SIM_BPRED_CONFIGS[*]}; i++))
do
  full_command="${SIM_BPRED} ${SIM_BPRED_CONFIGS[$i]} ./186.crafty/crafty00.peak.ev6"
  echo "${full_command} <./186.crafty/data/test/input/crafty.in > ./${OUTPUT_DIR}/crafty${SIM_BPRED_CONFIG_NAMES[$i]}.out &>./${OUTPUT_DIR}/crafty${SIM_BPRED_CONFIG_NAMES[$i]}.err"
done

for ((i = 0; i < ${#SIM_BPRED_CONFIGS[*]}; i++))
do
  full_command="${SIM_BPRED} ${SIM_BPRED_CONFIGS[$i]} ./256.bzip2/bzip200.peak.ev6 ./256.bzip2/data/test/input/input.random 2"
  echo "${full_command} > ./${OUTPUT_DIR}/bzip2${SIM_BPRED_CONFIG_NAMES[$i]}.out &>./${OUTPUT_DIR}/bzip2${SIM_BPRED_CONFIG_NAMES[$i]}.err"
done

for ((i = 0; i < ${#SIM_BPRED_CONFIGS[*]}; i++))
do
  full_command="${SIM_BPRED} ${SIM_BPRED_CONFIGS[$i]} ./181.mcf/mcf00.peak.ev6 ./181.mcf/data/test/input/inp.in"
  echo "${full_command} > ./${OUTPUT_DIR}/mcf${SIM_BPRED_CONFIG_NAMES[$i]}.out &>./${OUTPUT_DIR}/mcf${SIM_BPRED_CONFIG_NAMES[$i]}.err"
done
