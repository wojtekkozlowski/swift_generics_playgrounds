//: [Previous](@previous)

import Foundation

protocol ViewModel {
    associatedtype CellType: Cell
}

protocol Cell: class {
    init()
    associatedtype ViewModelType
    func update(viewModel: ViewModelType)
}

struct DataSource<V: ViewModel where V.CellType.ViewModelType == V> {
    let viewModels: [V]
    
    func createCell () -> V.CellType {
        let cell = V.CellType()
        cell.update(viewModels.first!)
        return cell
    }
}

struct ViewModelA: ViewModel {
    typealias CellType = CellA
}

class CellA: Cell {
    required init(){}
    func update(viewModel: ViewModelA) {
        
    }
}

let dsa = DataSource(viewModels: [ViewModelA()])
dsa.createCell()



