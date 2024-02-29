#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage: compressed_cleanup.sh <path/to/text file of compressed files>"
	exit
fi

while read -r file; do
	chflags nocompressed "$file"
 	if [ $? -eq 0 ]; then
  		echo "Fixed $file"
    	else
     		echo "ERROR: couldn't fix $file"
       fi
done < "$1"
