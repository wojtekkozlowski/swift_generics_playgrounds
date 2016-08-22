//: [Previous](@previous)

import UIKit
import XCPlayground

protocol ViewModel {
    associatedtype C: UITableViewCell, Cell
}

struct UserViewModel: ViewModel {
    typealias C = UserTableCell
}

protocol Cell {
    associatedtype V
    func configure(viewModel: V)
}

class UserTableCell: UITableViewCell, Cell {
    func configure(viewModel:UserViewModel) {
        
    }
}

class GenericDataSource<V: ViewModel where V.C.V == V>: NSObject {
    
    private var viewModels: [V]
    
    init(viewModels: [V] ){
        self.viewModels = viewModels
    }
    
    // 2. Turn the viewModel into a TableCell
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let specificCell = tableView.dequeueReusableCellWithIdentifier("later", forIndexPath: indexPath) as! V.C
        
        
        // 2.2 - ... with the apropriate viewModel for the cell
        
        specificCell.configure(self.viewModels[indexPath.row])
        
        return specificCell
        
    }
    
}

//: [Next](@next)

