#! /usr/bin/env nix-shell
#! nix-shell -i /bin/bash -p openssl zlib ncurses gawk file gcc49 getopt git gnumake path perl pkgconfig python27 subversion unzip which bash expat pyxml perlPackages.XMLSAX glibc boost intltool libftdi libgcrypt bc binutils wget
cd ${WORKSPACE}

function BuildCommunity {
   if ${CleanBuild} ;
      then
      make clean
   fi
   make update
   BuildTarget   
}
              
function BuildTarget{

if ${ar71xxgeneric} ;
   then
      make GLUON_TARGET=ar71xx-generic V=s -j4
fi
if ${ar71xxnand} ;
   then
      make GLUON_TARGET=ar71xx-nand V=s -j4
fi
if ${brcm2708bcm2708} ;
   then
      make GLUON_TARGET=brcm2708-bcm2708 V=s -j4
fi
if ${brcm2708bcm2709} ;
   then
      make GLUON_TARGET=brcm2708-bcm2709 V=s -j4
fi
if ${mpc85xxgeneric} ;
   then
      make GLUON_TARGET=mpc85xx-generic V=s -j4
fi
if ${x86generic} ;
   then
      make GLUON_TARGET=x86-generic V=s -j4
fi
if ${x86kvmguest} ;
   then
      make GLUON_TARGET=x86-kvm_guest V=s -j4
fi
if ${x86xendomu} ;
   then
      make GLUON_TARGET=x86-xen_domu V=s -j4
fi

}
if ${Westerwald} ;
   then
      cp ./ffwwsites/westerwald ./site -r
      BuildCommunity
fi
if ${Altenkirchen} ;
   then
      cp ./ffwwsites/altenkirchen ./site -r
      BuildCommunity
fi
if ${Limburg} ;
   then
      cp ./ffwwsites/limburg ./site -r
      BuildCommunity
fi
if ${Neuwied} ;
   then
      cp ./ffwwsites/neuwied ./site -r
      BuildCommunity
fi
if ${Testnetz} ;
   then
      cp ./ffwwsites/testnetz ./site -r
      BuildCommunity
fi
