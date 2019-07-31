//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

class Node {
    var nodeValue: Int
    var next : Node?
    
    init(value: Int) {
        self.nodeValue = value
        self.next = nil
    }
    
    deinit {
        print("Released node for value \(self.nodeValue)")
    }
}

class LinkList {
    var head : Node?
    
    func addNode(for value:Int) {
        var newNode = Node(value:value)
        if head == nil {
            head = newNode
        } else {
            
            var tempNode = head
            while  tempNode?.next != nil{
                tempNode = tempNode?.next
            }
            tempNode?.next = newNode
        }
    }
    
    
    
    func traverse() -> [Int] {
        var tempNode = self.head
        var numberList : [Int] = []
        while tempNode?.next != nil {
            numberList.append((tempNode?.nodeValue)!)
            tempNode = tempNode?.next
            if tempNode?.next == nil {
                numberList.append((tempNode?.nodeValue)!)
            }
        }
        return numberList
    }
    
    func removeNode(for value:Int)  {
        var tempNode = self.head
        
        if tempNode?.nodeValue == value {
            var firstNode = tempNode
            head = tempNode?.next
            firstNode = nil
        } else {
            var previousNode : Node? = self.head // store previous node
            tempNode = self.head
            var matchingNode : Node?
            while tempNode?.next != nil {
                if tempNode?.nodeValue == value {
                    matchingNode = tempNode
                    previousNode?.next = matchingNode?.next
                    matchingNode = nil
                    break
                }
                previousNode = tempNode
                tempNode = tempNode?.next
            }
        }
        
    }
}

let singleLinkList = LinkList()
singleLinkList.addNode(for: 1)
singleLinkList.addNode(for: 2)
singleLinkList.addNode(for: 3)
singleLinkList.addNode(for: 4)
singleLinkList.traverse()

singleLinkList.removeNode(for: 3)
singleLinkList.traverse()

singleLinkList.addNode(for: 5)
singleLinkList.traverse()

