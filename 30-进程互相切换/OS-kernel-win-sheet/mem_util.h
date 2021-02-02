#define  MEMMAN_FREES  4096

struct FREEINFO {
    unsigned int addr, size;
};

struct MEMMAN {
    int frees, maxfrees, lostsize, losts;
    struct FREEINFO free[MEMMAN_FREES];
};

void memman_init(struct MEMMAN *man);

unsigned int memman_total(struct MEMMAN *man);

unsigned int memman_alloc(struct MEMMAN *man, unsigned int size);

int memman_free(struct MEMMAN *man, unsigned int addr, unsigned int size);

unsigned int memman_allock_4k(struct MEMMAN *man, unsigned int size);

int memman_free_4k(struct MEMMAN *man, unsigned int addr, unsigned int size);
