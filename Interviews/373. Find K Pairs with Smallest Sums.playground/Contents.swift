/*
 Input: nums1 = [1,7,11], nums2 = [2,4,6], k = 3
 Output: [[1,2],[1,4],[1,6]]
 Explanation: The first 3 pairs are returned from the sequence: [1,2],[1,4],[1,6],[7,2],[7,4],[11,2],[7,6],[11,4],[11,6]
 */

func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
    
    var index1 = 0
    var index2 = 0
    var counter = k
    var values = [[Int]]()
    while k > 0 && index1 < nums1.count && index1 < nums1.count {
        if values.isEmpty {
            values.append([index1,index2])
            if nums1[index1 + 1] < nums2[index2 + 1] {
                index2 + 1
            } else {
                
            }
        }
    }
}
