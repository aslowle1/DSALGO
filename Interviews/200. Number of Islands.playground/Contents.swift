func numIslands(_ grid: [[Character]]) -> Int {
    var visited = [String]()
    var islands = 0
    for row in 0..<grid.count {
        for col in 0..<grid[row].count {
            guard !visited.contains("\(row),\(col)") else {
                continue
            }
            if grid[row][col] == "1" {
                islands += 1
                traverse(grid, &visited, row, col)
            }
        }
    }
    return islands
}


func traverse(_ grid: [[Character]], _ visited: inout [String], _ row: Int, _ col: Int) {
 
    if visited.contains("\(row),\(col)") {
        return
    }
    
    visited.append("\(row),\(col)")
    
    let paths = [(row + 1, col), (row, col + 1), (row - 1, col), (row, col - 1)]
    
    for path in paths {
        if path.0 < 0 || path.1 < 0 || path.0 >= grid.count || path.1 >= grid[0].count || grid[path.0][path.1] == "0" {
            continue
        }
        traverse(grid, &visited, path.0, path.1)
    }
}
