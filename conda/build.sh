LANG="C" sed -i.bak 's:-o root -g root::' Makefile*

make -f Makefile.gnu
make -f Makefile.gnu install PREFIX=${PREFIX} DESTDIR="${PREFIX}" INCDIR="${PREFIX}/include" INSTALLDIR="${PREFIX}/lib"

make -f Makefile.fip
make -f Makefile.fip install PREFIX=${PREFIX} DESTDIR="${PREFIX}" INCDIR="${PREFIX}/include" INSTALLDIR="${PREFIX}/lib"

