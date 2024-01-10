def counting_sort(arr, place):
    size = len(arr)
    output = [0] * size
    count = [0] * 10
 
    # Determine count of elements
    for i in range(0, size):
        index = arr[i] // place
        count[index % 10] += 1
 
    # Determine cummulative count
    for i in range(1, 10):
        count[i] += count[i - 1]
 
    # Place the elements in the correct place
    i = size - 1
    while i >= 0:
        index = arr[i] // place
        output[count[index % 10] - 1] = arr[i]
        count[index % 10] -= 1
        i -= 1
 
    for i in range(0, size):
        arr[i] = output[i]
 
def radix_sort(arr):
    max_item = max(arr)
    place = 1
    while max_item // place > 0:
        counting_sort(arr, place)
        place *= 10
 
library_num = [124,235,456,123,756,476,285,998,379,108]
print("Initial array:", library_num)
radix_sort(library_num)
print ("Sorted array:", library_num)