def selection_sort(arr):    
    for i in range(len(arr)):
        min = i
        for j in range(i + 1, len(arr)):
            if arr[min] > arr[j]:
                min = j
        arr[i], arr[min] = arr[min], arr[i]
 
library_num = [124,235,456,123,756,476,285,998,379,108]
print("Initial array:", library_num)
selection_sort(library_num)
print ("Sorted array:", library_num)