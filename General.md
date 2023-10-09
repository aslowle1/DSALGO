# DataStructure
Is required as a way to model and organize data both in a human readable form and a form that makes sense to the layout of memory, which is where data is stored. **But storing data is not enough data for data is also relational which means they often interact and depend on each other. And the relationship can also be placed into memory in a relational pattern as well.**

For Example:
* A stack is a contigious memory region where moving to an from a memory address is easy and doesn't take much calculation.
* A tree is a view that has a superview and a subview and the way to navigate is to traverse those views. There's typically a root view.
* A linked list is a free list where regions to memory are linked with a certain amount of free space.

What is the best way to store data?

# Algorithms
Is the process or steps required to get, traverse data from memory. There are times a single memory address is needed to get what you want but then there are other times that you need a link of memory address to truly get what you want. No matter the need some sort of algorithm will be needed as well.

What is the best way to get Data?

# Memory
The memory of concern is typically RAM. Which is random access memory. Memory that is given an address in a list and data can be access at each address randomly. You don’t need an order to get it. Once you have an address you can get it. Each data structure comes differently in how they lay out data in memory(i.e. contiguous memory, all the x bytes will reside in one place in the memory that is defined by a range of memory addresses).

# Datastructure + Algo = Programming
Concerns of Programming
* Readable - Can you look at the code and understand it
* Memory - How much space does it take up on the stack O(n)
* Speed - How fast can you get the data O(n)

<img width="857" alt="image" src="https://user-images.githubusercontent.com/22100946/213064990-cc25e06f-0a31-481e-8e91-b9a397a1756b.png">

# Logarithm
Logarithmic is a process that is recurrsive, where the rate of change(base number) stays the same(i.e constantly double). The recurrsion can be considered a function. The input to the function is the question(n-value) you are trying to answer. i.e. given the number 59 in an ordered possibly repetitive sceaniro how long will it take to get to 59. 0 - n in the input. How many combinations can you have with two(n) places. The input can then be the power or the total count. The body of the function determines the input type a performs a specific logarthmis formula. 

A logarithm is a mathematical function that represents the relationship between the exponent of a given base and a specified number.

Logarithmic is how many options(base - b) you have to fill a slot(power - p) and as those slots the amount of combinations you increase via "options to slots" or "base to power".

In computing you typically only have two options for memory 0 or 1.

```
logbp = t 

log2n = bits
```

The logarithm of base b for value y is the power to which b is raised to get y. Normally, this is written as logbp=t. 

Many programs require an encoding for a collection of objects. What is the minimum number of bits needed to represent 
n distinct code values? The answer is log2n bits. For example, if you have 1000 codes to store, you will require at least log1000=10 bits to have 1000 different codes (10 bits provide 1024 distinct code values)

## Big O
Big O asks the ultimate question of whether are not your code scalable, efficient & fast? It gets rid of the computer differences machinery and language differences and focus on the pure code itself.
Scalability: As the elements increases how many more operations do we need to do?
Speed: As the elements increase what is the RATE OF CHANGE OF THE SPEED OF THE ALGORYTHM?
What is the worse case scenario? Always calculate based on that.

You treat different inputs as different properties, so if they go through a loop you would do O(n+m)
* O(1) Constant - no loops
* O(log N) Logarithmic - usually searching algorithms have log n if they are sorted (Binary Search). That's because you keep diving by two each time so you keep halving your result set.
* O(n) Linear - for loops, while loops through n items
* O(n log(n)) Log Linear - usually sorting operations
* O(n^2) Quadratic - every element in a collection needs to be compared to ever other element. Two nested loops
* O(2^n) Exponential - recursive algorithms that solves a problem of size N
* O(n!) Factorial - you are adding a loop for every element

Iterating through half a collection is still O(n) - That’s because you need to think of n as inifinty
Two separate collections: O(a * b)
