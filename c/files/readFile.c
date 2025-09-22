# include <stdio.h>

int main(){
    FILE *fptr = fopen("hello.txt", "r");
    if (fptr == NULL){
        printf("File couldn't be opened...\n");
        return 1;
    }

    char buf[100];

    fgets(buf, sizeof(buf), fptr);
    printf("%s", buf);

    fclose(fptr);    
    return 0;
}