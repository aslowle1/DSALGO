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

func depthSum(_ nestedList: [NestedInteger]) -> Int {
    return findSum(nestedList, 1)
}


func findSum(_ nestedList: [NestedInteger], _ k: Int) -> Int {
    
    var sum = 0
    for list in nestedList {
        if list.isInteger() {
            sum += (list.getInteger() * k)
        } else {
            sum += findSum(list.getList(), k + 1)
        }
    }
    return sum
}
