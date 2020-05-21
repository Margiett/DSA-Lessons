import UIKit

public class LRUCache<Value: Equatable> {
    var num = [Int]()
    var capacity: Int
  public init(capacity: Int) {
    self.capacity = capacity
    
  }
  @discardableResult
  public func get(index: Int) -> Int? {
    guard index < self.capacity else {
       
    return nil
    }
    guard index < self.num.count else {
        return nil
    }
    let value = self.num.remove(at: index)
    num.insert(value, at: 0)
    return value
  }
  
  public func insert(value: Int) {
  
        num.insert(value, at: 0)
    if num.count > self.capacity {
        num.removeLast()
    }
    
  
        
    }
  
  @discardableResult
  public func remove(value: Value) -> Bool {
    
  }
}













