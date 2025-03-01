from itertools import permutations
import sys

# Brute Force Approach (Naive Backtracking)
def tsp_brute_force(graph, start=0):
    n = len(graph)
    vertices = list(range(n))
    vertices.remove(start)
    min_path = sys.maxsize
    best_route = None
    
    for perm in permutations(vertices):
        current_pathweight = 0
        k = start
        
        for j in perm:
            current_pathweight += graph[k][j]
            k = j
        current_pathweight += graph[k][start]  # Return to start node
        
        if current_pathweight < min_path:
            min_path = current_pathweight
            best_route = (start,) + perm + (start,)
    
    return min_path, best_route

# Dynamic Programming Approach (Held-Karp Algorithm)
def tsp_dynamic_programming(graph):
    n = len(graph)
    dp = [[None] * (1 << n) for _ in range(n)]
    
    def tsp(mask, pos):
        if mask == (1 << n) - 1:
            return graph[pos][0]
        
        if dp[pos][mask] is not None:
            return dp[pos][mask]
        
        min_cost = sys.maxsize
        for city in range(n):
            if (mask & (1 << city)) == 0:
                new_cost = graph[pos][city] + tsp(mask | (1 << city), city)
                min_cost = min(min_cost, new_cost)
                
        dp[pos][mask] = min_cost
        return min_cost
    
    return tsp(1, 0)

# Example Usage
graph = [
    [0, 10, 15, 20],
    [10, 0, 35, 25],
    [15, 35, 0, 30],
    [20, 25, 30, 0]
]

# Brute Force Solution
min_cost_brute, route_brute = tsp_brute_force(graph)
print("Brute Force TSP:")
print("Minimum Cost:", min_cost_brute)
print("Route:", route_brute)

# Dynamic Programming Solution
min_cost_dp = tsp_dynamic_programming(graph)
print("\nDynamic Programming TSP:")
print("Minimum Cost:", min_cost_dp)
