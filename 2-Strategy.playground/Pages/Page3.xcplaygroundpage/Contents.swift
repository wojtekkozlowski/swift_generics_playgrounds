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

class Transformer<T> {
    private let strategy: T
    
    init(strategy: T) {
        self.strategy = strategy
    }
    func transform(this this: ..., that: ...) -> ... {
        return strategy.applyAndReturn(this, that: that)
    }
}