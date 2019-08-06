//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

class Account {
    
    // MARK: - Properties
    var accountNumber:String
    var plan: Plan?
    
    init(accNumber:String) {
        self.accountNumber = accNumber
    }
    
    deinit {
        print("Release account object")
    }
    
}

class Plan {
    
    // MARK: - Properties
    
    let account: Account
    
    // MARK: - Initialization
    
    init(account: Account) {
        self.account = account
    }
    
    deinit {
        print("Release plan object")
    }
    
}

var vodafoneMobileNumber: Account? = Account(accNumber: "713646172")
var fullSpeedData : Plan = Plan(account: vodafoneMobileNumber!)
print("Non of deinit method get called")
vodafoneMobileNumber = nil

print("BSRC: stands for Break Strong Reference Cycle")
class AccountBSRC {
    
    // MARK: - Properties
    var accountNumber:String
    var plan: PlanBSRC?
    
    init(accNumber:String) {
        self.accountNumber = accNumber
    }
    
    deinit {
        print("Release accountBSRC object")
    }
    
}

class PlanBSRC {
    
    // MARK: - Properties
    
    unowned let account: AccountBSRC
    
    // MARK: - Initialization
    
    init(account: AccountBSRC) {
        self.account = account
    }
    
    deinit {
        print("Release planBSRC object")
    }
    
}

var airtelAccount : AccountBSRC? = AccountBSRC(accNumber: "9073643223")

airtelAccount!.plan = PlanBSRC(account: airtelAccount!)
airtelAccount = nil

print("Following code release only Account object not Plan class object")
var ideaAccount : AccountBSRC? = AccountBSRC(accNumber: "988146732423")
var planNightPack : PlanBSRC = PlanBSRC(account: ideaAccount!)
ideaAccount?.plan = planNightPack
ideaAccount = nil




