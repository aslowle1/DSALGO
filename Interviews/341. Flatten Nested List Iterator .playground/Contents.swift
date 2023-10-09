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

/*
 Input: nestedList = [[1,1],2,[1,1]]
 Output: [1,1,2,1,1]
 Explanation: By calling next repeatedly until hasNext returns false, the order of elements returned by next should be: [1,1,2,1,1].
 */

class NestedIterator {

    var nestedList: [NestedInteger]
    var list = [Int]()
    init(_ nestedList: [NestedInteger]) {
        self.nestedList = nestedList
        list = createFlatList(nestedList)
    }
    
    func createFlatList(_ list: [NestedInteger]) -> [Int] {
        
        if list.isEmpty {
            return []
        }
        
        var values = [Int]()
        for item in list {
            if item.isInteger() {
                values.append(item.getInteger())
            } else {
                let value = createFlatList(item.getList())
                values.append(contentsOf: value)
            }
        }
        return values
    }

    func next() -> Int {
        return list.removeLast()
    }
    
    func hasNext() -> Bool {
       return  list.isEmpty
    }
}
