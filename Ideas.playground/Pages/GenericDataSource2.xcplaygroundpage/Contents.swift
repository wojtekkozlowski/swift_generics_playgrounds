import UIKit
import XCPlayground

protocol Configurable: class {
    static var identifier: String { get }
    func configure<V:ViewModel>(viewModel:V)
}

protocol ViewModel {
    associatedtype C: UITableViewCell, Configurable
    static var cellClass: C.Type { get }
}


struct ImageViewModel: ViewModel {
    static let cellClass = ImageCell.self
    let imageName: String
}

struct TextViewModel: ViewModel  {
    static let cellClass = TextCell.self
    let text: String
}

class ImageCell: UITableViewCell, Configurable {
    static let identifier = "ImageCell"
    let iconView = UIImageView()
    
    func configure<V:ViewModel>(viewModel: V) {
        self.backgroundColor = .greenColor()
    }
}

class TextCell: UITableViewCell, Configurable {
    static let identifier = "TextCell"
    let label = UILabel()
    func configure<V:ViewModel>(viewModel: V) {
        self.backgroundColor = .orangeColor()
    }
}


class DataSource<V:ViewModel>: NSObject, UITableViewDataSource {
    private var viewModels: [V]

    init(viewModels: [V]) {
        self.viewModels = viewModels
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModels.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(V.C.identifier, forIndexPath: indexPath) as! V.C
        cell.configure(self.viewModels[indexPath.row])
        return cell
    }
}

class VCT<V:ViewModel>: UITableViewController {
    private let ds: DataSource<V>
    
    init(viewModels: [V]) {
        ds = DataSource(viewModels: viewModels)
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        view.frame = CGRect(x: 0,y: 0,width: 320,height: 480)
        tableView.registerClass(V.C.self, forCellReuseIdentifier: V.C.identifier)
        tableView.dataSource = ds
    }
}

let imageViewModels = [ImageViewModel(imageName: "asd")]
let textViewModels = [TextViewModel(text: "hello")]

let vc = VCT(viewModels: textViewModels)

XCPlaygroundPage.currentPage.liveView = vc.view


