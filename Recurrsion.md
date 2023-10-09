EVERY USEFUL OBJECT contains instance variables. When the type of an instance variable is given by a class or interface name, the variable can hold a reference to another object. Such a reference is also called a pointer, and we say that the variable points to the object(Pointer has its own memory location, while pointing to the other-thats the value). (Of course, any variable that can contain a reference to an object can also contain the special value null, which points to nowhere.) When one object contains an instance variable that points to another object, we think of the objects as being "linked" by the pointer. Data structures of great complexity can be constructed by linking objects together.
A linked list consists of a chain of objects of the same type, linked together by pointers from one object to the next. This is much like the chain of supervisors between emp and the boss

You would choose a link list over an array because you can grow and shrink as you need…allows for traversing without being right next to each other, this can also be ordered

IS THIS HOW VIEWCONTROLLERS WORK?

It is also possible to use recursion to process a linked list. Recursion is rarely the natural way to process a list, since it's so easy to use a loop to traverse the list. However, understanding how to apply recursion to lists can help with understanding the recursive processing of more complex data structures. A non-empty linked list can be thought of as consisting of two parts: the head of the list, which is just the first node in the list, and the tail of the list, which consists of the remainder of the list after the head. Note that the tail is itself a linked list and that it is shorter than the original list (by one node). This is a natural setup for recursion, where the problem of processing a list can be divided into processing the head and recursively processing the tail. The base case occurs in the case of an empty list (or sometimes in the case of a list of length one). For example, here is a recursive algorithm for adding up the numbers in a linked list of integers:



RECURSION
BASE CASES - think about it as a problem within itself || the root typically has some value but its often when you reach null that starts the removal of father stack
Whats the relationship with the children and parent?

Recurrsive is always good for paths
<img width="301" alt="image" src="https://user-images.githubusercontent.com/22100946/227771834-5b26b3a1-d57d-433e-9a02-8a00781e352b.png">


***************

For recursion and traversal it almost goes down to the node of choice and the when it finds nothing it then returns the root of the equation and then just keep returning roots

IN RECURSION ALWAYS THINK OF THE SIMPLIEST STATE IS EASIEST
WHEN YOU START WRITING THE CODE GO ONE DOWN THINK ABOUT THAT TREE ALREADY BEING COMPLETE AND COMBINE LEFT AND RIGHT IN A MANNER AS IF IT WERE DONE 
RECURSION IS STACK

Think about the simplest tree -> an empty tree || this is important

*******************

Feels like arrays are good for in-memory usage while trees are good for storage. And if you think about it when are arrays used with smaller data sets that have been fetched but when are trees used when data is stored on a server and you what a subset of that data. But it’s best to keep that data stored so you can have fast look-ups. BBBOOOMMMMMM Unlike Array, which is linear data structure, tree is hierarchical (or non-linear) data structure. One reason to use trees might be because you want to store information that naturally forms a hierarchy

**********************

BFS - is a queue
DFS - is a stack || deeper in the tree and then lateral || O(n) space and time
You keep removing but just differently 

Breadth First Search - Left To Right O(n) || uses high memory and a queue || shortest Path for even weight

Depth First Search - Down left, down right O(n) || uses stack, memory is equal to height of tree
InOrder, lowest leftNode, Parent Node, furthest Right Node -> ordered array
Preorder, Parent Node, closest left, closest right -> you can recreate a tree
Post Order -> All the way left, all the way right, parent
