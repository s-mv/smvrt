volatile char *UART0DR = (char *)0x101f1000;

void print(const char *s) {
  while (*s) {
    *UART0DR = *s++;
  }
}

void main() {
  print("hello, smvrt!\n");
  while (1)
    ;
}

