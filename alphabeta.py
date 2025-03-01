import math

# Define the board size and player markers
EMPTY = 0
PLAYER_X = 1  # AI (maximizing player)
PLAYER_O = -1  # Opponent (minimizing player)

# Function to evaluate the board
def evaluate(board):
    # Check for a win
    # Check rows, columns, and diagonals for the winner
    for row in range(3):
        if board[row][0] == board[row][1] == board[row][2] != EMPTY:
            return board[row][0]  # Return 1 for X (AI) and -1 for O (opponent)
    
    for col in range(3):
        if board[0][col] == board[1][col] == board[2][col] != EMPTY:
            return board[0][col]
    
    if board[0][0] == board[1][1] == board[2][2] != EMPTY:
        return board[0][0]
    
    if board[0][2] == board[1][1] == board[2][0] != EMPTY:
        return board[0][2]
    
    return 0  # No winner yet

# Function to check if the game is over (win or draw)
def is_terminal(board):
    return evaluate(board) != 0 or not any(EMPTY in row for row in board)

# Generate all possible moves for the current player
def generate_moves(board):
    moves = []
    for i in range(3):
        for j in range(3):
            if board[i][j] == EMPTY:
                moves.append((i, j))
    return moves

# Apply a move to the board
def apply_move(board, move, player):
    i, j = move
    new_board = [row[:] for row in board]  # Make a copy of the board
    new_board[i][j] = player
    return new_board

# Alpha-Beta Pruning function
def alpha_beta_pruning(board, depth, alpha, beta, maximizing_player):
    # If the depth is 0 or the game is over, return the evaluation of the board
    if depth == 0 or is_terminal(board):
        return evaluate(board)
    
    if maximizing_player:
        max_eval = -math.inf
        # Generate all possible moves for the maximizing player (AI)
        for move in generate_moves(board):
            # Apply the move and get the evaluation
            new_board = apply_move(board, move, PLAYER_X)
            eval = alpha_beta_pruning(new_board, depth - 1, alpha, beta, False)
            max_eval = max(max_eval, eval)
            alpha = max(alpha, eval)
            # Pruning
            if beta <= alpha:
                break
        return max_eval
    else:
        min_eval = math.inf
        # Generate all possible moves for the minimizing player (opponent)
        for move in generate_moves(board):
            # Apply the move and get the evaluation
            new_board = apply_move(board, move, PLAYER_O)
            eval = alpha_beta_pruning(new_board, depth - 1, alpha, beta, True)
            min_eval = min(min_eval, eval)
            beta = min(beta, eval)
            # Pruning
            if beta <= alpha:
                break
        return min_eval

# Driver function to find the best move for the AI
def best_move(board, depth):
    best_val = -math.inf
    best_move = None
    # Generate all possible moves for the maximizing player (AI)
    for move in generate_moves(board):
        # Apply the move and get the evaluation
        new_board = apply_move(board, move, PLAYER_X)
        move_val = alpha_beta_pruning(new_board, depth - 1, -math.inf, math.inf, False)
        if move_val > best_val:
            best_val = move_val
            best_move = move
    return best_move

# Function to print the board
def print_board(board):
    for row in board:
        print(' '.join(str(cell) for cell in row))
    print()

# Example usage
if __name__ == "__main__":
    board = [
        [EMPTY, EMPTY, EMPTY],
        [EMPTY, EMPTY, EMPTY],
        [EMPTY, EMPTY, EMPTY]
    ]
    
    depth = 3  # Set depth of search
    print("Initial board:")
    print_board(board)
    
    move = best_move(board, depth)
    print(f"Best move for AI (X): {move}")
    
    # Apply the best move for AI
    board = apply_move(board, move, PLAYER_X)
    print("Board after AI's move:")
    print_board(board)
