//: [Previous](@previous)

import Foundation
print("----Q1:")
var numbers = [1, 2, 3]
numbers += [4]
print(numbers)

print("----Q2:")
let number = 16
print("\(number) squared is \(number * number), and its square root is \(sqrt(Double(number)))")
let doublenumber = 16.0
print("\(doublenumber) squared is \(doublenumber * doublenumber), and its square root is \(sqrt(doublenumber))")


print("----Q3:")
var crew = ["Captain": "Malcolm", "Doctor": "Simon"]
crew = [:]
print(crew.count)

print("----Q4:")
func greet(_ name: inout String) {
    name = name.uppercased()
    print("Greetings, \(name)!")
}

print("----Q5:")
var name = "Mal"
greet(&name)
print("Goodbye, \(name)!")

print("----Q6:")
let bigNumber = Int.max
//let biggerNumber = bigNumber + 1
print(bigNumber)


print("----Q7:")
let crew1 = NSMutableDictionary()
crew1.setValue("Kryten", forKey: "Mechanoid")
print(crew1.count)


print("----Q8:")
let numbers1 = [1, 2, 3].flatMap { [$0, $0] }
print(numbers1)


print("----Q9:")
let names = ["Pilot": "Wash", "Doctor": "Simon"]
let doctor = names["doctor"] ?? "Bones"
print(doctor)


print("----Q10:")
let numbers2 = Array(1..<10)
print(numbers2.count)


print("----Q11:")
let names3 = ["Simon", "River", "Book"]
names3.forEach {
    print($0)
}

print("----Q12:")
var cars = "benz";

var clouserHolds = {  [cars]  in
    let car = cars;
    print("The value of car is \(car)");
}

func clouserHoldsF(){
    //let car = cars;
    print("the value of car is \(cars)");
}
cars = "audi";

clouserHolds();
clouserHoldsF();

print("----Q12.1:")
// Here both print Audi
var cars12_1 = "benz";

var clouserHolds12_1 = {
    let car = cars12_1;
    print("The value of car is \(car)");
}

func clouserHoldsF12_1(){
    //let car = cars;
    print("the value of car is \(cars12_1)");
}
cars12_1 = "audi";

clouserHolds12_1();
clouserHoldsF12_1();


print("----Q13:")
let queue = DispatchQueue.init(label: "raju");
queue.async {
    for i in 0 ... 10 {
        print("Custom Queue: \(i)");
    }
}

DispatchQueue.main.async {
    for i in 0 ... 10 {
        print("Main Queue:   \(i)");
    }
}

print("----Q14: Count occurance of element in array")
let array = [1,1,2,1,5,6]
func makeGroup(list:[Int])-> [String:Int] {
    var localGroup : [String:Int] = [:]
    
    for value in list {
        if let valueFoundForKey = localGroup[String(value)] {
            localGroup[String(value)] = valueFoundForKey + 1
        }
        else {
            localGroup[String(value)] = 1
        }
    }
    return localGroup
}

let group =  makeGroup(list: array)
print(group[String(1)])
print( group[String(5)])
print( group[String(7)])



