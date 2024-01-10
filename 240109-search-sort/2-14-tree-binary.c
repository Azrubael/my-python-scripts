#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <malloc.h>
 
struct tnode {
    int item; 
    int count; 
    struct tnode *left;
    struct tnode *right; 
};
 
struct tnode *addTree (struct tnode *p, int val)// Function for adding a node to the tree
{
    if (p == NULL) {
        p = (struct tnode *) malloc (sizeof (struct tnode));
        p->item =val;
        p-> count = 1;
        p-> left = p-> right = NULL;
        }else if (val < p->item){
            p-> left = addTree (p-> left, val);
        }else{
            p-> right = addTree (p-> right, val);
            p->count++;
        }
    return p;
}
// Function for deleting a subtree
void freemem (struct tnode * tree) {
  if (tree!= NULL) {
      freemem (tree-> left);
      freemem (tree-> right);
      free (tree);
    }
}
 
void displayTreeInf (struct tnode *p) {// Function to display the tree in infix form
  if (p!= NULL) {
    displayTreeInf(p-> left);
    printf ("%d - %d \n", p-> count, p-> item);
    displayTreeInf(p-> right);
  }
}
int main () {
  struct tnode *root;
  int val=0;
  root = NULL;
 
    root = addTree (root, 8);
    root = addTree (root, 6);
    root = addTree (root, 2);
    root = addTree (root, 1);
    root = addTree (root, 3);
    root = addTree (root, 7);
    root = addTree (root, 11);
    displayTreeInf(root);
    freemem (root);
    getchar ();
    return 0;
}