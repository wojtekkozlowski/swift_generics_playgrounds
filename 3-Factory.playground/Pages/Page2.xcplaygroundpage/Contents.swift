//: Playground - noun: a place where people can play

import UIKit

struct UserModel {
    
    let name: String
    
    static func instance(dict: Dictionary<String, AnyObject>) -> UserModel {
        return UserModel(name: ((dict["name"] as? String) ?? "..."))
    }
}

// v.1
class NetowrkService {
    let httpManager = AFNetworking()
    
    func getUser(url: String, completion: (Dictionary<String, AnyObject>) -> Void) {
        
        httpManager.get(url, completion: { dictionary  in
            completion(dictionary)
        })
        
    }
}

