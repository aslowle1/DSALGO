

func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
    
    var total = 0
    for index in 0..<nums.count {
        total += traverse(Array(nums[index...]), k)
    }
    
    return total
}


func traverse(_ nums: [Int], _ k: Int) -> Int {
    var lastVal = nums[0] <= k ? 1: 0
    if lastVal == 0 {
        return 0
    }
    var product = nums[0]
    for index in 1..<nums.count {
        let value = nums[index]
        if product * value < k {
            lastVal += 1
            product = product * value
        } else {
            break
        }
    }
    return lastVal
}

print(numSubarrayProductLessThanK([10,5,2,6], 100))
