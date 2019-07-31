//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

struct Employee {
    var name: String
    var age: Int
    private var phone : String

    init(name:String, age:Int, phone:String) {
                self.name = name
                self.age = age
                self.phone = phone
    }
    
//    convenience init(<#parameters#>) {
//        <#statements#>
//    }
    
//    init() {
//        self.name = ""
//        self.age = 0
//        self.phone = ""
//    }
    
//    required init(<#parameters#>) {
//        <#statements#>
//    }
}


var empShankar = Employee(name: "Shankar", age: 30, phone: "2173812123")
//var empShankarOptional = Employee(name: "asdasd", age: 20 , phone: )

//: [Next](@next)
