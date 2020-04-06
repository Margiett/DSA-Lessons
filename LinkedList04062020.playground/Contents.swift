import UIKit

class Node<T> {
    // node does not have to have a generic type
    // but every time you create a node you have to sepified what type it is
    var value: T
    var next: Node?
    init(_ value: T) {
         self.value = value
    }
   
}

// instantiating node instances
// our train has two cars
let car12 = Node<Int>(12)
// we want to connect our train to the next car
let car99 = Node<Int>(99)

// linked our nodes
car12.next = car99

// print the current state of the linked node
print(car12) // 12 -> 99 

let fellows = ["Ameni", "Lilia"]
print(fellows)
