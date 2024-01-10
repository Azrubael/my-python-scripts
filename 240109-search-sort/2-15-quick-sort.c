#include <stdio.h>
 
 int partition(int items[], int left, int right) {
    int key = items[right];
    int i = left - 1;
        for (int j = left; j < right; j++) {
            if (items[j] <= key) {
                i++;
                int temp = items[i];
                items[i] = items[j];
                items[j] = temp;
            }
        }
        int temp = items[i + 1];
        items[i + 1] = items[right];
        items[right] = temp;
        return (i + 1);
}
 
void quickSort(int arr[], int left, int right) {
    if (left < right) {
        int keyIndex = partition(arr, left, right);
        quickSort(arr, left, keyIndex - 1);// Sort the elements on the left of a key element
        quickSort(arr, keyIndex + 1, right);// Sort the elements on the right of a key element
        }
}
 
void showArray(int arr[], int size) 
{ 
    int i; 
    for (i=0; i < size; i++) 
        printf("%d ", arr[i]); 
    printf("\n"); 
}
 
int main()
{ 
    int libraryNum[] = {124,235,456,123,756,476,285,998,379,108}; 
    int n = sizeof(libraryNum)/sizeof(libraryNum[0]); 
 
    printf("Initial array: \n"); 
    showArray(libraryNum, n); 
    quickSort(libraryNum, 0, n-1); 
    printf("Sorted array: \n"); 
    showArray(libraryNum, n); 
    return 0; 
}