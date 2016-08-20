//: [Previous](@previous)

import Foundation

struct GenericStruct<T> {
    func value(param: T) -> T {
        return param
    }
}

let gs = GenericStruct<String>()
gs.value("hello")

// --------------------------------

struct GenericFunc {
    func value<T>(param: T) -> T {
        return param
    }
}


let gf = GenericFunc()
gf.value("Hello")