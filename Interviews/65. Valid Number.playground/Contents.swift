
func isNumber(_ s: String) -> Bool {
    if s.isEmpty {
        return false
    }
    return traverse(s, true, false, true, false, false)
}


func traverse(_ s: String, _ plus: Bool, _ e: Bool, _ dec: Bool, _ decUsed: Bool, _ numUsed: Bool) -> Bool {
    
    if s.isEmpty {
        return numUsed
    }
    var stringCopy = s
    let letter = stringCopy.removeFirst()
    
    if Int("\(letter)") != nil {
        return traverse(stringCopy, false, true, decUsed ? false : true, decUsed, true)
    } else if letter == "+" || letter == "-" {
        if plus {
            return traverse(stringCopy, false, false, false, decUsed, false)
        } else {
            return false
        }
    } else if letter == "e" || letter == "E" {
        if e {
            return traverse(stringCopy, true, false, false, true, false)
        } else {
            return false
        }
    } else if letter == "." {
        if dec {
            return traverse(stringCopy, false, false, false, true, false)
        } else {
            return false
        }
    } else {
        return false
    }
}

print(isNumber(".1"))
