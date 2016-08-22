//: [Previous](@previous)

import Foundation

protocol Strategy {
    associatedtype S
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

class Transformer<T: Strategy> {
    private let strategy: T
    
    init(strategy: T) {
        self.strategy = strategy
    }
    func transform(this this: T.S, that: T.S) -> T.S {
        return strategy.applyAndReturn(this, that: that)
    }
}

let stringTransformer = Transformer(strategy: AddingStringStrategy())
stringTransformer.transform(this: "a", that: "b")


let intTransformer = Transformer(strategy: AddingIntStrategy())
intTransformer.transform(this: 1, that: 2)

