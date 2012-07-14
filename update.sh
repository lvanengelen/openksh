#!/bin/sh

rm -rf ksh
cvs -d anoncvs@anoncvs.openbsd.org:/cvs export -r HEAD -d ksh src/bin/ksh
