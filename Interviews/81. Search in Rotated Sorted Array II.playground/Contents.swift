/*
 Example 1:

 Input: nums = [2,5,6,0,0,1,2], target = 0
 Output: true
 Example 2:

 Input: nums = [2,5,6,0,0,1,2], target = 3
 Output: false
 */
func search(_ nums: [Int], _ target: Int) -> Bool {
    
    if nums.count == 1 {
        return nums[0] == target
    }
    
    if nums.last! < nums.first! {
        let mid = Int(nums.count/2)
        if nums[mid] == target {
            return true
        }
        if nums[mid] > nums.last! && target < nums.last! {
            search(nums[(mid + 1)...], target)
        } else {
            
        }
    } else {
        
    }
    
}
