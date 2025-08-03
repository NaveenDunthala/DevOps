#!/bin/bash



#check the user has root access or not 

USERID=$(id -u )

if [ "$USERID" -eq 0 ];

then
    echo "user is root user, we are prosiding to install"
else 
    echo "user is not a root user, please try with root user"
    exit 1
fi

dnf install mysql -y

#echo "user id is : $USERID"


#if root access , processd with the script

#other wise throgh the error

#check alredy installed or not , if installed tell the user

#it is alredy installed

#if not installed , install it 

#check it success or not?

