#! /usr/bin/env nix-shell
#! nix-shell -i /bin/bash -p openssl zlib ncurses gawk file gcc49 getopt git gnumake path perl pkgconfig python27 subversion unzip which bash expat pyxml perlPackages.XMLSAX glibc boost intltool libftdi libgcrypt bc binutils wget
cd ${WORKSPACE}
if [${env.Westerwald}] then
   cp ./ffwwsites/westerwald ./site -r
   make update
   make GLUON_TARGET=ar71xx-generic V=s -j4
fi
if [${env.Altenkirchen}] then
   cp ./ffwwsites/altenkirchen ./site -r
   make update
   make GLUON_TARGET=ar71xx-generic V=s -j4
fi
if [${env.Limburg}] then
   cp ./ffwwsites/limburg ./site -r
   make update
   make GLUON_TARGET=ar71xx-generic V=s -j4
fi
if [${env.Neuwied}] then
   cp ./ffwwsites/neuwied ./site -r
   make update
   make GLUON_TARGET=ar71xx-generic V=s -j4
fi
if [${env.Testnetz}] then
   cp ./ffwwsites/testnetz ./site -r
   make update
   make GLUON_TARGET=ar71xx-generic V=s -j4
fi
