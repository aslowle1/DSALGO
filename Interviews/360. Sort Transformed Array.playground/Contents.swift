import UIKit


func sortTransformedArray(_ nums: [Int], _ a: Int, _ b: Int, _ c: Int) -> [Int] {
     
    var vals = [Int]()
    
    for num in nums {
        vals.append(getValue(num, a, b, c))
    }
    return mergeSort(vals)
}

func mergeSort(_ nums: [Int]) -> [Int] {
    if nums.count == 1 {
        return nums
    }
    
    let mid = Int(nums.count/2)
    
    let left = mergeSort(Array(nums[0..<mid]))
    let right = mergeSort(Array(nums[mid...]))

    var leftIndex = 0
    var rightIndex = 0
    
    var finalArray = [Int]()
    
    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            finalArray.append(left[leftIndex])
            leftIndex += 1
        } else {
            finalArray.append(right[rightIndex])
            rightIndex += 1
        }
    }
    
    if leftIndex < left.count {
        finalArray.append(contentsOf: left[leftIndex...])
    } else {
        finalArray.append(contentsOf: right[rightIndex...])
    }
    return finalArray
}

func getValue(_ x: Int, _ a: Int, _ b: Int, _ c: Int) -> Int {
    return a*x*x + b*x + c
}

/*
 func sortTransformedArray(_ nums: [Int], _ a: Int, _ b: Int, _ c: Int) -> [Int] {
 
     /// y = a*x*x + b*x + c --> `Parabola`
     /// sign (+/-) of `a` determines whether parabola has its vertex as lowest or highest point.
     /// if a is +ve, then `parabola` looks like `U`
     /// if a is -ve, then `parabola` looks like `Ω`
     /// value of `b` doesn't matter in determining the shape of parabola
     /// We take two pointers left & right pointing to both ends of nums and initialize an empty result array
     /// if a is +ve, fill from the back
     /// if a is -ve, fill from the front
     /// We take an iterator that iterates over `result` array.
     /// If a is +ve, iterator starts from back else starts from front

     let count = nums.count
     var l = 0
     var r = count - 1
     var result = Array(repeating: 0, count: count)

     var iter = a >= 0 ? count - 1 : 0 /// Iterates over result array

     while l <= r {

         if a >= 0 {

             let val1 = quadraticResult(nums[l], a, b, c)
             let val2 = quadraticResult(nums[r], a, b, c)

             if val1 > val2 {
                 result[iter] = val1
                 l += 1
             } else {
                 result[iter] = val2
                 r -= 1
             }

             iter -= 1
         } else {
             let val1 = quadraticResult(nums[l], a, b, c)
             let val2 = quadraticResult(nums[r], a, b, c)

             if val1 < val2 {
                 result[iter] = val1
                 l += 1
             } else {
                 result[iter] = val2
                 r -= 1
             }

             iter += 1
         }
     }

     return result
 }

 func quadraticResult(_ x: Int, _ a: Int, _ b: Int, _ c: Int) -> Int {
     return a*x*x + b*x + c
 }
 */
