func getFactors(_ n: Int) -> [[Int]] {
    print(n)
    if n < 2 {
        return []
    }
    
    var values = [Int]()
    var combo = [[Int]]()
    for value in Array(2...n) {
        guard value != n else { continue }
        if n%value == 0 {
            combo.append([value,(n/value)])
            values.append((n/value))
        }
    }
    
print("here")
    print(values)
    print(combo)
    for value in combo {
        var result1 = getFactors(n/value[0])
        if !result1.isEmpty {
            for (index, _) in result1.enumerated() {
                result1[index].append(value[1])
            }
            combo.append(contentsOf: result1)
        }
        var result2 = getFactors(n/value[1])
        if !result2.isEmpty {
            for (index, _) in result2.enumerated() {
                result2[index].append(value[0])
            }
            combo.append(contentsOf: result2)
        }
    }
    
    return combo
}

print(getFactors(12))
