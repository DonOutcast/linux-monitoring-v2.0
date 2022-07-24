#!/bin/bash
source ./my_lib.sh
source ./variables.sh

check_count_of_args $@
check_arg_1 $par_1
check_arg_2 $par_2
check_arg_3 $par_3
start_gen $par_1 $par_2 $par_3
