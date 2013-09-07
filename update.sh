#!/bin/sh

rm -rf ksh
CVS_RSH=ssh cvs -d anoncvs@anoncvs.openbsd.org:/cvs export -r HEAD -d ksh src/bin/ksh
