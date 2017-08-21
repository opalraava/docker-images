AC_INIT([jsbuildbasicc], [0.1.0], [opalraava@riseup.net], [], [https://github.com/opalraava/jsbuildbasicc/])
AC_CONFIG_SRCDIR(src/jsbuildbasicc.c)
AC_PREREQ(2.59)
AM_INIT_AUTOMAKE
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_HEADERS(config.h)

AC_PROG_CC



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

AC_CONFIG_FILES(Makefile src/Makefile)
AC_OUTPUT
