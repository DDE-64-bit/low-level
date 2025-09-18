# include <stdio.h>
# include <string.h>
# include <stdlib.h>

struct Task{
    char title[64];
    unsigned int priority;
    int done;
};

void sanitizeInput(char *buf){
    size_t len = strlen(buf);
    if (len > 0 && buf[len -1] == '\n'){
        buf[len-1] = '\0';
    }
}

int main(){
    struct Task tasks[30];
    memset(tasks, 0, sizeof(tasks));

    unsigned int taskCount = 0;

    while(1){
        char inputBuf[16];

        printf("\n1. Add Task \n2. List tasks \n3. Mark task as done \n4. Delete task \n5. Exit \n\n");
        printf("Action: ");
        fgets(inputBuf, sizeof(inputBuf), stdin);

        int action = (int) strtol(inputBuf, NULL, 10);
    
        switch (action){
            case 1:
                char title[64];
                char priorityBuf[16];

                printf("Name of task: ");
                fgets(title, sizeof(title), stdin);

                printf("Priority of the task: ");
                fgets(priorityBuf, sizeof(priorityBuf), stdin);
                sanitizeInput(title);
                unsigned int priority = (unsigned int) strtoul(priorityBuf, NULL, 10);

                struct Task task;
                strcpy(task.title, title);
                task.priority = priority;
                task.done = 0; // not done (yet)
                tasks[taskCount] = task;
                taskCount++;
                break;

            case 2:
                for (int i = 0; i < taskCount; i++){
                    printf("Name: %s\n", tasks[i].title);
                    printf("Priority: %u\n", tasks[i].priority);

                    printf("Completed: ");
                    switch (tasks[i].done){
                        case 0:
                            printf("not completed\n\n");
                            break;
                        case 1:
                            printf("completed\n\n");
                            break;
                        default:
                            printf("something went wrong\n\n");
                            break;
                    }
                }
                break;

            case 3:
                char completedBuf[16];

                for (int i = 0; i < taskCount; i++){
                    if (tasks[i].done != 1){
                    printf("Id: %d \nName: %s\n\n", i ,tasks[i].title);
                    }
                }
                printf("Task to mark completed: ");
                fgets(completedBuf, sizeof(completedBuf), stdin);
                int toMarkCompleted = (int) strtol(completedBuf, NULL, 10);
                
                tasks[toMarkCompleted].done = 1;
                break;

            case 4:
                for (int i = 0; i < taskCount; i++){
                    printf("Id: %d \nName: %s\n\n", i ,tasks[i].title);
                }

                char deleteBuf[16];
                printf("Task to delete: ");
                fgets(deleteBuf, sizeof(deleteBuf), stdin);
                
                unsigned int choice = (unsigned int) strtoul(deleteBuf, NULL, 10);

                tasks[choice] = tasks[taskCount - 1];
                memset(&tasks[taskCount - 1], 0, sizeof(struct Task));

                taskCount--;
                break;

            case 5:
                printf("Exiting...\n");
                return(0);
            
            default:
                printf("This was not one of the options, please try again...");
                break;
        }
    }
}