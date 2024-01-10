#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <malloc.h>
#define QMAX 100
 
struct queue {
    int qItem[QMAX];
    int last, first;
};
 
void init(struct queue *q) {//initialization of the queue
    q->first = 1;
    q->last = 0;
}
 
void pushBack(struct queue *q, int x) {//placing element x at the end of the queue q
    if(q->last < QMAX-1) 
    {
        q->last++;
        q->qItem[q->last]=x;
    }else
        printf("The queue is full!\n");
}
 
int isempty(struct queue *q) {//returns 1 if the queue is empty and 0 otherwise
    if(q->last < q->first)   
        return 1;
    else 
        return 0;
}
 
void print(struct queue *q) {
    int count;
    if(isempty(q)==1) {
        printf("The queue is empty!\n");
    }
    for(count = q->first; count<= q->last; count++)
        printf("%d ",q->qItem[count]);
}
 
int popFront(struct queue *q) {//remove element x from queue q;
    int x;
    if(isempty(q)==1) {
        printf("The queue is empty!\n");
        return(0);
    }
    x = q->qItem[q->first];
    q->first++;
    return x;
}
 
int popFrontAll(struct queue *q) {
  int x, count;
  if(isempty(q)==1) {
    printf("The queue is empty!\n");
    return 0;
  }
  x = q->qItem[q->first];
  for(count = q->first; count < q->last; count++) {
    q->qItem[count] = q->qItem[count+1];
  }
  q->last--;
  return x;
}
 
int main() {
  struct queue *q=(struct queue*)malloc(sizeof(struct queue));
  int a;
  init(q);
  print(q);
  for(int i=0;i<8;i++) {
    printf("Enter an element: ");
    scanf("%d", &a);
    pushBack(q, a);
  }
  printf("\n");
  print(q);
  while(q->first <= q->last) {
    a = popFront(q);
    printf("\nThe element %d was removed.\n", a);
    print(q);
  }
  getchar();
  return 0;
}