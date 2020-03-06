import UIKit

var str = "Hello, playground"

let firstNumbers = [5, 7, 1, 4, 6, 9, 12, 13]

// sorted

// let newNumbers = firstNumber.sorted()

let newNumbers = firstNumbers.sorted(by: {0 > $1})

print(newNumbers)

//filter

let numbers = [1,2,3,4,5,3,3]

var filteredNums = [Int]()

for num in numbers{
    if num == 3{
        filteredNums.append(num)
        
    }
    print(filteredNums)
}

// map

var mappedNums = [Int]()

let secondNums = [2,3,4,9,8]

let show = secondNums.map ({$0 * 20})
print(show)

// reduce

let fourthNumbers = [4,6,7,9,12]

var sumElement = 0

for num in fourthNumbers{
    sumElement += num
}
print(sumElement)

let sum = fourthNumbers.reduce(0, {sum, number in sum + number})

print(sum)
