#include <stdio.h> 
#include <stdlib.h>  
 
int main() 
{ 
    FILE  *fileName = fopen("my_information.txt", "w+t"); 
    if(fileName == NULL) 
    { 
        printf("Error. Could not open or unable to create a file.\n");     
        return 0; 
    } else 
        printf("The file is opened successfully.\n"); 
 
    //some block of code 
 
    fclose(fileName); 
    return 0; 
}