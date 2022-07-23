#!/bin/bash
par_1=$1
par_2=$2
par_3=$3
par_4=$4
par_5=$5
par_6=$6

reg_for_count_folders_and_files='^[0-9]+$'
reg_for_folder_name='^[A-Za-z]{1,7}+$'
len_of_folder_name=${#par_3}
reg_for_files_name='^[A-Za-z][{1,7}[.][a-z]{1,3}+$'
reg_for_file_size='^[0-9]+[k][b]$'
