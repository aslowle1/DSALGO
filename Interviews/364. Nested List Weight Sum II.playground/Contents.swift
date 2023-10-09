class NestedInteger {
    public func isInteger() -> Bool {
        return true
    }
    public func getInteger() -> Int {
        return 0
    }
    public func setInteger(value: Int) {
        //
    }
    public func add(elem: NestedInteger) {
        
    }
    public func getList() -> [NestedInteger] {
        return []
    }
}

var maximum = 1
func depthSumInverse(_ nestedList: [NestedInteger]) -> Int {
    var hash = [Int: [Int]]()
    traverse(nestedList, 1, &hash)
    var sum = 0
    
    for (key, value) in hash {
        let multiplier = abs(maximum - key) + 1
        value.forEach {
            sum += ($0 * multiplier)
        }
    }
    return sum
}

func traverse(_ nestedList: [NestedInteger], _ depth: Int, _ hash: inout [Int: [Int]]) {
    
    if hash[depth] == nil {
        hash[depth] = []
    }

    for list in nestedList {
        if list.isInteger() {
            maximum = max(maximum, depth)
            hash[depth]?.append(list.getInteger())
        } else {
            traverse(list.getList(), depth + 1, &hash)
        }
    }
}
