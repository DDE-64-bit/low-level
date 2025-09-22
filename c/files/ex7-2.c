# include <stdio.h>
# include <stdlib.h>
# include <string.h>

struct Contact{
    char name[64];
    char phone[16];
    unsigned int age;
};

void sanitizeInput(char *buf){
    size_t len = strlen(buf);
    if (len > 0 && buf[len-1] == '\n'){
        buf[len-1] = '\0';
    }
}

int main(){
    struct Contact contacts[3];

    for (int i = 0; i < 3; i++){
        struct Contact person;

        char name[64];
        char phone[16];
        char ageBuf[8];
        
        printf("----- Contact %d ----- \nname: ", i + 1);
        fgets(name, sizeof(name), stdin);
        sanitizeInput(name);

        printf("phone: ");
        fgets(phone, sizeof(phone), stdin);
        sanitizeInput(phone);

        printf("age: ");
        fgets(ageBuf, sizeof(ageBuf), stdin);

        unsigned int age = (unsigned int) strtoul(ageBuf, NULL, 10);

        strncpy(person.name, name, sizeof(name));
        strncpy(person.phone, phone, sizeof(phone));
        person.age = age;

        contacts[i] = person;
    }

    FILE *fptr = fopen("data.bin", "wb");
    if (fptr == NULL){
        printf("Couldn't open file...\n");
        return 1;
    }

    for (int i = 0; i < 3; i++){
        fwrite(&contacts[i], sizeof contacts[i], 1, fptr);
    }

    fclose(fptr);
    fptr = NULL;

    fptr = fopen("data.bin", "rb");
    if (fptr == NULL){
        printf("Couldn't open file...\n");
        return 1;
    }

    struct Contact loadedData[3];
    for (int i = 0; i < 3; i++){
        fread(&loadedData[i], sizeof(struct Contact), 1, fptr);
    }
    printf("Loaded all data\n");

    for (int i = 0; i < 3; i++){
        printf("Name: %s, Phone: %s, Age: %u\n", loadedData[i].name, loadedData[i].phone, loadedData[i].age);
    }


    fclose(fptr);
    fptr = NULL;
    return 0;
}