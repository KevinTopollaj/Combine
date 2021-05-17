//: [Previous](@previous)

//Example for CurrentValueSubject and PassthroughSubject
//PassthroughSubject: use for starting action/process, equivalent to func


import UIKit
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class ViewModel {
    
    let userNames = CurrentValueSubject<[String], Never>(["Bill"])
    let newUserNameEntered = PassthroughSubject<String, Never>()
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        // create publisher stream that updates userNames whenever a newUserNameEntered has a new value
    }
}

let viewModel = ViewModel()
 
// add new user name "Susan"

// add new user name "Bob"

// who do you protect userName from not setting it directly


//: [Next](@next)
