func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
    
    if words.isEmpty {
        return []
    }
    
    
    var addedWords = [String]()
    var spaceCount = 0
    var totalWordCount = 0
    var lastIndex = 0
    for index in 0..<words.count {
        let word = words[index]
        let wordCount = word.count
        
        if totalWordCount + wordCount + spaceCount > maxWidth {
            break
        }
        addedWords.append(word)
        if index != 0 && index != words.count - 1 {
            spaceCount += 1
        }
        totalWordCount += wordCount
        lastIndex += 1
    }
    
    let diff = (totalWordCount - maxWidth)/(addedWords.count - 1)
    
    var addExtra = diff%2 != 0
    
    var finalString = ""
    
    for index in 0..<addedWords.count {
        finalString.append(addedWords[index])
        if index != addedWords.count - 1 {
            if addExtra {
                finalString.append(" ")
                addExtra = false
            }
            for _ in 0...Int(diff) {
                finalString.append(" ")
            }
        }
    }
    
    if lastIndex >= words.count {
        return [finalString]
    } else {
        return fullJustify(Array(words[lastIndex...]), maxWidth)
    }
}
