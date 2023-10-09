/*
public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }


var hash = [Int:[(Int, Int)]]()
var minVal = Double.infinity
var maxVal = -Double.infinity

func verticalOrder(_ root: TreeNode?) -> [[Int]] {
    traverse(root, 0, 0)
    
    var result = [[Int]]()
    for _ in 0..<hash.count {
        let val = hash[Int(minVal)]?.sorted(by: { $0.1 < $1.1 }).map { $0.0 }
        result.append(val!)
        minVal += 1
    }
    return result
}


func traverse(_ root: TreeNode?, _ width: Int, _ height: Int) {
    guard root != nil else { return }
    if root?.left == nil && root?.right == nil {
        if hash[width] == nil { hash[width] = [] }
        minVal = min(minVal, Double(width))
        maxVal = max(maxVal, Double(width))
        hash[width]?.append((root!.val, height))
        return
    }
    if hash[width] == nil { hash[width] = [] }
    traverse(root?.left, width - 1, height + 1)
    hash[width]?.append((root!.val, height))
    traverse(root?.right, width + 1, height + 1)

    minVal = min(minVal, Double(width))
    maxVal = max(maxVal, Double(width))
}

*/
/*
func calculate(_ s: String) -> Int {
    
    let array = Array(s)
    
    var stack = [String]()
    
    for value in array {
        if let last = stack.last {
            if last == "*" {
                stack.removeLast()
                let lastVal = Int(stack.removeLast())!
                print(lastVal)
                stack.append("\(lastVal * Int("\(value)")!)")
            } else if last == "/" {
                stack.removeLast()
                let lastVal = Int(stack.removeLast())!
                let intVal = Int(lastVal / Int("\(value)")!)
              stack.append("\(intVal)")
            } else {
                stack.append("\(value)")
            }
        } else {
            stack.append("\(value)")
        }
    }
    print(stack)
    while stack.count > 1 {
        let secondNum = stack.removeLast()
        let operation = stack.removeLast()
        let firstNum = stack.removeLast()
        if operation == "+" {
            let total = Int(firstNum)! + Int(secondNum)!
            stack.append("\(total)")
        } else {
            let total = Int(firstNum)! - Int(secondNum)!
            stack.append("\(total)")
        }
    }

    return Int(stack.first!)!
}

print(calculate("3+2*2"))

*/
/*
func simplifyPath(_ path: String) -> String {
    var stack = ""
    
    for value in path {
        if stack.isEmpty {
            if value != "/" {
                stack.append("/")
                if value == "." {
                    continue
                } else {
                    stack.append(value)
                }
            } else {
                stack.append(value)
            }
        } else {
            if value == "." {
                continue
            } else if value == "/" && stack.last! != "/" {
                stack.append("/")
            } else if value == "/" && stack.last! == "/" {
                continue
            } else {
                stack.append(value)
            }
        }
    }
    
    if stack.last == "/" && stack.count != 1 {
        stack.removeLast()
    }
    
    return stack
}

print(simplifyPath("/home//foo/"))
*/
/*
func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
    
    let res = merge(points)

    return Array(res[...k])
}

func merge(_ points: [[Int]]) -> [[Int]] {
    
    
    if points.count == 1 {
        return points
    }
    
    let mid = Int(points.count/2)
    
    let left = merge(Array(points[..<mid]))
    let right = merge(Array(points[mid...]))
    
    var final = [[Int]]()
    var leftIndex = 0
    var rightIndex = 0
    
    while leftIndex < left.count && rightIndex < right.count {
        if distance(left[leftIndex][0], left[leftIndex][1]) < distance(right[rightIndex][0], right[rightIndex][1]) {
            final.append(left[leftIndex])
            leftIndex += 1
        } else {
            final.append(right[rightIndex])
            rightIndex += 1
        }
    }
    
    if leftIndex < left.count {
        final.append(contentsOf: left[leftIndex...])
    } else {
        final.append(contentsOf: right[rightIndex...])
    }
    return final
}


func distance(_ x: Int, _ y: Int) -> Double {
    let value = (x*x) + (y*y)
    return sqrt(Double(value))
}


*/

public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
}

var hash = [Int:[Int]]()
var minVal = Double.infinity
var maxVal = -Double.infinity

func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
    traverse(root, 0)
    
    var result = [[Int]]()
    for _ in 0..<hash.count {
        let val = hash[Int(minVal)]?.sorted(by: { $0 < $1 })
        result.append(val!)
        minVal += 1
    }
    return result
}


func traverse(_ root: TreeNode?, _ width: Int) {
    guard root != nil else { return }
    if root?.left == nil && root?.right == nil {
        if hash[width] == nil { hash[width] = [] }
        minVal = min(minVal, Double(width))
        maxVal = max(maxVal, Double(width))
        hash[width]?.append(root!.val)
        return
    }
    if hash[width] == nil { hash[width] = [] }
    traverse(root?.left, width - 1)
    hash[width]?.append(root!.val)
    traverse(root?.right, width + 1)

    minVal = min(minVal, Double(width))
    maxVal = max(maxVal, Double(width))
}
