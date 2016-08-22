//: Playground - noun: a place where people can play

import UIKit

struct UserModel {
    
    let name: String
    
    static func instance(dict: Dictionary<String, AnyObject>) -> UserModel {
        return UserModel(name: ((dict["name"] as? String) ?? "..."))
    }
}

// v.2
class NetowrkService {
    let httpManager = AFNetworking()
    
    func getUser(url: String, completion: (UserModel) -> Void) {
        
        httpManager.get(url, completion: { dictionary  in
            completion(UserModel.instance(dictionary))
        })
        
    }
}

