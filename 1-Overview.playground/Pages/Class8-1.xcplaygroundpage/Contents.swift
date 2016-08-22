//: [Previous](@previous)

import Foundation
import UIKit

protocol Switchable {
    associatedtype Item
}

class User<T: Switchable where T.Item: Hashable> {
    let dictionary: Dictionary<T.Item, String>
    
    init(param: T.Item){
        dictionary = [param: "param"]
    }
}