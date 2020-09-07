#include <stdio.h>

int main()
{
    float zed, bigZed, littleZed;

    zed = -100.000;
    bigZed = 1000;
    littleZed = 0.0001;

    while (zed < bigZed) {
        zed += littleZed;
    }
    if (zed >= bigZed) {
        printf("counting completed :)  ");
    } else {

    }
}
