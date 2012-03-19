#/bin/bash

SCRIPT_PATH="${BASH_SOURCE[0]}";
if ([ -h "${SCRIPT_PATH}" ]) then
  while([ -h "${SCRIPT_PATH}" ]) do SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
pushd . > /dev/null
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;
popd  > /dev/null


source $SCRIPT_PATH/CONF

#This script extracts an arc file, and runs fits recursively on the content. The reports are tarred in the output dir

#first argument is the arc file
ARCFILE=$1

#magic stuff to extract arcname from filepath
ARCNAME=$(echo $ARCFILE | rev | cut -d'/' -f1 | rev)

#The reports folder, named after the arc file
REPORTS=$ARCNAME

#does the arcname contain har, 0 or 1. TODO what is the meaning of this?
T=$(echo $ARCNAME |grep har | wc -l)

if [ $T -eq 1 ]; then #it does contain har
	#if the report archive does not exist
	if [ ! -f $OUTPUTDIR/$REPORTS.tgz ]; then
		#temp folder
		TEMPFOLDER=$(echo $ARCNAME-org)
		#kill the temp folder
		rm -rf $TEMPFOLDER
		#unpack the arc file to the temp folder
		./unpack_arc.sh $ARCFILE $TEMPFOLDER

		#kill the reports folder, if it exists
		rm -rf $REPORTS
		#make the folder for the reports
		mkdir $REPORTS
		#run fits, with a specified file on path
		#recursively, on the files in the temp folder, dumping reports in the report folder
		$FITS_HOME/fits.sh -r -i $TEMPFOLDER -o $REPORTS
		#tar the reports
		tar cvzf $OUTPUTDIR/$REPORTS.tgz $REPORTS/*
		#kill the temp folder
		rm -rf $TEMPFOLDER
	fi
fi
#kill the reports folder, as the reports have now been tarred
rm -rf $REPORTS
