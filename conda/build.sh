make -f Makefile.gnu
make -f Makefile.gnu install PREFIX=${PREFIX}

make -f Makefile.fip
make -f Makefile.fip install PREFIX=${PREFIX}

