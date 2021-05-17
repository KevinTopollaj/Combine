//: [Previous](@previous)

//Example for CurrentValueSubject and PassthroughSubject
//PassthroughSubject: use for starting action/process, equivalent to func


import UIKit
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class ViewModel {
  
  // private publisher
  private let userNamesSubjects = CurrentValueSubject<[String], Never>(["Bill"])
  // public publisher
  var userNames: AnyPublisher<[String], Never>
  
  let newUserNameEntered = PassthroughSubject<String, Never>()
  
  var subscriptions = Set<AnyCancellable>()
  
  init() {
    // to delete the type of publisher and protect it from the outside use of send()
    userNames = userNamesSubjects.eraseToAnyPublisher()
    
    // create publisher stream that updates userNames whenever a newUserNameEntered has a new value
    newUserNameEntered
      .filter { $0.count > 3 }
      .sink {
        print("completion: \($0)")
      } receiveValue: { [unowned self] username in
        //      userNames.value = userNames.value + [username]
        self.userNamesSubjects.send(self.userNamesSubjects.value + [username])
      }
      .store(in: &subscriptions)
    
    // check the username
    userNames.sink { users in
      print("usernames change to: \(users)")
    }
    .store(in: &subscriptions)
    
    
  }
  
}

let viewModel = ViewModel()

// add new user name "Susan"
viewModel.newUserNameEntered.send("Susan")

// add new user name "Bob"
viewModel.newUserNameEntered.send("Boby")

// you protect userName from not setting it directly
//viewModel.userNames.send(["AAAA"]

//: [Next](@next)
