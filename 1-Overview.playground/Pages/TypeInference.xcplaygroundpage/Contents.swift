//: [Previous](@previous)

import Foundation

struct GenericStruct<T> {
    func test(param: T) -> T {
        return param
    }
}

let gs = GenericStruct<String>()
//let gs2: GenericStruct<String> = GenericStruct()
gs.test("hello")




// --------------------------------




struct GenericFunc {
    func test<T>(param: T) -> T {
        return param
    }
}

let gf = GenericFunc()
gf.test("Hello")




// --------------------------------




func test<T>(param: T) -> T {
    return param
}

test(123)
test("abc")

