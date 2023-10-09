
Feels like arrays are good for in-memory usage while trees are good for storage. And if you think about it when are arrays used with smaller data sets that have been fetched but when are trees used when data is stored on a server and you what a subset of that data. But it’s best to keep that data stored so you can have fast look-ups. BBBOOOMMMMMM Unlike Array, which is linear data structure, tree is hierarchical (or non-linear) data structure. One reason to use trees might be because you want to store information that naturally forms a hierarchy

///
For recursion and traversal it almost goes down to the node of choice and the when it finds nothing it then returns the root of the equation and then just keep returning roots

IN RECURSION ALWAYS THINK OF THE SIMPLIEST STATE IS EASIEST
WHEN YOU START WRITING THE CODE GO ONE DOWN THINK ABOUT THAT TREE ALREADY BEING COMPLETE AND COMBINE LEFT AND RIGHT IN A MANNER AS IF IT WERE DONE 
RECURSION IS STACK

Think about the simplest tree -> an empty tree || this is important

///
BFS - is a queue
DFS - is a stack || deeper in the tree and then lateral || O(n) space and time
You keep removing but just differently 

//
Always find that there’s a root node - a node without parent || can only be one

//
While a linked list works well for a small number of strings, it becomes inefficient for a large number of items. When inserting an item into the list, searching for that item's position requires looking at, on average, half the items in the list. Finding an item in the list requires a similar amount of time. If the strings are stored in a sorted array instead of in a linked list, then searching becomes more efficient because binary search can be used. However, inserting a new item into the array is still inefficient since it means moving, on average, half of the items in the array to make a space for the new item. A binary tree can be used to store an ordered list in a way that makes both searching and insertion efficient. A binary tree used in this way is called a binary sort tree or BST.

A binary sort tree is a binary tree with the following property: For every node in the tree, the item in that node is greater than or equal to every item in the left subtree of that node, and it is less than or equal to all the items in the right subtree of that node. 

Binary sort trees have this useful property: An inorder traversal of the tree will process the items in increasing order. In fact, this is really just another way of expressing the definition. For example, if an inorder traversal is used to print the items in the tree shown above, then the items will be in alphabetical order. 

Searching and inserting are efficient operations on a binary search tree, provided that the tree is close to being balanced. A binary tree is balanced if for each node, the left subtree of that node contains approximately the same number of nodes as the right subtree. In a perfectly balanced tree, the two numbers differ by at most one. Not all binary trees are balanced, but if the tree is created by inserting items in a random order, there is a high probability that the tree is approximately balanced. (If the order of insertion is not random, however, it's quite possible for the tree to be very unbalanced.) During a search of any binary sort tree, every comparison eliminates one of two subtrees from further consideration. If the tree is balanced, that means cutting the number of items still under consideration in half. This is exactly the same as the binary search algorithm, and the result is a similarly efficient algorithm.

The problem size, n, is the number of items in the tree, and the average is taken over all the different orders in which the items could have been inserted into the tree. As long as the actual insertion order is random, the actual run time can be expected to be close to the average. However, the worst case run time for binary search tree operations is Θ(n), which is much worse than Θ(log(n)). The worst case occurs for particular insertion orders. For example, if the items are inserted into the tree in order of increasing size, then every item that is inserted moves always to the right as it moves down the tree. The result is a "tree" that looks more like a linked list, since it consists of a linear string of nodes strung together by their right child pointers. Operations on such a tree have the same performance as operations on a linked list. Now, there are data structures that are similar to simple binary sort trees, except that insertion and deletion of nodes are implemented in a way that will always keep the tree balanced, or almost balanced. For these data structures, searching, inserting, and deleting have both average case and worst case run times that are Θ(log(n)). Here, however, we will look at only the simple versions of inserting and searching.

By using In-order traversal, you can get sorted node values if your requirement needs sorted information.. By using Pre-order traversal, you can create a copy of the tree and also can be used to get prefix expression of an expression tree. Postorder traversal is used to delete the tree and also can be useful to get postfix expression of an expression tree.

//
RECURSION
BASE CASES - think about it as a problem within itself || the root typically has some value but its often when you reach null that starts the removal of father stack
Whats the relationship with the children and parent?

Recurrsive is always good for paths

//
2.
BFS(Breadth First Search) uses Queue data structure for finding the shortest path.
DFS(Depth First Search) uses Stack data structure.
3.
BFS can be used to find single source shortest path in an unweighted graph, because in BFS, we reach a vertex with minimum number of edges from a source vertex.
In DFS, we might traverse through more edges to reach a destination vertex from a source.
4.
BFS is more suitable for searching vertices which are closer to the given source.
DFS is more suitable when there are solutions away from source.
7.
Here, siblings are visited before the children
Here, children are visited before the siblings

In each step, DFS adds to the tree a child of the most recently included node with at least one unincluded child. So, DFS adds the start node, then its child, then its grandchild, and so on. For that reason, DFS increases the depth of the search tree in each step as much as it can. Then, if there aren’t more children of a node to add, it backtracks to the node’s parent.


********

2.
BFS(Breadth First Search) uses Queue data structure for finding the shortest path.
DFS(Depth First Search) uses Stack data structure.
3.
BFS can be used to find single source shortest path in an unweighted graph, because in BFS, we reach a vertex with minimum number of edges from a source vertex.
In DFS, we might traverse through more edges to reach a destination vertex from a source.
4.
BFS is more suitable for searching vertices which are closer to the given source.
DFS is more suitable when there are solutions away from source.
7.
Here, siblings are visited before the children
Here, children are visited before the siblings

In each step, DFS adds to the tree a child of the most recently included node with at least one unincluded child. So, DFS adds the start node, then its child, then its grandchild, and so on. For that reason, DFS increases the depth of the search tree in each step as much as it can. Then, if there aren’t more children of a node to add, it backtracks to the node’s parent.


***************

//If you know a solution is not far from the root of the tree:
BFS
//If the tree is very deep and solutions are rare: 
BFS(DFS may take too long) Think about memory and stack usage
//If the tree is very wide:
DFS(BFS will use too much memory)
//If solutions are frequent but located deep in the tree:
DFS
//Determining whether a path exists between two nodes:
DFS primary objective
//Finding the shortest path:
BFS primary objective
