#include <stdio.h>
 
void selectionSort(int arr[], int n) 
{ 
   int i, j, min; 
   int count=0;
   for(i = 0; i < n-1; i++) 
   {
       min = i;
       for(j = i+1; j < n; j++)
       {
           if(arr[j] < arr[min])
           { 
              min = j;
           }    
        }
        int temp = arr[min]; 
        arr[min] = arr[i]; 
        arr[i] = temp; 
        count++;      
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
    selectionSort(libraryNum, n); 
    printf("Sorted array: \n"); 
    showArray(libraryNum, n); 
    return 0; 
}