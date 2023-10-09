## Arrays

Arrays are the foundation of everything, even when you are talking about a linked list that node probably points to an array, so understand that many other data structures are built off an array.

Contiguous memory allocation which means that data is listed next to each other. Because of this data can be ordered. Arrays are also the foundation for stacks and queues which follow the same principles but have specific usages and design.

Static Array - Fix in Size, Can’t keep adding
Dynamic Arrays - Copy and build arrays at a new location || most times the language manages it on its own
A dynamic array is a data structure that allocates all elements contiguously in memory, and keeps a count of the current number of elements. If the space reserved for the dynamic array is exceeded, it is reallocated and (possibly) copied, which is an expensive operation.
Meant for
Index Lookup: O(1)
pushO(1) - adding it at the end of the array, can be O(n) for dynamic
popO(1) - removing last is O(1) because it knows it’s size
insertO(n)
deleteO(n)

## Stacks & Queues

Real life usage: memory stacks created when a function is intitated.

Liner data structure
*** No random data access structure ***
Mostly access first or last data 
Higher level data structure - Limits the abilities of Array to make options mostly be more focused

Stack
LIFO
Web Browser (Last one appears first)
Also used for function calls
Can use Arrays or linked list
Arrays is better because they tend to be next to each other(Cache locality)
LinkedList have more dynamic memory/spacing

Queues
FIFO
***Create a Queue from an array is not efficient because the first one goes so you have to reindex***

## Hash Tables
Key/Value as compared to index/value
Key is the memory address via a hash function and stores it in the address table
hash function -> inputs to generated pattern, unable to recognize input from output, always gives the same output(idempotent)
Insert O(1)
Lookup O(1)
Insertion O(1)
Delete O(1)

An Object like struct or class is like a hash table for all its properties 

Collision: store two values in one address space O(n) which is stored as a link list - linking values in one address

Question Type:
Repeating Values
Comparing Multiple arrays

## Linked List
Real World: Think recurrsive object that references another optional object of the same type, this can be considered a linked list.
Careful there are some similarities to tress which may need to be dived into a little deeper.

A list that is linked
Single link list contains a node(value and pointer to next node)
First node is head, last node is tail…which the tail node has a pointer of null
***Summary: Element that links to another link, can be sorted and unsorted***
Scattered Memory Address because the addresses are not next to each other
Pointer is a  reference to another object, a reference of a place in memory as compared to the value
Computer deletes memory that is unreferenced so as long as there are pointers to the address then it won’t disappear ARC

Link list are better because it can replicate the nature of being ordered and you can just find the lookup with O(1)
Inserting via index is still O(n) but inserting via address is O(1)…reseting pointers

Doubly Link List vs Singly link list
Space, work, reverse ordering

There’s no random access,

Most times requires a link list class


One of the more interesting possibilities is that an object can contain a reference to another object of the same type. There is a common data structure, the list, that takes advantage of this feature.
Lists are made up of nodes, where each node contains a reference to the next node in the list. In addition, each node usually contains a unit of data called the cargo. In our first example, the cargo will be a single integer, but later we will write a generic list that can contain objects of any type.


In computer science, a linked list is a linear collection of data elements whose order is not given by their physical placement in memory. Instead, each element points to the next. It is a data structure consisting of a collection of nodes which together represent a sequence. In its most basic form, each node contains: data, and a reference (in other words, a link) to the next node in the sequence. This structure allows for efficient insertion or removal of elements from any position in the sequence during iteration. More complex variants add additional links, allowing more efficient insertion or removal of nodes at arbitrary positions. A drawback of linked lists is that access time is linear (and difficult to pipeline). Faster access, such as random access, is not feasible. Arrays have better cache locality compared to linked lists.

***The principal benefit of a linked list over a conventional array is that the list elements can be easily inserted or removed without reallocation or reorganization of the entire structure because the data items need not be stored contiguously in memory or on disk, while restructuring an array at run-time is a much more expensive operation. Linked lists allow insertion and removal of nodes at any point in the list, and allow doing so with a constant number of operations by keeping the link previous to the link being added or removed in memory during list traversal.***

Linked lists have several advantages over dynamic arrays. Insertion or deletion of an element at a specific point of a list, assuming that we have indexed a pointer to the node (before the one to be removed, or before the insertion point) already, is a constant-time operation (otherwise without this reference it is O(n)), whereas insertion in a dynamic array at random locations will require moving half of the elements on average, and all the elements in the worst case. While one can "delete" an element from an array in constant time by somehow marking its slot as "vacant", this causes fragmentation that impedes the performance of iteration.

