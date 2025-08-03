#!/bin/bash

VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo " MySql Not Installed , Please Check "
    else 
        echo " MYSQL Installed suessfully"
    fi
}

#check the user has root access or not 

USERID=$(id -u )

if [ "$USERID" -eq 0 ];

then
    echo "user is root user, we are prosiding to install" #if root access , processd with the script
else 
    echo "user is not a root user, please try with root user"
    
fi

dnf list installed  mysql 

if [ $? -ne 0 ];  #check alredy installed or not , if installed tell the user
then
    echo " mysql pakage not installed in this system, we are processding to install "
    dnf install mysql -y
    if [ $? -eq 0 ];
    then
        echo " mysql package installed successfully"
    else 
        echo " Mysql package installation failed , please try after sometime "
    
    fi

else 
    echo " git Package alredy installed "  #it is alredy installed
    
fi

VALIDATE $?