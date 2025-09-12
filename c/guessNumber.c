# include <stdio.h>
# include <stdlib.h>
# include <time.h>
# include <string.h>

int main(){
    srand(time(NULL));

    unsigned int n = 100; // gets number between 0-99 so i do it plus 1

    unsigned int random = 1 + rand() % n;
    printf("%d", random);

    int i = 1;

    while (i){
        char buf[64];
        fgets(buf, sizeof(buf), stdin);
        size_t len = strlen(buf);
        if (len > 0 && buf[len-1] == '\n'){
            
        }
    }
    return 0;
}