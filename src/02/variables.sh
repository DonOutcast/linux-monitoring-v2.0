#!/bin/bash
par_1=$1
par_2=$2
par_3=$3
word=$3

reg_for_folder_name='^[A-Za-z]+$'
len_of_folder_name=${#word}
reg_for_files_name='^[A-Za-z]{1,7}.[a-z]{1,3}$'
len_of_file_name=$(echo $par_5 | awk -F. '{print $1}')
len_of_file_ext=$(echo $par_5 | awk -F. '{print $2}')
reg_for_file_size='^[0-9]+[M][b]$'
