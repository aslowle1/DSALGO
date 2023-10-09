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

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        return inorder(root) + " " + postOrder(root)
    }
    
    func inorder(_ root: TreeNode?) -> String {
        guard let root = root else {
            return ""
        }
        var left = inorder(root.left)
        let right = inorder(root.right)
        let val = "\(root.val)"
        left.append(contentsOf: val)
        left.append(contentsOf: right)
        return left
    }
    
    func postOrder(_ root: TreeNode?) -> String {
        guard let root = root else {
            return ""
        }
        var left = postOrder(root.left)
        let right = postOrder(root.right)
        let val = "\(root.val)"
        left.append(contentsOf: right)
        left.append(contentsOf: val)
        return left
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        let index = data.firstIndex(of: " ")!
        let inorderStr = Array(arrayLiteral: String(data[..<index])).map { Int($0)!}
        let postOrderStr = Array(arrayLiteral: String(data[..<index])).map { Int($0)!}

        return build(inorderStr, postOrderStr)
    }
    
    
    func build(_ inorder: [Int], _ postOrder: [Int]) -> TreeNode? {
        
        if inorder.isEmpty {
            return nil
        }
        
        let last = postOrder.last!
        let foundIndex = inorder.firstIndex(of: last)!
        
        let inorderLeft = inorder[..<foundIndex]
        let inorderRight = inorder[(foundIndex + 1)...]
        
        let postOrderLeft = postOrder[...(inorderLeft.count - 1)]
        let postOrderRight = postOrder[foundIndex..<postOrder.count - 1]
        
        let root = TreeNode(last)
        
        root.left = build(Array(inorderLeft), Array(postOrderLeft))
        root.right = build(Array(inorderRight), Array(postOrderRight))
        
        return root
    }
}
