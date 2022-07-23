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


function start_gen() {
script_path=$(pwd)
Absolute_path=$par_1
cd "$Absolute_path"
total_memmory=$(df -hk | awk 'NR==4{print $4}')
folders_name=$(echo "$par_3" | sed -E ':a;s/((.).*)\2/\1/;ta')
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


pattern_var=$(echo "$par_5" | sed -E ':a;s/((.).*)\2/\1/;ta') 
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

for (( i=1, j=0; j <$par_2; i++, j++ )) do
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
            folders_name+="$(echo $last)"
            mkdir "$Absolute_path"/"$folders_name"_"$date_create"
            echo "DIR: [$(date +"%d-%m-%y") $(date +"%H:%M:%S")]  $Absolute_path"$folders_name"_"$date_create"">>$script_path/log.txt
            cd "$Absolute_path"/"$folders_name"_"$date_create"
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
tmp=$file_name
 for(( l=1, k=0; k < $par_2; l++,k++ )) do
        if [[ $total_memmory -lt 1048576 ]]; then
                echo "ERROR NO HAVE SPACE"
                echo "ERROR NO HAVE SPACE [$(date +"%d-%m-%y") $(date +"%H:%M:%S")]">>$script_path/log.txt
                exit 1
         else
    
                 if (( $l <= 240 ));
    then
       fallocate -l $par_6 $Absolute_path/$folders_name"_"$date_create/$tmp."$ext_name"_"$log_date"
       echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $Absolute_path/$folders_name"_"$date_create/$tmp."$ext_name"_$log_date $par_6">>$script_path/log.txt
       tmp+="${file_name: -1}"
    elif (( $l > 240 && $l <= 480)); 
    then
                if (( $len_of_file_name < 2  )); then
                echo "CREATED:FILE stoped becose is name so big">>log.txt
                exit
                fi

            if (( $l == 241 )); 
            then
                tmp=${file_name:0:1}$first_symbol${file_name:1} 
            fi
       fallocate -l $par_6 $Absolute_path/$tmp."$ext_name"_"$log_date"
      echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp."$ext_name"_$log_date $6">>log.txt
       tmp=${tmp:0:1}$first_symbol${tmp:1}
    elif (( $l > 480 && $l <= 640 )); 
    then
        if (( $l == 481 ));
        then
            tmp=${file_name:0:1}$first_symbol$first_symbol${file_name:1} 
        fi
        tmp+="${file_name: -1}"
       fallocate -l $par_6 $Absolute_path/$tmp."$ext_name"_"$log_date"
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp."$ext_name"_$log_date $6">>log.txt
        
    elif (( $l > 640 && $l <= 880 ));
    then
     if (( $l == 641 ));
        then
            tmp=${file_name:0:1}$first_symbol$first_symbol$first_symbol${file_name:1} 
        fi
        tmp+="${file_name: -1}"
       fallocate -l $par_6 $Absolute_path/$tmp."$ext_name"_"$log_date"
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp."$ext_name"_$log_date $6">>log.txt
    elif (( $l > 880 && $l <= 1120));
    then
         if (( $l == 881 ));
        then
            tmp=${file_name:0:1}$first_symbol$first_symbol$first_symbol$first_symbol${file_name:1} 
        fi
        tmp+="${file_name: -1}"
       fallocate -l $par_6 $Absolute_path/$tmp."$ext_name"_"$log_date"
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp."$ext_name"_$log_date $6">>log.txt
    elif (( $l > 1120 && $l <= 1360 ));
    then
        if (( $l == 1121 ));
        then
            tmp=${file_name:0:1}$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol${file_name:1} 
        fi
        tmp+="${file_name: -1}"
       fallocate -l $par_6 $Absolute_path/$tmp."$ext_name"_"$log_date"
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp."$ext_name"_$log_date $6">>log.txt   
    elif (( $l > 1360 && $l <= 1600 ));
    then
        if (( $l == 1361 ));
        then
            tmp=${file_name:0:1}$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol${file_name:1} 
        fi
        tmp+="${file_name: -1}"
       fallocate -l $par_6 $Absolute_path/$tmp."$ext_name"_"$log_date"
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp."$ext_name"_$log_date $6">>log.txt
    elif (( $l > 1600 && $l <= 1840));
    then
    if (( $l == 1601 ));
        then
            tmp=${file_name:0:1}$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol${file_name:1} 
        fi
        tmp+="${file_name: -1}"
       fallocate -l $par_6 $Absolute_path/$tmp."$ext_name"_"$log_date"
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp."$ext_name"_$log_date $6">>log.txt
    elif (( $l > 1840 && $l <= 2080));
    then
        if (( $l == 1841 ));
        then
            tmp=${file_name:0:1}$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol${file_name:1} 
        fi
        tmp+="${file_name: -1}"
       fallocate -l $par_6 $Absolute_path/$tmp."$ext_name"_"$log_date"
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp."$ext_name"_$log_date $6">>log.txt
    fi
fi
done


        fi
done
}
