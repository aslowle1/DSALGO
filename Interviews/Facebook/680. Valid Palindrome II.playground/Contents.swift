
var didRemove = false

func validPalindrome(_ s: String) -> Bool {
    
    let array = Array(s)
    var start = 0
    var end = s.count - 1
    
    while start < end {
        if array[start] == array[end] {
            start += 1
            end -= 1
        } else {
            break
        }
    }
    
    if start < end && didRemove {
        return false
    } else if start < end {
        let startIndex = s.index(s.startIndex, offsetBy: start)
        let endIndex = s.index(s.startIndex, offsetBy: end)
        let sCopy = String(s[startIndex...endIndex])
        var leftCopy = sCopy
        var rightCopy = sCopy
        leftCopy.removeFirst()
        rightCopy.removeLast()
        didRemove = true
        return validPalindrome(leftCopy) || validPalindrome(rightCopy)
    } else {
        return true
    }
}

print(validPalindrome("abc"))
