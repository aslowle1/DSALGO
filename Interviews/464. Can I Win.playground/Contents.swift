
var greeting = "Hello, playground"

func canIWin(_ maxChoosableInteger: Int, _ desiredTotal: Int) -> Bool {
    var options = Set<Int>()
    
    for index in 1...maxChoosableInteger {
        options.insert(index)
    }
    
    for index in 1...maxChoosableInteger {
        var copy = options
        copy.remove(index)
        if desiredTotal - index <= 0 {
            return true
        }
        if traverse(&copy, desiredTotal - index, isPlayer1: false) {
            print(index)
            return true
        }
    }
    
    return false
}

func traverse(_ options: inout Set<Int>, _ total: Int, isPlayer1: Bool) -> Bool {
    
    if total <= 0 {
        print(options)
        return isPlayer1
    }
    
    if options.contains(total) {
        print(options)
        return isPlayer1
    }
    
    for option in options {
        options.remove(option)
        if traverse(&options, total - option, isPlayer1: !isPlayer1) {
            return true
        }
    }
    
    return false
}

print(canIWin(10, 40))
