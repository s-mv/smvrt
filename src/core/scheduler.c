#include "smvrt.h"

#define smvrt_max_tasks 2

static smvrt_task tasks[smvrt_max_tasks];
static int task_count = 0;
static int current_task = 0;

void smvrt_scheduler_add(smvrt_task task) {
  if (task_count < smvrt_max_tasks) {
    tasks[task_count++] = task;
  }
}

void smvrt_scheduler_run() {
  while (1) {
    if (task_count == 0)
      continue;
    tasks[current_task]();
    current_task = current_task + 1;
    if (current_task >= task_count)
      current_task = 0;
  }
}
