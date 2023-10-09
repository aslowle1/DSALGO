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

class Solution {
    var hash = [Int: [Int]]()
    func findLeaves(_ root: TreeNode?) -> [[Int]] {
        _ = traverseTree(root)
        var result = [[Int]]()
        for index in 0..<hash.count {
            result.append(hash[index]!)
        }
        
        return result
    }
    
    func traverseTree(_ root: TreeNode?) -> Int {
        
        if root == nil {
            return -1
        }
        
        if root?.left == nil && root?.right == nil {
            let val = root!.val
            if hash[0] == nil {
                hash[0] = []
            }
            hash[0]!.append(val)
            return 0
        }
        
        let left = traverseTree(root!.left)
        let right = traverseTree(root!.right)
        
        let maximum = max(left, right) + 1
        if hash[maximum] == nil {
            hash[maximum] = []
        }
        print(hash)
        hash[maximum]!.append(root!.val)
        return maximum
        
    }
}

// I like this approach but it didn't always work
/*
func findLeaves(_ root: TreeNode?) -> [[Int]] {

    if root == nil {
        return []
    }
    
    var result = [[Int]]()
    while root?.left == nil && root?.right == nil {
        result.append(traverseTree(root))
    }
    
    result.append([root!.val])
    
    return result
}

func traverseTree(_ root: TreeNode?) -> [Int] {
    if root?.left == nil && root?.right == nil {
        let val = root!.val
        return [val]
    }
    
    let left = traverseTree(root!.left)
    if left.count == 1 {
        root!.left = nil
    }
    let right = traverseTree(root!.right)
    if right.count == 1 {
        root!.right = nil
    }
    
    var result = [root!.val]
    result.append(contentsOf: left)
    result.append(contentsOf: right)
    return result
}
*/
