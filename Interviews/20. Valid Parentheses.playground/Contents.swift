


func isValid(_ s: String) -> Bool {

    let hash = ["(":")", "[":"]", "{":"}"]
    var stack = [String]()
    
    for char in s {
        let character = String(char)
        if let last = stack.last {
            if hash[last] == character {
                stack.removeLast()
            } else {
                stack.append(character)
            }
        } else if hash[character] == nil {
            return false
        } else {
            stack.append(character)
        }
    }
    
    return stack.isEmpty
}
