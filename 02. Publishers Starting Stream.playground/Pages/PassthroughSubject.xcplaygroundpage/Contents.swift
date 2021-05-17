import UIKit
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//Subject - Publisher that you can continously send new values down stream.

// PassthroughSubject
// use for starting action/process, equivalent to func

let newUserNameEntered = PassthroughSubject<String, Never>()


// we can't get the value for newUserNameEntered because it does not hold a starter value

// subscribe to Subject
let subscriprion = newUserNameEntered.sink {
  print("completion: \($0)")
} receiveValue: { value in
  print("recived value: \(value)")
}

// passing down new values with Subject
newUserNameEntered.send("Bob")

// sending completion finished with Subject
newUserNameEntered.send(completion: .finished)


