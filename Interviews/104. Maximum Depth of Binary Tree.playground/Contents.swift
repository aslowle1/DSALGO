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

func maxDepth(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    let left = maxDepth(root!.left)
    let right = maxDepth(root!.right)
    
    return max(left, right) + 1
}
