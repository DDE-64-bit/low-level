# include <stdio.h>
# include <string.h>

struct Contact{
    char name[256];
    int age;
};

int main(){
    char name[256];
    int age;

    printf("What is your name? \n");
    fgets(name, sizeof(name), stdin);

    size_t len = strlen(name);
    if (len > 0 && len == '\n'){
        name[len-1] = '\0';
    }

    printf("What is your age? \n");
    fgets(age, sizeof(int), stdin);

    struct Contact persoon;
    
    strncpy(persoon.name, name, sizeof(name));
    persoon.age = age;

    printf("Welcome %s", name);

    return 0;
}
