bin_PROGRAMS = jsbuildbasicc
jsbuildbasicc_SOURCES = jsbuildbasicc.h jsbuildbasicc.c  
jsbuildbasicc_CPPFLAGS = 
jsbuildbasicc_LDFLAGS = 
jsbuildbasicc_LDADD = 

if PLATFORM_WINDOWS
  jsbuildbasicc_SOURCES += winprog.rc
  # NOTE: remove the jsbuildbasicc_LDFLAGS to make a console app
  jsbuildbasicc_LDFLAGS += -mwindows
endif

.rc.o:
	$(RC) -i $< $@

setup64-zip : ${bin_PROGRAMS}
	perl ../zipwin.pl 64 ${bin_PROGRAMS}

EXTRA_DIST = winprog.ico winprog.rc
