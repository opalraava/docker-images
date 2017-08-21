AC_INIT([jsbuildtestc], [0.1.0], [opalraava@riseup.net], [], [https://github.com/opalraava/jsbuildtestc/])
AC_CONFIG_SRCDIR(src/jsbuildtestc.c)
AC_PREREQ(2.59)
AM_INIT_AUTOMAKE
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_HEADERS(config.h)

AC_PROG_CC

# check for -lm
a=0
AC_CHECK_HEADERS(math.h, [], [a=1])
AC_SEARCH_LIBS(sqrt, m, [], [a=1])
if test $a != 0; then
  AC_MSG_ERROR([-lm dependency not found, this should not happen.])
fi
AX_LIB_SQLITE3
AX_LIB_GCRYPT([yes])
AX_CHECK_OPENSSL
# check for libpng...
a=0
AC_CHECK_HEADERS(png.h, [], [a=1])
AC_SEARCH_LIBS(png_create_info_struct, png, [], [a=1])
if test $a != 0; then
  AC_MSG_ERROR([libpng dependency not found.])
fi
# check for libtiff...
a=0
AC_CHECK_HEADERS(tiffio.h, [], [a=1])
AC_SEARCH_LIBS(TIFFOpen, tiff, [], [a=1])
if test $a != 0; then
  AC_MSG_ERROR([libtiff dependency not found.])
fi
# check for libjpeg...
a=0
AC_CHECK_HEADERS(jpeglib.h, [], [a=1])
AC_SEARCH_LIBS(jpeg_set_defaults, jpeg, [], [a=1])
if test $a != 0; then
  AC_MSG_ERROR([libjpeg dependency not found.])
fi
# check for giflib...
a=0
AC_CHECK_HEADERS(gif_lib.h, [], [a=1])
AC_SEARCH_LIBS(DGifOpenFileName, gif, [], [a=1])
if test $a != 0; then
  AC_MSG_ERROR([giflib dependency not found.])
fi
PKG_CHECK_MODULES([GTK], [gtk+-3.0 >= 3.14.5])
# final stable release of 3.x ==> PKG_CHECK_MODULES([GTK], [gtk+-3.0 >= 3.22])
GLIB_GSETTINGS
PKG_CHECK_MODULES([LIBSOUP], [libsoup-2.4 >= 2.4])
PKG_CHECK_MODULES([LIBXML2], [libxml-2.0 >= 2.9])
PKG_CHECK_MODULES([LIBXSLT], [libxslt >= 1.1])
PKG_CHECK_MODULES([WEBKITGTK3], [webkitgtk-3.0 >= 2.4])


# check for windows
AC_CANONICAL_HOST
AC_MSG_CHECKING([for some Win32 platform])
case "$host" in
  *mingw*|*cygwin*)
    platform_win32=yes
    # set RC to the right windres name
    if test -z $host_alias; then
      RC=windres
    else
      RC=$host_alias-windres
    fi
    AC_SUBST(RC)
    ;;
  *)
    platform_win32=no
    ;;
esac
AC_MSG_RESULT([$platform_win32])
AM_CONDITIONAL(PLATFORM_WINDOWS, test "$platform_win32" = "yes")

AC_CONFIG_FILES(Makefile setup64.nsi src/Makefile)
AC_OUTPUT
