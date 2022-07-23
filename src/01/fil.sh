#!/bin/bash
Absolute_path=$(pwd)
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

tmp=$file_name

 for(( l=1, k=0; k < $par_2; l++,k++ )) do
        if [[ $total_memmory -lt 1048576 ]]; then
                echo "ERROR NO HAVE SPACE"
                echo "ERROR NO HAVE SPACE [$(date +"%d-%m-%y") $(date +"%H:%M:%S")]">>$script_path/log.txt
                exit 1
         else
    
                 if (( $l <= 240 ));
    then
       fallocate -l $par_6 $Absolute_path/$tmp."$ext_name"_"$log_date"
       echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp."$ext_name"_$log_date $par_6">>log.txt
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