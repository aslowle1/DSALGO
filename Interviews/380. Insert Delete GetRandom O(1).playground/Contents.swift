class RandomizedSet {

    var dict = [Int:Bool]()
    
    init() {
        
    }
    
    func insert(_ val: Int) -> Bool {
        if dict[val] == nil {
            dict[val] = true
            return true
        }
        return false
    }
    
    func remove(_ val: Int) -> Bool {
        if dict[val] == nil {
            return false
        }
        dict[val] = nil
        return true
    }
    
    func getRandom() -> Int {
         let random = Int.random(in: 1..<dict.count)
        return Array(dict.keys)[random]
    }
}
