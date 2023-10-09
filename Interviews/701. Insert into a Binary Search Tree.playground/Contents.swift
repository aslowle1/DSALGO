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

func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    guard let root = root else {
        return TreeNode(val)
    }

    if root.val == val {
        let left = root.left
        let right = root.right
        let newNode = TreeNode(val)
        root.right = newNode
        newNode.left = left
        newNode.right = right
    } else if root.val > val {
        if let left = root.left {
            insertIntoBST(left, val)
        } else {
            root.left = TreeNode(val)
        }
    } else {
        if let right = root.right {
            insertIntoBST(right, val)
        } else {
            root.right = TreeNode(val)
        }
    }
    
    return root
}
