//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

//  0. DataSource consumems some viewModel, and produces some Cell
//  so I want to assume, that this pair: ViewModel <-> Cell has a type relationship
//  That is of course trivial in a concrete example, but we want to make this relationship generic

struct UserViewModel {
    
}

class UserTableCell: UITableViewCell{
    
}

class DataSource: NSObject {
    
    //    1. store viewModels of some type
    //    private var viewModels: ...
    
    //    init(viewModels: ... ){
    //        self.viewModels = viewModels
    //    }
    
    // 2. Configure the cell that is associated with the viewModel
    //    so we need to access the associated type here
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("", forIndexPath: indexPath)
        //        cell.configure(self.viewModels[indexPath.row])
        //        cell.configure()
        return cell
    }
    
    
}
