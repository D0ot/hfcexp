#!/bin/bash
echo "cache_test.sh"
echo "use $(nproc) cores to simulate"
echo "start time : $(date) "
echo "running, please wait..."
bash ./cache_test_pure.sh | parallel
echo "end time : $(date)"
echo "done. exit"
