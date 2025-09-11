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
    char name[64];
    char phone[16];
    char ageBuf[128];

    printf("What is your name? \n");
    fgets(name, sizeof(name), stdin);
    removeNewLine(name);

    printf("What is your phone number? \n");
    fgets(phone, sizeof(phone), stdin);
    removeNewLine(phone);

    printf("What is your age?");
    fgets(ageBuf, sizeof(ageBuf), stdin);
    removeNewLine(ageBuf);

    unsigned int age = (unsigned int) strtoul(ageBuf, NULL, sizeof(ageBuf));

    struct Contact Person;

    strcpy(Person.name, name);
    strcpy(Person.phone, phone);
    Person.age = age;


}