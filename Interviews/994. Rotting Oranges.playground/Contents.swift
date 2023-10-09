






func orangesRotting(_ grid: [[Int]]) -> Int {
    
    var rottedLoc = [(Int, Int)]()
    var freshCount = 0
    var visited = [String]()
    for row in 0..<grid.count {
        for col in 0..<grid[row].count {
            if grid[row][col] == 2 {
                rottedLoc.append((row,col))
            } else if grid[row][col] == 1 {
                freshCount += 1
            } else {
                visited.append("\(row),\(col)")
            }
        }
    }
    
    if freshCount == 0 {
        return 0
    }
    freshCount += 1
    var rottedCount = rottedLoc.count
    var queue = [rottedLoc]
    var steps = 1
    
    while !queue.isEmpty {
        let rot = queue.removeFirst()
        
        var paths = [(Int, Int)]()
        
        for loc in rot {
            paths.append(contentsOf: [(loc.0 + 1, loc.1), (loc.0, loc.1 + 1), (loc.0 - 1, loc.1), (loc.0, loc.1 - 1)])
        }
        var newOranges = [(Int, Int)]()
        for path in paths {
            if path.0 < 0 || path.1 < 0 || path.0 >= grid.count || path.1 >= grid[0].count || visited.contains("\(path.0),\(path.1)") {
                continue
            }
            visited.append("\(path.0),\(path.1)")
            freshCount -= 1
            newOranges.append(path)
        }
        steps += 1
        
        if !newOranges.isEmpty {
            queue.append(newOranges)
        }
        print(freshCount)
    }
    
    return freshCount == 0 ? steps : -1
}

print(orangesRotting([[0,2]]))
