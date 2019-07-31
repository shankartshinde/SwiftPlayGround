//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
/*
 https://medium.com/@abhimuralidharan/difference-between-value-type-and-a-reference-type-in-ios-swift-18cb5145ad7a
 */
//: [Next](@next)
class Home {
    var roomCount = 2
}

var shankarHouse = Home()
var archanaHouse = shankarHouse
print("Home is reference Type there for archana get roomCount is : \(archanaHouse.roomCount)")

archanaHouse.roomCount = 5

print("Both object Archana and Shankar have same roomcount : \(shankarHouse.roomCount)")

print("-------------------------------------")
print("Case:2 Home variable of type 'let' still we able to change object variable")
let shankarHouse1 = Home()
let archanaHouse1 = shankarHouse1
print("Home is reference Type there for archana get roomCount is : \(archanaHouse1.roomCount)")

archanaHouse1.roomCount = 7

print("Both object Archana and Shankar have same roomcount : \(shankarHouse1.roomCount)")

print("Case:2.1 Home object can not assign to of type 'let'")
//archanaHouse1 = Home()

var yuganHouse1 = archanaHouse1
yuganHouse1 = Home()
print("yugan house roomCount : \(yuganHouse1.roomCount)")
/*
 Think in a simple way: Once we create a HOME or buy one and give it to a let constant, we can only change the roomCount. So, here John cannot upgrade his home since it’s immutable (let). We cannot create a new HOME or change it. let will be angry on us 🤬😡🤬😡. I think you got it now!!
 */
print("-------------------------------------")


struct House {
    var roomCount = 4
    
    mutating func changeRoomCount(newCount : Int) {
        roomCount = newCount
    }
}

var shankarFlat = House()
let archanaFlat = shankarFlat
print("Following line will give error since constant value type try to change its value")
//archanaFlat.roomCount = 8

shankarFlat.changeRoomCount(newCount: 5)
