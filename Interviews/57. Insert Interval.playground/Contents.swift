func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    
    if intervals.isEmpty {
        return [newInterval]
    }
    
    var results = [[Int]]()
    var isInserted = false
    for interval in intervals {
        if !isInserted {
            if interval[1] >= newInterval[0] && interval[0] <= newInterval[1] {
                var min = min(newInterval[0], interval[0])
                var max = max(newInterval[1], interval[1])
                results.append([min, max])
                isInserted = true
            } else if newInterval[0] < interval[0] {
                results.append(newInterval)
                results.append(interval)
                isInserted = true
            } else {
                results.append(interval)
            }
        } else {
                                if let last = results.last {
                    if last[1] >= interval[0] {
                var min = min(last[0], interval[0])
                var max = max(last[1], interval[1])
                        results[results.count - 1] = [min, max]
                    } else {
                        results.append(interval)
                    }
                }
        }
    }
    
    if !isInserted {
        results.append(newInterval)
    }
    
    return results
}
