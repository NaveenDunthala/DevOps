#!/bin/bash

Source_Dir=$1
DEST_DIR=$2
DAYS=${3:-14} #if $3 is empty ,then it will take 14days
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
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
    ZIP_FILE="$DEST_DIR/app_logs-$TIME_STAMP.zip"
    find ${Source_Dir} -name "*.log" -mtime +14 | zip "$ZIP_FILE" -@

    #check if ZIP file is successfully created or not 
    if [ -f $ZIP_FILE ]
    then
        echo " successfullly zipped files older than $DAYS"

        while IFS=read -r file
        do
            echo "Deleting file : $file"
            rm -rf $file
        done <<< $FILES
    else 
        echo " zipping the files is failed"
    fi 
else 
    echo "No Files older than $DAys "
fi