On the other hand, dynamic arrays (as well as fixed-size array data structures) allow constant-time random access, while linked lists allow only sequential access to elements. Singly linked lists, in fact, can be easily traversed in only one direction. This makes linked lists unsuitable for applications where it's useful to look up an element by its index quickly, such as heapsort. Sequential access on arrays and dynamic arrays is also faster than on linked lists on many machines, because they have optimal locality of reference and thus make good use of data caching.

A balanced tree has similar memory access patterns and space overhead to a linked list while permitting much more efficient indexing, taking O(log n) time instead of O(n) for a random access. However, insertion and deletion operations are more expensive due to the overhead of tree manipulations to maintain balance. Schemes exist for trees to automatically maintain themselves in a balanced state: AVL trees or red–black trees.

## Trees

 heiracry 
Starts with a root node
Leaf nodes the ends of the nodes(no child)
Parent Child - which is unidirectional
Subtree
Siblings - same level as other children

Instagram Comments - Tree
Abstract Syntax Tree - this is pretty much the entire swift system…why OOP because sense

Binary Tree

In this section, we'll look at one of the most basic and useful structures of this type: binary trees. Each of the objects in a binary tree contains two pointers, typically called left and right. In addition to these pointers, of course, the nodes can contain other types of data.

The left and right pointers in a TreeNode can be null or can point to other objects of type TreeNode. A node that points to another node is said to be the parent of that node, and the node it points to is called a child. In a binary tree, a child is either a "left child" or a "right child," and a node can have a right child even if it has no left child. 

A binary tree must have the following properties: There is exactly one node in the tree which has no parent. This node is called the root of the tree. Every other node in the tree has exactly one parent. Finally, there can be no loops in a binary tree. That is, it is not possible to follow a chain of pointers starting at some node and arriving back at the same node.

A node that has no children is called a leaf. A leaf node can be recognized by the fact that both the left and right pointers in the node are null. In the standard picture of a binary tree, the root node is shown at the top and the leaf nodes at the bottom—which doesn't show much respect for the analogy to real trees. But at least you can see the branching, tree-like structure that gives a binary tree its name.

In a preorder traversal, the root node of the tree is processed first, then the left subtree is traversed, then the right subtree. In a postorder traversal, the left subtree is traversed, then the right subtree, and then the root node is processed. And in an inorder traversal, the left subtree is traversed first, then the root node is processed, then the right subtree is traversed. Subroutines that use postorder and inorder traversal to print the contents of a tree differ from preorderPrint() only in the placement of the statement that outputs the root item:

THINK OF THIS AS BUBBLING UP. EACH LINE IN CODE IS NOT COMPLETE UNTIL YOU FIRST HIT THE FINAL CRITERIA, NO MORE ROOT NODES AND THEN YOU AGGREGATED ON TOP OF EACH OTHER UNTIL THE ORIGINAL IS SATISFIED

Each Node can only have 0, 1 or 2 nodes
Perfect Binary Tree - Bottom layer is even and fully filled, siblings are all leveled, Nodes double as you move down each level
All nodes above plus 1 equals the nodes on the last level…this means that half the data is at the bottom…so if you can get rid of half of the data in your search it gets super efficient

How many nodes?
Level 0: 2^0 = 1
Level 1: 2^1 = 2

number of nodes = 2^h - 1
Log nodes = height

Log 100 = 2
10^2 = 100
Log nodes = maximum # of steps you would need to make to get to a node(like looking through a phone book) only need to look through a subset

Rules
All Child Nodes to the parent node must be larger on the right and smaller on the left

Unbalanced Binary Search Trees lookup O(n) insert O(n) deleteO(n)

While a linked list works well for a small number of strings, it becomes inefficient for a large number of items. When inserting an item into the list, searching for that item's position requires looking at, on average, half the items in the list. Finding an item in the list requires a similar amount of time. If the strings are stored in a sorted array instead of in a linked list, then searching becomes more efficient because binary search can be used. However, inserting a new item into the array is still inefficient since it means moving, on average, half of the items in the array to make a space for the new item. A binary tree can be used to store an ordered list in a way that makes both searching and insertion efficient. A binary tree used in this way is called a binary sort tree or BST.

