import UIKit

// binary Search - implemented using recursion

// binary search

// runtime - O(log n) - as array diving on each pass

// array must be sorted
// array is divided in halves to find the middle index
//based on the current value at the middle index we either continue searching to the left of the middle index
// or
// continue searching for the value to the right of the middle index
// we use divide and conquer and implement the steps above
// until we find our value to do not find a value when steps have been exhausted


// implementing binary search using recursion
// converting to genertic
//func binarySearch(_ arr: [Int], searchKey: Int, range: Range<Int>) {
func binarySearch<T: Comparable>(_ arr: [T], searchKey: T, range: Range<Int>) -> Int? {
    
    // check to ensure that the upper bound is higher than the lower bound
    // it has to be sorted !!!
    // we are assuming that is sorted
    // the reason why is need it to be sorted because we are comparing to the number in the middle to see if is bigger or smaller ?? - need to confirm this note
   
    //if 5 > 0 return nil
    //[4, 5, 8]
    // lower bound = 0
   //upper bound = 2
    if range.lowerBound >= range.upperBound {
        return nil
    }
    
    // calculate middle index
    let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    
    // 3 checks
    // 1. is middle index value equal to search key (if it is we have found the search ket )
    //2. if the value at the middle index is greater than the search key, we will now look at the left side of the middle index
    //3. if the value at the middle index is less than search value, we look to the right
    
    // check 1
    if arr[middleIndex] == searchKey {
        return middleIndex
    }
    
    // check 2
    else if arr[middleIndex] > searchKey { // left side of the middle index
        return binarySearch(arr, searchKey: searchKey, range: range.lowerBound..<middleIndex)
    }
    
    // check 3
    
    else if arr[middleIndex] < searchKey { // look at the right side of the middle index
        
        return binarySearch(arr, searchKey: searchKey, range: middleIndex + 1..<range.upperBound)
        // if middle index plus 1 so if is currently at index 3 + 1 is saying go to index 4
    }
    // did not find the value
    return nil
}

let sortedList = [2, 6, 9, 13, 34, 99, 101]

let index = binarySearch(sortedList, searchKey: 99, range: (0..<sortedList.count - 1))

print("found index \(index ?? -999)") // 5

let characters = [ "a", "b", "c", "y"]
let charIndex = binarySearch(characters, searchKey: "y", range: (0..<characters.count))

print("found char index: \(charIndex ?? -1)")
