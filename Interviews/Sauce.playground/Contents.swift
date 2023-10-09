/*
               Target = 8
 Moving Along the index and each index can have a relationship with each other. Each index can also have a relationship with  itself
 [5, 12, 4]
         

 1st           4(4)...
 2nd        4(0)
 
 func sumPossible(_ target: Int, _ nums: [Int]) -> Bool {
    
     if target < 0 { return false }
     
     if target == 0 { return true }
     
     for index in nums {
         if sumPossible(target - index, nums) { return true }
     }
   
     return false
 }

 */

/*
 
 The naming here clearly outlines the relationship as you traverse so you remember what is what

 func minChange(_ target: Int, _ nums: [Int]) -> Double {
    
     if target < 0 { return Double.infinity }
     
     if target == 0 { return 0 }
     
     var parent = Double.infinity
     for index in nums {
         let child = minChange(target - index, nums) + 1
         if child == -1 {
             continue
         } else {
             parent = min(child, parent)
         }
     }
     return parent == Double.infinity ? -1 : parent
 }
 */

/*
                        
 What is changing here? Is the question. And changing by what until when?
 If Double.infinity isn't changed
                        12
                    9(3)   4(8)   1(11)
                 1(2)       4(4)
              1(1)            4(0)
            1(0)
 
 
 import Darwin

 func summingSquares(_ num: Double) -> Double {
     if num < 0 {
         return Double.infinity
     }

     if num == 0 {
         return 0
     }

     let maxSqrt = sqrt(num).rounded(.down)

     var minValue = Double.infinity

     for value in 1...Int(maxSqrt) {
         let sqr = Double(value * value)
         let result = summingSquares(num - sqr) + 1
         minValue = min(minValue, result)
     }

     return minValue
 }

 print("summingSquares(87)")

 */

/*
 
 Non for-loop iteration. The thing that is changing here is the array...Its a bit difficult to iterate over an array. The array is also change at different rates which is important. the smallest array you'd compace starting from different places. GO DOWN TO THE SIMPLEMENTS FORMS
 
 let arr = [2, 4, 5, 12, 7]
  
                    2
          5, 12, 7    12, 7   7
 
 
 func nonAdjacentSum(_ nums: [Int]) -> Int {
     
     if nums.count == 1 {
         return nums.first!
     }
     
     if nums.count == 0 {
         return 0
     }
     
    var first = nums[0]
     
     if nums.count > 1 {
        first += nonAdjacentSum(Array(nums[2...]))
     }
     
    let second = nonAdjacentSum(Array(nums[1...]))
     
     
    return max(first, second)
 }

 print(nonAdjacentSum([2, 4, 5, 12, 7]))
      
 */

/*
 "oneisnone", ["one", "none", "is"]
            
             oneisnone
 
 
 "santahat", ["santah", "san", "hat", "tahat"]
 
                    santahat
                    san     santah
                tahat
 
 func canConcat(_ str: String, _ options: [String]) -> Bool {
     
     if str.isEmpty {
         return true
     }
     
     var values = [(String, Int)]()
     
     for index in 0..<str.count {
         if values.isEmpty {
             values.append(("", -1))
         }
         let char = "\(str[str.index(str.startIndex, offsetBy: index)])"
         values[values.count - 1].0.append(char)
         if options.contains(values[values.count - 1].0) {
             values[values.count - 1].1 = index
             values.append(values[values.count - 1])
         }
     }
     
     for value in values {
         if value.1 == -1 {
             continue
         }
         let newString: String = {
             var copy = str
             for _ in 0...value.1 {
                 _ = copy.removeFirst()
             }
             return copy
         }()
         if canConcat(newString, options) {
             return true
         }
     }
     return false
 }

 
 */

/*
 
 For loop is really good for when theres a continous relationship between the children in the array and then some interation. but here the tree skews to one side ecame after you remove an element you let it go to the bottom and then come back and interact withremoved
 
 See what happens if you keep breaking the parent down and then see what happens when you leave the parent and break the rest down
               ['a', 'b']
                [a,b,c]
         [a]            [b,c]
                     [b]    [c]
                

 
               [a]
            [ ]   [b]
                     [ ]
                  
[b][ ], [a,b][a ]

 
 // [
 //   [],
 //   [ 'b' ],
 //   [ 'a' ],
 //   [ 'a', 'b' ]
 // ]
          
 // [
 //   [],
 //   [ 'c' ],
 //   [ 'b' ],
 //   [ 'b', 'c' ],
 //   [ 'a' ],
 //   [ 'a', 'c' ],
 //   [ 'a', 'b' ],
 //   [ 'a', 'b', 'c' ]
 // ]
 

func subsets(_ arr: [String]) -> [[String]] {

    if arr.isEmpty {
        return [[]]
    }
        
    var copy = arr

    let first = copy.removeFirst()
    
    let value = subsets(copy)
    var valueCopy = value
    
    for index in 0..<valueCopy.count {
        valueCopy[index].append(first)
    }
    
    valueCopy.append(contentsOf: value)
    
    return valueCopy
}


print(subsets(["a", "b", "c"]))

 */

