#!/bin/bash

USERID=$(id -u )

CHECK_ROOT(){
    if [ "$USERID" -eq 0 ];
    then
        echo "user is root user, we are prosiding to install" #if root access , processd with the script
    else 
        echo "user is not a root user, please try with root user"
        exit 1
    fi  
}   
VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo " MySql Not Installed , Please Check "
    else 
        echo " MYSQL Installed suessfully"
    fi
}
CHECK_ROOT
dnf list installed  mysql 

if [ $? -ne 0 ];  #check alredy installed or not , if installed tell the user
then
    echo " mysql pakage not installed in this system, we are processding to install "
    dnf install mysql -y
    VALIDATE $?

else 
    echo " git Package alredy installed "  #it is alredy installed
    
fi
