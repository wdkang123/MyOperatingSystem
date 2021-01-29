extern void foo_print(char* p, int len);

int  bar_func(int a, int b) {
    if (a > b) {
       foo_print("the 1st one\n", 13);
    } else {
       foo_print("the 2nd one\n", 13);
    }

    return 0;
}
