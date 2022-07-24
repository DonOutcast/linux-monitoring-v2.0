#!/bin/bash

reg_for_args='^[1-3]+$'
name_of_files=$(grep DIR ../02/log.txt | awk '{ print $4}')
name_mask=${name_of_filse: -7}

function check_count_of_args() {
local i=0
for ARG
do
        let i++
done

if (( i > 1 || i < 1 )); then
    echo "Too few parameters in bash $i"
    exit 1
fi

}


function check_arg_1() {
    if [[  $1 =~ $reg_for_args ]]; then
            par_1=$1
    else
            echo "ERROR for folders name"
           exit 1
    fi
}

function del_log() {
        echo "$name_of_files" | xargs rm -rf
}

function del_date_time {
    echo "input should be like: $(date '+%Y-%m-%d %H:%M:%S')"

    read -p "enter the beginning of the search range for files to delete, date and time: " START_TIME
    read -p "enter the end of the file search range to delete, date: " END_TIME

    echo "deleting files created from "$START_TIME" to "$END_TIME"..."
    find / -newermt "$START_TIME" -not -newermt "$END_TIME" 2>/dev/null | sudo xargs rm -r 2>/dev/null
}

function del_name() {

    echo "deleting files and directorys with mask = $name_mask..."
    find / -type f -name "*$name_of_files*" 2>/dev/null | sudo xargs rm -r 2>/dev/null
    find / -type d -name "*$name_of_files*" 2>/dev/null | sudo xargs rm -r 2>/dev/null
}

function start_clear() {
       case $par_1 in
            1) del_log ;;
            2) del_date_time ;;
            3) del_name;;
       esac

}



