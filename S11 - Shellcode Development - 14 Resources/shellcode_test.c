#include<stdio.h>
#include<string.h>

unsigned char code[] = "\x48\x31\xc0\xb0\x3c\x48\x31\xff\x0f\x05";

int main()
{
	printf("Shellcode Length: %d\n",(int)strlen(code));

	int (*ret)() = (int(*)())code;

	ret();
}


