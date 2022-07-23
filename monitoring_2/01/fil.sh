#!/bin/bash
Absolute_path=$(pwd)
pattern_var=$(echo "$par_5" | sed -E ':a;s/((.).*)\2/\1/;ta') 
file_name=$( echo "$pattern_var" | awk -F. '{print$1}' )
ext_name=$( echo "$pattern_var" | awk -F. '{print$2}' )
len_of_file_name=${#file_name}
len_of_ext=${#ext_name}
first_symbol=${file_name:0:1}
log_date="$(date +"%d%m%y")"
total_memmory=$(df -hk | awk 'NR==4{print $4}')
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

 for(( i=1, j=0; j < $par_2; i++,j++ )) do
        if [[ $total_memmory -lt 1048576 ]]; then
                echo "ERROR NO HAVE SPACE"
                echo "ERROR NO HAVE SPACE [$(date +"%d-%m-%y") $(date +"%H:%M:%S")]">>$script_path/log.txt
                exit 1
         else
    
                 if (( $i <= 240 ));
    then
       fallocate -l $par_6 $Absolute_path/$tmp."$ext_name"_"$log_date"
       echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp."$ext_name"_$log_date $par_6">>log.txt
       tmp+="${file_name: -1}"
    elif (( $i > 240 && $i <= 480)); 
    then
                if (( $len_of_file_name < 2  )); then
                echo "CREATED:FILE stoped becose is name so big">>log.txt
                exit
                fi

            if (( $i == 241 )); 
            then
                tmp=${file_name:0:1}$first_symbol${file_name:1} 
            fi
       fallocate -l $par_6 $Absolute_path/$tmp."$ext_name"_"$log_date"
      echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp."$ext_name"_$log_date $6">>log.txt
       tmp=${tmp:0:1}$first_symbol${tmp:1}
    elif (( $i > 480 && $i <= 640 )); 
    then
        if (( $i == 481 ));
        then
            tmp=${file_name:0:1}$first_symbol$first_symbol${file_name:1} 
        fi
        tmp+="${file_name: -1}"
       fallocate -l $par_6 $Absolute_path/$tmp."$ext_name"_"$log_date"
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp."$ext_name"_$log_date $6">>log.txt
        
    elif (( $i > 640 && $i <= 880 ));
    then
     if (( $i == 641 ));
        then
            tmp=${file_name:0:1}$first_symbol$first_symbol$first_symbol${file_name:1} 
        fi
        tmp+="${file_name: -1}"
       fallocate -l $par_6 $Absolute_path/$tmp."$ext_name"_"$log_date"
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp."$ext_name"_$log_date $6">>log.txt
    elif (( $i > 880 && $i <= 1120));
    then
         if (( $i == 881 ));
        then
            tmp=${file_name:0:1}$first_symbol$first_symbol$first_symbol$first_symbol${file_name:1} 
        fi
        tmp+="${file_name: -1}"
       fallocate -l $par_6 $Absolute_path/$tmp."$ext_name"_"$log_date"
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp."$ext_name"_$log_date $6">>log.txt
    elif (( $i > 1120 && $i <= 1360 ));
    then
        if (( $i == 1121 ));
        then
            tmp=${file_name:0:1}$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol${file_name:1} 
        fi
        tmp+="${file_name: -1}"
       fallocate -l $par_6 $Absolute_path/$tmp."$ext_name"_"$log_date"
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp."$ext_name"_$log_date $6">>log.txt   
    elif (( $i > 1360 && $i <= 1600 ));
    then
        if (( $i == 1361 ));
        then
            tmp=${file_name:0:1}$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol${file_name:1} 
        fi
        tmp+="${file_name: -1}"
       fallocate -l $par_6 $Absolute_path/$tmp."$ext_name"_"$log_date"
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp."$ext_name"_$log_date $6">>log.txt
    elif (( $i > 1600 && $i <= 1840));
    then
    if (( $i == 1601 ));
        then
            tmp=${file_name:0:1}$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol${file_name:1} 
        fi
        tmp+="${file_name: -1}"
       fallocate -l $par_6 $Absolute_path/$tmp."$ext_name"_"$log_date"
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp."$ext_name"_$log_date $6">>log.txt
    elif (( $i > 1840 && $i <= 2080));
    then
        if (( $i == 1841 ));
        then
            tmp=${file_name:0:1}$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol$first_symbol${file_name:1} 
        fi
        tmp+="${file_name: -1}"
       fallocate -l $par_6 $Absolute_path/$tmp."$ext_name"_"$log_date"
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $tmp."$ext_name"_$log_date $6">>log.txt
    fi
fi
done
