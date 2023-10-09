Bubble Sort - Not efficient || You have to loop through each twice || comparing  each item next to each other and then moving and swapping
func bubbleSort(_ array: [Int]) -> [Int] {
var arr = array
for count in 0..<arr.count - 1 {
    for index in 0..<arr.count - 1 {
        let value = arr[index]
        let futureValue = arr[index + 1]
        if value > futureValue {
            arr[index] = futureValue
            arr[index + 1] = value
        }
    }
}
return arr
} 

Selection Sort - set current index as you loop as the current minimum but then as you loop through the rest of the list if you find a smaller value you update the smallest index. After you’ve fully loop through you then find the smaller index and swap it with the current index
func selectionSort(_ array: [Int]) -> [Int] {
var arr = array
for count in 0..<arr.count {
var smallestIndex = count
    for index in count + 1..<arr.count {
        if arr[index] < arr[smallestIndex] {
            smallestIndex = index
        }
    }
    let currentIndexValue = arr[count]
    let smallestValue = arr[smallestIndex]
    arr[count] = smallestValue
    arr[smallestIndex] = currentIndexValue
}
return arr
}
print(selectionSort([3,4,7,1,2,9,0]))

Insertion Sort - is good for when a list almost sorted or small data sets
func insertionSort(_ array: [Int]) -> [Int] {
var arr = array
for count in 1..<arr.count {
var mutableCount = true
var countable = count

while countable > 0 && (arr[countable] < arr[countable - 1]) {
    let value = arr[countable]
    arr[countable] = arr[countable - 1]
    arr[countable - 1] = value
    countable = countable - 1
    mutableCount = false
}
}
return arr
}

***********
Complexity: n log(n)
When to use: Max or Min problems
Min - Parent is always the min
Max - Parent is always larger

Heap - Ordered binary tree

Not really adaptive (Doesn't get faster if given somewhat sorted array)
Heap Sort in Data Structure is used when the smallest (shortest) or highest (longest) value is needed instantly.

A common misconception is that a Heap is the same as a Priority Queue, which is not true. A priority queue is an abstract data type, while a Heap is a data structure. Therefore, a Heap is not a Priority Queue, but a way to implement a Priority Queue.
There are multiple ways to implement a Priority Queue, such as array and linked list. However, these implementations only guarantee 
O(1)
O(1) time complexity for either insertion or deletion, while the other operation will have a time complexity of 
O(N)
O(N). On the other hand, implementing the priority queue with Heap will allow both insertion and deletion to have a time complexity of 
O(\log N)
O(logN).

a Heap is a special type of binary tree. A heap is a binary tree that meets the following criteria:
Is a complete binary tree;
The value of each node must be no greater than (or no less than) the value of its child nodes.

Classification of Heap
There are two kinds of heaps: Max Heap and Min Heap.
Max Heap: Each node in the Heap has a value no less than its child nodes. Therefore, the top element (root node) has the largest value in the Heap. 
Min Heap: Each node in the Heap has a value no larger than its child nodes. Therefore, the top element (root node) has the smallest value in the Heap. 
COMPLETE BINARY TREE IS LEFT TO RIGHT!!! Insert to bottom left HEAPS MUST BE COMPLETE BINARY TREE

DELETION REMOVE THE BOTTOM RIGHT ELEMENT AND SWAP IN WITH THE ONE YOU DELETE
