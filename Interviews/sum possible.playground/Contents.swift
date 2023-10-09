/*
 sum possible
 Write a function sumPossible that takes in an amount and an array of positive numbers. The function should return a boolean indicating whether or not it is possible to create the amount by summing numbers of the array. You may reuse numbers of the array as many times as necessary.

 You may assume that the target amount is non-negative.
 
 sumPossible(8, [5, 12, 4]); // -> true, 4 + 4
 
            5
 (8-5)   3(x)
 (3-5)  -2(x)
 
 Keys
 - You Can Repeat Values
 - It's a Sum so a base case can be when zero is reached
 - How can this be broken down? By the target value
 - Combination of continous array
 
 a = amount
 n = length of numbers
 Time: O(a*n)
 Space: O(a)
 
 O(n^a)   numbers time height
 */




func sumPossible(_ target: Int, _ values: [Int]) -> Bool {
    
    if target == 0 {
        return true
    }
    
    if target < 0 {
        return false
    }
    
    for (index, value) in values.enumerated() {
        if sumPossible(target - value, Array(values[index...])) {
            return true
        }
    }
    
    
    return false
}

print(sumPossible(15, [6, 2, 10, 19]))

/*
 A min problem what invalidates this is having an incredible maximum and making the comparison
 */
func minChange(_ target: Int, _ values: [Int]) -> Int {
    
    if target == 0 {
        return 0
    }
    
    if target < 0 {
        return 10000
    }
    
    
    var count = 100000
    for (index, value) in values.enumerated() {
        let result = minChange(target - value, Array(values[index...]))
        count = min(count, result)
    }
    
    count += 1
    
    return count
}

print(minChange(23, [2, 5, 7]))
