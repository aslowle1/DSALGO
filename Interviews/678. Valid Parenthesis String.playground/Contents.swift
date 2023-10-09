
func checkValidString(_ s: String) -> Bool {
    var low = 0
    var high = 0
    
    for char in s {
        low += char == "(" ? 1 : -1
        high += char != ")" ? 1 : -1
        if high < 0 {
            break
        }
        low = max(low, 0)
    }
    
    return low == 0
}



func checkValidString(_ s: String) -> Bool {
    
    if s.isEmpty {
        return true
    }
    
    var index = 0
    var stack = ""
    while index < s.count {
        print(index)
        let char = "\(s[s.index(s.startIndex, offsetBy: index)])"
        if char == "(" {
            stack.append("(")
            index += 1
        } else if char == ")" {
            if stack.isEmpty {
                
                return false
            } else if stack.last == "(" {
                index += 1
                _ = stack.removeLast()
            }
        } else {
            break
        }
    }

    if index == s.count && stack.isEmpty {
        return true
    } else if index == s.count && !stack.isEmpty {
        return false
    }
    
    let diff = s.index(s.startIndex, offsetBy: index + 1)
    
    let newString = String(s[diff...])
    
    let emptyString = stack + newString
    
    let leadString = stack + "(" + newString

    let trailingString = stack + ")" + newString
    
    return checkValidString(emptyString) || checkValidString(leadString) || checkValidString(trailingString)
}

print(checkValidString("(*))"))
