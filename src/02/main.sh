#!/bin/bash
source ./my_lib.sh
source ./variables.sh
begin=$(date +%s)
time_b=$(date +%H:%M)



check_count_of_args $@
check_arg_1 $par_1
check_arg_2 $par_2
check_arg_3 $par_3
start_gen $par_1 $par_2 $par_3
end=$(date +%s)
total=$(($end - $begin))
time_e=$(date +%H:%M)
echo "Start time: $time_b"
echo "End time: $time_e "
echo "Time work of script: $total sec "

echo "Start time: $time_b">>$script_path/log.txt
echo "End time: $time_e ">>$script_path/log.txt
echo "Time work of script: $total sec ">>$script_path/log.txt


