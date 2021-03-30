#!/bin/sh
case "`uname -s`" in
	FreeBSD)
		MAKE=gmake
		;;
	*)
		MAKE=make
esac

if [ -f Makefile ] ; then
	$MAKE clean distclean
fi
rm -f aclocal.m4 config.h* configure m4/libtool.m4 m4/lt*.m4
rm -rf autom4te.cache config 
find libximc xigen wrappers \( -name Makefile.in -or -name Makefile \) -delete
rm -f Makefile.in Makefile
rm -rf wrappers/java/gen
find . \( -name .DS_Store -or -name \*.swp -or -name tags -or -name '._*' -or -name \*.stamp -or -name \*.pyc \) -delete
for exam in testapp_C testappeasy_C testjava ; do
	(cd examples/$exam ; $MAKE clean ; rm -rf DerivedData build *.xcodeproj/*.pbxuser *.xcodeproj/xcuserdata *.xcodeproj/project.xcworkspace )
done
