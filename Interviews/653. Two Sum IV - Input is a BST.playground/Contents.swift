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

var hash = [Int:Bool]()

func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
    guard let root = root else {
        return false
    }
    
    
    if findTarget(root.left, k) {
        return true
    }
    
    if findTarget(root.right, k) {
        return true
    }

    let seek = k - root.val
    if hash[seek] != nil {
        return true
    }
    hash[root.val] = true
    return false
}
