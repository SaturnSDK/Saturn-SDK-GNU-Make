#!/bin/bash
set -e

[ -d $BUILDDIR/make ] && rm -rf $BUILDDIR/make

mkdir -p $BUILDDIR/make
cd $BUILDDIR/make

$SRCDIR/make-${MAKE_VER}/configure \
	--build=$BUILDMACH --target=$TARGETMACH --host=$HOSTMACH \
	--prefix=$INSTALLDIR --program-prefix=${PROGRAM_PREFIX}

make -j${NCPU}
make install -j${NCPU}
