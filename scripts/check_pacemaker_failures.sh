#!/bin/bash
#Script for check failures in pacemaker resources
#return 0 if there is no error
retorno=$(pcs resource failcount show)
if echo $retorno | grep -i "No failcounts" > /dev/null; then
	echo 0
	exit 0
fi
pcs resource failcount show | grep -o ": [0-9]*" | cut -f 2 -d ":" | grep -o "[0-9]*" | sort -n -r | head -1
exit 0
