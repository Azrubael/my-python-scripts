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
 
    if(!(fileName = fopen("My_information.bin", "wb+")))
    {
        printf("Error. Could not open or unable to create a file.\n");    
        return 0;
    } else
        printf("The file was opened successfully.\n");
 
    printf("Enter full name: ");
    fflush(stdin);
    gets(info.name);
 
    printf("Enter your age: ");
    scanf("%d", &info.age);
 
    fwrite(&info, 1,sizeof(info), fileName);  
    fclose(fileName);
 
    printf("\nYour information:\n");
    if(!(fileName = fopen("My_information.bin", "rb+")))
    {  
        printf("Error. Could not open the file\n"); 
        return 0;
    }
    fread(&info, sizeof(info), 1,fileName);
    printf("You name: %s and your age: %d years \n", info.name, info.age);
 
    fclose(fileName);
    return 0;
}