import UIKit

// Binary Tree - Depth First Traversal

// Depth - first traversals

/*
 1, in order
 2. pre order
 3. post order
 */


/*
                       1
                     /   \
                    2        3
                   / \     /   \
                  4   5   6     7
 
 
 */

// impement a binary tree node

class BinaryTreeNode<T> {
    var value: T // doesnt have any value
    var leftChild: BinaryTreeNode? // because optional has a value of nil
    var rightChild: BinaryTreeNode?
    init(_ value: T) {
        self.value = value
    }
}

extension BinaryTreeNode {
    // in - order traversal
    // rules:
    
    /*
     1. visit left child recursively
     2. visit current node
     3. visit right child recursively
     */
    
    func inOrderTraversal(visit: (BinaryTreeNode) -> ()) {
        leftChild?.inOrderTraversal(visit: visit)
        visit(self)
        rightChild?.inOrderTraversal(visit: visit)
        
    }
}
// create a tree
let treeNode = BinaryTreeNode<Int>(1)
let twoNode = BinaryTreeNode<Int>(2)
let threeNode = BinaryTreeNode<Int>(3)
let fourNode = BinaryTreeNode<Int>(4)
let fiveNode = BinaryTreeNode<Int>(5)
let sixNode = BinaryTreeNode<Int>(6)
let sevenNode = BinaryTreeNode<Int>(7)

treeNode.leftChild = twoNode
treeNode.rightChild = threeNode
twoNode.leftChild = fourNode
twoNode.rightChild = fiveNode
threeNode.leftChild = sixNode
threeNode.rightChild = sevenNode


// test in- order traversal
// expected output: 4 2 5 1 3
print("in-order traversal: ")
treeNode.inOrderTraversal { (node) in
    print(node.value, terminator: " ")
}
print("\n")


