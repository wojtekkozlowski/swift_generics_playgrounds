//: [Previous](@previous)

import UIKit
import XCPlayground

class GenericDataSource<V>: NSObject {
    
    // 1. store viewModels of some type
    
    private var viewModels: [V]
    
    init(viewModels: [V] ){
        self.viewModels = viewModels
    }
    
}

//: [Next](@next)
