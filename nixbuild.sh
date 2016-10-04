#! /usr/bin/env nix-shell
#! nix-shell -i /bin/bash -p openssl zlib ncurses gawk file gcc49 getopt git gnumake path perl pkgconfig python27 subversion unzip which bash expat pyxml perlPackages.XMLSAX glibc boost intltool libftdi libgcrypt bc binutils wget
cp ./ffwwsites/testnetz ./site -r
cd ${WORKSPACE}
make update
make GLUON_TARGET=ar71xx-generic V=s -j4

