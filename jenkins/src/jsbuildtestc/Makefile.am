AUTOMAKE_OPTIONS = foreign
ACLOCAL_AMFLAGS = -I m4


setup64-nsis :
	make all
	sudo make install
	sh setup64-nsis.sh
	sudo make uninstall
	sudo make clean

SUBDIRS = src
EXTRA_DIST = delfiles.pl instfiles.pl setup64-nsis.sh
