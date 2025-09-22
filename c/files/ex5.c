# include <stdio.h>
# include <stdlib.h>
# include <time.h>

int main(){
    srand(time(NULL));
    int random;

    FILE *fptr = fopen("numbers.txt", "a");
    if (fptr == NULL){
        printf("File couldn't be opened...\n");
        return 1;
    }

    printf("Getallen: \n");

    for (int i = 0; i < 5; i++){
        random = 1 + rand() % 100;
        printf("%d\n", random);
        fprintf(fptr, "%d\n", random);
    }

    fclose(fptr);

    fptr = fopen("numbers.txt", "r");
    if (fptr == NULL){
        printf("File couldn't be opened...\n");
        return 1;
    }

    char line[16];
    int sum = 0;
    
    while (fgets(line, sizeof(line), fptr) != NULL){
        int number = (int) strtol(line, NULL, 10);
        sum = sum + number;
    }
    
    printf("Sum: %d\n", sum);
    
    fclose(fptr);
    return 0;
}
