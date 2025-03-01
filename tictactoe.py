def print_board(board):
    for i in range(3):
        print(" | ".join(board[i]))
        if i < 2:
            print("---------")
    
# Function to check if a player has won
def check_win(board, player):
    # Check rows, columns, and diagonals
    for i in range(3):
        if all([cell == player for cell in board[i]]):  # Check row
            return True
        if all([board[j][i] == player for j in range(3)]):  # Check column
            return True
    if board[0][0] == player and board[1][1] == player and board[2][2] == player:  # Check diagonal
        return True
    if board[0][2] == player and board[1][1] == player and board[2][0] == player:  # Check anti-diagonal
        return True
    return False

# Function to check if the board is full
def is_full(board):
    for row in board:
        if ' ' in row:
            return False
    return True

# Function to play Tic Tac Toe
def play_game():
    board = [[' ' for _ in range(3)] for _ in range(3)]
    players = ['X', 'O']
    turn = 0

    while True:
        print_board(board)
        print(f"Player {players[turn % 2]}'s turn")

        # Get the position from the current player
        while True:
            try:
                row, col = map(int, input("Enter row and column (0-2) separated by space: ").split())
                if board[row][col] != ' ':
                    print("This position is already taken. Try again.")
                else:
                    board[row][col] = players[turn % 2]
                    break
            except (ValueError, IndexError):
                print("Invalid input. Please enter row and column values between 0 and 2.")
        
        # Check if the current player won
        if check_win(board, players[turn % 2]):
            print_board(board)
            print(f"Player {players[turn % 2]} wins!")
            break
        
        # Check if the board is full (draw)
        if is_full(board):
            print_board(board)
            print("It's a draw!")
            break
        
        # Switch to the next player
        turn += 1

# Start the game
play_game()
