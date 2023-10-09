//
//  272. Closest Binary Search Tree Value II.swift
//  
//
//  Created by Andros Slowley on 3/24/22.
//


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

func closestKValues(_ root: TreeNode?, _ target: Double, _ k: Int) -> [Int] {
    var hash = [Int: Int]()
    
    let array = traverse(root)
    var index = 0
    while index < array.count, array[index] < Int(target) {
        index += 1
    }
    
    var copyK = k
    var results = [Int]()
    if index == array.count - 1 {
        
        while copyK != 0 {
            results.append(array[index])
            copyK -= 1
        }
        
    } else {
        var upperPointer = index + 1
        while copyK != 0 {
            let upperDiff = abs(array[upperPointer] - target)
            let lowerDiff = abs(array[index] - target)
            
            if lowerDiff < upperDiff {
                results.append(array[index])
                index -= 1
            } else {
                results.append(array[upperPointer])
                upperPointer += 1
            }
            copyK -= 1
        }
    }
    return results
    
}


func traverse(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    
    var left = traverse(root.left)
    left.append([root.val])
    left.append(contentsOf: traverse(root.right))
    
    return left
}
