#include <stdio.h>
#include <stdbool.h>
 
void bubbleSort(int arr[], int n) 
{ 
   int i, j; 
   int count = 0;
   bool needIteration = true;
   while(needIteration) {
       needIteration = false;
       for(i = 0; i < n-1; i++)
       {
           for(j = 0; j < n-i-1; j++)
           {
               if(arr[j] > arr[j+1])
               { 
                   int temp = arr[j]; 
                   arr[j] = arr[j+1]; 
                   arr[j+1] = temp; 
                   needIteration = true;
                   count++;
                }
            }
        }
    }
   printf("The number of permutations is %d. \n", count); 
} 
 
void showArray(int arr[], int size) 
{ 
    int i; 
    for(i=0; i < size; i++) 
        printf("%d ", arr[i]); 
    printf("\n"); 
}
 
int main()
{ 
    int libraryNum[] = {124,235,456,123,756,476,285,998,379,108}; 
    int n = sizeof(libraryNum)/sizeof(libraryNum[0]); 
 
    printf("Initial array: \n"); 
    showArray(libraryNum, n); 
    bubbleSort(libraryNum, n); 
    printf("Sorted array: \n"); 
    showArray(libraryNum, n); 
    return 0; 
}