#!/bin/bash
Source_Dir=/var/log/Frontend

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u )


CHECK_ROOT(){
    if [ "$USERID" -eq 0 ];
    then
        echo -e "${G} user is root user, we are prosiding to install $N" 
    else 
        echo -e "${R} user is not a root user, please try with root user $N" 
        exit 1
    fi  
}   

CHECK_ROOT

if [ -d $Source_Dir ]
then 
    echo -e "$Source_Dir $G exists $N"
else
    echo " $Source_Dir $R does not exist $N "
fi

Files=$(find $Source_Dir -name "*.log" -mtime -14)
echo -e "files: $Files"

while IFS= read -r line
do
    echo -e " $G Deleteing line:$N $line"
    rm -rf $line
done <<< $Files