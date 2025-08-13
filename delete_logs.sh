#!/bin/bash
Source_Dir=/var/log/Frontend

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $Source_Dir ]
then 
    echo -e "$Source_Dir $G exists $N"
else
    echo " $Source_Dir $R does not exist $N "
fi

Files=$(find $Source_Dir -name "*.log" -mtime -14)
echo -e "files: $Files"
 