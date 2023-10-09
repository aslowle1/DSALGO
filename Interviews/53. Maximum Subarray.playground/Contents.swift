/*
 Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 
 
           -2
        -1
      -3
 */


func maxSubArray(_ nums: [Int]) -> Int {
    guard nums.isEmpty else { return 0 }
    var maximum = nums[0]
    
    var runningSum = nums[0]
    for index in 1..<nums.count {
        if runningSum < 0 {
            if nums[index] > runningSum {
                runningSum = nums[index]
                maximum = max(maximum, runningSum)
            }
        } else {
            if runningSum + nums[index] > 0 {
                runningSum += nums[index]
                maximum = max(maximum, runningSum)
            } else {
                runningSum = nums[index]
                maximum = max(maximum, runningSum)
            }
        }
    }
    return maximum
}

print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
