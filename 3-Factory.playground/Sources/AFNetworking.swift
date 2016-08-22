import Foundation

public class AFNetworking {
    public init(){
        
    }
    public func get(url: String, completion: (Dictionary<String, AnyObject>) -> Void){
        if url.containsString("user"){
            completion(["name":"Jim"] as Dictionary<String, AnyObject>)
        } else if url.containsString("accounts"){
            completion(["balance":50000] as Dictionary<String, AnyObject>)
        }
    }
}