//: [Previous](@previous)

//Subject - Publisher that you can continously send new values down stream.

//CurrentValueSubject
//used like a var with a Publisher stream attached

// CurrentValueSubject must have a starting value.

import Foundation
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct User {
    var id: Int
    var name: String
}

let currentUserId = CurrentValueSubject<Int, Never>(1000)
let userNames = CurrentValueSubject<[String], Never>(["Bob", "Susan", "Luise"])

let currentUser = CurrentValueSubject<User, Never>(User(id: 1, name: "Bob"))


// get the value for currentUserID
print("Current User Id: \(currentUserId.value)")

// subscribe to Subject
let subscription = currentUserId.sink {
  print("completion: \($0)")
} receiveValue: { value in
  print("recived value: \(value)")
}

// passing down new values with Subject
currentUserId.send(1)
currentUserId.send(2)

// sending completion finished with Subject
currentUserId.send(completion: .finished)

// after finishing it will not recive any more values
currentUserId.send(12)

//: [Next](@next)
