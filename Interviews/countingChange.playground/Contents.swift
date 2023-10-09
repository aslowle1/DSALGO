

func countingChange(_ target: Int, _ nums: [Int]) -> Int {

    if target == 0 {
        return 1
    }
    
    if target < 0 {
        return 0
    }
    
    var total = 0
    for (index, num) in nums.enumerated() {
        total += countingChange(target - num, Array(nums[index...]))
    }
    
    return total
}

print(countingChange(13, [2, 6, 12, 10]))
