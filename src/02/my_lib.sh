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
        if [[ ! $par_1 =~ $reg_for_folder_name  || (( $len_of_folder_name > 7  )) ]]; then
               echo  "ERROR for folder name $par_1 "
               exit 1
        fi

}

function check_arg_2() {
        if [[ ! $par_2 =~ $reg_for_files_name  ]]; then
                echo "ERRRO for name of files $par_2"
                exit 1
        fi

}

function check_arg_3() {
        numbers_size=${par_3%Mb}
        if [[ ! $par_3 =~ $reg_for_file_size ]]  || [[ $numbers_size -le 0 ]] || 
                    [[ $numbers_size -gt  100  ]]; then
                echo "ERROR for size"
                exit 1
        fi        

}


function start_gen() {
script_path=$(pwd)

list=$(compgen -d / | grep -v 'bin\|sbin\|proc\|sys')
echo "$list">$script_path/paths.txt


folders_name=$(echo "$par_1" | sed -E ':a;s/((.).*)\2/\1/;ta')
tmp_name=$folders_name
folders_first=${folders_name:0:1}
len_for_folders_name=${#folders_name}
last=${folders_name: -1}
date_create=$(date +"%d%m%y")
        if [[ ${#folders_name} -lt 5  ]]; then
            for (( i=${#folders_name};  i< 5; i++ )); do
                folders_name+="$(echo $last)"
            done
        fi


pattern_var=$(echo "$par_2" | sed -E ':a;s/((.).*)\2/\1/;ta') 
file_name=$( echo "$pattern_var" | awk -F. '{print$1}' )
ext_name=$( echo "$pattern_var" | awk -F. '{print$2}' )
len_of_file_name=${#file_name}
len_of_ext=${#ext_name}
first_symbol=${file_name:0:1}
log_date="$(date +"%d%m%y")"
if [[ $len_of_file_name -lt 5 ]]; then
        counter=$len_of_file_name
       while [[ $counter -lt 5  ]]; do
            file_name+="${file_name: -1}"
        let counter++
   done
 fi

if [[ $len_of_ext -lt 3 ]]; then
      count=$len_of_ext
       while [[ $count -lt 3 ]]; do
           ext_name+="${ext_name: -1}"
           let count++
       done
 fi

count_of_folders=$(shuf -i 0-100 -n1)

for ((  j=0; j < $count_of_folders; j++ )) do
        total_memmory=$(df / -BM | awk '{print $4}' | tail -n 1 | cut -d 'M' -f1)
        if [[ $total_memmory -lt 1024 ]]; then
                echo "ERROR NO HAVE SPACE"
                echo "ERROR NO HAVE SPACE TO FOLDERS [$(date +"%d-%m-%y") $(date +"%H:%M:%S")]">>$script_path/log.txt
                exit 1
        else
    if [[ ${#folders_name} -gt 255  ]]; then
            echo "ARE YOU SHURE LEN OF FOLDERS GREAT THAN 255 SYMBOL [$(date +"%d-%m-%y") $(date +"%H:%M:%S")]">>$script_path/log.txt
            exit 1
    fi
    random_path=$(shuf -n 1 $script_path/paths.txt)
            folders_name+="$(echo $last)"
            mkdir "$random_path"/"$folders_name"_"$date_create"
     echo "DIR: [$(date +"%d-%m-%y") $(date +"%H:%M:%S")]  $random_path/"$folders_name"_"$date_create"">>$script_path/log.txt
            cd "$random_path"/"$folders_name"_"$date_create"
          
count_of_files=$(shuf -i 0-100 -n1)
tmp=$file_name
 for((  k=0; k < $count_of_files; k++ )) do
        if [[ $total_memmory -lt 1024 ]]; then
                echo "ERROR NO HAVE SPACE"
                echo "ERROR NO HAVE SPACE [$(date +"%d-%m-%y") $(date +"%H:%M:%S")]">>$script_path/log.txt
                exit 1
         else
    
       fallocate -l $par_3 $Absolute_path/$folders_name"_"$date_create/$tmp."$ext_name"_"$log_date"
       echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $random_path/$folders_name"_"$date_create/$tmp."$ext_name"_$log_date $par_3">>$script_path/log.txt
       tmp+="${file_name: -1}"
fi
done
        fi
        cd ..
done
}
