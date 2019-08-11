//: [Previous](@previous)

import Foundation
class Movie {
    var name:String
    var length: Double
    var numberOfCharacter: Int
    init(name:String, length:Double, numCharacter:Int) {
        self.name = name
        self.length = length
        self.numberOfCharacter = numCharacter
    }
}

let familyMembers = ["Shivaji","Larry","Yug"]
let frozen = Movie(name: "Frozen", length: 40.30, numCharacter: 10)

var anyList : [Any] = ["Shankar", 10, 70.45,familyMembers,frozen]
print(anyList)

for value in anyList where value is [String] {
        print(value)
}

for value in anyList where value is Int {
    print(value)
}

for value in anyList where value is Double {
    print(value)
}


for value in anyList {
    if value is Int {
        guard let convertedAnyToInt = value as? Int else {
            print("fail to convert into Int")
            fatalError()
        }
        print("\(convertedAnyToInt * 10)")
    }
}

print("--------Type Casting for Any and AnyObject---------")
print("--------NOTE:: Uncomment below deceleration you see error- value of type 'String' does not conform to expected element type 'AnyObject'")
print("-------- defination Of Any And AnyObject")
let definationOfAnyAndAnyObject = """
AnyObject refers to any instance of a class, and is equivalent to id in Objective-C. It’s useful when you specifically want to work with a reference type, because it won’t allow any of Swift’s structs or enums to be used. AnyObject is also used when you want to restrict a protocol so that it can be used only with classes.

Any refers to any instance of a class, struct, or enum – literally anything at all. You’ll see this in Swift wherever types are unknown or are mixed in ways that can be meaningfully categorized:

"""
print(definationOfAnyAndAnyObject)

//var listOfAnyObject : [AnyObject] = ["Shankar", 10, 70.45,familyMembers]

//var validListOfAnyObjectType : [AnyObject] = [frozen, "Shankar" as String]
//frozen

//var validListOfAnyObjectType : [AnyObject] = ["Shankar" as AnyObject, 10, 70.45,familyMembers]
let description1 = """

What just happened?! How was I able to use AnyObject on Ints and Strings by explicitly casting each element to AnyObject?
I then printed the anyObjectArray into console.
            [1, 2, Hi]

"""
print(description1)
let anyObjectArray : [AnyObject] = [1 as AnyObject,
                                    2 as AnyObject,
                                    "Hi" as AnyObject]
print(anyObjectArray)
let description2 = """
The element Hi obviously looked like a string to me, but it did not have quotes around like a normal String value in Swift!
Next I printed each element using a for-in loop to check its actual type rather than its casted-type of AnyObject.
First, I used is operator to see whether the elements are Swift Struct types or not.

"""

print(description2)

for element in anyObjectArray {
    if element is Int {
        print("Element of type is Int ")
    } else if element is String {
        print("Element of type is String ")
    }
}

let description3 = """

It is of type String! Then how could it be casted to AnyObject? Again, Strings in Swift are Structs, not Class types. Thus in theory, I shouldn’t be able to cast them as AnyObject.

I was utterly confused, and decided to do some more experiments with it. This time I used NSNumber and NSString, which are Objective-C types, to check the type of each element.

"""
print(description3)
for element in anyObjectArray {
    if element is NSNumber {
        print("Element of type is NSNumber ")
    } else if element is NSString {
        print("Element of type is NSString ")
    }
}

let description4 = """

Wait, Hi is also a NSString and numeric elements are NSNumber! And… they are reference types in Objective-C! Was this the reason why Hi didn’t have quotes on it in console? I wrote some more code as below to see if my assumption was correct.

"""


let nsStringArray : [NSString] = ["Objective-C", "NSArray"]
let swiftStringArray : [String] = ["Swift", "Array"]

print("nsStringArray :: \(nsStringArray)")
print("swiftStringArray :: \(swiftStringArray)")

let description5 = """

Confirmed! The elements that are casted to AnyObject in the array are now class types of Objective-C: NSString and NSNumber.

"""

print(description5)


print("-------- Typecasting------")
class LivingBeing {
    var age :Int?
    
    init(age:Int?) {
        if let age = age {
            self.age = age
        }
    }
}

class Human: LivingBeing {
    var name:String?
    
    init(name:String?, age:Int?) {
        if let name = name {
            self.name = name
        }
        super.init(age: age ?? 0)
    }
}

class Animal: LivingBeing {
    var isMammals:Bool?
    
    init(isMammals:Bool?, age:Int?) {
        if let isMammals = isMammals {
            self.isMammals = isMammals
        }
        super.init(age: age ?? 0)
    }
}

let livingBeingArray = [Animal(isMammals:true, age:12),Human(name:"Abhilash",age:25)]

print("--------Check object type using 'is' type casting")
for object in livingBeingArray {
    switch object {
    case is Animal:
        print("Object type of instance Animal")
    case is Human:
        print("Object type of instance Human")
    default:
        print("Does not match type of object")
    }
}


print("--------Check object type using 'as' type casting")
for object in livingBeingArray {
    switch object {
    case let animalObject as Animal:
        print("Object type of instance Animal")
    case let humanObject as Human:
        print("Object type of instance Human")
    default:
        print("Does not match type of object")
    }
}

print("--------Check object type using 'as' type casting and Upcasting")
let humanObject = livingBeingArray[1] as! Human
let humanObjectAsLivingBeingObj = humanObject as LivingBeing
print("\(humanObjectAsLivingBeingObj.age)")
