## Binary

Consider the binary search algorithm for finding a given value within an array sorted by value from lowest to highest. Binary search first looks at the middle element and determines if the value being searched for is in the upper half or the lower half of the array. The algorithm then continues splitting the appropriate subarray in half until the desired value is found. How many times can an array of size (n) be split in half until only one element remains in the final subarray?

When to use:
When already ordered

O(n)
log(n) -> Why because you keep cutting in half to find the value you are looking for.
