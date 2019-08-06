//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

class Car {
    var carName: String
    init(cName:String) {
        self.carName = cName
    }
    
    func showCarName() {
        print("\(self.carName)")
    }

    
    deinit {
        print("Car object released")
    }

}

class Owner {
    var name:String
    init(ownerName:String) {
        self.name = ownerName
    }
    
    
    deinit {
        print("Owner Object released")
    }
}

var bmwCar : Car? = Car(cName:"ClassV")
bmwCar?.showCarName()
bmwCar = nil // Note retainCount become zero and bmwCar object is released

print("SRC: stands for Strong Reference Cycle")
class CarSRC {
    var carName: String
    var owner: OwnerSRC?
    init(cName:String) {
        self.carName = cName
    }
    
    func showCarName() {
        print("\(self.carName)")
    }
    
    
    deinit {
        print("CarSRC object released")
    }
    
}

class OwnerSRC {
    var name:String
    var car: CarSRC?
    init(ownerName:String) {
        self.name = ownerName
    }
    
    
    deinit {
        print("OwnerSRC Object released")
    }
}

var Audi : CarSRC? = CarSRC(cName:"Audi V8")
var Shankar : OwnerSRC? = OwnerSRC(ownerName:"Shankar")

Audi?.owner = Shankar
Shankar?.car = Audi

print("After assigning objec to nil its repective dinit method not get called")
Audi = nil
Shankar = nil


print("BSRC: stands for Break Strong Reference Cycle")
class CarBSRC {
    var carName: String
    weak var owner: OwnerBSRC?
    init(cName:String) {
        self.carName = cName
    }
    
    func showCarName() {
        print("\(self.carName)")
    }
    
    
    deinit {
        print("CarBSRC object released")
    }
    
}

class OwnerBSRC {
    var name:String
    var car: CarBSRC?
    init(ownerName:String) {
        self.name = ownerName
    }
    
    
    deinit {
        print("OwnerBSRC Object released")
    }
}

var AstonMartin : CarBSRC? = CarBSRC(cName:"Aston Martin Lagonda")
var Steve : OwnerBSRC? = OwnerBSRC(ownerName:"Steve Jobs")

AstonMartin?.owner = Steve
Steve?.car = AstonMartin

print("After assigning objec to nil its repective dinit method not get called")
print("case 1 : AstonMartin = nil Steve = nil :=> Both will get released")
print("case 2 : Steve = nil :=> Only Owner will get released")
print("case 3 : AstonMartin = nil :=> Strong reference cycle still exist with Owner")

// Case: 1

AstonMartin = nil
Steve = nil

// Case: 2
Steve = nil

// Case:3
AstonMartin = nil












