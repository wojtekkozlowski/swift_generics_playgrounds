
import Foundation

//---------------------

enum Result<T, U> {
    case Success(T)
    case Error(U)
}

//---------------------


struct AuthModel {
    let roles: [String]
}

enum AuthError {
    case Unauthenticated
    case Unauthorised
}

func getAuth() -> Result<AuthModel, AuthError> {
    return .Success(AuthModel(roles: ["Admin"]))
//    return .Error(.Unauthorised)
}

let result = getAuth()


