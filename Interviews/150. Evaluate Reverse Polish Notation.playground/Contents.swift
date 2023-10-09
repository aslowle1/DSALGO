func evalRPN(_ tokens: [String]) -> Int {
    if tokens.count == 1 {
        return Int(tokens[0])!
    }
    
    var foundNumber = false
    var foundDoubleNumber = false
    var actionFound = false
    var index = 0
    
    while index < tokens.count, !actionFound {
        if !foundNumber {
            if Int(tokens[index]) != nil {
                foundNumber = true
            }
            index += 1
        } else if !foundDoubleNumber {
            if Int(tokens[index]) != nil {
                foundDoubleNumber = true
                index += 1
            } else {
                index += 1
            }
        } else {
            if Int(tokens[index]) == nil {
                actionFound = true
            } else {
                index += 1
            }
        }
    }
    index -= 1
    print(index)
    print(tokens)
    let firstVal = Int(tokens[index - 1])!
    let secondVal = Int(tokens[index])!
    let action = tokens[index + 1]
    print(action)
    print(firstVal)
    var newVal: Int
    switch action {
    case "+": newVal = firstVal + secondVal
    case "-": newVal = firstVal - secondVal
    case "*": newVal = firstVal * secondVal
    default: newVal = firstVal/secondVal
    }

    if index + 1 >= tokens.count - 1 {
        return newVal
    }
    
    var left = tokens[0..<(index - 1)]
    let right = tokens[(index + 2)...]
    print(left)
    print(right)
    left.append("\(newVal)")
    left.append(contentsOf: right)
    
    return evalRPN(Array(left))
}
let val = ["2","1","+","3","*"]
print(evalRPN(val))
