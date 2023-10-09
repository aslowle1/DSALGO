func isPerfectSquare(_ num: Int) -> Bool {
    if num == 1 {
        return true
    }
    var half = Int(num/2)
    
    return traverse(num, 0, half)
}

func traverse(_ target: Int, _ start: Int, _ end: Int) -> Bool {
    
   if start - end == 0 {
       return start * start == target
   }
  
   if start * start == target {
       return true
   }
    
    if end * end == target {
       return true
   }
   
   let mid = Int((start + end)/2)
   
    if mid * mid == target {
       return true
   } else if  mid * mid > target {
        return traverse(target, start, mid - 1)
    } else {
        return traverse(target, mid + 1, end)
    }
   
}
