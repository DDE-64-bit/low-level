# include <stdio.h>
# include <string.h>
# include <stdlib.h>

struct Contact{
    char name[64];
    char phone[16];
    unsigned int age;
};

void removeNewLine(char *buf){
    size_t len = strlen(buf);
    if (len > 0 && buf[len-1] == '\n'){
        buf[len-1] = '\0';
    }
}

int main(){
    struct Contact contacts[10];
    
    int i = 1;
    int contactCount = 0;

    while(i){
        char buf[4];

        printf("Do you want to create or search contacts?\n");
        printf("[+] 1. Create new contact\n");
        printf("[+] 2. Search for contact\n");
        printf("[+] 3. Exit\n");

        fgets(buf, sizeof(buf), stdin);
        removeNewLine(buf);

        int input = (int) strtol(buf, NULL, 10);
        if (input == 1){
            char name[64];
            char phone[16];
            char ageBuf[128];

            printf("\nWhat is your name? \n");
            fgets(name, sizeof(name), stdin);
            removeNewLine(name);

            printf("What is your phone number? \n");
            fgets(phone, sizeof(phone), stdin);
            removeNewLine(phone);

            printf("What is your age? \n");
            fgets(ageBuf, sizeof(ageBuf), stdin);
            removeNewLine(ageBuf);

            unsigned int age = (unsigned int) strtoul(ageBuf, NULL, 10);

            strcpy(contacts[contactCount].name, name);
            strcpy(contacts[contactCount].phone, phone);
            contacts[contactCount].age = age;

            for (int j = 0; j < 10; j++){
                printf("Name: %s, Phone: %s, Age: %d \n", contacts[j].name, contacts[j].phone, contacts[j].age);
            }

            contactCount++;
        }
        else if (input == 2){
            // search contacts
        }
        else if (input == 3){
            return 1;
        }
        else{
            printf("Not a valid input chosen...");
        }
    }
    return 0;
}