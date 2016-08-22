//: [Previous](@previous)

import UIKit
import XCPlayground

struct UserViewModel {
    
}

// ---------------- 👆 ---------------
//      type relationship maybe ?
// ---------------- 👇 ---------------
// trivial to make with concrete types
// **** but we want a generic one ****

class UserTableCell: UITableViewCell {
    
}

class GenericDataSource<V>: NSObject {
    
    private var viewModels: [V]
    
    init(viewModels: [V] ){
        self.viewModels = viewModels
    }
    
    // 2. Turn the viewModel into a TableCell
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 2.1 - Cast it as the apropriate cell for the viewModel
        
        // let specificCell = tableview.dequeue...
        
        
        // 2.2 - call `configure` with the apropriate viewModel for the cell
        
        // specificCell.configure(viewModel: ...)
        
        
        fatalError()
    }
    
}
//: [Next](@next)
