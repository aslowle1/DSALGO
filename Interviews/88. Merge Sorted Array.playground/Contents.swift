






func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
    
    var nums2Index = n - 1
    var nums1Index = m - 1
    var travelingIndex = nums1.count - 1
    
    
    while nums2Index >= 0 {
        
        if nums1Index < 0 {
            nums1[travelingIndex] = nums2[nums2Index]
            nums2Index -= 1
            travelingIndex -= 1
            continue
        }
        
        if nums2[nums2Index] > nums1[nums1Index] {
            nums1[travelingIndex] = nums2[nums2Index]
            nums2Index -= 1
        } else {
            nums1[travelingIndex] = nums1[nums1Index]
            nums1Index -= 1
        }
        travelingIndex -= 1
        
    }
}

var nums = [1]
merge(&nums, 1, [], 0)
print(nums)
