//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

protocol Initiable{
    init()
}
struct User:Initiable {
    init(){
        
    }
}

struct Account:Initiable {
    init(){
        
    }
}

//func mapToObject<T:Initiable>(dictionary: Dictionary<String, AnyObject>) -> T {
//    return T()
//}
//
//
//let user: User = mapToObject(["username":"Joe"])
//
//let account: Account = mapToObject(["balance":5000])

protocol TyroMappable {
    
}

func mapToObject(dictionary: Dictionary<String, AnyObject>) -> TyroMappable {
    // ...
}