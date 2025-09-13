# include <stdio.h>
# include <stdlib.h>
# include <time.h>
# include <string.h>

int main(){
    srand(time(NULL));

    unsigned int n = 100; // gets number between 0-99 so i do it plus 1

    unsigned int random = 1 + rand() % n;
    // printf("%d\n\n", random);

    while (1){
        char buf[64];
        printf("Enter your guess: ");
        fgets(buf, sizeof(buf), stdin);
        size_t len = strlen(buf);
        if (len > 0 && buf[len-1] == '\n'){
            buf[len-1] = '\0';
        }

        unsigned int guess = (unsigned int) strtoul(buf, NULL, 10);
        // printf("Guess as ul: %d \n", guess);

        if (guess == random){
            printf("Congratulations the number is indeed %d \n", random);
            return 0;
        }
        else if (guess > random){
            printf("Sorry your guess is too high... \n");
        }
        else if (guess < random){
            printf("Sorry your guess is too low... \n");
        }
        else{
            printf("This is super weird that you see this ): \n");
            printf("Something is wrong and I have no idea what... \n");
        }
    }
}