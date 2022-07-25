#!/bin/bash

function check_args() {
        if [[ $@ -ne 0 ]];
        then
            echo "Wrong parametrs"
            exit 1
        fi
}

function gen_ips() {
    ip_1=$(shuf -i 1-255 -n1)
    ip_2=$(shuf -i 1-255 -n1)
    ip_3=$(shuf -i 1-255 -n1)
    ip_4=$(shuf -i 1-255 -n1)
    echo -n "$ip_1.$ip_2.$ip_3.$ip_4"
    echo -n " - - "
}

function gen_methods() {
    array_methods=("GET" "POST" "PUT" "PATCH" "DELETE")
    methods=( $(shuf -e "${array_methods[@]}") )
    echo -n "\"$methods "

}

function gen_uri() {
        array_uri=("/status" "/support" "/home" "/my" "/blog")
        uri=( $(shuf -e "${array_uri[@]}")  )
        echo -n "$uri "
}

function gen_protocol() {
        array_protocol=("HTTP/1.1" "HTTP/1.0" "HTTP/2")
        protocol=( $(shuf -e "${array_protocol[@]}") )
        echo -n "$protocol\" "
}

function gen_codes() {

        array_codes=("200" "201" "400" "401" "403" "404" "500" "501" "502" "503")
        codes=( $(shuf -e "${array_codes[@]}") )
        echo -n "$codes "
        echo -n $RANDOM
        echo -n " \"-\" "
}
function generation_logs() {
    script_path=$(pwd)
    day_of_log=$(date +%d)
    for (( count_of_files=1; count_of_files < 6; count_of_files++ )); do
        count_of_lines=$(shuf -i 100-1000 -n1)
        for (( i=0; i < count_of_lines; i++  )); do
            gen_ips>>$script_path/log_$count_of_files.log
            # gen_time
            echo -n "[$day_of_log$(date +/%b/%Y:$(shuf -n1 -i 1-23):$(shuf -n1 -i 1-59):$(shuf -n1 -i 1-59)) +0000] ">>$script_path/log_$count_of_files.log
            gen_methods>>$script_path/log_$count_of_files.log
            gen_uri>>$script_path/log_$count_of_files.log
            gen_protocol>>$script_path/log_$count_of_files.log
            gen_codes>>$script_path/log_$count_of_files.log
            gen_agents>>$script_path/log_$count_of_files.log
        done
        let day_of_log--
    done


}
