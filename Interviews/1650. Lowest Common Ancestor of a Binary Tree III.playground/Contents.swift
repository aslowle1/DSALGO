
public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var parent: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.parent = nil
    }
}

func lowestCommonAncestor(_ p: Node?,_ q: Node?) -> Node? {
    
    let pNodes = traverseParent(p)
    let qNodes = traverseParent(q)

    var indexP = pNodes.count - 1
    var indexQ = qNodes.count - 1
    
    var lastNode: Node?
    
    while indexP >= 0 && indexQ >= 0 {
        if pNodes[indexP] === qNodes[indexQ] {
            lastNode = qNodes[indexQ]
        }
        indexP -= 1
        indexQ -= 1
    }
    
    return lastNode
}


func traverseParent(_ node: Node?) -> [Node] {
    
    var current = node
    var nodes = [Node]()
    while current != nil {
        nodes.append(current!)
        current = current?.parent
    }
    return nodes
}
