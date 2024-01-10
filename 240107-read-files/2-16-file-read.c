#include <stdio.h>
#include <stdlib.h>
 
struct myInfo
{ 
    char name[40];
    int age;       
};
 
int main()
{
    struct myInfo info;
    FILE *fileName;
 
    if(!(fileName = fopen("My_information.txt", "w+t")))
    {
        printf("Error. Could not open or unable to create a file.\n");    
        return 0;
    } else  
      {        
        printf("The file was opened successfully.\n");
      }
 
    printf("Enter full name: ");
    fgets(info.name, sizeof(info.name), stdin);
    fflush(stdin);
    for ( int i = 0; i < sizeof(info.name); i++ )
    {
        if ( info.name[i] == '\n' )
        {
            info.name[i] = '\0';
            break;
        }
    }
    printf("Enter your age: ");
    scanf("%d", &info.age);
    fprintf(fileName, "You name: %s and your age: %d years", info.name, info.age); 
 
    fclose(fileName);
 
    printf("\nYour information:\n");
    if(!(fileName = fopen("My_information.txt", "r+t")))
    {  
        printf("Error. Could not open the file\n"); 
        return 0;
    }
    char buff[225];
    while(fscanf(fileName, "%s", buff)!=EOF)
    {  
        printf("%s ", buff ); 
    }  
 
    fclose(fileName);
    return 0;
}