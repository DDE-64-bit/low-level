# include <stdio.h>
# include <string.h>

void sanitizeInput(char *buf){
    size_t len = strlen(buf);
    if (len > 0 && buf[len-1] == '\n'){
        buf[len-1] = '\0';
    }
}

int main(){
    char buf[64];
    char password[64] = "Password";
    
    printf("Password: \n");
    fgets(buf, sizeof(buf), stdin);
    sanitizeInput(buf);

    if (strcmp(buf, password) == 0){
        printf("Welcome, you're in...\n");
        return 0;
    }
    printf("Unauthorized access attempted...\n");
    return 1;
}