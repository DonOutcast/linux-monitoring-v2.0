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

























pattern_var=$(echo "$1" | sed -E ':a;s/((.).*)\2/\1/;ta') 
file_name=$( echo "$pattern_var" | awk -F. '{print$1}' )
ext_name=$( echo "$pattern_var" | awk -F. '{print$2}' )
len_of_file_name=${#file_name}
len_of_ext=${#ext_name}
first_symbol=${file_name:0:1}
log_date="$(date +"%d%m%y")"

if [[ $len_of_file_name -lt 4 ]]; then
        counter=$len_of_file_name
       while [[ $counter -lt 4  ]]; do
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

tmp=$file_name
tmp1=$file_name
tmp3=${file_name:0:1}$first_symbol${file_name:1}
tmp4=${file_name:0:1}$first_symbol$first_symbol${file_name:1}
tmp5=${file_name:0:1}$first_symbol$first_symbol$first_symbol${file_name:1}
tmp6=${file_name:0:1}$first_symbol$first_symbol$first_symbol$first_symbol${file_name:1}
tmp7=${file_name:0:1}$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol${file_name:1}
tmp8=${file_name:0:1}$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol${file_name:1}
tmp9=${file_name:0:1}$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol${file_name:1}

 for(( i=1, j=0; j < $2; i++,j++ )) do
        if [[ $total_memmory -lt 1048576 ]]; then
                echo "ERROR NO HAVE SPACE"
                echo "ERROR NO HAVE SPACE [$(date +"%d-%m-%y") $(date +"%H:%M:%S")]">>$script_path/log.txt
                exit 1
         else
    #  final_file_name=("$tmp"."$ext_name")
    #  final_file_name_2=("$tmp1"."$ext_name")
     # $(fallocate -l $par_6 $Absolute_path/$folder_name/$final_file_name)
    
    if (( $i <= 240 ));
    then
       # $(fallocate -l $par_6 $Absolute_path/$folders_name/$tmp."$ext_name"_$log_dat)
       echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp."$ext_name"_$log_date $6">>log.txt
       tmp+="${file_name: -1}"
    elif (( $i > 240 && $i <= 480)); 
    then 
     # $(fallocate -l $par_6 $Absolute_path/$folders_name/$tmp1."$ext_name"_$log_dat)
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp1."$ext_name"_$log_date $6">>log.txt
       tmp1=${tmp1:0:1}$first_symbol${tmp1:1}
    elif (( $i > 480 && $i <= 640 )); then 
        # $(fallocate -l $par_6 $Absolute_path/$folders_name/$tmp3."$ext_name"_$log_dat)
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp3."$ext_name"_$log_date $6">>log.txt
        tmp3+="${file_name: -1}"
    elif (( $i > 640 && $i <= 880 )); then
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp4."$ext_name"_$log_date $6">>log.txt
        # $(fallocate -l $par_6 $Absolute_path/$folders_name/$tmp4."$ext_name"_$log_dat)
        tmp4+="${file_name: -1}"
    elif (( $i > 880 && $i <= 1120)); then
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp5."$ext_name"_$log_date $6">>log.txt
        # $(fallocate -l $par_6 $Absolute_path/$folders_name/$tmp5."$ext_name"_$log_dat)
        tmp5+="${file_name: -1}"
    elif (( $i > 1120 && $i <= 1360 )); then
        # $(fallocate -l $par_6 $Absolute_path/$folders_name/$tmp6."$ext_name"_$log_dat)
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp6."$ext_name"_$log_date $6">>log.txt
        tmp6+="${file_name: -1}"       
    elif (( $i > 1360 && $i <= 1600 )); then
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp7."$ext_name"_$log_date $6">>log.txt
        # $(fallocate -l $par_6 $Absolute_path/$folders_name/$tmp7."$ext_name"_$log_dat)
        tmp7+="${file_name: -1}"
    elif (( $i > 1600 && $i <= 1840)); then
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp8."$ext_name"_$log_date $6">>log.txt
        # $(fallocate -l $par_6 $Absolute_path/$folders_name/$tmp8."$ext_name"_$log_dat)
        tmp8+="${file_name: -1}"
    elif (( $i > 1840 && $i <= 2080)); then
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp9."$ext_name"_$log_date $6">>log.txt
        # $(fallocate -l $par_6 $Absolute_path/$folders_name/$tmp9."$ext_name"_$log_dat)
        tmp9+="${file_name: -1}"
    fi
fi
done
