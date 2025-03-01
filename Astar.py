import heapq

# A* algorithm
class AStar:
    def __init__(self, grid, start, goal):
        self.grid = grid  # The grid (matrix) of the environment
        self.start = start  # Starting node (x, y)
        self.goal = goal  # Goal node (x, y)
        self.open_list = []  # Nodes to be evaluated
        self.closed_list = set()  # Nodes already evaluated
        self.came_from = {}  # Path to reconstruct the final path
        self.g_score = {start: 0}  # Cost from start to node
        self.f_score = {start: self.heuristic(start)}  # Estimated total cost

    def heuristic(self, node):
        """Heuristic function (Manhattan Distance)"""
        return abs(node[0] - self.goal[0]) + abs(node[1] - self.goal[1])

    def get_neighbors(self, node):
        """Get the neighbors of the current node"""
        neighbors = []
        for dx, dy in [(-1, 0), (1, 0), (0, -1), (0, 1)]:  # 4 neighbors (up, down, left, right)
            x, y = node[0] + dx, node[1] + dy
            if 0 <= x < len(self.grid) and 0 <= y < len(self.grid[0]) and self.grid[x][y] != 1:
                neighbors.append((x, y))
        return neighbors

    def reconstruct_path(self, current):
        """Reconstruct the path from the goal to the start"""
        path = []
        while current in self.came_from:
            path.append(current)
            current = self.came_from[current]
        path.append(self.start)
        path.reverse()
        return path

    def run(self):
        """Run the A* algorithm to find the shortest path"""
        heapq.heappush(self.open_list, (self.f_score[self.start], self.start))

        while self.open_list:
            _, current = heapq.heappop(self.open_list)

            if current == self.goal:
                return self.reconstruct_path(current)

            self.closed_list.add(current)

            for neighbor in self.get_neighbors(current):
                if neighbor in self.closed_list:
                    continue

                tentative_g_score = self.g_score[current] + 1  # Assume cost between nodes is 1
                if neighbor not in self.g_score or tentative_g_score < self.g_score[neighbor]:
                    self.came_from[neighbor] = current
                    self.g_score[neighbor] = tentative_g_score
                    self.f_score[neighbor] = tentative_g_score + self.heuristic(neighbor)
                    heapq.heappush(self.open_list, (self.f_score[neighbor], neighbor))

        return None  # No path found


# Example usage:

# 0 represents free space, 1 represents obstacles
grid = [
    [0, 0, 0, 0, 0],
    [0, 1, 0, 1, 0],
    [0, 1, 0, 0, 0],
    [0, 0, 0, 1, 0],
    [0, 0, 0, 0, 0]
]

start = (0, 0)  # Starting position (row, col)
goal = (4, 4)   # Goal position (row, col)

astar = AStar(grid, start, goal)
path = astar.run()

if path:
    print("Path found:", path)
else:
    print("No path found.")
