#!/bin/bash
# Automated File Transfer Using Shell
# Author: Samuel Aboye
# Last Modified: 08/01/2023
# Script for automated Data Transfer

# Set the phone number and email address to send the notifications to
PHONE_NUMBER="+1234567890"
EMAIL_ADDRESS="user@example.com"

function send_notification() {
    message=$1

    # Send the SMS notification
    aws sns publish --phone-number $PHONE_NUMBER --message "$message"

    # Send the email notification
    echo "$message" | mail -s "File Transfer Notification" $EMAIL_ADDRESS
}

# Set the date format for the file names
date_format="%Y-%m-%d"

# Check if a date parameter was passed to the script
if [ $# -eq 1 ]
then
    # Use the passed date as the file name
    file_name="Antwak_Daily_$1.csv"
else
    # Use the current date as the file name
    file_name="Antwak_Daily_$(date +$date_format).csv"
fi

# Set the paths for the source and destination directories
source_dir="/path/to/source"
destination_dir="/path/to/destination"

# Set the path for the log file
log_file="/path/to/log/transfer.log"

# Check if the source file exists
if [ -f "$source_dir/$file_name" ]
then
    # Copy the file from the source to the destination
    cp "$source_dir/$file_name" "$destination_dir"

    # Check if the file copy was successful
    if [ $? -eq 0 ]
    then
        # Log the success message
        echo "$(date +'%F %T') : $file_name copied to $destination_dir" >> $log_file

        # Send a success notification
        send_notification "File transfer successful: $file_name"
    else
        # Log the failure message
        echo "$(date +'%F %T') : Error while copying file from source to destination" >> $log_file

        # Send a failure notification
        send_notification "Error: File transfer failed for $file_name"
    fi
else
    # Log the file not found message
    echo "$(date +'%F %T') : File not found: $file_name" >> $log_file

    # Send a notification if the file was not found
    send_notification "Error: File not found: $file_name"
fi
