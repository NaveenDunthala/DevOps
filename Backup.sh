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