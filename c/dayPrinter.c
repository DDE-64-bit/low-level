# include <stdio.h>
# include <string.h>
# include <stdlib.h>

int main(){
    char buffer[4];

    while (1){
        printf("Enter a number (0 to exit) \n");
        fgets(buffer, sizeof(buffer), stdin);

        size_t len = strlen(buffer);
        if (len > 0 && buffer[len-1] == '\n'){
            buffer[len-1] = '\0';
        }

        unsigned int day = (unsigned int) strtoul(buffer, NULL, 10);

        switch (day){
            case 1:
                printf("Monday\n\n");
                break;
            case 2:
                printf("Tuesday\n\n");
                break;
            case 3:
                printf("Wednesday\n\n");
                break;
            case 4:
                printf("Thursday\n\n");
                break;
            case 5:
                printf("Friday\n\n");
                break;
            case 6:
                printf("Saturday\n");
            case 7:
                if (day == 7) printf("Sunday\n");
                printf("Weekend!!\n\n");
                break;
            case 0:
                printf("Exiting...");
                return 0;
            default:
                printf("Please enter a number between 0-7 (0 for exiting)...\n\n");
                break;
        }
    }
}