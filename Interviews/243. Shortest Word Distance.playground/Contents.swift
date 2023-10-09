// Key here is setting index as -1

func shortestDistance(_ wordsDict: [String], _ word1: String, _ word2: String) -> Int {
    var indexWrd1: Double = -1
    var indexWrd2: Double = -1
    
    var shortest = Double.infinity
    for index in 0..<wordsDict.count {
        let word = wordsDict[index]
        guard word == word1 || word == word2 else { continue }
        
        if word == word1 {
            indexWrd1 = Double(index)
            if indexWrd2 != -1 {
                 shortest = min(abs(indexWrd1 - indexWrd2), shortest)
            }
        }
        
        if word == word2 {
            indexWrd2 = Double(index)
            if indexWrd1 != -1 {
                shortest = min(abs(indexWrd1 - indexWrd2), shortest)
            }
        }
    }
    
    return Int(shortest)
}

print(shortestDistance(["practice", "makes", "perfect", "coding", "makes"], "coding", "practice"))
