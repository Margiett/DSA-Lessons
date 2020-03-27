import UIKit

// https://www.bigocheatsheet.com

// Big O Notation: calculating the performance of the given algorithm

// Big O has two performance metrics:
// 1. time complexity
// 2. space complexity


// fastest to slowest runtimes (time complexity)
// O(1), O(log n), O(n), O(n log n), O(n^2), O(2^n), O(n!)

//O(1) - constant time

func printFirstElement(arr: [String]) {
    guard let first = arr.first else {
        return
    }
    //print(arr[0])
    print(first)
}
printFirstElement(arr: ["Greg", "Matt"])

let fellows = ["Mel", "Yulia", "Stephanie"]


// what is the runtime of the line below?
fellows[2]
let firstTwoFellows = fellows.prefix(10)
print(firstTwoFellows) // this is a slice of an array

let numbers: Set = [1,2,3,4]
numbers.contains(3) // this is constain time O(1)

// if we doing something with contains a set is better.

//MARK:  web for Sets:
// https://developer.apple.com/documentation/swift/set

// Set: An unordered collection of unique elements.

//MARK: WEB FOR CONTAIN
// Returns a Boolean value that indicates whether the given element exists in the set.
//https://developer.apple.com/documentation/swift/set/1540013-contains


//=======================================================
//O(n)
//=======================================================

// n represents the number in the elements in the collection
for fellow in fellows { // O(n) => O(3)
    
    
    print(fellow)
    // it prints out 3 because there is three fellows and it looped thru three fellows Mel, Yulia and Stephanie
}

// Returns a subsequence, up to the specified maximum length, containing the initial elements of the collection.

//https://developer.apple.com/documentation/swift/array/1689487-prefix


//let firstTwoFellows = fellows.prefix(10)
//print(firstTwoFellows) // this is a slice of an array


// ==========================================================
// O(log n) - logorithmic time
// on every iteration the problem increments
//or decrements by half
//===========================================================

// https://www.logcalculator.net/log-2

let n = 16
var j = 1
while j < n {
    j *= 2 // 2, 3, 4, 8, 16
}

var count = 0
while count < 10 {
    print(count) // we are going thru each element
    count += 1
}

//============================
//O(n log n)
//===========================

for _ in 0..<10 { // O(n) = >
    var j = 1
    while j < n { // O(log n) = > 4
        j *= 2 // // 2,4,8,16
    }
    }

// ============================
// O(n^2) - quadratic
//=============================

let list = [1,2,3,4,5,6,7,8,9,10]
for i in 0..<list.count { // O(n) => 10
    for j in 0..<list.count { // O(n) => 10
        print("\(list[i]) * \(list[j]) = \(list[i] * list[j])")
    }
}

func compoundRuntimes(arr: [Int]) {
  for _ in 0..<1000 {
    print("Hi!")
  }
  for num in arr {
    print(num)
  }
  for (indexOne,numOne) in arr.enumerated() { // O(n)
    for (indexTwo, numTwo) in arr.enumerated() { //O(n)
      if indexOne != indexTwo && numOne == numTwo {
        print("It's a match! \(numOne) and \(numTwo) are equal")
      }
    }
  }
}
// solution:

