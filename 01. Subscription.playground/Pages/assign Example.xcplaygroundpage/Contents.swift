//: [Previous](@previous)

// Important note
// assign(to, on: self) -> memory cycle

import Foundation
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct User {
    let name: String
    let id: Int
}

class ViewModel {
    
    var user = CurrentValueSubject<User, Never>(User(name: "Bob", id: 1))
    var userID: Int = 1 {
        didSet {
            print("userId changed \(userID)")
        }
    }

    var subscriptions = Set<AnyCancellable>()
    
    init() {
        user
          // will give me only the id property of the User object
          .map(\.id)
          // assign that to the userID property of the ViewModel class
//          .assign(to: \.userID, on: self) // WARNING: will cause a memory leak every time!!!
          .sink(receiveValue: { [unowned self] value in
            self.userID = value
          })
          // keep a reference of the created subscription
          .store(in: &subscriptions)
    }
    
    deinit {
        print("deinit")
    }
}

var viewModel: ViewModel? = ViewModel()
viewModel?.user.send(User(name: "Anna", id: 2))

viewModel = nil



//: [Next](@next)
