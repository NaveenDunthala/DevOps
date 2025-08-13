#!/bin/bash

Source_Dir=$1
DEST_DIR=$2
DAYS=${3:-14} #if $3 is empty ,then it will take 14days
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


USAGE(){
    echo -e " $R USAGE::$N sh Backup.sh <souce> <destination> <days(optional)>"
}
#check the souce and destination provided or not 

if [ $# -lt 2 ]
then 
    USAGE
fi

if [ ! -d $Source_Dir ]
then
    echo " $Source_Dir does not exist... please check  "

fi 

if [ ! -d $DEST_DIR ]
then
    echo " $DEST_DIR does not exist... please check  "

fi 

FILES=$(find ${Source_Dir} -name "*.log" -mtime +14)

echo "Files:$FILES"

if [ ! -z $FILES ]
then
    echo " Files are found"
else 
    echo "No Files older than $DAys "
fi