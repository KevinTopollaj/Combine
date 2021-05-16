//: [Previous](@previous)

// assign() -> Is added only for iOS 14

// assign(to:, on:)
// func assign<Root>(to keyPath: ReferenceWritableKeyPath<Root, Self.Output>, on object: Root) -> AnyCancellable

// ReferenceWritableKeyPath only avaliable for property in class

// enables you to assign the received value to a KVO-compliant property of an object
// upstream publisher's Failure must be Never.

import Foundation
import Combine
import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class MyClass {
    var anInt: Int = 0 {
        didSet {
            print("anInt was set to: \(anInt)")
        }
    }
}

var myObject = MyClass()
let myRange = (0...2)
let publisher = myRange.publisher

let subscription = publisher
  // an operator that will transform every value of the Publisher
  .map { $0 * 10 }
  // a Subscriber that will assign a value to a specific property in inside a class Object
  .assign(to: \.anInt, on: myObject)

  // We can recive the same result using the sink Subscriber
//  .sink { value in
//    myObject.anInt = value
//  }


//: [Next](@next)


