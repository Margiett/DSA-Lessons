import UIKit

// quick sort implementation using lomutos partitioning algorithm
//Quick Sort uses a pivot in our examples we use the last element as the pivot
// using this pivot we split the array to the left of the pivot and to the right of the pivot
// example 10, -9, 0, -11 (pivot is 13) , 80
// Quick Sort uses divide and conquer approach to solve the sorting algorithm, divide and conquer is spliting the problem in half on every interation (or recursive call)
//runtime: O(n log n) this is faster than friday March 6 2020

// implement Lomoto's partitioning

// return new index which we will use as the pivot to partition
// the array into a left and right side array
func lomutoPartition(_ arr: inout [Int], low: Int, high: Int) -> Int {
    let pivot = arr[high] // using last element in array
    var i = low
    
    // iterate through the array using j variable as our marker
    for j in low..<high {
        if arr[j] <= pivot {
            //swap and increment i
            arr.swapAt(i, j)
            i += 1
            
        }
    }
    arr.swapAt(i, high)
    return i
    
}

func quicksortLomuto(_ arr: inout [Int], low: Int, high: Int) {
    if low < high {
        // get a new pivot
          let pivot = lomutoPartition(&arr, low: low, high: high)
        
        // recusive calls
        // left array
        // we spilt the array using the pivot
        quicksortLomuto(&arr, low: low, high: pivot - 1)
        
        // right array
        quicksortLomuto(&arr, low: pivot + 1, high: high)
        
    }
  
}

var list = [80, 10, -9, 0, -11, 13, 100, 130, -200, 12, 5, 7, -10, 27, 1992, 28, 14, 18, 24, 36]
quicksortLomuto(&list, low: 0, high: list.count - 1)
print(list)


// bubble sort

func bubbleSort(_ arr: inout [Int]){
    for _ in 0..<arr.count { // n
        for j in 1..<arr.count { // n => O(n^ 2)
            if arr[j] < arr[j - 1] {
                arr.swapAt(j, j - 1)
            }
        }
    }
}
var bubbleList = [90, -8, 1, -90, 80, 10, 80, 10, -9, 0, -11, 13, 14, 40, 27, 28, 20, 2020, 100, -200]
bubbleSort(&bubbleList)
print(bubbleList)

