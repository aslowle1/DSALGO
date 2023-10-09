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

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    
    if p == nil && q != nil || p != nil && q == nil {
        return false
    }
    
    guard let p = p, let q = q else {
        return true
    }
    
    if p.val != q.val {
        return false
    }

    let left = isSameTree(p.left, q.left)
    let right = isSameTree(p.right, q.right)
    
    if !left || !right {
        return false
    }
    
    return true
}
