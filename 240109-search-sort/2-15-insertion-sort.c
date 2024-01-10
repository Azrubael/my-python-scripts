#include <stdio.h>
 
void insertionSort(int arr[], int n) 
{ 
   int i, j, keyItem; 
   int count=0;
   for(i = 1; i < n; i++) 
   {
       keyItem = arr[i];
       j = i - 1;
       while(j >= 0 && arr[j] > keyItem)
       {
           arr[j + 1] = arr[j]; 
            j = j - 1;
            count ++;
       }
       arr[j + 1] = keyItem;
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
    insertionSort(libraryNum, n); 
    printf("Sorted array: \n"); 
    showArray(libraryNum, n); 
    return 0; 
}