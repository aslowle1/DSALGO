


func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
     
    var graph = toGraph(edges)
    var visited = [Int]()
    var queue = [0]
    var last = -1
    while !queue.isEmpty {
        let first = queue.removeFirst()
        visited.append(first)
        for item in graph[first]! {
            if visited.contains(item) && item != last {
                return false
            } else if visited.contains(item) {
                continue
            }
            queue.append(item)
        }
        last = first
    }
    
    return true
    
}

func toGraph(_ edges: [[Int]]) -> [Int:[Int]] {
    
    
    
    
    var graph = [Int:[Int]]()
    
    for edge in edges {
        let first = edge[0]
        let second = edge[1]
        
        if graph[first] == nil { graph[first] = [] }
        if graph[second] == nil { graph[second] = [] }
        
        graph[first]!.append(second)
        graph[second]!.append(first)

    }
    
    return graph
}
