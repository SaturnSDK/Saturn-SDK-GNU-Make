#!/bin/bash

if [ ! -d $DOWNLOADDIR ]; then
	mkdir -p $DOWNLOADDIR
fi

cd $DOWNLOADDIR

if test "`curl -v`"; then
	FETCH="curl -f -L -o -C -"
elif test "`wget -V`"; then
	FETCH="wget -c"
else
	echo "Could not find either curl or wget, please install either one to continue"
	exit 1
fi

$FETCH ftp://ftp.gnu.org/gnu/gnu-keyring.gpg
$FETCH ftp://ftp.gnu.org/gnu/make/make-4.0.tar.bz2
$FETCH ftp://ftp.gnu.org/gnu/make/make-4.0.tar.bz2.sig

gpg --verify --keyring ./gnu-keyring.gpg make-4.0.tar.bz2.sig

if [ $? -ne 0 ]; then
	echo "Failed to verify GPG signature for make"
	exit 1
fi
