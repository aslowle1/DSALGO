func isAlienSorted(_ words: [String], _ order: String) -> Bool {
    var hash = [String: Int]()
    var index = 0
    
    for char in order {
        hash["\(char)"] = index
        index += 1
    }

    return search(words, hash)
}

func search(_ words: [String], _ dictionary: [String: Int]) -> Bool {
    
    if words.count <= 1 {
        return true
    }
    
    var minIndex = dictionary["\(words[0].first!)"]!
    var newWords = [String]()
    for word in words {
        if dictionary["\(word.first!)"]! < minIndex {
            return false
        } else if dictionary["\(word.first!)"]! == minIndex {
            guard word.count > 1 else {
                if !newWords.isEmpty {
                    return false
                }
                continue
            }
            var copyWord = word
            copyWord.removeFirst()
            newWords.append(copyWord)
            print(copyWord)
        } else {
            minIndex = dictionary["\(word.first!)"]!
        }
    }
    print(newWords)
    return search(newWords, dictionary)
    
}

print(isAlienSorted(["zirqhpfscx","zrmvtxgelh","vokopzrtc","nugfyso","rzdmvyf","vhvqzkfqis","dvbkppw","ttfwryy","dodpbbkp","akycwwcdog"], "khjzlicrmunogwbpqdetasyfvx"))
