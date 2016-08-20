//: [Previous](@previous)

import Foundation
import UIKit

protocol Switchable {
    associatedtype Item
}

class User<T: Switchable> {
    let param: T.Item
    
    init(param: T.Item){
        self.param = param
    }
}
