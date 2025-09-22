# include <stdio.h>
# include <stdlib.h>
# include <time.h>

int main(){
    int size = 5;
    
    int arr[size];

    srand(time(NULL));
    
    for (int i = 0; i < size; i++){
        arr[i] = 1 + rand() % 100;
        printf("%d\n", arr[i]);
    }
    printf("array filled\n\n");

    FILE *fptr = fopen("data.bin", "wb");
    if (fptr == NULL){
        printf("Couldn't open file...\n");
        return 1;
    }

    fwrite(arr, sizeof(int), size, fptr);
    fclose(fptr);


    fptr = fopen("data.bin", "rb");
    if (fptr == NULL){
        printf("Couldn't open file...");
        return 1;
    }

    int buf[size];

    fread(buf, sizeof(int), size, fptr);

    printf("array loaded\n");

    for (int i = 0; i < size; i++){
        printf("%d\n", buf[i]);
    }

    fclose(fptr);
    return 0;
}
