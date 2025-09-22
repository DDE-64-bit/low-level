# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <time.h>

struct Contact{
    char name[64];
    char phone[16];
    unsigned int age;
};


void createContact(struct Contact *arr, int *length){
    char name[64];
    char phone[16];
    char ageBuf[8];
    struct Contact person;


    printf("Name: ");
    fgets(name, sizeof(name), stdin);

    printf("Phone: ");
    fgets(phone, sizeof(phone), stdin);

    printf("Age: ");
    fgets(ageBuf, sizeof(ageBuf), stdin);
    unsigned int age = (unsigned int) strtoul(ageBuf, NULL, 10);

    strncpy(person.name, name, sizeof(person.name) - 1);
    person.name[sizeof(person.name) -1] = '\0';

    strncpy(person.phone, phone, sizeof(person.phone) -1);
    person.phone[sizeof(person.phone) -1] = '\0';

    person.age = age;

    arr[*length] = person;
    *length++;
}


int saveContacts(struct Contact *arr, int *lengthptr){
    FILE *fptr = fopen("data.bin", "wb");
    if (fptr == NULL){
        printf("Couldn't open file...\n");
        return 1;
    }

    for (int i = 0; i < &length; i++){
        fwrite(&arr[i], sizeof(struct Contact), 1, fptr);
    }

    fclose;

    return 0;
}


int fillWithData(struct Contact *arr, int *length){
    FILE *fptr = fopen("data.bin", "wb");
    if (fptr == NULL){
        printf("Couldn't open file...\n");
        return 1;
    }

    while (sizeof(arr)/sizeof(struct Contact) > length){
        struct Contact Person;
        char name[64];
        char phone[16];

        for (int i = 0; i < 32; i++){
            int letterBuf = 1 + rand() % 26;
            name[i] = (char) letterBuf + 97;
        }

        for (int i = 0; i < 16; i++){
            int phoneBuf = 1 + rand() % 10;
            phone[i] = (char) phoneBuf + 48;
        }

        Person.age = 1 + rand() % 100;
        strncpy(Person.name, name, sizeof(name));
        strncpy(Person.phone, phone, sizeof(phone));
        *(length)++;
    }

    return 0;
}


int main(){
    struct Contact arr[20];
    int length = 0;

    srand(time(NULL));

    while (1){
        char choiceBuf[16];
        printf("----- address book ----- \n1. Create Contact \n2. Save Contacts \n3. View contacts \n4. Fill with random data \n5. Exit \n\nAction: ");
        fgets(choiceBuf, sizeof(choiceBuf), stdin);

        unsigned int choice = (unsigned int) strtoul(choiceBuf, NULL, 10);

        switch (choice){
            case 1: { // create contact
                createContact(arr, &length);
                break;
            }
            case 2: { // save contact
                if (saveContacts(arr, &length) != 0){
                    return 1;
                }
                printf("Data saved\n");
                break;
            }
            case 3: { // view contacts
                break;
            }
            case 4: { // random data
                if (fillWithData(arr, &length) != 0){
                    return 1;
                }
                printf("Filled with random data\n");
                break;
            }
            case 5: { // exit
                printf("Exiting...\n");
                return 0;
                break;
            }
            default: { // other
                printf("This is not a valid option, please try again...\n");
            }
        }
    }
}