/*
 Here is a combination based result. I removed the first element each time again and iterated through it. Not using a for-loop.
   [a, b, c]
          [a]
             [b, c]
           [b]   [c]
         []         []
 

 [b, c] [c,b]
 
 [a, b, c]  [b, a, c] [b, c, a]

 func permutations(_ array: [String]) -> [[String]] {
     
     if array.isEmpty {
         return [[]]
     }
     
     var copy = array
     
     let first = copy.removeFirst()
     print(first)
     let result = permutations(copy)
     var finalResult = [[String]]()
     
     for index in 0..<result.count {
         let editable = result[index]
         
         for count in 0...editable.count {
             var newVal = editable
             if count == editable.count {
                 newVal.append(first)
             } else {
                 newVal.insert(first, at: count)
             }
             finalResult.append(newVal)
         }
     }
     return finalResult
 }

 print(permutations(["a", "b", "c"]))
 */


/*
 
 For combinations there are not comparisons!!! and with comparisons you are normally comparing what the child does in relationship to everything. With combinations you take it away from the collection and combine the result fron root up in a certain way
 
 [a,b,c,d]
 
 a ac            [[cd] [bc] [bd]]
   b      cd bc bd
    cd
      [a]           root * each and bring back a new Array
         [b,c]         ab ac bc
       [b]    [c]
 
 func createCombinations(_ array: [String], _ count: Int) -> [[String]] {
     
     if array.count == 2 {
         return [array]
     }
     
     var copy = array
     let parent = copy.removeFirst()
     
     var result = createCombinations(copy, count)
     var newValues: [[String]] = []
     for index in 0..<result.count {
         for letter in result[index] {
             let addable = [parent, letter]
             newValues.append(addable)
         }
     }
     result.append(contentsOf: newValues)
     return result
 }
PART 2
 /*
  subsets(['a', 'b']); // ->
  // [
  //   [],
  //   [ 'b' ],
  //   [ 'a' ],
  //   [ 'a', 'b' ]
  // ]
  
       Edge Case: Empty Array || How do I get to an empty array?  Remove & Copy
          []
     []        [a]
  []    [b] [a]   [ab]
               [][a][b][ab]
  Include or not include as you move up and backwards
  
  2^n different subsets
  */

 func subsets(_ elements: inout [String]) -> [[String]] {
     if elements.isEmpty { return [[]] }
     
     let first = elements.removeFirst()
     
     var subset = subsets(&elements)
     
     let subsetWithFirstElement = subset.map { element -> [String] in
         var copy = element
         copy.append(first)
         return copy
     }
     
     subset.append(contentsOf: subsetWithFirstElement)
     
     return subset
 }

 var elements = ["a","b","c"]
 print(subsets(&elements))
 print(createCombinations(["a", "b", "c"], 2))
 */

/*
 
 parentheticalPossibilities('x(mn)yz'); // ->
 xmyz
 xnyz
 
 
          x
            m,n
                yz
 z
 // [ 'xmyz', 'xnyz' ]
 
 func parentheticalPossibilities(_ str: inout String) -> [String] {
     if str.isEmpty {
         return [""]
     }
     var first: String = "\(str[str.startIndex])"
     _ = str.removeFirst()
     if first == "(" {
         first = ""

         while "\(str[str.startIndex])" != ")" {
             first.append(contentsOf: "\(str[str.startIndex])")
             _ = str.removeFirst()
         }
         _ = str.removeFirst()
     }

     let result = parentheticalPossibilities(&str)
     var finalCopy = [String]()
     for letterIndex in 0..<first.count {
         result.forEach { value in
             var letter = "\(first[first.index(first.startIndex, offsetBy: letterIndex)])"
             print("letter: \(letter)")
             print("value: \(value)")
             letter.append(contentsOf: value)
             finalCopy.append(letter)
         }
     }

     return finalCopy
 }

 var str = "(qr)ab(stu)c"
 print(parentheticalPossibilities(&str))

 */

