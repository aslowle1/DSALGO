func findCelebrity(_ n: Int) -> Int {
          var celeb = 0
    
    // there can only be 1 person at the
    // party who knows nobody, that is the key
    // in this pass
    //
    // in addition, if celeb knows i, they can't
    // be the celeb, since prior i's are all unknown
    // they can't be the celeb making i the next
    // potential candidate
    for i in 1..<n {
        if knows(celeb, i) {
            celeb = i
        }
    }
    
    // at this point, celeb should know
    // nobody of higher n than themsevles
    
    // confirm that celeb is:
    // 1) knows nobody <= celeb
    // 2) known by all
    for j in 0..<n where celeb != j {
        if (j < celeb && knows(celeb, j)) || !knows(j, celeb) {
            // there is no celeb
            return -1
        }
    }
    
    // we found the celeb
    return celeb
}

func findCelebrity(_ n: Int) -> Int {
    var graph = [Int:[Int]]()
    var know = [Int: Int]()
    for index in 0..<n {
        if index == 0 {
            graph[index] = Array(1..<n)
        } else if index != n - 1{
            graph[index] = Array(0..<index) + Array((index + 1)..<n)
        } else {
            graph[index] = Array(1..<n - 1)
        }
        know[index] = 0
    }
    
    var potential = -1
    
    for (p1, value) in graph {
        var knowsNoOne = true
        for p2 in value {
            if knows(p1, p2) {
                knowsNoOne = false
                know[p2]! += 1
            }
        }
        if knowsNoOne && potential == -1 {
            potential = p1
        } else if knowsNoOne && potential != -1 {
            return -1
        }
        
    }
    if potential == -1 {
        return -1
    }
    
    var secondComparison = -1
    for (p1, value) in know {
        if value == n - 1 {
            if secondComparison == -1 {
                secondComparison = p1
            } else {
                return -1
            }
        }
    }
    
    if secondComparison == -1 {
        return -1
    }
    
    return potential == secondComparison ? potential : -1
}


func knows(_ a: Int, _ b: Int) -> Bool {
    return true
}
