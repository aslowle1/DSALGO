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

func printTree(_ root: TreeNode?) -> [[String]] {
    let height = getHeight(root)
    let width = Int(pow(2, Double(height))) - 1
    var res: [[String]] = Array(repeating: Array(repeating: "", count: width), count: height)
    dfs(root, 0, 0, width - 1, &res)
    return res
}

// h: height, l: left index, r: right index
func dfs(_ root: TreeNode?, _ h: Int, _ l: Int, _ r: Int, _ res: inout [[String]]) {
    guard let root = root else {
        return
    }
    
    var mid = l + (r-l)/2
    res[h][mid] = String(root.val)
    dfs(root.left, h + 1, l, mid - 1, &res)
    dfs(root.right, h + 1, mid + 1, r, &res)
}

func getHeight(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    return max(getHeight(root.left), getHeight(root.right)) + 1
}
