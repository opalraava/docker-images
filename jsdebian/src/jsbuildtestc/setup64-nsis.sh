mingwdir=/usr/x86_64-w64-mingw32/sys-root/mingw

rm -rf work
mkdir work

# create 'bin' folder..
cd work
mkdir bin
cd bin
cp $mingwdir/bin/jsbuildtestc.exe .
perl ../../zipwin.pl 64 jsbuildtestc.exe
unzip -o jsbuildtestc-win64.zip
rm jsbuildtestc-win64.zip
cd ../..


# create 'lib' folder...
cd work
cp -r $mingwdir/lib .
cd lib
rm -f *.a
cd ../..

# create 'etc' and 'share'...
cd work
cp -r $mingwdir/etc .
cp -r $mingwdir/share .
cd ..

# call instfiles.pl and delfiles.pl
find work | perl instfiles.pl > instfiles.nsh
find work | perl delfiles.pl > delfiles.nsh

makensis setup64.nsi
rm -rf work
