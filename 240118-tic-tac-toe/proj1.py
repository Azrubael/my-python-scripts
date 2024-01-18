from random import randint


def display_board(board):
    """ The function accepts one parameter containing the board's current status and prints it out to the console. """
    lineH = "+-------+-------+-------+"
    lineE = "|       |       |       |"
    for row in board:
        print(lineH)
        print(lineE)
        print(f"|   {row[0]}   |   {row[1]}   |   {row[2]}   |")
        print(lineE)
    print(lineH)


def make_list_of_free_fields(board):
    """ The function browses the board and builds a list of all the free squares the list consists of tuples, while each tuple is a pair of row and column numbers. """
    free_cells = []
    num = 1
    for row in range(3):
        for cell in range(3):
            if type(board[row][cell]) == int:
                free_cells.append((row, cell, num))
            num += 1
    if free_cells == []:
        print("The game ends with a tie!")
        quit()
    return free_cells


def enter_move(board):
    """ The function accepts the board's current status, asks the user about their move, checks the input, and updates the board according to the user's decision. """
    user_input = input("Enter your move: ")
    if user_input == 'q':  quit()
    updated_board = []
    try:
        user_move = int(user_input)
        if user_move == 0:
            print(f"Wrong input. Please repeat Your input [1-9]: ")
            return None
        free_cells = make_list_of_free_fields(board)
        is_taken = True
        for i in free_cells:
            if i[2] == user_move:
                is_taken = False
                updated_board = board.copy()
                updated_board[i[0]][i[1]] = 'O'
                break
        if is_taken:
            print("This cell is already taken. Please input [1-9]: ")
            return None
        
        return updated_board
    except (TypeError, ValueError):
        print("Wrong input. Please enter a digit [1-9]")
        return None


def victory_for(board, sign):
    """ The function analyzes the board's status in order to check if the player using 'O's or 'X's has won the game """
    victory = None
    for r in range(3):
        if board[r][0] == sign and board[r][1] == sign and board[r][2] == sign: 
            victory = sign
    for c in range(3):
        if board[0][c] == sign and board[1][c] == sign and board[2][c] == sign:
            victory = sign
    if board[0][0] == sign and board[1][1] == sign and board[2][2] == sign:
        victory = sign
    if board[0][2] == sign and board[1][1] == sign and board[2][0] == sign:
        victory = sign

    if victory:
        if victory == 'O':
            print("Player WON!")
        else:
             print("Computer WON!")
        quit()
    return victory


def draw_move(board):
    """ The function draws the computer's move and updates the board. """
    free_cells = make_list_of_free_fields(board)
    is_moved = False
    updated_board = []
    while not is_moved:
        computer_move = randint(1,9)
        for i in free_cells:
            if i[2] == computer_move:
                is_moved = True
        if is_moved: break
    updated_board = board.copy()
    updated_board[i[0]][i[1]] = 'X'
    return updated_board


board = [
    [1,2,3],
    [4,'X',6],
    [7,8,9] ]
player = 'O'
computer = 'X'
game_over = False
turn_counter = 1

print("Tic-Tac-Toe")
while turn_counter < 9 or not game_over:
    make_list_of_free_fields(board)
    display_board(board)
    user_move = enter_move(board)
    if user_move:
        display_board(board)
        board = user_move
        victory_for(board, 'O')
        turn_counter += 1
        draw_move(board)
        display_board(board)
        victory_for(board, 'X')
        turn_counter += 1
    else:
        continue

print("The game ends with a tie!")