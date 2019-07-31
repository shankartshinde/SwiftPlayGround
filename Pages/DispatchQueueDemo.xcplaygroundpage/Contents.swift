//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
    for _ in 0...10 {
        print("🥳")
    }
}

// Print Emoji using ctrl+command+spacebar
DispatchQueue.global(qos:.utility).async {
    for _ in 0...10 {
        print("😈")
    }
}


