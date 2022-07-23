#!/bin/bash
source ./variables.sh

function check_count_of_args() {
local i=0
for ARG
do
        let i++
done
if (( i != 3  )); then
        echo "Too few parameters in bash need 6"
        exit 1
fi
}
function check_arg_1() {
        if  [[  -d $1 ]]; then
             Absolute_path=$1   
        else
                echo "Is a not Absolute path"        
                exit 1
        fi
        

}

function check_arg_2() {
        if [[ $2 =~ $reg_for_count_folders_and_files  ]]; then
                par_1=$2
        else
                echo "ERROR for count of folders"
                exit 1
        fi
}

function check_arg_3() {
        if [[ $3 =~ $reg_for_folder_name  ]]; then
                par_3=$3
        else
               echo  "ERROR for folder name $1 "
               exit 1
        fi

}

function check_arg_4() {
        if [[ $4 =~ $reg_for_coun_folders_and_diles  ]]; then
                par_4=$4
        else
                echo "ERROR for count of files"
                exit 1
        fi
        }

function check_arg_5() {
        if [[ $5 =~ $reg_for_files_name   ]]; then
                par_5=$5
        else
                echo "ERRRO for name of files"
                exit 1
        fi

}

function check_arg_6() {
        if [[ $6 =~ reg_for_file_size  ]]; then
                par_6=$6
                numbers_size=${#par_6}
        if (( $numbers_size < 0 || $numbers_size > 101 )); then
                echo "ERROR for size"
                exit 1
        fi
        else
                echo "ERROR for file size"
                exit 1
        fi

}


