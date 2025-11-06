# include <stdlib.h>
# include <stdio.h>
# include <time.h>

int *makeList(int n){
    int *array = malloc(n * sizeof(int));

    for (int i = 0; i < n; i++){
        int number = rand() % 1000 + 1;
        array[i] = number;
    }
    return array;
}

int *sortList(int *array, int n){
    int *sortedArray = malloc(n * sizeof(int));

    for (int i = 0; i < n; i++){
        //printf("%d ", array[i]);
        for (int j = 0; j < n; i++){
            if 
        }
    
    }


}

int main(){
    int n = 10;

    srand(time(NULL));
    
    int *array = makeList(n);

    // for (int i = 0; i < n; i++){
    //     printf("%d ", array[i]);
    // }
    // printf("\n");

    int *sortedArray = sortList(array, n);

    return 0;
}