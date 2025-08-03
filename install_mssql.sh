#!/bin/bash

#dnf install mysql -y

#check the user has root access or not 

USERID=$(id -u )

if [ "$USERID" -eq 0 ];

then
    echo "user is root user"
else 
    echo "user is not a root user"
fi

#echo "user id is : $USERID"


#if root access , processd with the script

#other wise throgh the error

#check alredy installed or not , if installed tell the user

#it is alredy installed

#if not installed , install it 

#check it success or not?

