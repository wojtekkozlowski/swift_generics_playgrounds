import UIKit
import XCPlayground


protocol Configurable: class {
    associatedtype V
    static var identifier: String { get }
    func configure(viewModel: V)
}

struct ImageViewModel {
    let imageName: String
}

struct TextViewModel {
    let text: String
}

class ImageCell: UITableViewCell, Configurable {
    static let identifier = "ImageCell"
    let iconView = UIImageView()
    func configure(viewModel: ImageViewModel) {
        self.backgroundColor = .greenColor()
    }
}

class TextCell: UITableViewCell, Configurable {
    static let identifier = "TextCell"
    let label = UILabel()
    func configure(viewModel: TextViewModel) {
        self.backgroundColor = .orangeColor()
    }
}


class DataSource<C where C: UITableViewCell, C: Configurable>: NSObject, UITableViewDataSource {
    
    private var viewModels: Array<C.V>
    
    init(viewModels: [C.V]) {
        self.viewModels = viewModels
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModels.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(C.identifier, forIndexPath: indexPath) as! C
        cell.configure(self.viewModels[indexPath.row])
        return cell
    }
}

class VCT: UITableViewController {

    let ds: DataSource<ImageCell>
    
    init(){
        ds = DataSource(viewModels: [ImageViewModel(imageName: "icon")])
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        view.frame = CGRect(x: 0,y: 0,width: 320,height: 480)
        
        tableView.registerClass(ImageCell.self, forCellReuseIdentifier: ImageCell.identifier)
        tableView.dataSource = ds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


let vc = VCT()
XCPlaygroundPage.currentPage.liveView = vc.view


