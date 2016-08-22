//: Playground - noun: a place where people can play

import UIKit

struct UserModel {
    
    let name: String
    
    static func instance(dict: Dictionary<String, String>) -> UserModel {
        return UserModel(name: (dict["name"] ?? "..."))
    }
}


