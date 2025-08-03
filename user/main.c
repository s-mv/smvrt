#include "smvrt.h"

int count = 0;

void producer() {
  if (count < 2) {
    smvrt_print("producing...\n");
    for (volatile int i = 0; i < 100000; i++)
      ;
    count++;
  }
}

void consumer() {
  if (count > 0) {
    smvrt_print("consuming...\n");
    for (volatile int i = 0; i < 100000000; i++)
      ;
    count--;
  }
}

void main() {
  smvrt_scheduler_add(producer);
  smvrt_scheduler_add(consumer);
  smvrt_scheduler_run();
}
