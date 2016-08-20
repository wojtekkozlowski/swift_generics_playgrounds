
import Foundation

//---------------------
enum Result<T, U> {
    case Success(T)
    case Error(U)
}
//---------------------

//copied from Swift STDL
enum Optional<Wrapped> {
    case None
    case Some(Wrapped)
}
