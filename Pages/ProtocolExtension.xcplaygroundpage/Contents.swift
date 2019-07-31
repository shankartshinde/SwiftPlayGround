//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"
print(" Dispatch Method Mechanism")
protocol Fighter{
    func fight() //Requirement
    //func punch() // Case-2 change static method to requiremnt
}

extension Fighter{
    //Requirement
    func fight(){
        print("Fighter fight ")
        self.punch()
    }
    //Static method (it is not required in the protocol)
    func punch(){
        print("Fighter punch")
    }
}

protocol MagicalFighter: Fighter {
    func castSpell()
}

extension MagicalFighter {
    func fight() {
        self.punch()
    }
    func castSpell() {
        print("MagicalFighter casted a spell")
    }
    
    func punch() {
        self.castSpell()
        print("Magical fighter punch")
    }
}

struct Hero : MagicalFighter {
    func castSpell() {
         print("Hero casted special spell")
    }
    
//    func punch() {
//        print("I am in struct punch")
//    }
}

let gordo = Hero()
gordo.fight()

print("---------------")

gordo.punch()

//: [Next](@next)



class MasterHero: MagicalFighter {
    func castSpell() {
        print("You are master Hero")
    }
    
    // Requirement methods use dynamic dispatch.
    func fight() {
        self.punch()
    }

}

print("-------Check with class -------------")
let thor = MasterHero()
thor.fight()

thor.punch()



print("https://medium.com/@PavloShadov/https-medium-com-pavloshadov-swift-protocols-magic-of-dynamic-static-methods-dispatches-dfe0e0c85509")

protocol Movable {
    func walk()
}

extension Movable {
    func crawl()  {
        print("Default crawling")
    }
}


struct Animal : Movable {
    
    func walk() {
        print("Animal is walking proudly")
    }
    
}

let panda = Animal()
panda.walk()
panda.crawl()

extension Animal {

    func crawl() {
        print("Animal is crawling silently")
    }
}
// Uncommnet above code
let raccoon = Animal()
raccoon.walk()
raccoon.crawl()


let wolf : Movable = Animal()
wolf.walk()
wolf.crawl()



protocol MyProtocol {
    
}
struct MyStruct: MyProtocol {
}
extension MyStruct {
    func extensionMethod() {
        print("In Struct")
    }
}
extension MyProtocol {
    func extensionMethod() {
        print("In Protocol")
    }
}

let myStruct = MyStruct()
let proto: MyProtocol = myStruct

myStruct.extensionMethod() // -> “In Struct”
proto.extensionMethod() // -> “In Protocol”



class MyClass {
}
extension MyClass {
    func extensionMethod() {}
}

class SubClass: MyClass {
    //override func extensionMethod() {}
}

class Person: NSObject {
    func sayHi() {
        print("Hello")
    }
}
func greetings(person: Person) {
    person.sayHi()
}
greetings(person: Person()) // prints 'Hello'


class MisunderstoodPerson: Person {
//    override func sayHi() {
//        print("No one gets me.")
//    }

}
extension MisunderstoodPerson {
//    override func sayHi() {
//        print("No one gets me.")
//    }
}
greetings(person: MisunderstoodPerson()) // prints 'Hello'


public extension UIColor {
    
    @objc func colorDescription() -> String {
        let color = "Some Custom text Here"
        return color
    }
    
    public class func swizzleDesription() {
        let instance: UIColor = UIColor.red
        let aClass: AnyClass! = object_getClass(instance)
        
        let originalMethod = class_getInstanceMethod(aClass, #selector(getter: NSObjectProtocol.description))
        let swizzledMethod = class_getInstanceMethod(aClass, Selector("colorDescription"))
        method_exchangeImplementations(originalMethod!, swizzledMethod!)
    }
    
    //https://medium.com/@abhimuralidharan/method-swizzling-in-ios-swift-1f38edaf984f
    private static let swizzleDesriptionImplementation: Void = {
        let instance: UIColor = UIColor.red
        let aClass: AnyClass! = object_getClass(instance)
        let originalMethod = class_getInstanceMethod(aClass, #selector(description))
        let swizzledMethod = class_getInstanceMethod(aClass, #selector(colorDescription))
        if let originalMethod = originalMethod, let swizzledMethod = swizzledMethod {
            // switch implementation..
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }()
    public static func swizzleDesriptionFromMedium() {
        _ = self.swizzleDesriptionImplementation
    }
}

print(UIColor.red)
UIColor.swizzleDesription()
print(UIColor.red)

UIColor.swizzleDesription()
print(UIColor.red)

UIColor.swizzleDesription()
print(UIColor.red)


let add : (Int,Int)->Int = {
    var a = $0 + 2
    var b = $1 + 3
    return a + b
}
print(add(2,3))


func makeSequareDigitOf(digit:Int, onCompletion:(Int)->Void) {
    var digitResult = digit*digit
    onCompletion(digitResult)
}

makeSequareDigitOf(digit: 10) { square in
    print("Final Result is : \(square)")
}

makeSequareDigitOf(digit: 20, onCompletion: { square in
    print("Final Result is : \(square)")
    })



func getSumOfArray(ageList:[Int], onCompletion: (Int)->Void) {
    var total = 0
    for value in ageList {
        total = total + value
    }
    
    onCompletion(total)
}

func sumOfDigit() {
    getSumOfArray(ageList: [1,2,3,4,5], onCompletion: {
        totalSum in
            print("Sum of ages is :\(totalSum)")
    })
}

sumOfDigit()

getSumOfArray(ageList: [1,2,3,4,5,6]) { totalSum in
    print("Sum of array :\(totalSum)")
}



func personInTheHouse()->((String)->String) {
    
    func doProcess(process:String)->String {
        return "This person is \(process)"
    }
    
    return doProcess
}

var person = personInTheHouse()
person("Playing cricket")



class Interviewtest {
    var interViewername: String = "Shankar"
    lazy var greeting = {
        return "Hello \(self.interViewername)"
    }()
    
    deinit {
        print("Interviewtest is released")
    }
}

var todayInterview = Interviewtest()
print(todayInterview.greeting)

class Foo {
    var value: Int
    lazy var double : Int = { [weak self] in
        if let selfOBj = self {
            return selfOBj.value * 2
        }
        return 0
    }()
    
    init(someValue:Int) {
        self.value  = someValue
    }
    deinit {
        print("Released")
    }
}

var obje1 = Foo(someValue: 20)
obje1.double
