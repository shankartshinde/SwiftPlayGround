//: [Previous](@previous)

import Foundation

import UIKit
var str = "Hello, playground"

//: [Next](@next)
// Q1:
let data : [Any?] = ["Bill",nil,69,"ABC"]
for item in data where !(item is Hashable) {
    print(item)
}

// Q2::
//weak let view = UIView()
//print(view)

//Q3 ::
let array : [String?] = ["Bill",nil,"ABC"]
if let b = array.first {
    print(b)
}

//Q4 ::
let j = 100
if case 100...101=j {
    print("hello")
} else {
    print("world")
}


//Q5 ::
protocol sdasd {
    mutating func hello()
}

struct hhas:sdasd {
    var sadas:String
    mutating func hello() {
        sadas = "dsadas"
    }
}

//Q6 ::
let left = [1,2,3,5,4]
let right = [6,7,8,9,10]

var action =  [right.first,left.first].compactMap({$0}) + right.dropFirst() + left.dropFirst()
print(action[9])

//Q7 ::
class Animals {
    
}

class Cat :Animals {
    
}

var C: Animals?
C = Cat()
type(of: C)
print(type(of: C) == Cat?.self)

//Q8 ::
func foo (_ function:(Int)->Int)->Int {
    return function(function(5))
}

func bar<T:BinaryInteger>(num:T)->T {
    return num*3
}

print(foo(bar))

//Q9 ::
class SomeClass1 {
    var someClass2:SomeClass2
    init(s:SomeClass2) {
        self.someClass2 = s
    }
}

class SomeClass2 {
    let someClass1:SomeClass1
    init(s1:SomeClass1) {
        self.someClass1 = s1
    }
}

