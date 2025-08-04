#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"

USERID=$(id -u )

CHECK_ROOT(){
    if [ "$USERID" -eq 0 ];
    then
        echo -e "${G} user is root user, we are prosiding to install" #if root access , processd with the script
    else 
        echo -e "${R} user is not a root user, please try with root user"
        exit 1
    fi  
}   
VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo -e "${R} MySql Not Installed , Please Check "
    else 
        echo -e "${G} MYSQL Installed suessfully"
    fi
}
CHECK_ROOT

for Package in $@
do 
    dnf list installed $package
    echo { $package alredy installed}
done
