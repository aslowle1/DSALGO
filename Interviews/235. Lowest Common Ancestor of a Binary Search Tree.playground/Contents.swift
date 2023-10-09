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


func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    if root.val == p!.val {
        return p
    } else if root.val == q!.val {
        return q
    } else if (root.val > p!.val && root.val < q!.val) || (root.val < p!.val && root.val > q!.val) {
        return root
    } else if root.val > p!.val && root.val > q!.val {
        return lowestCommonAncestor(root.left, p, q)
    } else {
        return lowestCommonAncestor(root.right, p, q)
    }
}
    
    
