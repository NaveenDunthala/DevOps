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
        echo -e "$2 is...${R} Failed "
    else 
        echo -e "$2 is... ${G} Sucess"
    fi
}
CHECK_ROOT

for Package in $@
do 
    dnf list installed $Package
    if [ $? -ne 0 ];  #check alredy installed or not , if installed tell the user
    then
        echo -e "${Y} $Package not installed in this system, we are processding to install "
        dnf install $Package -y
        VALIDATE $? "installing $Package"
    else
        echo -e "${Y} $Package is already installed...nothing to do"
    fi
done
