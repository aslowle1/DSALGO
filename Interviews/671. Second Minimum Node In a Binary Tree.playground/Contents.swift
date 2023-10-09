public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public var next: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func findSecondMinimumValue(_ root: TreeNode?) -> Int {
    
    guard let root = root else { return -1 }
    
    var queue = [[root]]
    var newMin: Int = -1
    while !queue.isEmpty {
        let elements = queue.removeFirst()
        
    
        var toQueue = [TreeNode?]()
        for element in elements {
            if element.val > root.val {
                if newMin == -1 {
                    newMin = element.val
                } else {
                    newMin = min(element.val, newMin)
                }
            }
            toQueue.append(contentsOf: [element.left, element.right])
        }
        let array = toQueue.compactMap { $0 }
        if !array.isEmpty {
            queue.append(array)
        }
    }
    return newMin
}
