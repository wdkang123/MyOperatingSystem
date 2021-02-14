#include "mem_util.h"
#include "global_define.h"
#include "multi_task.h"
#include "win_sheet.h"

struct SHTCTL *shtctl_init(struct MEMMAN *memman, unsigned char *vram,
  int xsize, int ysize) {
    struct SHTCTL *ctl;
    int i;
    ctl = (struct SHTCTL *)memman_alloc_4k(memman, SIZE_OF_SHTCTL);
    if (ctl == 0) {
        return 0;
    }

    ctl->map = (unsigned char*)memman_alloc_4k(memman, xsize * ysize);
    if (ctl->map == 0) {
        memman_free_4k(memman, (int)ctl, SIZE_OF_SHTCTL);
        return 0;
    }
    ctl->vram = vram;
    ctl->xsize = xsize;
    ctl->ysize = ysize;
    ctl->top = -1;
    for (i = 0; i < MAX_SHEETS; i++) {
        ctl->sheets0[i].flags = 0;
        ctl->sheets0[i].task = 0;
    }

    return ctl;
}

#define SHEET_USE  1
struct SHEET *sheet_alloc(struct SHTCTL *ctl) {
    struct SHEET *sht;
    int i;
    for (i = 0; i < MAX_SHEETS; i++) {
        if (ctl->sheets0[i].flags == 0) {
            sht = &ctl->sheets0[i];
//change here
//            ctl->sheets[i] = sht;
            sht->flags = SHEET_USE;
            sht->height = -1;
            sht->task = task_now();
            return sht;
        }
    }

    return 0;
}

void sheet_setbuf(struct SHEET *sht, unsigned char *buf, int xsize, int ysize,
    int col_inv) {
    sht->buf = buf;
    sht->bxsize = xsize;
    sht->bysize = ysize;
    sht->col_inv = col_inv;
    return;
}

void sheet_updown(struct SHTCTL *ctl, struct SHEET *sht, int height) {
    int h, old = sht->height;
    if (height > ctl->top + 1) {
        height = ctl->top + 1;
    }
 
    if (height < -1) {
        height = -1;
    }

    sht->height = height;

    if (old > height) {
        if (height >= 0) {
            for (h = old; h > height; h--) {
                ctl->sheets[h] = ctl->sheets[h-1];
                ctl->sheets[h]->height = h;
            }
     
            ctl->sheets[height] = sht;
            sheet_refreshmap(ctl, sht->vx0, sht->vy0, sht->vx0+sht->bxsize, sht->vy0+sht->bysize,
        height+1);
            sheet_refreshsub(ctl, sht->vx0, sht->vy0, sht->vx0+sht->bxsize, sht->vy0+sht->bysize,
        height+1, old);
        } else {
            if (ctl->top > old) {
               for (h = old; h < ctl->top; h++) {
                   ctl->sheets[h] = ctl->sheets[h+1];
                   ctl->sheets[h]->height = h;
               }
            }

            ctl->top--;
            sheet_refreshmap(ctl, sht->vx0, sht->vy0, sht->vx0+sht->bxsize, sht->vy0+sht->bysize,
        0);
            sheet_refreshsub(ctl, sht->vx0, sht->vy0, sht->vx0+sht->bxsize, sht->vy0+sht->bysize,
        0, old - 1);
        }

    } else if (old < height) {
        if (old >= 0) {
            for (h = old; h < height; h++) {
               ctl->sheets[h] = ctl->sheets[h + 1];
               ctl->sheets[h]->height = h;
            }

            ctl->sheets[height] = sht;
        } else {
            for (h = ctl->top; h >= height; h--) {
                ctl->sheets[h + 1] = ctl->sheets[h];
                ctl->sheets[h + 1]->height = h + 1;
            }

            ctl->sheets[height] = sht;
            ctl->top++;
        }
        sheet_refreshmap(ctl, sht->vx0, sht->vy0, sht->vx0+sht->bxsize, sht->vy0+sht->bysize,
        height);       

        sheet_refreshsub(ctl, sht->vx0, sht->vy0, sht->vx0+sht->bxsize, sht->vy0+sht->bysize,
        height, height);
    }

}

int sheet_refresh(struct SHTCTL *ctl, struct SHEET *sht, int bx0, int by0, int bx1, int by1) {
    if (sht->height >= 0) {
        sheet_refreshsub(ctl, sht->vx0 + bx0, sht->vy0 + by0, sht->vx0 + bx1,
        sht->vy0 + by1, sht->height, sht->height);
    }
    return 0;
}

