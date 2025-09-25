# include <sys/types.h>
# include <sys/socket.h>

int main(){

    int serverfd, clientfd;

    serverfd = socket(AF_INET, SOCK_STREAM, 0);
    if (serverfd == -1){
        printf("Couldn't open connection...\n");
        return 1;
    }

    
}