#!/bin/bash

VALIDATE(){
    echo "exit status: $1 "
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
# #if not installed , install it 
# //


# //
# dnf list installed git

# if [ $? -ne 0 ];  #check alredy installed or not , if installed tell the user
# then
#     echo " git pakage not installed in this system, we are processding to install "
#     dnf install git -y
#     if [ $? -eq 0 ];
#     then
#         echo " git package installed successfully"
#     else 
#         echo " git package installation failed , please try after sometime "
    
#     fi

# else 
#     echo " git Package alredy installed "  #it is alredy installed
    
# fi






#other wise throgh the error





#if not installed , install it 

#check it success or not?

