# 2024-01-09  18:12
===================

# Big O Notation
----------------
Обозначение Big O используется для описания сложности алгоритмов или для прогнозирования эффективности написанного блока кода.
Способы оценки эффективности алгоритма включают в себя:
     в худшем случае
     лучший сценарий
     средний сценарий

В худшем случае алгоритм получает входные данные, для обработки которых потребуется максимально возможное количество действий по сравнению с другими возможными входными данными того же размера.
Основные правила расчета нотации Big O алгоритма следующие:
* Не обращайте внимания на константы: нас интересуют только те элементы функции, которые влияют на порядок роста.
* Некоторые термины «доминируют» над другими терминами (игнорируют термины низкого порядка): мы игнорируем термины низкого порядка, когда над ними доминируют термины высокого порядка.

Big O называется асимптотической функцией, поскольку она обеспечивает производительность алгоритма на пределе, то есть когда в него вводится много входных данных. Следует также отметить, что существуют и другие асимптотические функции.

o(n)        - o сообщает нам, что мы нашли нежёсткую границу сложности.

O(n)        - O говорит нам, что наш код никогда не будет работать медленнее определенного предела.

Phi(n)      - Представляет временную сложность или просто сложность нашего алгоритма.

Omega(n)    - дает нам такую сложность, что наша программа не может быть лучше, т. е. дает нам нижнюю оценку сложности нашего алгоритма.

omicron(n)  - говорит нам, что нижняя граница не является жесткой.


# Binary Search, Search in Array
--------------------------------
There are several basic search algorithms in programming languages.

The simplest, but not the most efficient one, is a *linear* or *sequential search*. The search is carried out by full sequential iteration over the array elements and by comparing its values with a given key. The speed of the algorithm is quite low.

Consider the situation when we have a sorted array that contains unique numbers of library cards, and we need to determine by the number whether a reader is registered in the library. We can use a *binary search*.
In this case, a search is performed in a sorted array by repeatedly dividing the search interval in half. In other words, let's first check the middle element of the array. If it is greater than the desired value, then check the middle element of the second half; otherwise, check the middle element only of the first half. We will repeat this procedure until the required element is found, or until there are no unchecked elements.
On average and in the worst case,the time complexity of a binary search algorithm is O(log(n)).


# Different Sorts
-----------------
Sorting is a process of ordering individual elements of a list according to their proper rank, either in an ascending or descending order.


*Internal sorting* – a type of sorting algorithms or their implementations, in which the amount of RAM is sufficient to place a sorted array of data into it with random access to any cell and, in fact, to execute the algorithm no additional memory is used. In this case, sorting occurs as quickly as possible, since the speed of access to RAM is much higher than to peripheral devices (accordingly, the access time is much shorter).

*External sorting* – a type of sorting of the data located on peripheral devices which does not fit into RAM, that is, when one of the internal sorts cannot be applied.

Стабильная сортировка — это сортировка, при которой не изменяется относительный порядок сортируемых элементов, имеющих одинаковые значения, по которым происходит сортировка.

*Пузырьковая сортировка* — самый простой алгоритм сортировки. Мы сравниваем пары соседних элементов и меняем их местами, если они расположены не в правильном порядке. В результате первого шага получается, что самый большой элемент перемещается в конец массива. На втором этапе второй по величине элемент, следующий за ним, перемещается на предпоследнее место и так далее.

  $ vim 2-15-bubble-sort.py
----------
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


*Сортировка вставкой* перебирает массив и перемещает нужное значение в начало массива. После обработки очередной позиции мы знаем, что сортируются все позиции, предшествующие ей, но не позиции, следующие за ней. Эта сортировка «стабильна», поскольку идентичные элементы не меняют свой порядок.


*Сортировка выбором* — своего рода гибрид пузырьковой сортировки и сортировки вставками. Как и пузырьковая сортировка, этот алгоритм снова и снова перебирает массив, перемещая одно значение в правильную позицию. Правильная позиция выбранного элемента определяется перед переходом к следующему элементу массива, и при каждом проходе несортированная часть массива уменьшается на один элемент.
Однако, в отличие от пузырьковой сортировки, она выбирает наименьшее неотсортированное значение вместо самого большого. Как и при сортировке вставками, отсортированная часть массива находится в начале, а при пузырьковой сортировке — в конце.

*Heapsort* — это метод сортировки на основе сравнения, основанный на структуре данных двоичной кучи. Это похоже на сортировку выбором, при которой мы сначала находим минимальный элемент и помещаем минимальный элемент в начало. Однако в этом случае в узлах обычно размещают самые крупные элементы. Повторяем тот же процесс для остальных элементов. Heapsort сочетает в себе эффективность использования времени сортировки слиянием и эффективность хранения данных быстрой сортировки, что будет обсуждаться ниже.

*Сортировка слиянием* - алгоритм сортировки, который упорядочивает списки (или другие структуры данных, к элементам которых можно обращаться только последовательно, например потоки) в определенном порядке. Объединить означает объединить две (или более) последовательности в одну упорядоченную последовательность путем циклического выбора доступных в данный момент элементов.

  $ vim 2-15-merge-sort.py
----------
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


*Быстрая сортировка* — это один из алгоритмов «разделяй и властвуй». Он работает путем рекурсивного повторения следующих шагов:
1. Выберите ключевой индекс и разбейте по нему массив на две части. Есть много способов сделать это, например, случайный или самый правый (то есть последний) элемент.
2. Переместите все элементы больше ключа в правую часть массива, а все элементы меньше ключа в левую часть. Ключевой элемент теперь находится в правильном положении — он больше любого элемента слева и меньше любого элемента справа.
3.  Повторяйте первые два шага, пока массив не будет полностью отсортирован.

Быстрая сортировка не является адаптивной и нестабильной сортировкой.


*Поразрядная сортировка* (radix sort) это алгоритм несравнительной сортировки. Он позволяет избежать сравнения, создавая и распределяя элементы по сегментам в соответствии с их основанием. Массив повторяется несколько раз, и элементы переставляются в зависимости от того, какая цифра находится в определенном бите. После обработки битов (всех или почти всех) массив упорядочивается, и биты могут обрабатываться в противоположных направлениях — от наименее значимого к наиболее значимому или наоборот.
 	O(w*n), где n - количество єлементов, а w - разрдность єлементов.

