OpenBSD Shell Port
==================

There are a number of ports of the OpenBSD ksh shell to Linux, but these are
all taken from older OpenBSD versions and don't seem to be actively maintained.
So, I thought I would add another port to the mix :)

This port is a bit different, however, in that it just exports the current HEAD
version of ksh from an OpenBSD cvs server, applies some patches and builds the
result.  Hopefully this will make it a bit easier to maintain.
