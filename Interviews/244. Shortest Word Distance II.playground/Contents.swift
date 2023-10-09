
class WordDistance {

    var wordsDict: [String]

    init(_ wordsDict: [String]) {
        self.wordsDict = wordsDict
    }
    
    func shortest(_ word1: String, _ word2: String) -> Int {
        var indexWrd1 = -1
        var indexWrd2 = -1
        var short = 100000000000
        var count = 1
        for word in wordsDict {
            guard word == word1 || word == word2 else { count += 1; continue }
            
            if word == word1 {
                indexWrd1 = count
                if indexWrd2 != -1 {
                    short = min(abs(indexWrd1 - indexWrd2), short)
                }
            }
            
            if word == word2 {
                indexWrd2 = count
                if indexWrd1 != -1 {
                    short = min(abs(indexWrd1 - indexWrd2), short)
                }
            }
            count += 1
        }
        return min(short, abs(indexWrd1 - indexWrd2))
    }
}
