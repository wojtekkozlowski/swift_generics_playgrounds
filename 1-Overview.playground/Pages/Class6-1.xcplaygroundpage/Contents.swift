//: [Previous](@previous)

import Foundation

class BaseModel {
    
}

class User<T where T == BaseModel> { // not allowed, would make the T non-generic
    let param: T
    
    init(param: T){
        self.param = param
    }
}
