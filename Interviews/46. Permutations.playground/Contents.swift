/*
 [1,2,3]
 [1]            [2,3] [3,2] [2,3] [3,2]
                   [2,3] [3,2]
                   [2]
                           [3]
 */



func permute(_ nums: [Int]) -> [[Int]] {
    if nums.count == 0 {
        return []
    }
    if nums.count == 1 {
        return [nums]
    }
    
    var copyNums = nums
    let firstElement = copyNums.removeFirst()
    
    let values = permute(copyNums)
    var result = [[Int]]()
    for value in values {
        for index in 0..<value.count {
            var valueCopy = value
            valueCopy.insert(firstElement, at: index)
            result.append(valueCopy)
        }
        var valueCopy = value
        valueCopy.append(firstElement)
        result.append(valueCopy)
    }
    return result
}

print(permute([1,2,3]))
