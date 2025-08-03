#include "smvrt.h"

volatile char *UART0DR = (char *)0x101f1000;

void smvrt_print(const char *s) {
  while (*s) {
    *UART0DR = *s++;
  }
}

