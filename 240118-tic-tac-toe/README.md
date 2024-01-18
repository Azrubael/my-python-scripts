A simple program which pretends to play tic-tac-toe with the user. To make it all easier for you, we've decided to simplify the game. Here are our assumptions:

* the computer (i.e., your program) should play the game using 'X's;
* the user (e.g., you) should play the game using 'O's;
* the first move belongs to the computer − it always puts its first 'X' in the middle of the board;
* all the squares are numbered row by row starting with 1 (see the example session below for reference)
* the user inputs their move by entering the number of the square they choose − the number must be valid, i.e., it must be an integer, it must be greater than 0 and less than 10, and it cannot point to a field which is already occupied;
* the program checks if the game is over − there are four possible verdicts: the game should continue, the game ends with a tie, you win, or the computer wins;
* the computer responds with its move and the checkb is repeated;
* it don't implement any form of artificial intelligence − a random field choice made by the computer is good enough for the game.

Features:
- the board should be stored as a three-element list, while each element is another three-element list (the inner lists represent rows) so that all of the squares may be accessed using the following syntax:
                board[row][column] 
- each of the inner list's elements can contain 'O', 'X', or a digit representing the square's number (such a square is considered free)
- the board's appearance should be exactly the same as the one presented in the example.
- implement the functions defined for you in the editor.

