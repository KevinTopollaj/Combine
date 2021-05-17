//: [Previous](@previous)

//Subject - Publisher that you can continously send new values down

//CurrentValueSubject
//used like a var with a Publisher stream attached

import Foundation
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct User {
    var id: Int
    var name: String
}

let currentUserId = CurrentValueSubject<Int     , Never>(1000)
let userNames     = CurrentValueSubject<[String], Never>(["Bob", "Susan", "Luise"])

let currentUser   = CurrentValueSubject<User    , Never>(User(id: 1, name: "Bob"))



// get the value for currentUserID

// subscribe to Subject

// passing down new values with Subject

// sending completion finished with Subject



//: [Next](@next)
