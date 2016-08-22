//: [Previous](@previous)

import Foundation

class AddingStringStrategy {
    func applyAndReturn(this: String, that: String) -> String {
        return this + " & " + that
    }
}

class AddingIntStrategy {
    func applyAndReturn(this: Int, that: Int) -> Int {
        return this + that
    }
}