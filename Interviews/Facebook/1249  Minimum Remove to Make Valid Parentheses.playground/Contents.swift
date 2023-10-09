func minRemoveToMakeValid(_ s: String) -> String {
    
    let array = Array(s)
    var hash = [[Int:Int]]()
    var finalString = ""
    
    for (_, value) in array.enumerated() {
        if hash.last?.first?.key == 1 && value == ")" {
            hash.removeLast()
            finalString.append(contentsOf: ")")
        } else if hash.last?.first?.key == nil && value == ")" {
            continue
        } else if value == "(" {
            hash.append([1:finalString.count])
            finalString.append(contentsOf: "(")
        } else {
            finalString.append(value)
        }
    }

    
    let index = hash.count - 1
    for current in 0..<hash.count {
        finalString.remove(at: finalString.index(finalString.startIndex, offsetBy: hash[index - current].values.first!))
    }
    
    return finalString
}
