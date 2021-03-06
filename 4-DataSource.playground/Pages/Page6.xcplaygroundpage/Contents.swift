//: [Previous](@previous)

import UIKit
import XCPlayground

class GenericDataSource<V>: NSObject {
    
    // 1. store viewModels of some type
    
    private var viewModels: [V]
    
    init(viewModels: [V] ){
        self.viewModels = viewModels
    }
    
    
    // 2. Turn the viewModel into a TableCell
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        fatalError()
    }
    
}

//: [Next](@next)
