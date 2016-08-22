//: Playground - noun: a place where people can play

import UIKit

protocol Instantiable {
    static func instance(dict: Dictionary<String, AnyObject>) -> ...
}

struct UserModel {
    
    let name: String
    
    static func instance(dict: Dictionary<String, AnyObject>) -> UserModel {
        return UserModel(name: ((dict["name"] as? String) ?? "..."))
    }
}


class NetowrkService {
    let httpManager = AFNetworking()
    
    func getUser<T>(url: String, completion: (T) -> Void) {
        
        httpManager.get(url, completion: { dictionary  in
            completion(T.instance(dictionary))
        })
        
    }
}

