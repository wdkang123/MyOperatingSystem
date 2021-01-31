#include "mem_util.h"

void memman_init(struct MEMMAN *man) {
    man->frees = 0;
    man->maxfrees = 0;
    man->lostsize = 0;
    man->losts = 0;
}

unsigned int memman_total(struct MEMMAN *man) {
    unsigned int i, t = 0;
    for (i = 0; i < man->frees; i++) {
        t += man->free[i].size;
    }

    return t;
}

unsigned int memman_alloc(struct MEMMAN *man, unsigned int size) {
    unsigned int i, a;
    for (i = 0; i < man->frees; i++) {
        if (man->free[i].size >= size) {
            a = man->free[i].addr;
            man->free[i].size -= size;
            if (man->free[i].size == 0) {
                man->frees--;
            }

            return a;
        }
    }

    return 0;
}

int memman_free(struct MEMMAN *man, unsigned int addr, unsigned int size) {
    int i, j;
    for (i = 0; i < man->frees; i++) {
        if (man->free[i].addr > addr) {
            break;
        }
    }

    if (i > 0) {
        if (man->free[i-1].addr + man->free[i-1].size == addr) {
           man->free[i-1].size += size;
           if (i < man->frees) {
               if (addr + size == man->free[i].addr) {
                   man->free[i-1].size += man->free[i].size;
                   man->frees--;
               }
           }
     
           return 0;
        }
    }

    if (i < man->frees) {
        if (addr + size == man->free[i].addr) {
           man->free[i].addr = addr;
           man->free[i].size += size;
           return 0;
        }
    }

    if (man->frees < MEMMAN_FREES) {
        for (j = man->frees; j > i; j--) {
            man->free[j] = man->free[j-1];
        }

        man->frees++;
        if (man->maxfrees < man->frees) {
            man->maxfrees = man->frees;
        }

        man->free[i].addr = addr;
        man->free[i].size = size;
        return 0;
    }

    man->losts++;
    man->lostsize += size;
    return -1;
}
