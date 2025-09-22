# include <stdio.h>
# include <string.h>

int main(){
    char line[1024];

    FILE *fptr = fopen("notes.txt", "r");
    if (fptr == NULL){
        printf("Couldn't open file...");
        return 1;
    }

    while(fgets(line, sizeof(line), fptr) != NULL){
        printf("%s", line);
        if (line[strlen(line)-1] != '\n'){
            printf("\n");
        }
    }

    fclose(fptr);
    return 0;
}