import UIKit


// merge sort
// worst, best and average runtime is O(n log n)
// uses divide and conquer
// splits the array in two using the middle index
// uses recursion until a base case count is greater than 1
// then merges individual arrays back together while sorting

func mergeSort<T: Comparable>(_ arr: [T]) -> [T] {
    // base case count is greater than 1
    guard arr.count > 1 else { return arr }
    let middleIndex = arr.count / 2
    
    // left array includes beginning array up to but not including the middle index
    let leftArray = mergeSort(Array(arr[..<middleIndex]))
    
    let rightArray = mergeSort(Array(arr[middleIndex...]))
    
    return merge(leftArray, rightArray)
}

// This functions comes up in interviews
//combine two sorted arrays

func merge<T: Comparable>(_ leftArray: [T], _ rightArray: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    var resultsArray = [T]()
    //using a while loop
    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        let leftElement = leftArray[leftIndex]
        let rightElement = rightArray[rightIndex]
        
        // compare
        if leftElement < rightElement {
            resultsArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            resultsArray.append(rightElement)
            rightIndex += 1
        } else { //both equal, append both to the results array
            resultsArray.append(leftElement)
            leftIndex += 1
            resultsArray.append(rightElement)
            rightIndex += 1
            
        }
    }
    
    // out here append elements remaining in left right arrays
    if leftIndex < leftArray.count {
        resultsArray.append(contentsOf: leftArray[leftIndex...])
    }
    if rightIndex < rightArray.count {
        resultsArray.append(contentsOf: rightArray[rightIndex...])
    }
    return resultsArray

}

let list = [12, 8, 29, 100, 234]
let sortedList = mergeSort(list)
print(mergeSort(list))
