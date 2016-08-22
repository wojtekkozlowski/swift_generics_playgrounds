//: [Previous](@previous)

import Foundation
import UIKit

class BaseModel {
    
}

class User<T: BaseModel> {
    let param: T
    
    init(param: T){
        self.param = param
    }
}