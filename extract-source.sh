#!/bin/bash

echo "Extracting source files..."

if [ ! -d $SRCDIR ]; then
	mkdir -p $SRCDIR
fi

cd $SRCDIR

if [ ! -d make-4.0 ]; then
	tar xvjpf $DOWNLOADDIR/make-4.0.tar.bz2
	if [ $? -ne 0 ]; then
		rm -rf $DOWNLOADDIR/make-4.0
		exit 1
	fi
fi

echo "Done"

