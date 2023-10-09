func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
    
    var hash = [Character: Int]()
    
    for (index, char) in "abcdefghijklmnopqrstuvwxyz".enumerated() {
        hash[char] = index
    }
    
    var value = search(hash, letters, target, 0, letters.count - 1)

    if value == letters.count - 1 {

        if hash[letters.last!]! >= value {
            value = 0
        }
    }
    return letters[value]
}

func search(_ map: [Character: Int], _ letters: [Character], _ target: Character, _ start: Int, _ end: Int) -> Int {
    
    if start - end == 0 {
        return start
    }
    
    if letters[start] == target {
        return start + 1
    }
    
    let mid = Int((start + end)/2)
    print(map[target]!)
    if letters[mid] == target {
        return mid + 1
    } else if map[letters[mid]]! < map[target]! {
        return search(map, letters, target, mid + 1, end)
    } else {
        return search(map, letters, target, start, mid)
    }
}

print(nextGreatestLetter(["c","f","j"], "j"))
