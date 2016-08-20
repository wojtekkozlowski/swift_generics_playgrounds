
import Foundation

//---------------------
enum Result<T, U> {
    case Success(T)
    case Error(U)
}
//---------------------


struct UserModel {
    let username: String
}

enum NetworkError {
    case Cancelled
    case Unreachable
}

func getUser() -> Result<UserModel, NetworkError> {
    return .Success(UserModel(username: "Wally"))
    //    return .Error(.Cancelled)
}

let result = getUser()


