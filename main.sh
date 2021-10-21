#!/bin/bash
# Script for automated Data Transfer

TODAYSDATE=$(date +"%Y%m%d")
#Check if any parameters passed to the script for adhoc execution

if [[ $# -eq 0 ]]; then
    FILENAME='ANTWAK_'$TODAYSDATE'.csv'
else
    FILENAME='ANTWAK_'$1'.csv'
fi

# Set Path variables for the code
HOMEPATH=/Users/samuel/Desktop/Antwak
SOURCE=/Users/samuel/Desktop/Antwak/source
DESTINATION=/Users/samuel/Desktop/Antwak/destination
LOGFILENAME=$HOMEPATH/transfer.log

echo "*********************************************************" 2>&1 | tee -a $LOGFILENAME
echo "$(date +'%F %T') : $TODAYSDATE" 2>&1 | tee -a $LOGFILENAME
echo "$(date +'%F %T') : $FILENAME" 2>&1 | tee -a $LOGFILENAME
echo "*********************************************************" 2>&1 | tee -a $LOGFILENAME

# Check if files are available
fileInputCheck=$(ls $SOURCE/$FILENAME | wc -l)

if [[ $fileInputCheck -gt 0 ]]; 
then
    echo "**********************************************************"2>&1 | tee -a $LOGFILENAME
    echo "$(date +'%F %T') : File is available for copy" 2>&1 | tee -a $LOGFILENAME
    echo "**********************************************************" 2>&1 | tee -a $LOGFILENAME
else
    echo "**********************************************************" 2>&1 | tee -a $LOGFILENAME
    echo "$(date +'%F %T') : File not found"                          2>&1 | tee -a $LOGFILENAME
    echo "Error : Send Email Notification"                            2>&1 | tee -a $LOGFILENAME
    echo "**********************************************************" 2>&1 | tee -a $LOGFILENAME
    exit
fi

# Check if the files were processed for the day

fileArchiveCheck=$(ls $DESTINATION/$FILENAME | wc -l)
        echo "**********************************************************" 2>&1 | tee -a $LOGFILENAME
if [[ $fileArchiveCheck -gt 0 ]]
then
        echo "**********************************************************"    2>&1 | tee -a $LOGFILENAME
        echo "$(date +'%F %T') : Files already processed for today. Exiting" 2>&1 | tee -a $LOGFILENAME
        echo "Send Email Notification" 2>&1 | tee -a $LOGFILENAME
        echo "**********************************************************"    2>&1 | tee -a $LOGFILENAME
        exit
fi


# Copy file fron source to destination
cp $SOURCE/$FILENAME $DESTINATION/$FILENAME
if [ $? -eq 0 ]
then
        echo "$(date +'%F %T') : $FILENAME copied to $DESTINATION" 2>&1 | tee -a $LOGFILENAME
        echo "Success : Send Email Notification" 2>&1 | tee -a $LOGFILENAME

else
        echo "Error while copying file from source to destination" 2>&1 | tee -a $LOGFILENAME
        echo "Error : Send Email Notification" 2>&1 | tee -a $LOGFILENAME

fi
