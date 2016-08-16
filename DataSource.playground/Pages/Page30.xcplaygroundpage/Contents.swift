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
    func configure()
}

class UserTableCell: UITableViewCell, Cell {
    func configure() {
        
    }
}

class GenericDataSource<V: ViewModel>: NSObject {
    
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

