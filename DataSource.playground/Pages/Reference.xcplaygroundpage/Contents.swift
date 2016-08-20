//: [Previous](@previous)

import Foundation
import UIKit
import XCPlayground

protocol Configurable {
    associatedtype ViewModel
    static var identifier: String { get }
    static var height: CGFloat { get }
    func configure(viewModel: ViewModel)
}

protocol ViewModel {
    associatedtype Cell: UITableViewCell, Configurable
}

//--------------------------------------------------

struct UserViewModel: ViewModel {
    typealias Cell = UserCell
    let userName: String
}

class UserCell: UITableViewCell, Configurable {
    static let identifier = "userId"
    static let height: CGFloat = 80.0
    func configure(viewModel:UserViewModel) {
        self.backgroundColor = .orangeColor()
        self.textLabel!.text = "Logged in as: \(viewModel.userName)"
        self.textLabel?.textAlignment = .Right
    }
}

//--------------------------------------------------

struct AccountViewModel: ViewModel {
    typealias Cell = AccountCell
    let amount: String
}

class AccountCell: UITableViewCell, Configurable {
    static let identifier = "accountId"
    static let height: CGFloat = 50.0
    
    func configure(viewModel:AccountViewModel) {
        self.backgroundColor = .greenColor()
        self.textLabel!.text = "Account Balance: $\(viewModel.amount)"
    }
}

//--------------------------------------------------

class DataSource<V:ViewModel where V.Cell.ViewModel == V> : NSObject, UITableViewDataSource {
    private var viewModels: [V]
    
    init(viewModels: [V]){
        self.viewModels = viewModels
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModels.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(V.Cell.identifier, forIndexPath: indexPath) as! V.Cell
        cell.configure(self.viewModels[indexPath.row])
        return cell
    }
}
















class VCT: UITableViewController {
    
//    typealias ViewModelType = UserViewModel
    typealias ViewModelType = AccountViewModel

    
    private let ds: DataSource<ViewModelType>
    
    init() {
//        ds = DataSource(viewModels: [UserViewModel(userName: "John")])
        ds = DataSource(viewModels: [AccountViewModel(amount:"50,000")])
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.frame = CGRect(x: 0,y: 0,width: 320,height: 480)
        tableView.registerClass(ViewModelType.Cell.self, forCellReuseIdentifier: ViewModelType.Cell.identifier)
        tableView.dataSource = ds
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return ViewModelType.Cell.height
    }
}

let vc = VCT()











XCPlaygroundPage.currentPage.liveView = vc.view


