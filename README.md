# H F C EXP is  HFUT Fast CA E

> some scripts for hfut ca experiments.

## Dependencies :

> parallel

## Config :
1. place all the scripts in CINT2000 directory
2. set correct Simple-Scalar installing path in `pred_test_pure.sh` and `cache_test_pure.sh`

## Usage :

```
# make sure your current working directory is CINT2000

# run gcc bzip crafty mcf with four different branch predictor, you can add more predictor in pred_test_pure.sh
./pred_test.sh 

# run gcc bzip craft mcf with some cache configs, see cache_test_pure.sh
./cache_test.sh

# run a single program which is one of {gcc bzip craft mcf}
# for example, we only want to run gcc
./pred_test_pure.sh | grep gcc | parallel
 
# the same as cache simulation
./cache_test_pure.sh | grep gcc | parallel

# when the scripts exits, you can see the result in pred_output and cache_output
# for example you do the following steps to see some results

# go into the cache_output directory
cd ./cache_output

# elapsed time
grep --with-file 'elapsed' craft*err

# misses
grep --with-file 'misses' gcc*err

```
