#include <stdio.h> 
#include <stdlib.h>
#include <malloc.h>
 
struct node 
{ 
    int data_element; 
    struct node *next; 
}; 
void displayNode(struct node *n) // Function to display the linked list
{ 
    while (n != NULL) { 
        printf("%d\n", n->data_element); 
        n = n->next; 
    } 
}
int main() 
{
    printf("Children's game\n");
    /* Linked list with 4 children*/
    struct node *first = NULL; 
    struct node *second = NULL; 
    struct node *third = NULL; 
    struct node *fourth = NULL;  
    first = (struct node*)malloc(sizeof(struct node)); /* Dynamic memory allocation */
    second = (struct node*)malloc(sizeof(struct node)); 
    third = (struct node*)malloc(sizeof(struct node)); 
    fourth = (struct node*)malloc(sizeof(struct node));
    int number1=0;
    printf("The leader thinks \n"); 
    scanf("%d", &number1);
    first->data_element = number1; // Assigning data to the first node 
    first->next = second; // Linking the first node with the second node
    int number2=number1+5;
    second->data_element = number2; // Assigning data to the second node 
    second->next = third; // Linking the second node with the third node 
    number2+=4;
    third->data_element = number2; // Assigning data to the third node
    third->next = fourth; // Linking the third node with the fourth node 
    number2-=9;
    fourth->data_element = number2; // Assigning data to the fourth node
    fourth->next = NULL; // Since fourth is the last node, it does not point to any other data element.
                         // NULL denotes the termination of the linked list 
    displayNode(first); 
    if (number1==number2)
    printf("Children win! \n"); 
    else
    printf("The leader wins \n"); 
    return 0; 
}