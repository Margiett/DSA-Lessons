import UIKit

func oddSum(_ arr: [Int]) -> Int {
    var sum = 0
    
    for num in arr where num % 2 == 1 {
        sum += num * num
    }
    
    return sum
    
}

oddSum([1,2,3,4,5,6])

func numberEningFive(_ array: [Int]) -> [Int] {
    
    return array.filter({ $0 % 5 == 0 && $0 % 10 != 0 })
}

numberEningFive([1, 3, 5, 85, 15, 11, 90, 5, 56, 45, 12, 75])


func rmVol(_ str: String) -> String {
    let vol: Set<String> = ["a", "e", "i", "o", "u", "y"]
    var result = ""
    
    for char in str where !vol.contains(String(char).lowercased()) {
        result += char.description
    }
    
    return result
    
}

rmVol("These are the voyages of the starship Enterprise")

//func factorial(_ num: Int) -> Int {
//    guard num > 1 else { return num }
//
//    return num * factorial(num - 1)
//}

func factorial(_ num: Int) -> Int {
    var count = num
    var result = 1
    
    while count > 0 {
        result *= count
        count -= 1
    }
    
    return result
}

// 14 * result: f(13) * result: f(12) * result: f(11) * result: f(10) * result: f(9)... * 1



factorial(6)


