
import Foundation

enum Result<T, U> {
    case Success(T)
    case Error(U)
}


struct UserModel {
    let username: String
}

enum NetworkError {
    case Cancelled
    case Unreachable
}

func getUser() -> Result<UserModel, NetworkError> {
    
    return .Success(UserModel(username: "Wally"))
//     return .Error(.Cancelled)
}


struct AuthModel {
    let roles: [String]
}

enum AuthError {
    case Unauthenticated
    case Unauthorised
}

func getAuth() -> Result<AuthModel, AuthError> {
    
    return .Success(AuthModel(roles: ["travel-agent"]))
    // return .Error(.Unauthorised)
}


