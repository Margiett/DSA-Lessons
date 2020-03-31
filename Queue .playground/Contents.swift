import UIKit


/*
 Queues
 - add to the back remove from the front
 
 - an abstract data type is a FIFO structure (meaning - first obejct is the obejct to be removed from the data structure)
 
 fifo structure - first in first out
​
 // methods of a queue
​
 Enqueue - enter the queue from the back
​
 Dequeue - leave the queue from the front
 
 peek - Returns the element at the front of the queue without removing it
 
 isEmpty - Returns whether or not the queue has any elements inside of it
 
 */

struct Queue<S> {
    // an arrary is a stack... so when making a stack from scratch use an array....
    // struct is a copy value type
    
    //private var linkedList = LinkedList<T>
    //private var stack = [Int]()
    
    // add item to elements
  private var elements = [S]()
    // private var linkedlist = LinkedList<S>()
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
    // returns the items at the front of the queue
    // remove it
    public var peek: S? {
        // this is the very first element in the queue
        return elements.first
    }
    
    // adding items to elements
    public mutating func enqueue(_ item: S) {
        elements.append(item)
    }
    
    // remove item from front of ARRARY
    public mutating func dequeue() -> S? {
        // this is also the very first element inside of the queue.
        // this one allows you to remove from the queue while also viewing what it is a queue
        guard !isEmpty else { return nil }
        return elements.removeFirst()
    }
}

var queue = Queue<String>()

queue.enqueue("Shaniya")
queue.enqueue("words")
queue.enqueue("pink")

print("\(queue.peek ?? "") is at the first word")

queue.dequeue()

print("this is all that is left \(queue)")

queue.enqueue("another")

print("\(queue.count) are the amount of words left")

// iterate through a queue structure

//make a copy of the queue
var queueCopy = queue

// while the queue has objects in it do the while loop
while let value = queueCopy.dequeue() {
    print("amount : \(value)")
}

print("there are \(queueCopy.count) left")

var queueNumbers = Queue<Int>()
queueNumbers.enqueue(1)
queueNumbers.enqueue(20)
queueNumbers.enqueue(3)
queueNumbers.enqueue(13)
queueNumbers.enqueue(-20)
//queueNumbers.enqueue(0)
//queueNumbers.enqueue(4)

//1. find the smallest value in a queue
func smallestElement(in q: Queue<Int>) -> Int {
    // parameters are let constants and in order to manipulate them we need access to them
    var qCopy = q // this copy gives access to the the q parameter
    guard var currentSmall = qCopy.peek else {
        return 0
    }
    
    while let num = qCopy.dequeue() {
        if currentSmall > num {
            currentSmall = num
        }
    }
    return currentSmall
}
print(smallestElement(in: queueNumbers))

//2. find the sum of ints in a queue
func sum(of q: Queue<Int>) -> Int {
    var qCopy = q
    var sum = Int()
    
    while let num = qCopy.dequeue() {
        sum += num
    }
    return sum
}

print(sum(of: queueNumbers))

//3. Find out if the queue is in order from smallest to largest
func isSorted(q: Queue<Int>) -> Bool {
    var qcopy = q
    var result = Bool()
guard var beforeNum = qcopy.peek
    else {
        // guarded here because the belowNum becomes an optionalValue
        return true
    }
    
    while let currnetNum = qcopy.dequeue() {
        if beforeNum > currnetNum {
            result = false
            break
        } else {
            beforeNum = currnetNum
            result = true
        }
    }
    return result
}
print(isSorted(q: queueNumbers))

//4. Return the queue in reverse

struct Stack<T> {
    private var elements = [T]()
    private var peek: T? {
        return elements.last
    }
    private var isEmpty: Bool {
        return elements.isEmpty
    }
    
    mutating func push(item: T) {
        elements.append(item)
    }
    mutating func pop() -> T? {
        guard !isEmpty else {
            return nil
        }
        let last = elements.removeLast()
        return last
    }
}

func reverseQueue(q: Queue<Int>) -> Queue<Int> {
    var stack = Stack<Int>()
    var qCopy = q
    
    while let num = qCopy.dequeue() {
        stack.push(item: num)
        print(stack)
    }
    while let num = stack.pop() {
        qCopy.enqueue(num)
        print(qCopy)
    }
    //    for num in stack {
    //        qCopy.enqueue(stack.pop())
    //    }
    return qCopy
}
print(reverseQueue(q: queueNumbers))

//5. determine if two queues are equal

var secondQueue = Queue<Int>()

secondQueue.enqueue(1)
secondQueue.enqueue(20)
secondQueue.enqueue(3)
secondQueue.enqueue(13)
//secondQueue.enqueue(-20)

func checkingBothQueues(qOne: Queue<Int>, qTwo: Queue<Int>) -> Bool {
    var q1 = qOne
    var q2 = qTwo
    var result = Bool()
    
    //if q1.count == q2.count {
         while let num = q1.dequeue(), let num2 = q2.dequeue() {
            if q1.count == q2.count {
                // need to also check if the values have the same amount
                if num == num2 {
                    print("num \(num) num2 \(num2)")
                    result = true
                } else {
                    print("num \(num) num2 \(num2)")
                    result = false
                }
            }
            
        }
    return result
}

print(checkingBothQueues(qOne: queueNumbers, qTwo: secondQueue))
