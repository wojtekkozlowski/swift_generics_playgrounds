//: [Previous](@previous)

import Foundation

protocol Instantiable {
    static func instance(dictionary: Dictionary<String, AnyObject>) -> Self
}

final class UserModel: Instantiable {
    
    static func instance(dictionary: Dictionary<String, AnyObject>) -> UserModel {
        //...
        return UserModel()
    }
}

final class AccountModel: Instantiable {
    static func instance(dictionary: Dictionary<String, AnyObject>) -> AccountModel {
        //...
        return AccountModel()
    }
}

class NetowrkService {
    private let httpManager = HTTPManager()
    
    func getModel<T: Instantiable>(url: String, completion: (T) -> Void) {
        httpManager.get(url) { dictionary in
            completion(T.instance(dictionary))
        }
    }
    
    private class HTTPManager {
        func get(url: String, completion: (Dictionary<String, AnyObject>) -> Void) {
            completion(["key":"value"])
        }
    }
}

let networkService = NetowrkService()

networkService.getModel("http://backend/user/1") { (user:UserModel) in
    print(user)
}

networkService.getModel("http://backend/user/1") { (account:AccountModel) in
    print(account)
}


