#include "jsbuildtestc.h"

int
main(int argc, char* argv[])
{
  return g_application_run (G_APPLICATION (example_app_new ()), argc, argv);
  return 0;
}