#!/bin/bash
SCRIPT_PATH=$(dirname $(readlink -f $BASH_SOURCE[0]))


source $SCRIPT_PATH/CONF
FILES_DIR=$SCRIPT_PATH/files
mkdir $FILES_DIR > /dev/null

#This script reads a file, containing a list of ARC file paths, and invoke the fits_arc.sh script on each

mkdir $SCRIPT_PATH/temp 2> /dev/null

#cat the first param
#read it one line at a time
cat $1 | while read I; do \
	#Cut the directory part out of the filename.
	ARCNAME=$(echo $I | rev | cut -d'/' -f1 | rev)
	#if the report archive does not exist in the outputdir
	if [ ! -f $OUTPUTDIR/$ARCNAME.tgz ]; then
		#copy from whereever to "here" TODO
		scp $I $FILES_DIR/
		#fits the ARC file
		$SCRIPT_PATH/fits_arc.sh $FILES_DIR/$(basename $I)
	fi
done
