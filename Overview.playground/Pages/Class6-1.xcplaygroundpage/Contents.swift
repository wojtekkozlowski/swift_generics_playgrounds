//: [Previous](@previous)

import Foundation

class BaseModel {
    
}

class User<T where T == BaseModel> {
    let param: T
    
    init(param: T){
        self.param = param
    }
}
