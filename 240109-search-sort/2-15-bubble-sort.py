def bubble_sort(arr):
    count = 0
    need_iteration = 'true'
    while need_iteration == 'true':
        need_iteration = 'false'
        for i in range(len(arr)):
            for j in range(0, len(arr)-i-1):
                if arr[j] > arr[j+1]:
                    arr[j], arr[j+1] = arr[j+1], arr[j]
                    need_iteration = 'true'
                    count +=1
    print("The number of permutations is", count)
 
libraryNum = [124,235,456,123,756,476,285,998,379,108] 
print("Initial array:", libraryNum) 
bubble_sort(libraryNum) 
print ("Sorted array:", libraryNum)