//: [Previous](@previous)

//SwiftUI works with ObservableObject Protocol

import Foundation
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class ViewModel: ObservableObject {
  
    @Published var userNames = ["Bill", "Susan", "Bob"]
    let userNamesSubject = CurrentValueSubject<[String], Never>(["Bill", "Susan", "Bob"])
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        //subscribe to publisher
         $userNames.sink { [unowned self] (values) in
            print("usernames - last \(self.userNames) -  value received - \(values)")
         }.store(in: &subscriptions)

        userNamesSubject.sink { [unowned self] values in
            print("usernamesSubject - last \(self.userNamesSubject.value) - value received - \(values)")
        }.store(in: &subscriptions)

    }
}

let viewModel = ViewModel()

// where you can see this used internally in SwiftUI
// ViewModel class conforms to ObservableObject protocol
 //let objectWillChange = PassthroughSubject<Void, Never>()



//: [Next](@next)
