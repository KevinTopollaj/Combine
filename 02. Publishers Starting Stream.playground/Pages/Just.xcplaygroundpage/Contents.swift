//: [Previous](@previous)

// Just publish something
// one-shot and completes normally

// The one element that the publisher emits.
// public let output: Output

// public typealias Failure = Never



import Foundation
import Combine
import PlaygroundSupport

let justWorld = Just("world!")


let subscription = justWorld.sink { cmpletion in
    print("just - completion - \(cmpletion)")
} receiveValue: { (value) in
    print("just - received value - \(value)")
}



//: [Next](@next)
