Array - Questions to Ask[Does sorting matter] || Array(repeating: "Z", count: 5)
Duplicate Numbers In An Array - Hash Approach is good but Sorting and checking before and after is also good
Maximum Subarray - Difficult problem to conceptualize. Reseting each value to zero when it reaches a negative number
Two Sums - Easy problem, O(n) can be achieved via a hash table of what you need(difference) and location of original
Squares of a Sorted Array - Tricky problem, approached from two ends with a pointer is one option. I took advantage of a while loop. Feel like a while loop is good if you want to stay at current index but still press forward. Also just keep track of the position in a while loop gives some flexibility
Merge Sorted Array - Again multiple pointers, combining two arrays and a while loop feels really good
Finding Intersection of Two Arrays - Using hash table and a counter to keep track of the frequency of the array O(n+m)
Best Time to Buy and Sell Stock - Finding max and min and then refreshing values every time you get a new min
Reshape the Matrix - 3D Array, which means array embedded in Array…used for loop and a while loop
Pascal's Triangle - Multiple Arrays embedded in Array…Used two while loops
Valid Sudoku - 3D matrix to find duplicates, used a hash table
First Unique Character in a String - Hash Map had to be used, but it was used with a counter, then check the hash map one more time getting the count
Ransom Note - A comparison is one string has the contents to make another string, again this is like a do these letters exist, create a hash for all the values you need the run through the other loop seeing if it has the values in the original hash while deleting a counter in the original hash, again a counter in hash

Binary Search
Since it’s two pointers you can use a while loop, ArraySlice can also be. Used but the downside is the input must also be an arraySlice
Again a two pointer approach and a while loop
First Bad Version - Defiantly use While loop and start with a low index and then a high Index and keep changing high and low

Stack/Queue
Valid Parentheses - Pop the last item to be added and verify that it matches || Here ORDER MATTERS…IF THE LAST IN NEEDS TO RELATE TO THE FIRST OUT KINDA THING
Move Zeros - FIFO ORDER OF THE ORIGINAL ARRAY MATTERED BEYOD CHROCOLOGICAL ORDER

Link List
Merge Two Sorted Lists - Trouble here was identifying the tail you have to set tail.next first and then the tail as you append
Reverse Linked List - You have to walk through the iterations at least a couple times to start developing a pattern
Remove Duplicates from Sorted List - When FINDING DUPILCATES IN A SORTED ANYTHING YOU DON’T NEED A HASH TABLE, JUST CHECK PREVIOUS
Reverse Words in a String III - O(n) solution but exceeded time. Approach felt really good. NEED TO LEARN STRING MANIPULATION
19. Remove Nth Node From End of List
Tree(DFS vs BFS):
102. Binary Tree Level Order Traversal - Understanding the aspect of queue vs stack is the most important aspect of this problem
104. Maximum Depth of Binary Tree - Really brilliant approach taken. Can either be done with DFS or BFS. With BFS you can use the same approach as problem 102 to solve. But with DFS you give each node a value of 1 and then add it to the left and right which ever has the maximum should be used. You are choosing the maximum depth left or right.
 226. Invert Binary Tree - It feels like when I’m doing anything related to comparing the left or right sides of the tree that BFS is much better
112. Path Sum - The base cases here were key. By understanding that its root to leaf you automatically check to first make sure its a leaf and that becomes the base case. Then after that it’s a matter of OR statements. Also subtracting for the sums
226. Invert Binary Tree - Pretty Simple. You just keep swapping left and right in a stack approach
700. Search in a Binary Search Tree
3. Longest Substring Without Repeating Characters - Used a hash table and a the most recent/current string…again a hash to check for repeats duplicate or frequency
701. Insert into a Binary Search Tree
98. Validate Binary Search Tree - Need to be more comfortable with building my own support functions and know when to create my own especially when these function don’y return an int
235. Lowest Common Ancestor of a Binary Search Tree - THE KEY HERE IS BINARY, QUESTION TO ASK IS, IS IT ORDERED WITH IT BEING ORDERED YOU CAN THEN START CHOPPING IN HALF THAT IS THE KEY TO MOVING FORWARD
Graph
1791. Find Center of Star Graph - Struggled with this one. This is not a cyclical graph whatever is in center will get repeated the most
