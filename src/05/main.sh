#!/bin/bash
source ./my_lib.sh

check_count_of_args $@
check_arg $1
start_sort $par_1
