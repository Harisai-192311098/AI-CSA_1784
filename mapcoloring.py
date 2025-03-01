map_graph = {
    'A': ['B', 'C', 'D'],
    'B': ['A', 'C', 'E'],
    'C': ['A', 'B', 'D', 'E'],
    'D': ['A', 'C', 'E'],
    'E': ['B', 'C', 'D']
}

# Define the available colors
colors = ['Red', 'Green', 'Blue']

# Function to check if assigning a color to a region is valid
def is_valid_assignment(region, color, assignment):
    for neighbor in map_graph[region]:
        if neighbor in assignment and assignment[neighbor] == color:
            return False
    return True

# Function for backtracking to assign colors
def map_coloring(assignment, regions):
    if len(assignment) == len(regions):
        return assignment  # All regions are colored
    
    # Select an uncolored region
    uncolored_region = next(region for region in regions if region not in assignment)
    
    # Try assigning each color to the uncolored region
    for color in colors:
        if is_valid_assignment(uncolored_region, color, assignment):
            assignment[uncolored_region] = color
            result = map_coloring(assignment, regions)
            if result:  # If the coloring is valid, return it
                return result
            # If not valid, remove the color and backtrack
            del assignment[uncolored_region]
    
    return None  # No solution found

# Main function to start the coloring process
def solve_map_coloring(map_graph):
    regions = list(map_graph.keys())
    assignment = {}
    solution = map_coloring(assignment, regions)
    
    if solution:
        return solution
    else:
        return "No solution found"

# Solve the map coloring problem
solution = solve_map_coloring(map_graph)
print(solution)
