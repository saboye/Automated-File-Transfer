#!/bin/bash
# Automated File Transfer Using Shell 
# Author: Samuel Aboye
# Last Modified: 08/02/2021

# Create a source and destination folder 
# setting default variable values
SOURCE=source
DESTINATION=Destination


function file_automation(){
	# handling function
	if ! grep -Eq 'antwak$' <<< $PWD; then
    	echo "The script must be run from the source directory."
    	exit 1
	else
    	echo "The daily file automation transfer starting ...."
    	wait 
	fi
    # create source and destination folder 
		if [[ ! -e $SOURCE ]]; then
    		mkdir -p $SOURCE 
    		mkdir -p $DESTINATION
		fi
	# copying the file souce to destination 
	if [[ -e SOURCE ]]; then
        touch source/Antwak_Daily-$(date +%Y-%m-%d).csv
	else
    	echo "There is no source folder."
    	exit 1
 	fi 
    # copying the file souce to destination 
	if [[ -e SOURCE ]]; then
    	cp -r SOURCE/Antwak_Daily*.csv  DESTINATION
 	else
    	echo "There is no source  folder folder."
    	exit 1
	fi
}

file_automation