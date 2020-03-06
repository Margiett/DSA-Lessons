import UIKit

// Quesues: is a abstract data type that is a FiFo structure (meaning: first object added is the first object to be removed from the data structure)

// method of a Queue:

// enqueue: add item to the back of thr queue


//dequeue: remove item from the front of the queue

// properties: count, isEmpty, peek

struct Queue<T> {
    //implementing a queue using an array
    private var elements = [T]()
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
    public var peek: T? {
        return elements.first
    }
    
    public mutating func enqueue(_ item: T) {
        elements.append(item)
    }
    
    public mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return elements.removeFirst()
    }
}

var queue = Queue<String>()
queue.enqueue("Mel")
queue.enqueue("Kelby")
queue.enqueue("Oscar")

print("\(queue.peek ?? "") is at the front of the line")

queue.dequeue()

print("Fellows left: \(queue)")

queue.enqueue("Eric")
print("there are \(queue.count) fellows on line")

var queueCopy = queue

while let value = queueCopy.dequeue() {
    print("fellow: \(value)")
}

print("there are \(queueCopy.count) fellows left in queueCopy")
