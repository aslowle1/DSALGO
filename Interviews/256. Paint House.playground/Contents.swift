
var hash = [String: Int]()
func minCost(_ costs: [[Int]]) -> Int {
    
    var minVal = 11100000000
    for col in 0..<costs[0].count {
        minVal = min(traverse(costs, 0, col), minVal)
    }
    
    return minVal
}

func traverse(_ costs: [[Int]], _ row: Int, _ col: Int) -> Int {
    
    if let val = hash["\(row),\(col)"] {
        return val
    }
    
    if row == costs.count - 1 {
        return costs[row][col]
    }
    
    var paths = [(Int, Int)]()
    
    for index in (col..<costs[0].count) {
        if index == col {
            continue
        }
        let val = costs[0].count - index
        paths.append((row + 1, col + val))
    }
    
    for index in (0..<col) {
        let val = index - col
        paths.append((row + 1, col + val))
    }
    
    var value = 1000000000
    
    for path in paths {
        if path.0 >= costs.count || path.1 >= costs[0].count || path.1 < 0 {
            continue
        }
        value = min(traverse(costs, path.0, path.1), value)
    }
    hash["\(row),\(col)"] = (value == 1000000000) ? 0 : value + costs[row][col]
    return (value == 1000000000) ? 0 : value + costs[row][col]
}

print(minCost([[3,5,3],[6,17,6],[7,13,18],[9,10,18]]))
