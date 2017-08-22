bin_PROGRAMS = jsbuildtestc
jsbuildtestc_SOURCES = jsbuildtestc.h jsbuildtestc.c resources.c jsbuildtestcapp.h jsbuildtestcapp.c jsbuildtestcappwin.h jsbuildtestcappwin.c jsbuildtestcappprefs.h jsbuildtestcappprefs.c
jsbuildtestc_CPPFLAGS = ${LIBXML2_CFLAGS} ${LIBXSLT_CFLAGS} ${LIBSOUP_CFLAGS} ${WEBKITGTK3_CFLAGS} ${GTK_CFLAGS} ${SQLITE3_CFLAGS} ${GCRYPT_CFLAGS} ${OPENSSL_INCLUDES} 
jsbuildtestc_LDFLAGS = ${OPENSSL_LDFLAGS} 
jsbuildtestc_LDADD = ${LIBXML2_LIBS} ${LIBXSLT_LIBS} ${LIBSOUP_LIBS} ${WEBKITGTK3_LIBS} ${GTK_LIBS} ${SQLITE3_LDFLAGS} ${GCRYPT_LIBS} ${OPENSSL_LIBS} 

BUILT_SOURCES=resources.c
gsettings_SCHEMAS = jsbuildtestc.gschema.xml
CLEANFILES = gschemas.compiled

resources.c : jsbuildtestc.gresource.xml window.ui app-menu.ui prefs.ui
	glib-compile-resources jsbuildtestc.gresource.xml --target=resources.c --generate-source

@GSETTINGS_RULES@


if PLATFORM_WINDOWS
  jsbuildtestc_SOURCES += winprog.rc
  # NOTE: remove the jsbuildtestc_LDFLAGS to make a console app
  jsbuildtestc_LDFLAGS += -mwindows
endif

.rc.o:
	$(RC) -i $< $@

setup64-zip : ${bin_PROGRAMS}
	perl ../zipwin.pl 64 ${bin_PROGRAMS}

EXTRA_DIST = winprog.ico winprog.rc
