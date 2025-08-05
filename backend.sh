#!/bin/bash

LOGS_FOLDER="/var/log/Backend"
SCRIPT_NAME=$(echo "$0" | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
mkdir -p $LOGS_FOLDER

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u )

USAGE() {
    echo -e "${R} USAGE$N:: sudo sh ($SCRIPT_NAME) pakage1 pakage2 pakage3 " | tee -a $LOG_FILE
}

CHECK_ROOT(){
    if [ "$USERID" -eq 0 ];
    then
        echo -e "${G} user is root user, we are prosiding to install $N" | tee -a $LOG_FILE#if root access , processd with the script
    else 
        echo -e "${R} user is not a root user, please try with root user $N" | tee -a  $LOG_FILE
        exit 1
    fi  
}   
VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo -e "$2 is...${R} Failed $N" | tee -a $LOG_FILE
    else 
        echo -e "$2 is... ${G} Sucess $N" | tee -a $LOG_FILE
    fi
}

echo " script started excuting at: $(date) " | tee -a $LOG_FILE
CHECK_ROOT

dnf module disable nodejs -y
VALIDATE $? "disabling Nodejs privious version" | tee -a $LOG_FILE

dnf module enable nodejs:20 -y
VALIDATE $? "enabling Nodejs privious version" | tee -a $LOG_FILE

dnf install nodejs -y
VALIDATE $? "Installing Nodejs Server" | tee -a $LOG_FILE

id expense &>>$LOG_FILE
if [ $? -ne 0 ];
then 
    echo -e " expense user not exist, ${G} Creating $N " &>>$LOG_FILE

    useradd expense &>>$LOG_FILE

    VALIDATE $? " Creating expanse user " | tee -a $LOG_FILE
else
   echo -e " expense user alredy exits..$Y  " | tee -a $LOG_FILE
fi