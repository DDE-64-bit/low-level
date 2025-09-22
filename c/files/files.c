# include <stdio.h>

int main(){
    FILE *fptr = fopen("hello.txt", "w");
    if (fptr == NULL){
        printf("File couldn't be opened...\n");
        return 1;
    }

    fprintf(fptr, "Hello World\n");

    fclose(fptr);
}