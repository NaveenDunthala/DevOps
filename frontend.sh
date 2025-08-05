#!/bin/bash

LOGS_FOLDER="/var/log/Frontend"
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

dnf install nginx -y
VALIDATE $? "Installing ngnix " &>>$LOG_FILE


systemctl enable nginx
VALIDATE $? "Enabling ngnix" | tee -a $LOG_FILE

systemctl start nginx
VALIDATE $? "Enabling ngnix" | tee -a $LOG_FILE

rm -rf /usr/share/nginx/html/* &>>$LOG_FILE


curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip


cd /usr/share/nginx/html
unzip /tmp/frontend.zip &>>$LOG_FILE
VALIDATE $? "Extracting application code"



cp /home/ec2-user/devops-notes/DevOps/expense.conf /etc/nginx/default.d/expense.conf


systemctl restart nginx &>>$LOG_FILE
VALIDATE $? " restarting ngnix sevice" 