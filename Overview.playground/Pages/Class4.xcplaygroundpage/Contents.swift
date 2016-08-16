//: [Previous](@previous)

import Foundation

class User<T> {
    let param: T
    
    init(param: T){
        self.param = param
    }
    
    func getParam() -> T {
        return param
    }
    
    // T shadows class T
    func other<T>(param:T) -> T {
        return param
    }
}