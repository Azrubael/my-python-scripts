/*
В соревновании по поеданию пончиков принимают участие N человек. Чтобы выиграть, вам нужно съесть как можно больше пончиков за 10 минут. Отображение на экране результата 3-х победителей и худшего результата. (Подсказка: программа выделяет динамическую память для массива из n элементов и запрашивает массив с клавиатуры. Попробуйте отсортировать данные разными методами. Случай, когда несколько участников съели одинаковое количество пончиков, рассматриваться не должен).
*/



#include <stdio.h>
 
int Menu();
void BubbleSort(int[], int);
void selectionSort(int[], int);
void InsertSort(int[], int);
void printArray(int[], int);
 
int main() 
{
    int dounts[20];
    int size;
 
    printf("Enter the number of bidders:(more than 3): ");
    scanf("%d", &size);
    printf("\n");
    while (size < 3) {
        printf("The number of participants must be more than 3!\n");
        printf("Enter again.\n");
        scanf("%d", &size);
    }
 
    for (int i = 0; i < size; i++) 
    {
        printf("Enter the number of donuts eaten by %d participant: ", i + 1);
        scanf("%d", &dounts[i]);
    }
 
    switch (Menu())
    {
        case 1: 
            BubbleSort(dounts, size); break;
        case 2:
            InsertSort(dounts, size); break;
        case 3: 
            selectionSort(dounts, size); break;
        default:
            printf("Incorrect choice.\n");
    }
 
    printArray(dounts, size);
    return 0;
}
 
void InsertSort(int array[], int size) 
{
    int temp, j;
    for (int i = 1; i < size; i++)
    {
        temp = array[i];
        j = i - 1;
        while (array[j] < temp && j >= 0)
        {
            array[j + 1] = array[j];
            j -= 1;
        }
        array[j + 1] = temp;
    }
}
 
void BubbleSort(int array[], int size) 
{
    int temp;
    for (int i = 0; i < size-1; i++) {
        for (int j = i; j < size; j++) {
            if (array[i] < array[j]) {
                temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
    }
}
 
void selectionSort(int array[], int size){
    int min, temp;
    for (int i = 0; i < size - 1; i++) {
        min = i;
        for (int j = i + 1; j < size; j++) {
            if (array[j] > array[min]) {
                min = j;
            }
        }
        temp = array[i];
        array[i] = array[min];
        array[min] = temp;
    }
}
 
void printArray(int array[], int size) {
    int flag = 0;
    int temp, i, how;
    for (i = 0; i < size && flag < 3; i++) {
        if (array[i] == array[i + 1]) {
            how = 1;
            temp = array[i];
            while (temp == array[i + 1]) {
                how++;
                ++i;
            }
            printf("%d participants took %d place with result - %d donuts.", how, ++flag, array[i]);
            printf("\n");
        }
        else {
            printf("The result of the participant who took %d place - %d donuts.\n", ++flag, array[i]);
        }
    }
    if ((i != size) && (size > 3)) {
        printf("The worst result corresponds to %d donuts.\n", array[size - 1]);
    }
    printf("\n");
}
 
int Menu() {
    int choice = 0;
    printf("\t1 - Outputting the result using Bubble sort.\n");
    printf("\t2 - Outputting the result using Insert sort.\n");
    printf("\t3 - Outputting the result using Selection sort.\n");
    scanf("%d", &choice);
    while (choice<1 || choice >3){
        printf("Incorrect choice. Enter again:");
        scanf("%d", &choice);
    }
    return choice;
}

