/*
Чтобы перевернуть слово, поместите данное слово в стек (букву за буквой), а затем извлеките буквы из стека.
*/

#include <stdio.h>
#include <stdlib.h>
 
typedef struct item {
	char data; 
	struct item *next; 
} Item;
 
void Push(void);
void Display(void);
Item* top = NULL; //stack pointer
 
int main() {
    int n;
    printf("Enter the number of letters in the word\n");
    scanf("%d",&n);
    printf("Enter the word letter by letter\n");
    for(int i=0;i<n*2;i++)
    Push();
    printf("Reverse the word\n");
    Display();
	return 0;
}
 
void Push(void) {
    Item* p;
	p = (Item *)malloc(sizeof(Item));  //dynamic memory allocation
	scanf("%c", &p->data);
 
	p->next = top;
	top = p;
}
 
void Display(void) 
{
	Item* p = top;
	if (p == NULL) printf("Stack is empty");
	else 
	while (p != NULL) {
		printf("%c", p->data);
		p = p->next;
	}
}

