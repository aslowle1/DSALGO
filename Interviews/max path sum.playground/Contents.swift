
func maxPathSum(_ values: [[Int]]) -> Int {
    var visited = [String: Int]()
    return traverse(values, &visited, 0, 0)
}


func traverse(_ values: [[Int]], _ visited: inout [String: Int], _ row: Int, _ col: Int) -> Int {
    if let value = visited["\(row),\(col)"] {
        return value
    }
    
    let paths = [(row + 1, col), (row, col + 1)]
    var sum = values[row][col]
    var maximum = 0
    for path in paths {
        if path.0 < 0 ||  path.1 < 0 || path.0 >= values.count || path.1 >= values[0].count {
            continue
        }
        maximum = max(traverse(values, &visited, path.0, path.1), maximum)
    }
    
    sum += maximum
    visited["\(row),\(col)"] = sum
    return sum
}

print(maxPathSum([
    [1, 2, 8, 1],
    [3, 1, 12, 10],
    [4, 0, 6, 3],
  ]))