void sheet_slide(struct SHTCTL *ctl, struct SHEET *sht, int vx0, int vy0) {
    int old_vx0 = sht->vx0, old_vy0 = sht->vy0;
    sht->vx0 = vx0;
    sht->vy0 = vy0;
    if (sht->height >= 0) {
         sheet_refreshmap(ctl, old_vx0, old_vy0, old_vx0 + sht->bxsize, old_vy0 + sht->bysize, 0);
         sheet_refreshmap(ctl, vx0, vy0, vx0+sht->bxsize, vy0+sht->bysize, sht->height);
         sheet_refreshsub(ctl, old_vx0, old_vy0, old_vx0 + sht->bxsize, 
                          old_vy0 + sht->bysize, 0, sht->height - 1);
         sheet_refreshsub(ctl, vx0, vy0, vx0+sht->bxsize, vy0+sht->bysize, sht->height, 
                          sht->height);
    }
}

void sheet_refreshsub(struct SHTCTL *ctl, int vx0, int vy0, int vx1, int vy1, int h0, int h1) {
    int h, bx, by, vx, vy, bx0, by0, bx1, by1;
    unsigned char *buf, c, *vram = ctl->vram, *map = ctl->map, sid;
    struct SHEET *sht;
    if (vx0 < 0) {vx0 = 0;}
    if (vy0 < 9) {vy0 = 0;}
    if (vx1 > ctl->xsize) {vx1 = ctl->xsize;}
    if (vy1 > ctl->ysize) {vy1 = ctl->ysize;}

    for (h = h0; h <= h1; h++) {
        sht = ctl->sheets[h];
        buf = sht->buf;
        sid = sht - ctl->sheets0;
//change here
        bx0 = vx0 - sht->vx0;
        by0 = vy0 - sht->vy0;
        bx1 = vx1 - sht->vx0;
        by1 = vy1 - sht->vy0;
        if (bx0 < 0) {bx0 = 0;}
        if (by0 < 0) {by0 = 0;}
        if (bx1 > sht->bxsize) {bx1 = sht->bxsize;}
        if (by1 > sht->bysize) {by1 = sht->bysize;}
        for (by = 0; by < by1; by++) {
            vy = sht->vy0 + by;
            for (bx = 0; bx < bx1; bx++) {
                vx = sht->vx0 + bx;
               /* if (vx0 <= vx && vx < vx1 && vy0 <= vy && vy < vy1) {
                    c = buf[by * sht->bxsize + bx];
                    if (map[vy * ctl->xsize + vx] == sid && c != sht->col_inv) {
                        vram[vy * ctl->xsize + vx] = c;
                    }
                }*/
                if (map[vy * ctl->xsize + vx] == sid) {
                    vram[vy * ctl->xsize + vx] = buf[by * sht->bxsize + bx];
                }
            }
        }
    }
}

void sheet_refreshmap(struct SHTCTL *ctl, int vx0, int vy0, int vx1, int vy1, int h0) {
    int h, bx, by, vx, vy, bx0, by0, bx1, by1;
    unsigned char *buf, sid, *map = ctl->map;
    struct SHEET *sht;
    
    if (vx0 < 0) {vx0 = 0;}
    if (vy0 < 0) {vy0 = 0;}

    if (vx1 > ctl->xsize) {vx1 = ctl->xsize;}
    if (vy1 > ctl->ysize) {vy1 = ctl->ysize;}

    for (h = h0; h <= ctl->top; h++) {
        sht = ctl->sheets[h];
        sid = sht - ctl->sheets0;
        buf = sht->buf;
        bx0 = vx0 - sht->vx0;
        by0 = vy0 - sht->vy0;
        bx1 = vx1 - sht->vx0;
        by1 = vy1 - sht->vy0;

        if (bx0 < 0) { bx0 = 0;}
        if (by0 < 0) { by0 = 0;}
        if (bx1 > sht->bxsize) {bx1 = sht->bxsize;}
        if (by1 > sht->bysize) {by1 = sht->bysize;}

        for (by = by0; by < by1; by++) {
            vy = sht->vy0 + by;
            for (bx = bx0; bx < bx1; bx++) {
                vx = sht->vx0 + bx;
                if (buf[by * sht->bxsize + bx] != sht->col_inv) {
                    map[vy * ctl->xsize + vx] = sid;
                }
            }
        }
        
    }

    return;
}

void sheet_free(struct SHTCTL *shtctl, struct SHEET *sht) {
    if (sht->height >= 0) {
        sheet_updown(shtctl, sht, -1);
    }

    sht->flags = 0;
    return;
}
