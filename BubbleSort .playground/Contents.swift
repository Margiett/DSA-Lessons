import UIKit

//bubble sort
// sorting algorithm
// runtime: O(n^2) - quadratic (considered as the worse sorting algorithm)
// space complexity: O(1) - constant - sorts in place
// sorts in place = inout function


func bubbleSort(_ arr: inout [Int]) {  // we not returning anything because we sort in place,
    // inout indicates in place manipulation
    for _ in 0..<arr.count { // O(n)
        for j in 1..<arr.count { // O(n)
            if arr[j] < arr[j - 1] {
                // we want to swapp without using the built in swap functions
                let temp = arr[j] // saved the value at arr[j] before overwriting
                arr[j] = arr[j - 1]
                arr[j - 1] = temp
                
            }
            
        }
        
    }
}
var list = [ 10, 30, 1, 2, -8, 4, -199] // it always needs to be a variable(var)
bubbleSort(&list)
print(list)
