from collections import deque

def bfs(graph, start):
    visited = set()  
    queue = deque([start])  
    
    while queue:
        node = queue.popleft()  
        if node not in visited:
            print(node, end=' ')
            visited.add(node)
            

            queue.extend(graph[node])


graph = {
    '0': ['1', '2'],
    '1': ['0', '3', '4'],
    '2': ['0', '4'],
    '3': ['1'],
    '4': ['1', '2']
}
bfs(graph, '0')
