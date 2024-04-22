#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>

#define PI (3.1415926536)

typedef double (*PSINE_FUNC)(double x);

int main(int argc, char *argv[]) {
  void *pHandle;
  pHandle = dlopen("libsin.dylib", RTLD_LAZY);
  if (NULL == pHandle) {
    fprintf(stderr, "%s\n", dlerror());
    return -1;
  }
  PSINE_FUNC pSineFunc = (PSINE_FUNC)dlsym(pHandle, "sin");
  if (NULL == pSineFunc) {
    fprintf(stderr, "%s\n", dlerror());
    dlclose(pHandle);
    pHandle = NULL;
    return -1;
  }
  printf("sin(PI/2) = %f\n", pSineFunc(PI / 2));
  dlclose(pHandle);
  pHandle = NULL;

  return 0;
}
