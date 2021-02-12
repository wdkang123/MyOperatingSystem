//void api_putchar(int c);

void main() {
    char *p = (char*)(0x100);
    *p = 'a';
    *(p+1) = 'p';
    *(p+2) = 'p';
    *(p+3) = 0;
    return;
}
