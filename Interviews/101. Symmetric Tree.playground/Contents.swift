import UIKit

var greeting = "Hello, playground"

public class TreeNode {
    public var val: String
    public var left: TreeNode?
    public var right: TreeNode?
    public var next: TreeNode?
    public init(_ val: String) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func isSymmetric(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    
    var queue: [[TreeNode?]] = [[root]]
    
    while !queue.isEmpty {
        let elements = queue.removeFirst()
        
        var leadingPointer = 0
        var trailingPointer = elements.count - 1
        
        while leadingPointer < trailingPointer {
            
            if elements[leadingPointer]?.val != elements[trailingPointer]?.val {
                return false
            }
            leadingPointer += 1
            trailingPointer -= 1
        }
        
        var array = [TreeNode?]()
        elements.forEach {
            array.append($0?.left)
            array.append($0?.right)
        }
        let count = array.compactMap { $0 }.count
        if count > 0 {
            queue.append(array)
    }
        
    }
    
    return true
}
