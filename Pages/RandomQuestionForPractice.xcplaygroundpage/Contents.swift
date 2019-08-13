//: [Previous](@previous)

import Foundation
print(" ------ Q: Write a protocol which confirm to only class")
protocol Runnable: class {
    var speed: Int {get set}
    func showSpeedOfCar()
}

class Car: Runnable {
    var speed = 100
    func showSpeedOfCar() {
        print("Car  Speed is \(speed)")
    }
}

let swift = Car()
swift.showSpeedOfCar()

print(" ------  Q: Is this valid deceleration & will it compile")
//struct Human : Runnable {
//
//}

print(" ------  Q: Is this valid deceleration & will it compile")
//class Animal {
//    var name:String
//}

print(" ------  Q : Is this valid deceleration and will code compile")
class A {
    deinit {
        print("Released class A")
    }
}

print(" ------  Q : Is this valid deceleration and will code compile with Inheritance ")
class B: A {
    deinit {
        print("Released class B")
    }
}



print(" ------  Q : Is this valid deceleration and will code compile with Inheritance, What is output")
class ChildClass {
    init() {
        print("Child class init")
    }
    
    deinit {
        print("Child class deinit")
    }
}

class BaseClass:ChildClass {
    override init() {
        print("BaseClass class init")
    }

    deinit {
        print("BaseClass class deinit")
    }

}

var base : BaseClass? = BaseClass()
base = nil


print(" ------ Write a function which takes updated address as string and return  address Object")
func update(address:Address, changedValue:String) ->Address {
    // NOTE :: We are try to change address object will see error since input agrument are constant
    // try for following code
    //return address.city = changedValue
    
    let localAddress = Address(city: changedValue)
    return localAddress
}

func update(person:Person, changedAddress:Address) ->Person {
    person.address = update(address: person.address, changedValue: changedAddress.city)
    return person
}
struct Address {
    var city: String
}

class Person {
    var address : Address
    init(pAddress:Address) {
        self.address = pAddress
    }
}

var puneAddress = Address(city: "Pune")
var shankar = Person(pAddress: puneAddress)
var updatedAddess = update(address: puneAddress, changedValue: "Mumbai")
shankar = update(person: shankar, changedAddress: updatedAddess)
print(shankar.address.city)


