#include <stdio.h>

main()
{
    int aaa, bbb, ccc;
    int lower, upper, step;

    lower = -1000;
    upper = 1000;
    step = 10;

    aaa = lower;
    while (aaa <= upper) {
        bbb = aaa * 2;
        ccc = bbb / 3;
        printf("%d\t", aaa);
        printf("\t %d\t", ccc);
        printf("\t\t\ %d\n", bbb);
        aaa = aaa + step;
    }
}
