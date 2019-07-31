//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


class LinkList {
    var numValue: Int
    var node: LinkList?
    
    init(nodeValue:Int, next:LinkList?) {
        self.numValue = nodeValue
        self.node = next
    }
}

var firstNode = LinkList(nodeValue:10, next: nil)
print(firstNode.numValue)

var secondNode = LinkList(nodeValue:20, next: nil)
firstNode.node = secondNode

var thirdNode = LinkList(nodeValue:30, next: nil)
secondNode.node = thirdNode

print("Third Node value \(secondNode.node!.numValue)")

var baseNode: LinkList?  = firstNode
print(" First node value \(baseNode?.numValue)")
var index = 0
while (baseNode?.numValue != 0) {
    index = index + 1
    print("\(index) : \(baseNode!.numValue)")
    if let nextNode = baseNode?.node {
        baseNode = nextNode
    } else {
        baseNode?.numValue = 0
    }
}


print(firstNode.numValue)



class Node {
    
    let value: Int
    var next: Node?
    
    init(value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
}

class LinkedList {
    
    let head: Node
    
    init(node: Node) {
        self.head = node
    }
    
    convenience init(nodeValue: Int) {
        self.init(node: Node(value: nodeValue))
    }
    
    func addNode(node: Node) {
        var current: Node = self.head
        while current.next != nil {
            current = current.next!
        }
        current.next = node
    }
    
    func addNode(withValue value: Int) {
        self.addNode(node: Node(value: value))
    }
    
    func traverse() -> [Int]{
        var results: [Int] = []
        var current: Node = self.head
        print("\(current.value)")
        while current.next != nil {
            results.append((current.value))
            current = current.next!
            if current.next == nil {
                results.append((current.value))
            }
        }
        return results
    }
    
}


let list = LinkedList(nodeValue: 4)
list.addNode(withValue: 3)
list.addNode(withValue: 2)
list.addNode(withValue: 1)
list.addNode(withValue: 0)
list.addNode(withValue: -1)
list.traverse()
