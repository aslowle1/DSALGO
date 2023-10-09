func triangleNumber(_ nums: [Int]) -> Int {
    var total = 0
    for index in 0..<nums.count {
        total += traverse(Array(nums[index...]), 3)
    }
    return total
}


func traverse(_ nums: [Int], _ count: Int) -> Int {
print(nums)
    if nums.count < count {
        return 0
    }
    
    if nums.count - 1 == 0 {
        return 1
    }
    
    var total = 0
    for index in 1..<nums.count {
        total += traverse(Array(nums[index...]), count - 1)
    }
    
    return total
}

print(triangleNumber([4,2,3,4]))
