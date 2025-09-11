# include <stdio.h>
# include <string.h>
# include <stdlib.h>

struct Contact{
    char name[128];
    char phone[32];
    unsigned int age;
};

void RemoveNewLine(char *buf){
    size_t len = strlen(buf);
    if (len > 0 && buf[len-1] == '\n'){
        buf[len-1] = '\0';
    }
}

int main(){
    char name[128];
    char phone[32];
    char agebuf[64];

    printf("What is your name?\n");
    fgets(name, sizeof(name), stdin);
    RemoveNewLine(name);

    printf("\nWhat is your phone number?\n");
    fgets(phone, sizeof(phone), stdin);
    RemoveNewLine(phone);

    printf("\nWhat is your age?\n");
    fgets(agebuf, sizeof(agebuf), stdin);
    RemoveNewLine(agebuf);

    unsigned int age = (unsigned int) strtoul(agebuf, NULL, sizeof(agebuf));

    struct Contact Persoon;

    Persoon.age = age;

    strcpy(Persoon.name, name);
    strcpy(Persoon.phone, phone);

    printf("%s", Persoon);

    return 0;
}