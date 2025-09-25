# include <stdio.h>

int main(){
    FILE *fptr = fopen("data.bin", "rb");
    if (fptr == NULL){
        printf("Couldn't open file...\n");
        return 1;
    }

    char fileBuf[128];

    fread(fileBuf, sizeof(fileBuf), 1, fptr);

    printf("%s", fileBuf);
}