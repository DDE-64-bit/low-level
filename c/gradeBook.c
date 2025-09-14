# include <stdio.h>
# include <string.h>
# include <stdlib.h>

struct Student{
    char name[64];
    unsigned int id;
    float grade[5];
    float average;
};

void sanitizeInput(char *buf){
    size_t len = strlen(buf);
    if (len > 0 && buf[len-1] == '\n'){
        buf[len-1] = '\0';
    }
}

void createStudent(){
    char buf[32];
    char name[64];
    float grade[5];
    float average;
    
    printf("Name: ");
    fgets(name, sizeof(name), stdin);

    printf("ID: ");
    fgets(buf, sizeof(buf), stdin);
    int ID = (int) strtol(buf, NULL, 10);

    struct Student student;

    strcpy(student.name, name);
    student.id = ID;

    printf("Name: ");
    fgets(name, sizeof(name), stdin);
}

int main(){
    struct Student students[20];

    while (1){
        printf("1. Add student\n");
        printf("2. List all students\n");
        printf("3. Search student by ID\n");
        printf("4. Show class average\n");
        printf("5. Exit\n");
        printf("Action: ");

        char buf[16];

        fgets(buf, sizeof(buf), stdin);
        sanitizeInput(buf);

        int action = (int) strtol(buf, NULL, 10);

        switch (action){
            case 1:
                createStudent();
                break;
            case 5:
                printf("Exiting...");
                return 0;
            default:
                printf("This is not an allowed input, please select one of the options...\n");
                break;
        }
    }
}