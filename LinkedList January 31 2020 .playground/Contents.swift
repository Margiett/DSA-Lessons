import UIKit
// link list has both a head and a tail ... beginning and a end
// link list class that has an append and remove functions
// implementing a abstract node structure
// connection: is a pointer to the next value
// array and dictionaries are generic types

class Node<S: Equatable>: Equatable {
    // has two values
    // type s
    // type node
    var value: S
    var next: Node? // singly link list .. only see the next value... only go forward.. only goes in one direction
    // var previous: Node? // Doubly linked list goes both ways
    
    //required function for equatable
    //==()  function value of equal equal
    // lhs(left hand side) == (rhs) right hand side
    
    static func ==(lhs: Node, rhs: Node) -> Bool {
    return lhs.value == rhs.value && lhs.next == rhs.next // 9
    }
    init(_ value: S) {
        self.value = value
    }
}

// implement customStringConvertable in order to customize the description of a Node

extension Node: CustomStringConvertible{
    var description: String{
        
        guard let next = next else { // guard optional binding to store the value IF there is a value.
            //
            return "\(value) -> nil " // 12 -> nil
        }
        // if there is a value for the node then you come to this line.
        
        return "\(value) -> \(next)"
        // after it checks the first one it starts over and the value becomes the next value and it will check if there is a value.
    }
}

// instantiating node instances
let car12 = Node<Int>(12)
let car99 = Node<Int>(99)

// link list using connected  nodes
// will link the nodes
car12.next = car99

// in order to print the connect nodes in a readable manner we conformed to CustomStringConvertable.
// implemented var description and wrote the print logic..
// description is built in..
// print the current state of the link node
print(car12) // 12 -> 99
// print the first one and you should expect to see the next value

// below is an array and an array know to print itself
//let fellows = ["shaniya","shaniya2"]
//print(fellows)

// implementation of linked list
 
// convert to custom string convertable

extension LinkedList: CustomStringConvertible {
    // stored property cannot be inside of an extension
    // var name = 90 - does not compile, extensions are not allows to have stored properties
    
    
    // computed property that allows for the Node to be able to print itself.
    var description: String{
        guard let head = head else {
            return "empty list"
        }
        return "\(head)"
    }
}
class LinkedList<S: Equatable>{
    var head: Node<S>? // nil
    var tail: Node<S>? // nil
    
// first computed propety
    public var first: Node<S>? {
        return head
    }
    
// last computed propety
    public var last: Node<S>?{
        // might be nil so we will return optional
        return tail
    }
    
    // isEmpty computed proptery
    public var isEmpty: Bool {
         print("empty list ")
        return head == nil// if head is equal to nil then the list is empty
       
    }
    
//append method - adds a Node to the end of the list
    public func append(_ value: S){
        // the point of this is to create a node that is of type generic
        let newNode = Node(value)
        
        // worst case 1: appending to an empty list
        guard let lastNode = tail else {
            // empty list
            head = newNode
            // this allows for them to both point to 7.
            tail = head
            return
        }
        
        // case 2 - has a SINGLE existing node
        lastNode.next = newNode
        // reassigns tail to new node
         tail = newNode
    }
    // removeLast method - removes the last Node from the end of the list
    public func removeLast() -> Node<S>? {
//        guard let _ = head else {
//            return nil // empty list
//        }
        if isEmpty {
            // only if it is empty
            return  nil
        }
        var removeNode: Node<S>?

        // custom types (a Node) does not know how to compare itself.
        if head == tail{
            // scenario 2 if head and tail are pointing to the same Node≥
            removeNode = head
            head = nil
            tail = nil
            return removeNode
        }
        
       // senario 3 - iterate, tranverse, walk through the link list starting from the head
        //make currentNode assignmet to head
         var currentNode = head
        
        while currentNode?.next != tail { // this will stop the node before the tail.
            // keep walking/traverse
            // reset the value here
            currentNode = currentNode?.next
        }
        // change the pointers.
        
        // save the tails node before removing the last value.
        removeNode = tail
        
        //  now say reassign tail to  Node BEFORE the last
        // this is the node before the tail.
        tail = currentNode
        
        // make the next node nothing.
        currentNode?.next = nil
        
        return removeNode
    }
    
 }

// create a list
let fellows = LinkedList<String>()
fellows.append("Shaniya")
fellows.append("Oscar")
fellows.append("Tanya")
//fellows.append("David")

print(fellows) // "Shaniya -> nil"

// test remoing last node
fellows.removeLast()

print(fellows)

fellows.append("Luba")

print(fellows)

fellows.removeLast()
fellows.removeLast()
fellows.removeLast()
fellows.removeLast()
print(fellows)

