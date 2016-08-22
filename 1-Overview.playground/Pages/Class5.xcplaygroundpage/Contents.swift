//: [Previous](@previous)

import Foundation
import UIKit

protocol Switchable {
    
}

class User<T: Switchable> {
    let param: T
    
    init(param: T){
        self.param = param
    }
}
