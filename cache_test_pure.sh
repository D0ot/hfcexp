#!/bin/bash
SIM_SCALAR=/home/doot/programs/simplescalar/simplesim-3.0 
SIM_CACHE=${SIM_SCALAR}/sim-cache
SIM_CACHE_COMMON_CONFIG="-cache:il1 il1:128:64:2:l -cache:dl1 dl1:128:64:2:l -cache:il2 dl2"
SIM_CACHE_CONFIGS=(
  "-cache:dl2 ul2:1024:64:8:l"

  "-cache:dl2 ul2:2048:64:8:l"
  "-cache:dl2 ul2:4096:64:8:l"
  "-cache:dl2 ul2:8192:64:8:l"
  "-cache:dl2 ul2:65536:64:8:l"

  "-cache:dl2 ul2:4096:64:2:l"
  "-cache:dl2 ul2:2048:64:4:l"
  "-cache:dl2 ul2:1024:64:8:l"
  "-cache:dl2 ul2:512:64:16:l"
  "-cache:dl2 ul2:128:64:64:l"

  "-cache:dl2 ul2:512:128:8:l"
  "-cache:dl2 ul2:256:256:8:l"
  "-cache:dl2 ul2:128:512:8:l"
  "-cache:dl2 ul2:16:4096:8:l"

  "-cache:dl2 ul2:1024:64:8:l -cache:vc vc:1:64:4:l"
);

SIM_CACHE_CONFIG_NAMES=(
  "_base"

  "_cap_t2"
  "_cap_t4"
  "_cap_t8"
  "_cap_t64"

  "_2way"
  "_4way"
  "_8way"
  "_16way"
  "_64way"

  "_blk2"
  "_blk4"
  "_blk8"
  "_blk64"

  "_vic"
)

OUTPUT_DIR=cache_output

mkdir -p ./${OUTPUT_DIR}

for ((i = 0; i < ${#SIM_CACHE_CONFIGS[*]}; i++))
do
  full_command="${SIM_CACHE} ${SIM_CACHE_COMMON_CONFIG} ${SIM_CACHE_CONFIGS[$i]} ./176.gcc/gcc00.peak.ev6 ./176.gcc/data/test/input/cccp.i -o ${OUTPUT_DIR}/gcc_out${SIM_CACHE_CONFIG_NAMES[$i]}.s"
  echo "${full_command} > ./${OUTPUT_DIR}/gcc${SIM_CACHE_CONFIG_NAMES[$i]}.out &>./${OUTPUT_DIR}/gcc${SIM_CACHE_CONFIG_NAMES[$i]}.err"
done

for ((i = 0; i < ${#SIM_CACHE_CONFIGS[*]}; i++))
do
  full_command="${SIM_CACHE} ${SIM_CACHE_COMMON_CONFIG} ${SIM_CACHE_CONFIGS[$i]} ./186.crafty/crafty00.peak.ev6"
  echo "${full_command} <./186.crafty/data/test/input/crafty.in > ./${OUTPUT_DIR}/crafty${SIM_CACHE_CONFIG_NAMES[$i]}.out &>./${OUTPUT_DIR}/crafty${SIM_CACHE_CONFIG_NAMES[$i]}.err"
done

for ((i = 0; i < ${#SIM_CACHE_CONFIGS[*]}; i++))
do
  full_command="${SIM_CACHE} ${SIM_CACHE_COMMON_CONFIG} ${SIM_CACHE_CONFIGS[$i]} ./256.bzip2/bzip200.peak.ev6 ./256.bzip2/data/test/input/input.random 2"
  echo "${full_command} > ./${OUTPUT_DIR}/bzip2${SIM_CACHE_CONFIG_NAMES[$i]}.out &>./${OUTPUT_DIR}/bzip2${SIM_CACHE_CONFIG_NAMES[$i]}.err"
done

for ((i = 0; i < ${#SIM_CACHE_CONFIGS[*]}; i++))
do
  full_command="${SIM_CACHE} ${SIM_CACHE_COMMON_CONFIG} ${SIM_CACHE_CONFIGS[$i]} ./181.mcf/mcf00.peak.ev6 ./181.mcf/data/test/input/inp.in"
  echo "${full_command} > ./${OUTPUT_DIR}/mcf${SIM_CACHE_CONFIG_NAMES[$i]}.out &>./${OUTPUT_DIR}/mcf${SIM_CACHE_CONFIG_NAMES[$i]}.err"
done
