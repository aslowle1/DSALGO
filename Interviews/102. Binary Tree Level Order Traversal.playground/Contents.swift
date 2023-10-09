func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return []}
    var queue = [[root]]
    var final = [[Int]]()
    while !queue.isEmpty {
        var vals = [Int]()
       let first = queue.removeFirst()
       print(first)
        for vale in first {
            vals.append(vale.val)
        }
        final.append(vals)
        var levels = [TreeNode]()
        for node in first {
            if let left = node.left {
                levels.append(left)
            }
            if let right = node.right {
                levels.append(right)
            }
        }
        if levels.count != 0 {
            queue.append(levels)
        }
    }
    return final
}
