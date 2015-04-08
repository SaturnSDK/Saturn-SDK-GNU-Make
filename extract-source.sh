#!/bin/bash

echo "Extracting source files..."

if [ ! -d $SRCDIR ]; then
	mkdir -p $SRCDIR
fi

cd $SRCDIR

if [ ! -d make-${MAKE_VER} ]; then
	tar xvjpf $DOWNLOADDIR/make-${MAKE_VER}.tar.bz2
	if [ $? -ne 0 ]; then
		rm -rf $DOWNLOADDIR/make-${MAKE_VER}
		exit 1
	fi
fi

echo "Done"

