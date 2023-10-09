func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var hash = [Int:Bool]()
    var intersection = Set<Int>()
    for num in nums1 {
        hash[num] = true
    }
    for num in nums2 {
        if hash[num] != nil {
            intersection.insert(num)
        }
    }
    return Array(intersection)
}
