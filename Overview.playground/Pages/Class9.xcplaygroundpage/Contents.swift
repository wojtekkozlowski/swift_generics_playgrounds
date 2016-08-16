//: [Previous](@previous)

import Foundation

protocol ViewModel {
    associatedtype CellType: Cell
}

protocol Cell {
    associatedtype ViewModelType
}

class DataSource<V: ViewModel where V.CellType.ViewModelType == ViewModel> {
    let viewModels: [V]
    
    init(viewModels: [V]){
        self.viewModels = viewModels
    }
}


