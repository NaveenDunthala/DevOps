#!/bin/bash



#check the user has root access or not 

USERID=$(id -u )

if [ "$USERID" -eq 0 ];

then
    echo "user is root user, we are prosiding to install" #if root access , processd with the script
else 
    echo "user is not a root user, please try with root user"
    exit 1
fi

dnf list installed  mysql 

if [ $? -ne 0 ];  #check alredy installed or not , if installed tell the user
then
    echo " pakage not installed in this system, we are processding to install "
    dnf install mysql -y
else 
    echo " Package alredy installed "  #it is alredy installed
    exit 1
fi
#if not installed , install it 






#other wise throgh the error





#if not installed , install it 

#check it success or not?

