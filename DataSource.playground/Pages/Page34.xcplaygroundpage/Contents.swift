//: [Previous](@previous)

import UIKit
import XCPlayground

protocol ViewModel {
    associatedtype C: UITableViewCell, Cell
}

protocol Cell {
    associatedtype V
    func configure(viewModel: V)
}

// ----------------------------------
struct UserViewModel: ViewModel {
    typealias C = UserTableCell
}


class UserTableCell: UITableViewCell, Cell {
    func configure(viewModel:UserViewModel) {
        
    }
}
// ----------------------------------

struct AccountViewModel: ViewModel  {
    typealias C = AccountTableCell
}

class AccountTableCell: UITableViewCell, Cell {
    func configure(viewModel: AccountViewModel) {
        
    }
}

class GenericDataSource<V: ViewModel where V.C.V == V>: NSObject {
    
    private var viewModels: [V]
    
    init(viewModels: [V] ){
        self.viewModels = viewModels
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let specificCell = tableView.dequeueReusableCellWithIdentifier("later", forIndexPath: indexPath) as! V.C
        
        specificCell.configure(self.viewModels[indexPath.row])
        
        return specificCell
    }

}

// in UserViewController...
let userDataSource = GenericDataSource(viewModels: [UserViewModel()])

// in AccountViewController..
let accountDataSource = GenericDataSource(viewModels: [AccountViewModel()])



//: [Next](@next)

