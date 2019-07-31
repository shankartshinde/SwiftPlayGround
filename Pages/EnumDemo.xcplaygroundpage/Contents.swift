//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
print(str)

// https://useyourloaf.com/blog/empty-strings-in-swift/
//Empty Strings in Swift
"Hello".isEmpty
"A".isEmpty
"".isEmpty
"B".count
"".count
" ".count
" ".isEmpty

//
//func isBlank(_ string: String) -> Bool {
//    for character in string {
//        if !character.isWhitespace {
//            return false
//        }
//    }
//    return true
//}

//isBlank("")
//isBlank(" ")


//extension Optional where Wrapped == String {
//    var isBlank: Bool {
//        return self?.isBlank ?? true
//    }
//}
enum Gender {
    case Male
    // case Male = 1 error: enum case cannot have a raw value if the enum does not have a raw type
    case Female
}

var personGender : Gender = Gender.Male
var person1Gender = personGender
person1Gender = .Female
person1Gender.hashValue
print(personGender)

enum Gender1:String {
    case Male = "M"
    case Female
}

var stringTypeGender : Gender1 = Gender1.Male
print("Raw Value :: \(stringTypeGender.rawValue) hashValue :: \(stringTypeGender.hashValue)")
var stringTypeFemaleGender = stringTypeGender
print("Raw Value :: \(stringTypeFemaleGender.rawValue) hashValue :: \(stringTypeFemaleGender.hashValue)")
stringTypeFemaleGender = .Female
print("Raw Value :: \(stringTypeFemaleGender.rawValue) hashValue :: \(stringTypeFemaleGender.hashValue)")

//: [Next](@next)


