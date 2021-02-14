void api_putchar(int c);

void main() {
//    api_putchar('C');
    char *p = (char*)0x123;
    p[0] = 'c';
    p[1] = 'r';
    p[2] = 'a';
    p[3] = 'c';
    p[4] = 'k';
    p[5] = 0;
}
