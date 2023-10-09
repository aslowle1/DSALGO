/*
 Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
 */


func merge(_ intervals: [[Int]]) -> [[Int]] {
    
    if intervals.count == 1 {
        return intervals
    }
    
    let mid = Int(intervals.count/2)
    
    let left = merge(Array(intervals[0..<mid]))
    let right = merge(Array(intervals[mid...]))
    print(left)
    print(right)
    var result = [[Int]]()
    var leftIndex = 0
    var rightIndex = 0
    
    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex][0] < right[rightIndex][0] {
            if result.isEmpty {
                result.append(left[leftIndex])
            } else {
                let last = result.last!
                
                if last[1] >= left[leftIndex][0] {
                    let first = min(last[0], left[leftIndex][0])
                    let last = max(last[1], left[leftIndex][1])
                    result[result.count - 1] = [first, last]
                } else {
                    result.append(left[leftIndex])
                }
            }
            
            leftIndex += 1
        } else {
            if result.isEmpty {
                result.append(right[rightIndex])
            } else {
                let last = result.last!
                
                if last[1] >= right[rightIndex][0] {
                    let first = min(last[0], right[rightIndex][0])
                    let last = max(last[1], right[rightIndex][1])
                    result[result.count - 1] = [first, last]
                } else {
                    result.append(right[rightIndex])
                }
            }
            
            rightIndex += 1
        }
    }
    
    if leftIndex < left.count {
        while leftIndex < left.count  {
            if result.isEmpty {
                result.append(left[leftIndex])
            } else {
                let last = result.last!
                
                if last[1] >= left[leftIndex][0] {
                    let first = min(last[0], left[leftIndex][0])
                    let last = max(last[1], left[leftIndex][1])
                    result[result.count - 1] = [first, last]
                } else {
                    result.append(left[leftIndex])
                }
            }
            
            leftIndex += 1
        }
    } else {
        if result.isEmpty {
            result.append(right[rightIndex])
        } else {
            while rightIndex < right.count  {
                if result.isEmpty {
                    result.append(right[rightIndex])
                } else {
                    let last = result.last!
                    
                    if last[1] >= right[rightIndex][0] {
                        let first = min(last[0], right[rightIndex][0])
                        let last = max(last[1], right[rightIndex][1])
                        result[result.count - 1] = [first, last]
                    } else {
                        result.append(right[rightIndex])
                    }
                }
                
                rightIndex += 1
            }
        }
    }
    
    return result
}


print(merge([[1,3],[2,6],[8,10],[15,18]]))
