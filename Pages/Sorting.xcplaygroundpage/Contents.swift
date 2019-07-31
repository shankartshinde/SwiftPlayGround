import UIKit

var numbers : [Int] = [3,2,1,5,8,7]
//print(numbers)

struct Person {
    var name:String
    var points:Int
}


var personList : [Person] =  [Person(name:"Steve Jobs" , points: 90),
Person(name:"Steve Buscemi" , points: 90),
Person(name:"Steve Young" , points: 90),
Person(name:"Stephen Fry" , points: 90),
Person(name:"Stephen Fry" , points: 70),
Person(name:"Harry Styles" , points: 90),
Person(name:"Harry Styles" , points: 60),
Person(name:"Harry Reid" , points: 60),
]

//personList.forEach { (p) in
//    print("\(p.points) :  \(p.name)")
//}

extension Person : Comparable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return (lhs.points, lhs.name) ==
            (rhs.points, rhs.name)
    }

    static func < (lhs: Person, rhs: Person) -> Bool {
        //return (lhsPts, lhsName) < (rhsPts, rhsName)
        return lhs.points == rhs.points ? lhs.name < rhs.name : lhs.points < rhs.points
    }

    static func > (lhs: Person, rhs: Person) -> Bool {
        return lhs.points == rhs.points ? lhs.name < rhs.name : lhs.points > rhs.points
    }
}


let ascendingOrder =  personList.sorted(by: <)
print("Ascending order By points and Ascending By Name")
ascendingOrder.forEach { (p) in
    print("\(p.points) :  \(p.name)")
}

let descendingOrder = personList.sorted(by: >)
print("Descending order By points and Ascending By Name")
descendingOrder.forEach { (p) in
    print("\(p.points) :  \(p.name)")
}

//struct Country {
//    let name: String
//    let capital: String
//    var visited: Bool
//}
//
//let canada = Country(name: "Canada", capital: "Ottawa", visited: true)
//let australia = Country(name: "Australia", capital: "Canberra", visited: false)
//let brazil = Country(name: "Brazil", capital: "Ottawa", visited: true)
//let uk = Country(name: "UK", capital: "Ottawa", visited: true)
//let egypt = Country(name: "Egypt", capital: "Ottawa", visited: true)
//let france = Country(name: "France", capital: "Ottawa", visited: true)
//
//let bucketList = [brazil,australia,canada,egypt,uk,france]

//extension Country: Comparable {
//
//    static func == (lhs: Country, rhs: Country) -> Bool {
//        return lhs.name == rhs.name &&
//            lhs.capital == rhs.capital &&
//            lhs.visited == rhs.visited
//    }
//
//    static func < (lhs: Country, rhs: Country) -> Bool {
//        print("You are in the method  < ")
//        return lhs.name < rhs.name ||
//            (lhs.name == rhs.name && lhs.capital < rhs.capital) ||
//            (lhs.name == rhs.name && lhs.capital == rhs.capital && rhs.visited)
//    }
//}

//bucketList.sorted(by: <)
//print(bucketList)
//


//extension Person : Comparable {
//    static func == (lhs: Person, rhs: Person) -> Bool {
//        return (lhs.points, lhs.name) ==
//            (rhs.points, rhs.name)
//    }
//
//    static func < (lhs: Person, rhs: Person) -> Bool {
//        guard let lhsPts = lhs.points, let lhsName = lhs.name,
//            let rhsPts = rhs.points,let rhsName = rhs.name   else {
//                return true
//        }
//        //return (lhsPts, lhsName) < (rhsPts, rhsName)
//        return lhsPts == rhsPts ? lhsName < rhsName : lhsPts < rhsPts
//    }
//
//    static func > (lhs: Person, rhs: Person) -> Bool {
//        guard let lhsPts = lhs.points, let lhsName = lhs.name,
//            let rhsPts = rhs.points,let rhsName = rhs.name   else {
//                return true
//        }
//        //$0.lastname == $1.lastname ? $0.firstname < $1.firstname : $0.lastname < $1.lastname
//        return lhsPts == rhsPts ? lhsName < rhsName : lhsPts > rhsPts
//    }
//}


