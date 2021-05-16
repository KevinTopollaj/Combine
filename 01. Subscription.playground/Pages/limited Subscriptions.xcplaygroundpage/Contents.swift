//: [Previous](@previous)

// publishers that will pass a limited number of values

import UIKit
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let foodbank: Publishers.Sequence<[String], Never> = ["apple","bread","orange","milk"].publisher



//: [Next](@next)
