/*
 x(mn)yz
 
 xmyx
 xnyz
      x
   m    n
 yz     yz
 
 */

func parentheticalPossibilities(_ word: inout String) -> [String] {

    if word.isEmpty {
        return [""]
    }
    
    let character = "\(word.removeFirst())"
    
    if character == "(" {
        var letters = [String]()
        
        while word.first != ")" {
            let newCharacter = "\(word.removeFirst())"
            letters.append(newCharacter)
        }
        word.removeFirst()
        
        var possibilities = [String]()
        for letter in letters {
            var copy = word
            for result in parentheticalPossibilities(&copy) {
                var letterCopy = letter
                letterCopy.append(result)
                possibilities.append(letterCopy)
            }
        }
        return possibilities
    } else {
        var result = parentheticalPossibilities(&word)
        
        for index in 0..<result.count {
            var copyChara = character
            copyChara.append(contentsOf: result[index])
            result[index] = copyChara
        }
        return result
    }
    
    
}

var word = "(qr)ab(stu)c"
print(parentheticalPossibilities(&word))
