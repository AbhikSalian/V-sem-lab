import heapq
Graph_nodes = {
    'S':['A','B','C'],
    'A':['D','E','G'],
    'B':['G'],
    'C':['G']   
   }
def heuristic(n):
    H_dist ={
        'S':8,
        'A':8,
        'B':4,
        'C':3,
        'D':99,
        'E':99,
        'G':0
    }
    return H_dist[n]

def best_first_search(graph,start,goal):
    open =[(heuristic(start),start)]
    closed ={}
    closed[start] =None
    
    while open:
        _,peak_node =heapq.heappop(open)
        
        if peak_node ==goal:
            break
        
        for neighbor in graph[peak_node]:
            if neighbor not in closed:
                heapq.heappush(open, (heuristic(neighbor),neighbor))
                closed [neighbor]=peak_node
                
    return closed
start_node ='S'
goal_node ='G'
closed =best_first_search(Graph_nodes,start_node,goal_node)
print("Closed list",closed)
node= goal_node
path =[node]
    
while node !=start_node:
    node =closed[node]
    path.append(node) 
path.reverse()
print("BFS path from",start_node,"to",goal_node,":",path)