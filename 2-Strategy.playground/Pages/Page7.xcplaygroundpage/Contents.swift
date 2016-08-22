//: [Previous](@previous)

import Foundation

protocol Strategy {
    func applyAndReturn(this: S, that: S) -> S
}

class AddingStringStrategy: Strategy {
    func applyAndReturn(this: String, that: String) -> String {
        return this + " & " + that
    }
}

class AddingIntStrategy: Strategy {
    func applyAndReturn(this: Int, that: Int) -> Int {
        return this + that
    }
}

class Transformer<T> {
    private let strategy: T
    
    init(strategy: T) {
        self.strategy = strategy
    }
    func transform(this this: T, that: T) -> T {
        return strategy.applyAndReturn(this, that: that)
    }
}
