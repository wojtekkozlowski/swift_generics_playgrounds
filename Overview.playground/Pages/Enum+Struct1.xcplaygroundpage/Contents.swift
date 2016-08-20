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


GenericTableCellViewModel(labelText: "Log in", whichCellAmI: Account.Login)

GenericTableCellViewModel(labelText: "Accept Transfer", whichCellAmI: ScheduledTrasnfer.Accept)

GenericTableCellViewModel(labelText: "First Cell", whichCellAmI: 1)