//: [Previous](@previous)

import Foundation

protocol ViewModel {
    associatedtype CellType: Cell
}

protocol Cell {
    associatedtype ViewModelType
    func update(viewModel: ViewModelType)
}

class DataSource<V: ViewModel where V.CellType.ViewModelType == V> {
    let viewModels: [V]
    
    init(viewModels: [V]){
        self.viewModels = viewModels
    }
}





