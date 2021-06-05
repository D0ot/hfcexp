#!/bin/bash
echo "pred_test.sh"
echo "use $(nproc) cores to simulate"
echo "start time : $(date) "
echo "running, please wait..."
bash ./pred_test_pure.sh | parallel
echo "end time : $(date)"
echo "done. exit"
