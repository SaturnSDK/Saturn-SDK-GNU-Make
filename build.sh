#!/bin/bash

if [ -z $NCPU ]; then
	export NCPU=`nproc`
fi

[ -d $INSTALLDIR ] && rm -rf $INSTALLDIR

./download.sh

if [ $? -ne 0 ]; then
	echo "Failed to download the source for GNU make"
	exit 1
fi

./extract-source.sh

if [ $? -ne 0 ]; then
	echo "Failed to extract the sources for GNU make"
	exit 1
fi

./build-make.sh

if [ $? -ne 0 ]; then
	echo "Failed to build GNU make"
	exit 1
fi
