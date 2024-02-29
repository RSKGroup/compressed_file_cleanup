#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage: compressed_cleanup.sh <path/to/text file of compressed files>"
	exit
fi

while read -r file; do
	cp "${file}" "${file}_"
	result=$?
	if [ $result -eq 0 ]; then
		rm "$file"
		mv "${file}_" "$file"
		echo "Fixed $file"
	else 
		echo "ERROR: Copying $file failed"
	fi

done < "$1"
