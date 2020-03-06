import UIKit

// insertion sort
// runtime: O(n^2)
// space: O(1) because sorts in place
// slighly more performant than bubble sort
// given a partially sorted and small array could be a good choice sorting algorithm

//swift's sorting algorithm (hybrib algorithm) is n log n, uses insertion sort on small, partially sorted arrays

//https://github.com/raywenderlich/swift-algorithm-club

func insertionSort(_ arr: inout [Int]) {
    
    for current in 1..<arr.count {
        for j in (1...current).reversed() {
            if arr[j] < arr[j - 1] {
                // swap - using built - in swapAt
                arr.swapAt(j, j - 1)
            } else { // left side of array is sorted
                break // continue to outer loop
            }
        }
    }
    
}
var list = [9, 4, 5, 10, -2]

insertionSort(&list)
print(list)
