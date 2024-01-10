#include <stdio.h>

/*
A new film was released at the cinema. There is 1 hall in the cinema and it can fit 200 spectators. Every day, a different number of tickets were sold for a new film in the first and second weeks of its running. When did the cinema sell more tickets – during the first or the second week? What was the revenue of the cinema in the first two weeks of the movie's distribution, if the price of one ticket is $M?
*/
 
void input(int array[7],int n);   //array input function
void output (int array[7],int n); //array output function
int sum(int array[7],int n);      //cinema revenue calculation function
 
int main()
{
    int a[7],b[7];
    int sum_first,sum_second;
    const int n=7;
 
    printf("Enter the number of tickets sold during the first week\n");
    input(a,n);
    output(a,n);
    printf("\n");
    printf("Enter the number of tickets sold during the second week\n");
    input(b,n);
    output(b,n);
    printf("\n");
    sum_first=sum(a,n);
    printf("%d tickets were sold during the first week\n",sum_first);
    sum_second=sum(b,n);
    printf("%d tickets were sold during the second week\n",sum_second);
 
    if(sum_first >sum_second) 
        printf("In the first week, the cinema sold %d more tickets than in the second one.\n",sum_first - sum_second);
    else if(sum_first < sum_second)
        printf("In the second week, the cinema sold %d more tickets than in the first one.\n",sum_second - sum_first);
    else printf("The cinema sold the same number of tickets in the first week as in the second week.");
 
    int pr,t;
    printf("Enter ticket price\n");
    scanf("%d",&pr);
    t = pr*(sum_first+sum_second);
 
    printf("The total cinema's revenue for two weeks was $%d.\n",t);
}
 
void input(int array[7],const int n)
{ 
    int i;
    for(i=0;i<n;i++)
    {
        printf("Enter the number of tickets sold in day %d - ",i+1);
        scanf("%d",&array[i]);
        if(array[i]>200)
        {
            while(array[i]>200)
            {
                printf("The hall is full. Enter again\n");
                scanf("%d",&array[i]);
            }
        }
    }
}
 
 
void output(int array[7],const int n)
{
    int i;
    for(i=0;i<n;i++)
        printf("%d ", array[i]);
}
 
int sum(int array[7],const int n)
{  
    int i, sum=0;
    for(i=0;i<n;i++)
        sum+=array[i];
    return sum;
}

