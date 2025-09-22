# include <stdio.h>

int main(){
    FILE *fptr = fopen("notes.txt", "a");
    if (fptr == NULL){
        printf("Couldn't open file...\n");
        return 1;
    }

    char buf[100];

    for (int i = 0; i < 3; i++){
        printf("What do you want to write?\n");
        fgets(buf, sizeof(buf), stdin);
        fprintf(fptr, "%s", buf);
    }

    fclose(fptr);
    return 0;
}