#include <stdio.h>
 
int findMax(int arr[], int size) {
  int maxItem = arr[0];
  for (int i = 1; i < size; i++)
    if (arr[i] > maxItem)
      maxItem = arr[i];
  return maxItem;
}
 
void countingSort(int arr[], int size, int place) {
  int output[size + 1];
  int maxItem = (arr[0] / place) % 10;
 
  for (int i = 1; i < size; i++) {
    if (((arr[i] / place) % 10) > maxItem)
      maxItem = arr[i];
  }
  int count[maxItem + 1];
 
  for (int i = 0; i < maxItem; ++i)
    count[i] = 0;
 
  // Determine count of elements
  for (int i = 0; i < size; i++)
    count[(arr[i] / place) % 10]++;
 
  // Determine cummulative count
  for (int i = 1; i < 10; i++)
    count[i] += count[i - 1];
 
  // Place the elements in the correct place
  for (int i = size - 1; i >= 0; i--) {
    output[count[(arr[i] / place) % 10] - 1] = arr[i];
    count[(arr[i] / place) % 10]--;
  }
 
  for (int i = 0; i < size; i++)
    arr[i] = output[i];
}
 
void radixSort(int arr[], int size) {
  int maxItrm = findMax(arr, size);
  for (int place = 1; maxItrm / place > 0; place *= 10)
    countingSort(arr, size, place);
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
    radixSort(libraryNum, n); 
    printf("Sorted array: \n"); 
    showArray(libraryNum, n); 
    return 0; 
}