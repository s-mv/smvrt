#ifndef smv_smvrt_smvrt_h
#define smv_smvrt_smvrt_h

typedef void (*smvrt_task)();

void smvrt_scheduler_add(smvrt_task task);
void smvrt_scheduler_run();

// helper, possibly temporary
void smvrt_print(const char *s);

#endif

