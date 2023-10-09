func isIsomorphic(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    
    var sMatch = [Character: Character]()
    var tMatch = [Character: Character]()

    for index in 0..<s.count {
        let sValue = s[s.index(s.startIndex, offsetBy: index)]
        let tValue = t[t.index(t.startIndex, offsetBy: index)]
        
        if sMatch[sValue] == nil, tMatch[tValue] == nil {
            sMatch[sValue] = tValue
            tMatch[tValue] = sValue
        } else if (sMatch[sValue] != nil && tMatch[tValue] == nil) || (sMatch[sValue] == nil && tMatch[tValue] != nil) {
            return false
        } else if (sMatch[sValue] != tValue || tMatch[tValue] != sValue) {
            return false
        }
        
    }
    
    return true
}
