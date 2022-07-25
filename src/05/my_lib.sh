#!/bin/bash

reg_for_args='^[1-4]+$'

function start_sort() {
       case $par_1 in
            1) sort_codes ;;
            2) sort_ips ;;
            3) sort_error_codes;;
            4) sort_error_ips  ;;
       esac

}

function check_arg() {
    if [[  $1 =~ $reg_for_args ]]; then
            par_1=$1
    else
            echo "ERROR for folders name"
           exit 1
    fi
}
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