/*
 /*
  // [
  //   [ 'a', 'b' ],
  //   [ 'a', 'c' ],
  //   [ 'b', 'c' ]
  // ]
  
        a,b,c
        a(2)
    b(1)  c(1)  [b,c]
  (0)
 b,c (1)  (b) [b,c]    c(1)
  
  */

 func createCombinations(_ elements: inout [String], _ count: Int) -> [[String]] {

     var combos = [[String]]()
     Array(0..<elements.count).forEach { value in
         var copy = Array(elements[value...])
         var copyCount = count
         combos.append(contentsOf: traverse(&copy, &copyCount))
     }
     return combos
 }

 func traverse(_ elements: inout [String], _ count: inout Int) -> [[String]] {
     
     guard !elements.isEmpty else { return [] }
     let first = elements.removeFirst()               // a               b
     count -= 1
     print(first, count)
     if count == 0 {
         print(first)
         return [[first]]
     }
     var allValues = [[String]]()
     for current in (0..<elements.count) {
         var copy = Array(elements[current...])       // [b,c]           [c]
         var copyCount = count
         print(current, copy, count)
         let combo = traverse(&copy, &copyCount)                                   //   [[]]
         allValues.append(contentsOf: combo)
     }
     for index in 0..<allValues.count {
         allValues[index].append(first)
     }
  return allValues
 }

 var elements = ["a","b","c", "d"]


 print(createCombinations(&elements, 7))

 */


/*
 
 
 /**
  * This function determines if the braces ('(' and ')') in a string are properly matched.
  * it ignores non-brace characters.
  * Some examples:
  * "()()()()"   -> true
  * "((45+)*a3)" -> true
  * "(((())())"  -> false
  * "))((" -> false
  */
 func matched(s: String) -> Bool {
    
   var stack = [String]()
   
   for chacarter in s {
     
     if "\(chacarter)" == ")" {
       
       if stack.isEmpty {
         return false
       } else {
         stack.removeLast()
       }
       
     } else if "\(chacarter)" == "(" {
       stack.append("(")
       
     }
     
   }
   
   return stack.isEmpty
 }

 /**
  * Given a nested list of integers, returns the sum of all integers in the list weighted by their depth
  * For example, given the list {{1,1},2,{1,1}} the function should return 10 (four 1's at depth 2, one 2 at depth 1)
  * Given the list {1,{4,{6}}} the function should return 27 (one 1 at depth 1, one 4 at depth 2, and one 6 at depth 3)
  *
  *   1      (depth 1) = 1 * 1
  *    \
  *     4    (depth 2) = 2 * 4
  *      \
  *       6  (depth 3) = 3 * 6
  *                    = 27
  */


 /**
  This is the interface that represents nested lists.
  You should not implement it, or speculate about its implementation.
  */
 protocol NestedInteger {
     /**
      - returns: `true` if this `NestedInteger` holds a single integer, rather than a nested list
      */
     var isInteger: Bool { get }
     /**
      - returns: The single integer that this `NestedInteger` holds, if it holds a single integer.
                 Return `nil` if this `NestedInteger` holds a nested list.
      */
     var integer: Int? { get }
     /**
      - returns: The nested list that this `NestedInteger` holds, if it holds a nested list.
                 Return `nil` if this `NestedInteger` holds a single integer.
      */
     var list: [NestedInteger]? { get }
 }

 func depthSum(for input: [NestedInteger]) -> Int {
     // Implementation here
   
   return depthSum(for: input, 1)
 }

 /* Given the list {1,{4,{6}}} the function should return 27 (one 1 at depth 1, one 4 at depth 2, and one 6 at depth 3)
  *
  *   1      (depth 1) = 1 * 1   -> 3
  *    \
  *     4    (depth 2) = 2 * 4   -> 2
  *      \
  *       6  (depth 3) = 3 * 6   -> 1
  *                    = 27
  */
 // {{1,1},2,{1,1}} -> 10

 func depthSum(for input: [NestedInteger], _ depth: Int) -> [(Int, Int)] {
     // Implementation here
   
   var sum = 0
   for element in input {
     if element.isInteger {
       let elementSum = element.integer! * depth
       sum += element
     } else {
       sum += depthSum(element.list, depth + 1)
     }
   }
   
   return sum
 }

 */


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

class Node {
   let val: String
   var next: Node?
   init(_ val: String) {
       self.val = val
   }
}
