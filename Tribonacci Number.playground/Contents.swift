import UIKit

var tribDic = [Int: Int]()

func trib (_ n: Int) -> Int {
    if let result = tribDic[n] {
        return result
    }
    guard n > 0 else { return 0}
    guard n > 2 else { return 1}
    let tribResult = trib(n-1) + trib(n-2) + trib(n-3)
    tribDic[n] = tribResult
    return tribResult
}

trib(25)