A binary sort tree is a binary tree with the following property: For every node in the tree, the item in that node is greater than or equal to every item in the left subtree of that node, and it is less than or equal to all the items in the right subtree of that node. 

Binary sort trees have this useful property: An inorder traversal of the tree will process the items in increasing order. In fact, this is really just another way of expressing the definition. For example, if an inorder traversal is used to print the items in the tree shown above, then the items will be in alphabetical order. 

Searching and inserting are efficient operations on a binary search tree, provided that the tree is close to being balanced. A binary tree is balanced if for each node, the left subtree of that node contains approximately the same number of nodes as the right subtree. In a perfectly balanced tree, the two numbers differ by at most one. Not all binary trees are balanced, but if the tree is created by inserting items in a random order, there is a high probability that the tree is approximately balanced. (If the order of insertion is not random, however, it's quite possible for the tree to be very unbalanced.) During a search of any binary sort tree, every comparison eliminates one of two subtrees from further consideration. If the tree is balanced, that means cutting the number of items still under consideration in half. This is exactly the same as the binary search algorithm, and the result is a similarly efficient algorithm.

The problem size, n, is the number of items in the tree, and the average is taken over all the different orders in which the items could have been inserted into the tree. As long as the actual insertion order is random, the actual run time can be expected to be close to the average. However, the worst case run time for binary search tree operations is Θ(n), which is much worse than Θ(log(n)). The worst case occurs for particular insertion orders. For example, if the items are inserted into the tree in order of increasing size, then every item that is inserted moves always to the right as it moves down the tree. The result is a "tree" that looks more like a linked list, since it consists of a linear string of nodes strung together by their right child pointers. Operations on such a tree have the same performance as operations on a linked list. Now, there are data structures that are similar to simple binary sort trees, except that insertion and deletion of nodes are implemented in a way that will always keep the tree balanced, or almost balanced. For these data structures, searching, inserting, and deleting have both average case and worst case run times that are Θ(log(n)). Here, however, we will look at only the simple versions of inserting and searching.

By using In-order traversal, you can get sorted node values if your requirement needs sorted information.. By using Pre-order traversal, you can create a copy of the tree and also can be used to get prefix expression of an expression tree. Postorder traversal is used to delete the tree and also can be useful to get postfix expression of an expression tree.

Binary Heap
Max Heap, Min Heap - Like searching through a link list
Really good for comparative analysis…because you can get all values above our below a number
Always left to right insertion which makes them always balance
Can actually use an array to implement it
Slow Loopups, fast inserts fkexivbike

Priority Queue
Each element has a priority

Trie
No Root Node, Tree that is used to solve String problems, autosuggestions, words in a dictionary 

<img width="830" alt="image" src="https://user-images.githubusercontent.com/22100946/227771583-f6776110-f0c5-478c-8771-60443ebbd494.png">

![image](https://user-images.githubusercontent.com/22100946/227771596-3ebd9fd5-432f-4c7a-833b-6bc0b55e0275.png)

Graphs
A set of values related in a pair-like relationship
Each Item is a node(vertex)
Connected by edges(links)
Use to represent real world relationships(like Facebook)

Linklist and trees are a type go graph

Directed vs Undirected Graph 
Undirected - you can go back and forth

Weighted and Unweighted Graph
Where the connections(edges have weight) i.e. traffic flow between two cities

Acyclic vs Cyclic 

To Build Graphs(Study this more)
Edge List - Shows Connections 
Adjacent List
Adjacent Matrix

A cyclic graph is a directed graph with at least one cycle. A cycle is a path along the directed edges from a vertex to itself. The vertex labeled graph above as several cycles

A weighted graph is an edge labeled graph where the labels can be operated on by the usual arithmetic operators, including comparisons like using less than and greater than. In Haskell we'd say the edge labels are i the Num class. Usually they are integers or floats. The idea is that some edges may be more (or less) expensive, and this cost is represented by the edge labels or weight.

Vertices in a graph do not need to be connected to other vertices. It is legal for a graph to have disconnected components, and even lone vertices without a single connection.


Graphs as adjacency information.
Most programs need to compute all the vertices adjacent to a given vertex. This corresponds to finding a 1-step path in the graph. In fact, for many programs this is the only operation needed, so data structures that support this operation quickly and efficiently are often used. Possible choices include arrays, balanced trees, hash tables,

One useful abstraction is to think of the adjecency information as a function. Under this abstraction a graph is nothing more than a function.
  type Graph vertex = vertex -> [vertex]


When dealing with garbage collection schemes, it is often helpful to think of the reference graph, which is a directed graph where the vertices are objects and there is an edge from an object A to an object B if A holds a reference to B. We also have a special vertex or vertices representing the local variables and references held by the runtime system, and no edges ever go to these nodes, although edges can go from them to other nodes.
In this context, the simple reference count of an object is the in-degree of its vertex. Deleting a vertex is like collecting an object. It can only be done when the vertex has no incoming edges, so it does not affect the out-degree of any other vertices, but it can affect the in-degree of other vertices, causing their corresponding objects to be collected as well if their in-degree also becomes 0 as a result.
The connected component containing the special vertex contains the objects that can't be collected, while other connected components of the graph only contain garbage. If a reference-counting garbage collection algorithm is implemented, then each of these garbage components must contain at least one cycle; otherwise, they would have been collected as soon as their reference count (i.e., the number of incoming edges) dropped to zero.

Perhaps the most obvious way to handle reference cycles is to design the system to avoid creating them. A system may explicitly forbid reference cycles; file systems with hard links often do this. Judicious use of "weak" (non-counted) references may also help avoid retain cycles; the Cocoa framework, for instance, recommends using "strong" references for parent-to-child relationships and "weak" references for child-to-parent relationships.[9]
Systems may also be designed to tolerate or correct the cycles they create in some way. Developers may design code to explicitly "tear down" the references in a data structure when it is no longer needed, though this has the cost of requiring them to manually track that data structure's lifetime. This technique can be automated by creating an "owner" object that does the tearing-down when it is destroyed; for instance, a Graph object's destructor could delete the edges of its GraphNodes, breaking the reference cycles in the graph. Cycles may even be ignored in systems with short lives and a small amount of cyclic garbage, particularly when the system was developed using a methodology of avoiding cyclic data structures wherever possible, typically at the expense of efficiency.

Social networks are a great example of undirected graphs. Once a request is accepted, both parties (e.g. the sender and recipient) share a mutual connection.
A service like Google Maps is a great example of a directed graph. Unlike an undirected graph, directed graphs only support a one-way connection between source vertices and their destinations. 

You should make your own Graph and index objects

Graph problems that can be solved using the BFS algorithm:
• Finding a path from a vertex to another
• Finding the minimum path from a vertex to another
• Finding all the paths from a vertex to another
Finding a minimum spanning tree of an unweighted graph

Graph problems that can be solved using the DFS algorithm:
• Proving that a graph is connected
• Finding if there are existing paths within the graph
Checking if a graph is bipartite (A graph is bipartite when the vertices can be divided into 2 independent sets and all the edges from one of the set connect to the other. Or we can also say a bipartite graph will not contain any odd length cycles.)

Two main data structures for the representation of graphs are used in practice. The first is called an adjacency list, and is implemented as an array with one linked list for each source node, containing the destination nodes of the edges that leave each node. The second is a two-dimensional boolean adjacency matrix, in which the rows and columns are the source and destination vertices, and entries in the array indicate whether an edge exists between the vertices. Adjacency lists are preferred for sparse graphs; otherwise, an adjacency matrix is a good choice.

For instance, social networks like LinkedIN show our connections or search results sorted by degree of separation, and trip planning sites show how many flights you have to take to reach your destination, usually listing direct connections first.

A similar but slightly different requirement is to find those nodes that are most strongly related, but not directly connected yet. In other words, it's interesting to find out which and how many connected nodes are shared between any two nodes, i.e. how many 'friends' are shared between two individuals. Or better yet, to find those nodes sharing a certain (minimum) number of nodes with the current one.
This could be useful to suggest a new possible friend, or in the case of recommendation systems, to suggest a new item/genre that matches the user's interests.

The main difference is the way relationships between entities are stored. In a graph database, relationships are stored at the individual record level, while a relational database uses predefined structures, a.k.a. table definitions.
Relational databases are faster when handling huge numbers of records because the structure of the data is known ahead of time. This also leads to a smaller memory footprint. Graph databases don’t have a predefined structure for the data which is why each record has to be examined individually during a query to determine the structure of the data.
