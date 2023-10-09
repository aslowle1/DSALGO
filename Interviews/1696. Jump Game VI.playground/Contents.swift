/*
 Input: nums = [1,-1,-2,4,-7,3], k = 2
 Output: 7
 Explanation: You can choose your jumps forming the subsequence [1,-1,4,3] (underlined above). The sum is 7.
 
 
                      1
                 -1       -2
              4      -7 -7    3
 */

func maxResult(_ nums: [Int], _ k: Int) -> Int {
    
    if nums.isEmpty {
        return 0
    }
    
    let first = nums[0]

    var values = 0
    for index in 1...k {
        guard nums.count > index else { continue }
        var value = maxResult(Array(nums[index...]), k) + first
        values = max(value, values)
    }
    
    return values
}

print(maxResult([1,-5,-20,4,-1,3,-6,-3], 2))

func rotateString(_ s: String, _ goal: String) -> Bool {
    return rotate(s, goal, s.count - 1)
}

func rotate(_ s: String, _ goal: String, _ count: Int) -> Bool {
    if count == 0 { return false }
    let firstIndex = s.index(s.startIndex, offsetBy: 1)
    let newLetter = String(s[firstIndex...]) + "\(s.first!)"
    
    if newLetter == goal {
        return true
    } else {
        return rotate(newLetter, goal, count - 1)
    }
}
