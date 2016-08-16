//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

protocol Instantiable {
    static func instance(dict: Dictionary<String, AnyObject>) -> Self
}

struct UserModel: Instantiable {
    
    let name: String
    
    static func instance(dict: Dictionary<String, AnyObject>) -> UserModel {
        return UserModel(name: ((dict["name"] as? String) ?? "..."))
    }
}

struct AccountModel: Instantiable {
    
    let balance: Double
    
    static func instance(dict: Dictionary<String, AnyObject>) -> AccountModel {
        return AccountModel(balance: ((dict["balance"] as? Double) ?? -1))
    }
}



class NetowrkService {
    let httpManager = AFNetworking()
    
    func getModel<T: Instantiable>(url: String, completion: (T) -> Void) {
        
        httpManager.get(url, completion: { dictionary  in
            completion(T.instance(dictionary))
        })
        
    }
}



















//-------------------------------------------

// generic parameters are inferred

let networkService = NetowrkService()



networkService.getModel("/users/1", completion: { (model: UserModel) in
    print(model.name)
})



networkService.getModel("/accounts/1", completion: { (model: AccountModel) in
    print(model.balance)
})
















