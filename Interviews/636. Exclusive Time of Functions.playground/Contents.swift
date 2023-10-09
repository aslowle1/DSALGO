/*
 
 0 1 2 3 4 5 6
 0   1     1 0   Bucket
 
 [0,0]
 */


func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
    let last = logs[logs.count - 1]
    let endCount = getEnd(last)
    var bucket = Array(repeating: -1, count: endCount + 1)

    for log in logs {
        var index = 0
        var num = ""
        while letter(log, index) != ":" {
            num += letter(log, index)
            index += 1
        }
        bucket[getEnd(log)] = Int(num)!
    }
    
    
    var final = Array(repeating: 0, count: n)

    print(final)
    var lastVal = 0
    for loc in 0..<bucket.count {
        if bucket[loc] == -1 {
            final[lastVal] = (final[lastVal] + 1)
        } else {
            final[bucket[loc]] = (final[bucket[loc]] + 1)
            lastVal = bucket[loc]
        }
    }
    return final
}

func getEnd(_ time: String) -> Int {
    var index = time.count - 1
    var num = ""
    while letter(time, index) != ":" {
        num = letter(time, index) + num
        index -= 1
    }
    return Int(num)!
}

func letter(_ letter: String, _ index: Int) -> String {
    return "\(letter[letter.index(letter.startIndex, offsetBy: index)])"
}

print(exclusiveTime(2, ["0:start:0","1:start:2","1:end:5","0:end:6"]))
