struct SHEET {
    unsigned char *buf;
    int bxsize, bysize, vx0, vy0, col_inv, height, flags;
};

#define MAX_SHEETS  256
struct SHTCTL {
    unsigned char *vram;
    int xsize, ysize, top;
    struct SHEET *sheets[MAX_SHEETS];
    struct SHEET sheets0[MAX_SHEETS];
};

#define SIZE_OF_SHEET  32
#define SIZE_OF_SHTCTL 9232

struct SHEET *sheet_alloc(struct SHTCTL *ctl);
struct SHTCTL *shtctl_init(struct MEMMAN *memman, unsigned char *vram,
  int xsize, int ysize);
void sheet_setbuf(struct SHEET *sht, unsigned char *buf, int xsize, int ysize,
    int col_inv);
void sheet_updown(struct SHTCTL *ctl, struct SHEET *sht, int height);

int sheet_refresh(struct SHTCTL *ctl);

int sheet_refresh2(struct SHTCTL *ctl);

void sheet_slide2(struct SHTCTL *ctl, struct SHEET *sht, int vx0, int vy0);

void sheet_slide(struct SHTCTL *ctl, struct SHEET *sht, int vx0, int vy0);
