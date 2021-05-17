//: [Previous](@previous)

/*
 @Published property wrapper
 adds a Publisher to a property

- use `@Published` for class propeties not structures.
 
 */


import Combine
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class ViewModel {
    
    // use @Published to create publisher
    let userNames = CurrentValueSubject<[String], Never>(["Bill"])
    let newUserNameEntered = PassthroughSubject<String, Never>()
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        
        
    }
}

let viewModel = ViewModel()


// add new user name "Susan"

// add new user name "Bob"

//  Documentation: When the property changes, publishing occurs in the property's `willSet` block, meaning subscribers receive the new value before it's actually set on the property.




//: [Next](@next)
