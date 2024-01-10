#include <stdio.h>

/*
Iterative implementation of binary search
*/
 
int binarySearch(int *libraryNum, int arrSize, int key) { 
    int low, high, mid; 
    low = 0; 
    high = arrSize-1; 
    while(low <= high) { 
        mid = (low+high)/2;
        if(key < libraryNum[mid]) 
            high = mid-1; 
        else if(key > libraryNum[mid]) 
            low = mid+1; 
        else return mid; 
    } 
    return -1; 
};
 
int main()
{
    int arrSize = 10;
    int libraryNum[] = {108,123,124,235,285,379,456,476,756,998};
    int requiredNum = -1;
    int result=-2;
    printf("To exit enter 0.\n");
    while(requiredNum!=0){
        printf("Enter the library card number: ");
        scanf("%d", &requiredNum);
        if (requiredNum==0)
            {
                printf("The search is over.");
            }
        else {
            if (requiredNum <0) {
                printf("\nYou entered an invalid customer library card number.\n");
            } 
            else {
                result = binarySearch(libraryNum,arrSize,requiredNum);
                if (result==-1)
                {
                    printf("The entered library card number %d was not found in the list.\n",requiredNum);
                }
                else{
                    printf("The entered library card number %d was found in the list.\n",requiredNum);
                }
            }
        }
    }
    return 0;
}