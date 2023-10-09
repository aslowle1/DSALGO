func maxPalinSubsequence(_ str: String) -> Int {
    
    if str.count == 1 {
        return 1
    }
    
    if str.isEmpty {
        return 0
    }
    
    let first = str.first!
    let last = str.last!
    
    var sum = 0
    if first == last {
        var copyStr = str
        copyStr.removeFirst()
        copyStr.removeLast()
        sum += 2
        sum += maxPalinSubsequence(copyStr)
    } else {
        
        var left = str
        left.removeFirst()
        
        var right = str
        right.removeLast()
        sum += max(maxPalinSubsequence(left), maxPalinSubsequence(right))
        
    }
    return sum
}


print(maxPalinSubsequence("lol"))
