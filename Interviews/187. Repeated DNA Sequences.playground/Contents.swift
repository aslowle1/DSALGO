func findRepeatedDnaSequences(_ s: String) -> [String] {
    
    var stack = Set<String>()
    var duplicates = [String]()
    var current = ""
    
    for letter in s {
        current.append(letter)
        if current.count == 10 {
            if stack.contains(current) {
                duplicates.append(current)
            } else {
                stack.insert(current)
            }
            current.removeFirst()
        }
    }
    print(current)
    return duplicates
}

print(findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"))
