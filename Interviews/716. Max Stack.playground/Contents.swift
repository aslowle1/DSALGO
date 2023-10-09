// Key here was to keep track of the last value outside the loop
func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
    
    var places = 0
    var last = 0
    
    for (index, value) in flowerbed.enumerated() {
        guard index != flowerbed.count - 1 else {
            if last == 0 && value == 0 {
                places += 1
            }
            continue
        }
        if last == 0 && value == 0 && flowerbed[index + 1] == 0{
            places += 1
            last = 1
        } else {
            last = value
        }
    }
    return places >= n
}
print(canPlaceFlowers([0,1,0], 1))
