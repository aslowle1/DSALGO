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

func upsideDownBinaryTree(_ root: TreeNode?) -> TreeNode? {
    if(root == nil || root!.left == nil) {
        return root
    }
    
    let newRoot = upsideDownBinaryTree(root!.left)
    
    root?.left?.left = root?.right
    root?.left?.right = root
    
    root?.left = nil
    root?.right = nil
    
    return newRoot
}
