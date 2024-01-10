/*
The pizza delivery service processes its orders on the first come, first served basis. After a client has paid for his/her order, he/she is added to the online waiting list. After the pizza is ready, the information is passed to a courier, saved to a file, and removed from the waiting list.
Display the number of customers who are currently waiting for an order. (Hint: to implement the task in C, use the structure that describes the concept of an order, with the properties: visitor's name, delivery address, order, total cost. An order is written from the waiting list to the file when it is deleted).
*/

#define _CRT_SECURE_NO_WARNINGS  // for compatibility with classic functions 
#include <stdio.h> 
#include <stdlib.h> 
 
struct order  //creating a structure for an order
{ 
    char name[30]; 
    char address[30]; 
    char pizza[30]; 
    float cost; 
    int quantity; 
    float sum; 
}; 
 
typedef struct order order; 
 
typedef struct queue //creating a structure for the order queue
{ 
    order date;      //order details
    order* head; 
    order* tail; 
    struct queue* next; 
} queue; 
 
queue* head = NULL, * tail = NULL; 
void instructions(); //expected functionality
void insert();       //adding an item to the queue
void removex();      //removing an item from the queue
void quantity();     //counting orders in the queue
void print();        //display of all orders
void fprint();       //saving a completed (deleted) order from the queue
 
int main() 
{ 
    queue* start = NULL; 
    int choice; 
    instructions(); 
    scanf("%d", &choice); 
    while (choice != 0){ 
        switch (choice){ 
            case 1: 
                insert(); break; 
            case 2: 
                fprint(); 
                removex(); 
                break; 
            case 3: 
                quantity(); break; 
            case 4: 
            print(); break; 
            default: 
                printf("Invalid entry. Please try again\n"); break; 
        } 
        instructions(); 
        printf("?\n"); 
        scanf("%d", &choice); 
    } 
    return 0; 
} 
 
void instructions(void) 
{ 
    printf("\n\n1) Add order to the queue\n" 
                "2) Deleting an order from the queue \n" 
                "3) Count orders\n" 
                "4) Output on display\n" 
                "0) Exit the program\n"); 
}  
 
void removex() 
{ 
    queue* p; 
    if (head != NULL) 
    { 
        p = head; 
        head = head->next; 
        free(p); 
        printf(" The order deleted\n"); 
    } 
    else printf("No orders\n"); 
} 
 
 
void insert() { 
    queue* p = head; 
    if(!(p = (queue*)malloc(sizeof(queue))))  
    {	 
        puts("Not enough memory"); 
        getchar();  
        return; 
    } 
    printf("Enter the name\n"); 
    getchar(); 
    fgets(p->date.name,40,stdin); 
    printf("Enter the address:\n"); 
    rewind(stdin); 
    fgets(p->date.address,20,stdin); 
    printf("\n"); 
    printf("Enter the order\n"); 
    int finish=1; 
    p->date.sum=0; 
    while(finish!=0) 
    { 
        printf("Enter the name of the pizza: \n"); 
        rewind(stdin); 
        getchar(); 
        fgets( p->date.pizza,15,stdin); 
        printf("Enter  cost of the pizza:\n"); 
        scanf("%f", &p->date.cost); 
        printf("Enter the quantity\n"); 
        scanf("%d",&p->date.quantity); 
        p->date.sum += p->date.quantity*p->date.cost; 
        printf("Finish order 0-yes 1-no\n"); 
        scanf("%d",&finish); 
    } 
 
    printf(" Total amount  $%.2f\n",p->date.sum); 
    p->next = NULL; 
    if (head == NULL) 
    { 
        head = p; 
    } 
    else tail->next = p; 
    tail = p; 
} 
 
void quantity() 
{ 
    queue* p = head; 
    int count = 0; 
    if (head == NULL) 
        printf("No orders"); 
    else 
    { 
        while (p != NULL) 
        { 
            count++; 
            p = p->next; 
        } 
        printf("Number of clients %d\n", count); 
    } 
} 
 
void print() 
{ 
    int i=1; 
    queue* p = head; 
    if (head != NULL) 
    { 
        printf("______________________________________________\n"); 
        printf("|  Order \n"); 
        printf("______________________________________________\n"); 
        while (p != NULL) 
        { 
            printf("%d| Name %15s| Address %15s| Total amount %.2f", i, p->date.name, p->date.address,p->date.sum); 
            printf("______________________________________________\n"); 
            p = p->next; 
            i++; 
        } 
    } 
    else printf("No orders\n"); 
}  
 
 
void fprint() 
{  
    FILE* f; 
    f = fopen("order.txt", "a"); 
    queue* p = head;      
 
    fprintf(f, "______________________________________________\n"); 
    fprintf(f, " Name %15s| Address %15s| Total amount %.2f\n", p->date.name, p->date.address,p->date.sum); 
    fprintf(f, "______________________________________________\n"); 
    p = p->next; 
    fclose(f); 
} 