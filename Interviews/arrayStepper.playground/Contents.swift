func arrayStepper(_ nums: [Int]) -> Bool {
    
    if nums.count == 1 {
        return true
    }
    
    let firstElement = nums[0]
    print(firstElement)
    guard firstElement != 0 else { return false }
    
    var didSucceedd = false
    for index in 1...firstElement {
        guard index < nums.count else { continue }
        if arrayStepper(Array(nums[index...])) {
            didSucceedd = true
        }
    }
    return didSucceedd
}

print(arrayStepper([3, 1, 3, 1, 0, 1]))
