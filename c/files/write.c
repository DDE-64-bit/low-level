# include <stdio.h>
# include <string.h>

int main(){
    char buf[128];
    printf("Enter text: ");
    fgets(buf, sizeof(buf), stdin);

    size_t len = strlen(buf);
    if (len > 0 && buf[len-1] == '\n'){
        buf[len-1] = '\0';
    }

    FILE *fptr = fopen("data.bin", "wb");
    if (fptr == NULL){
        printf("Couldn't open file...\n");
        return 1;
    }

    fwrite(buf, sizeof(buf), 1, fptr);

    fclose(fptr);
    fptr == NULL;

    return 0;
}