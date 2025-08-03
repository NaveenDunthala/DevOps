#!/bin/bash

echo "All Variables passed to the script: $@"
echo " Number of variables passed: $#"
echo "script name: $0"
echo "current working directiry: $PWD"
echo "How directory of current user: $HOME "
echo "PID of the script EXCUTING Now: $$"
sleep 100 &

echo " last processing Background PID is : $!"

date