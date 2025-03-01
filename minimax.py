import math

def minimax(depth, node_index, is_max, scores, height):
    # Base case: when the leaf node is reached
    if depth == height:
        return scores[node_index]
    
    if is_max:
        return max(minimax(depth + 1, node_index * 2, False, scores, height),
                   minimax(depth + 1, node_index * 2 + 1, False, scores, height))
    else:
        return min(minimax(depth + 1, node_index * 2, True, scores, height),
                   minimax(depth + 1, node_index * 2 + 1, True, scores, height))

# Example game tree: depth = 3, binary tree
scores = [3, 5, 2, 9, 12, 5, 23, 23]  # Terminal nodes
height = math.log2(len(scores))  # Calculate the height of the tree

# Running Minimax algorithm
optimal_value = minimax(0, 0, True, scores, height)
print("The optimal value is:", optimal_value)
