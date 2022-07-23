#!/bin/bash

script_path=$(pwd)
Absolute_path=$1
cd "$Absolute_path"
total_memmory=$(df -hk | awk 'NR==4{print $4}')
folders_name=$(echo "$3" | sed -E ':a;s/((.).*)\2/\1/;ta')
tmp_name=$folders_name
folders_first=${folders_name:0:1}
len_for_folders_name=${#folders_name}
last=${folders_name: -1}
date_create=$(date +"%d%m%y")
        if [[ ${#folders_name} -lt 4  ]]; then
            for (( i=${#folders_name};  i< 4; i++ )); do
                folders_name+="$(echo $last)"
            done
        fi

for (( i=1, j=0; j <$2; i++, j++ )) do
        total_memmory=$(df -hk | awk 'NR==4{print $4}')
        if [[ $total_memmory -lt 1048576 ]]; then
                echo "ERROR NO HAVE SPACE"
                echo "ERROR NO HAVE SPACE TO FOLDERS [$(date +"%d-%m-%y") $(date +"%H:%M:%S")]">>$script_path/log.txt
                exit 1
        else
    if [[ ${#folders_name} -gt 255  ]]; then
            echo "ARE YOU SHURE LEN OF FOLDERS GREAT THAN 255 SYMBOL [$(date +"%d-%m-%y") $(date +"%H:%M:%S")]">>$script_path/log.txt
            exit 1
    fi
        if (( $i <= 244 )); then
            mkdir $Absolute_path"$folders_name"_"$date_create"
            echo "DIR: [$(date +"%d-%m-%y") $(date +"%H:%M:%S")]  $Absolute_path"$folders_name"_"$date_create"">>$script_path/log.txt
            folders_name+="$(echo $last)"
        elif (( $i > 244 && $i <= 488 )); then
            if (( $i == 245)); then
                folders_name=$tmp_name
            fi
            mkdir $Absolute_path"$folders_name"_"$date_create"
            echo "DIR: [$(date +"%d-%m-%y") $(date +"%H:%M:%S")]  $Absolute_path"$folders_name"_"$date_create"">>$script_path/log.txt
            folders_name=${folders_name:0:1}${folders_name}
        elif (( $i > 488 && $i <= 732)); then
            if (( $i == 489)); then
                folders_name=${tmp_name:0:1}$folders_first${tmp_name:1}
            fi
            mkdir $Absolute_path"$folders_name"_"$date_create"
            echo "DIR: [$(date +"%d-%m-%y") $(date +"%H:%M:%S")]  $Absolute_path"$folders_name"_"$date_create"">>$script_path/log.txt
            folders_name+="$(echo $last)"
        elif (( $i > 732 && $i <= 976)); then
            if (( $i == 733)); then
                folders_name=${tmp_name:0:1}$folders_first$folders_first${tmp_name:1}
            fi
            mkdir $Absolute_path"$folders_name"_"$date_create"
            echo "DIR: [$(date +"%d-%m-%y") $(date +"%H:%M:%S")]  $Absolute_path"$folders_name"_"$date_create"">>$script_path/log.txt
            folders_name+="$(echo $last)"
        elif (( $i > 976 && $i <= 1220)); then
            if (( $i == 977)); then
                folders_name=${tmp_name:0:1}$folders_first$folders_first$folders_first${tmp_name:1}
            fi
            echo "DIR: [$(date +"%d-%m-%y") $(date +"%H:%M:%S")]  $Absolute_path"$folders_name"_"$date_create"">>$script_path/log.txt
            mkdir $Absolute_path"$folders_name"_"$date_create"
            folders_name+="$(echo $last)"
        fi
        fi
done

