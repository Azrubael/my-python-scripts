#include <stdio.h>
 
 void merge(int items[], int left, int mean, int right) {
    int leftSize = mean - left + 1;
    int rightSize = right - mean;
    int leftArr[leftSize], rightArr[rightSize];
    for (int i = 0; i < leftSize; i++)
        leftArr[i] = items[left + i];
    for (int j = 0; j < rightSize; j++)
        rightArr[j] = items[mean + 1 + j];
 
  // Maintain current index of sub-arrays and main array
  int i = 0;
  int j = 0;
  int k = left;
 
  // Until we reach the end of either leftArr or rightArr, pick larger among
  // elements leftArr and rightArr and place them in the correct position at items[left..right]
  while(i < leftSize && j < rightSize) {
    if (leftArr[i] <= rightArr[j]) {
        items[k] = leftArr[i];
        i++;
        } else {
            items[k] = rightArr[j];
            j++;
            }
    k++;
  }
  while (i < leftSize) {
    items[k] = leftArr[i];
    i++;
    k++;
    }
    while (j < rightSize) {
        items[k] = rightArr[j];
        j++;
        k++;
        }
}
 
// Divide the array into two subarrays, sort them and merge them
void mergeSort(int arr[], int left, int right) {
    if (left < right) {
        int mean  = left + (right - left) / 2;
        mergeSort(arr, left, mean );
        mergeSort(arr, mean  + 1, right);
        merge(arr, left, mean , right);
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
    mergeSort(libraryNum, 0, n-1); 
    printf("Sorted array: \n"); 
    showArray(libraryNum, n); 
    return 0; 
}