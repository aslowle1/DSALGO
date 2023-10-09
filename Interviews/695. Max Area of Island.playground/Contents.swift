func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    
    var maximum = -1
    var visited = [String]()
    for row in 0..<grid.count {
        for col in 0..<grid[row].count {
            guard grid[row][col] == 1 else {
                continue
            }
            maximum = max(traverseGraph(grid, row, col, &visited), maximum)
        }
    }
    return maximum == -1 ? 0 : maximum
}

func traverseGraph(_ grid: [[Int]], _ row: Int, _ col: Int, _ visited: inout [String]) -> Int {
    
    if visited.contains("\(row),\(col)") {
        return 0
    }
    
    visited.append("\(row),\(col)")
    
    let paths = [(row + 1, col), (row , col + 1), (row - 1, col), (row, col - 1)]
    
    var count = 1
    for path in paths {
        if path.0 < 0 || path.1 < 0 || path.0 >= grid.count || path.1 >= grid[0].count || visited.contains("\(path.0),\(path.1)") || grid[path.0][path.1] == 0 {
            continue
        }
        count += traverseGraph(grid, path.0, path.1, &visited)
    }
    return count
}


print(maxAreaOfIsland(
      [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]))
