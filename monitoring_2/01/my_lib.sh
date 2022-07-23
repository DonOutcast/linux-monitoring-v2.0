#!/bin/bash
source ./variables.sh

function check_count_of_args() {
local i=0
for ARG
do
        let i++
done
if (( i != 6  )); then
        echo "Too few parameters in bash need 6"
        exit 1
fi
}
function check_arg_1() {
        if  [[  -d $par_1 ]]; then
             Absolute_path=$par_1   
        else
                echo "Is a not Absolute path"        
                exit 1
        fi
        

}

function check_arg_2() {
        if [[ ! $par_2 =~ $reg_for_count_folders_and_files  || (( $par_2 == 0 )) ]]; then
                echo "ERROR for count of folders  $par_2"
                exit 1
        fi
}

function check_arg_3() {
        if [[ ! $par_3 =~ $reg_for_folder_name  || (( $len_of_folder_name > 7  )) ]]; then
               echo  "ERROR for folder name $par_3 "
               exit 1
        fi

}

function check_arg_4() {
        if [[ ! $par_4 =~ $reg_for_count_folders_and_files  ]]; then
                echo "ERROR for count of files"
                exit 1
        fi
        }

function check_arg_5() {
        if [[ ! $par_5 =~ $reg_for_files_name  ]]; then
                echo "ERRRO for name of files"
                exit 1
        fi

}

function check_arg_6() {
        numbers_size=${par_6%kb}
        if [[ ! $par_6 =~ $reg_for_file_size ]]  || [[ $numbers_size -le 0 ]] || 
                    [[ $numbers_size -gt  100  ]]; then
                echo "ERROR for size"
                exit 1
        fi        

}


