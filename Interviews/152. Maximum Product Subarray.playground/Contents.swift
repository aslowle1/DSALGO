
/*
 [2,3,-2,4]
 
            2
        3
    -2
 */


var maximum: Int = -1000000000
func maxProduct(_ nums: [Int]) -> Int {
    print(nums)
    if nums.isEmpty {
        return 11100000000
    }
    var currentProduct = nums[0]

    for (index, num) in nums.enumerated() {
        guard index != 0 else { continue }
        if num < 0 {
            
            currentProduct = max(maxProduct([currentProduct * num] + nums[(index + 1)...]), currentProduct)
            break
        } else if num == 0 {
            currentProduct = max(0, currentProduct)
            if index >= nums.count {
                break
            } else {
                max(maxProduct(Array(nums[(index + 1)...])), currentProduct)
            }
        } else {
            print(num)
            currentProduct = currentProduct * num
        }
    }
    
    return currentProduct
}

print(maxProduct([-2,0,-1]))
