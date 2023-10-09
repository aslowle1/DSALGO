
func summingSquares(_ val: Int) -> Int {

    if val < 0 {
        return 11100000
    }
    
    if val == 0 {
        return 0
    }
    
    var squares = [Int]()
    var num = 1
    while (num * num) <= val {
        squares.append(num)
        num += 1
    }
    
    var count = 11100000
    for value in squares {
        let result = summingSquares(val - (value * value))
        count = min(result, count)
    }
    
    count += 1
    return count
}

print(summingSquares(9))
