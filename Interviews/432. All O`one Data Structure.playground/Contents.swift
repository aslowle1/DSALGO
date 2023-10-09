//Double Linked List with Hash Table is a possibility

class AllOne {
    
    var allItems = [String: Int]()
    var itemsIndexed = [Set<String>]()
    
    init() {
        
    }
    
    func inc(_ key: String) {
        var value = 0
        if allItems[key] == nil {
            allItems[key] = 1
            value = 1
        } else {
            itemsIndexed[allItems[key]! - 1].remove(key)
            allItems[key]! += 1
            value = allItems[key]!
        }

        if itemsIndexed.count <= value - 1 {
            var set = Set<String>()
            set.insert(key)
            itemsIndexed.append(set)
        } else {
            itemsIndexed[value - 1].insert(key)
        }
    }
    
    func dec(_ key: String) {
        var value = allItems[key]!
        itemsIndexed[allItems[key]! - 1].remove(key)
        if itemsIndexed[allItems[key]! - 1].isEmpty {
            itemsIndexed.removeLast()
        } else if itemsIndexed[0].isEmpty {
            itemsIndexed.removeFirst()
        }
        value -= 1
        if value == 0 {
            allItems[key] = nil
        } else {
            allItems[key]! = value
            itemsIndexed[value - 1].insert(key)
        }
    }
    
    func getMaxKey() -> String {
        print(itemsIndexed)
        return itemsIndexed.last!.first!
    }
    
    func getMinKey() -> String {
        return itemsIndexed.first!.first!
    }
}

let allOne = AllOne()
allOne.inc("hello")
allOne.inc("hello")
//allOne.inc("leet")
print(allOne.getMaxKey())
print(allOne.getMinKey())
