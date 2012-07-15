Arch Package Configuration
==========================

This directory contains the PKGBUILD file, needed to create a package that can
be installed using Arch's pacman(8) package installer.

To build the package, simply run the makepkg(8) script:

    $ makepkg

Note that the current version of makepkg(8) expects du(1) to be located in
/usr/bin instead of /bin, which breaks building process.  This can be fixed by
linking /usr/bin/du to /bin/du.
