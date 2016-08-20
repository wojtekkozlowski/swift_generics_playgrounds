//: [Previous](@previous)

import Foundation

struct GenericTableCellViewModel<T> {
    let labelText: String
    let whichCellAmI: T
}

enum Account {
    case Login
    case Logout
}

enum ScheduledTrasnfer {
    case Accept
    case Reject
}


let c1 = GenericTableCellViewModel(labelText: "Log in", whichCellAmI: Account.Login)

let c2 = GenericTableCellViewModel(labelText: "Accept Transfer", whichCellAmI: ScheduledTrasnfer.Accept)

//let c3 = GenericTableCellViewModel(labelText: "First Cell", whichCellAmI: 1)
//let c4 = GenericTableCellViewModel(labelText: "First Cell", whichCellAmI: "X")
//
//c1.whichCellAmI
//c2.whichCellAmI
//c3.whichCellAmI
//c4.whichCellAmI

