def merge_sort(arr):
    if len(arr) > 1:
        mean = len(arr)//2
        left_arr = arr[:mean]
        right_arr = arr[mean:]
        merge_sort(left_arr)
        merge_sort(right_arr)
 
        i = j = k = 0
        while i < len(left_arr) and j < len(right_arr):
            if left_arr[i] < right_arr[j]:
                arr[k] = left_arr[i]
                i += 1
            else:
                arr[k] = right_arr[j]
                j += 1
            k += 1
        while i < len(left_arr):
            arr[k] = left_arr[i]
            i += 1
            k += 1
 
        while j < len(right_arr):
            arr[k] = right_arr[j]
            j += 1
            k += 1    
 
library_num = [124,235,456,123,756,476,285,998,379,108]
print("Initial array:", library_num)
merge_sort(library_num)
print ("Sorted array:", library_num)